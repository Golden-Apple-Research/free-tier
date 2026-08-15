#!/usr/bin/env node
// Synchronisiert den Markdown-Content des Repos (kanonische Quelle!) in die
// Starlight-Content-Collection unter src/content/docs/ (generiert, in .gitignore).
//
// Quellen:
//   content/<locale>/     → docs/<locale>/                    (nur .md; de = Default; examples/ ausgenommen)
//   examples/             → kein Sync — Sidebar verlinkt direkt auf GitHub
//   docs-site/content-src/<locale>/ → docs/<locale>/          (Stubs, Overlay zuletzt)
//
// Fixups beim Kopieren:
//  1. Frontmatter-title aus der ersten H1 injizieren (Starlight braucht `title`)
//     und die H1 aus dem Body entfernen — Starlight rendert den Frontmatter-Titel
//     bereits als Seiten-Überschrift, eine H1 im Body würde doppelt erscheinen
//  2. Verzeichnis-Links (`](01-todo-app/)`) auf README.md umschreiben
//  3. Relative .md-Links in finale Slug-URLs umschreiben — basis- und locale-unabhängig
//     (Astro löst md-Links nur im Original-Locale auf; in Fallback-Kopien unter /en/,
//      /tlh/ blieben sie sonst roh und wären 404)
//  4. Ziel existiert nur im Default-Locale (z. B. examples/): im eigenen Locale
//     verlinken — Starlight rendert dort automatisch die Fallback-Kopie (mit Banner)
//
// Link-Auflösung mit Fallback-Kandidaten — damit im Repo GitHub-gültige relative
// Pfade funktionieren, obwohl die Site den Baum anders flacht:
//   a) normal relativ zur Datei
//   b) führende ../-Kette strippen, relativ zum Locale-Root
//      (früheres Beispiel content/de/index.md → ../../examples/README.md — examples
//       ist seit dem Direktlink auf GitHub obsolet)
//   c) „content/<locale>/“-Segment im Ziel auf den Locale-Root mappen
//      (examples/x → ../../../content/de/supabase/README.md)

import {
  existsSync,
  mkdirSync,
  readdirSync,
  readFileSync,
  rmSync,
  statSync,
  writeFileSync,
} from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const DEFAULT_LOCALE = 'de';
const here = path.dirname(fileURLToPath(import.meta.url));
const repoRoot = path.resolve(here, '../..');
const docsDir = path.join(here, '../src/content/docs');
const contentDir = path.join(repoRoot, 'content');
const contentSrc = path.join(here, '../content-src');

let files = 0;
let filesCopied = 0;
let filesRemoved = 0;
let titlesInjected = 0;
let descriptionsInjected = 0;
let dirLinksFixed = 0;
let mdLinksRewritten = 0;

// --- 1) Zielspiegel in-place aktualisieren (kein rm -rf!) ----------------------
// Ein laufender `astro dev` beobachtet src/content/docs/ per File-Watcher. Löscht
// dieses Skript den Wurzelordner und baut ihn neu auf, verliert chokidar den Watch
// auf den gelöschten Baum — der Dev-Server friert auf seinem alten Stand ein
// (Symptom: tlh-Seiten als „nicht übersetzt“-Fallback, obwohl längst übersetzt).
// Deshalb: Dateien einzeln (über)schreiben, verschwundene einzeln löschen —
// der Watcher bekommt so Change-/Add-/Unlink-Events pro Datei mit.
mkdirSync(docsDir, { recursive: true });

const subdirsOf = (dir) =>
  existsSync(dir) ? readdirSync(dir).filter((e) => statSync(path.join(dir, e)).isDirectory()) : [];
// Locales = Vereinigung aus content/<locale>/ (echte Inhalte) und content-src/<locale>/ (Stubs)
const locales = [...new Set([...subdirsOf(contentDir), ...subdirsOf(contentSrc)])];

// Alle Quelldateien unterhalb eines Wurzelverzeichnisses einsammeln (relativ)
const collect = (root, keep) => {
  const out = [];
  if (!existsSync(root)) return out;
  const walkSrc = (dir, rel) => {
    for (const entry of readdirSync(dir)) {
      const abs = path.join(dir, entry);
      const relEntry = rel ? `${rel}/${entry}` : entry;
      if (statSync(abs).isDirectory()) walkSrc(abs, relEntry);
      else if (keep(abs)) out.push([abs, relEntry]);
    }
  };
  walkSrc(root, '');
  return out;
};

// examples/ werden nicht als Seiten synchronisiert — der Sidebar-Link
// (astro.config.mjs) zeigt in allen Sprachen direkt auf GitHub.
const isExample = (abs) => abs.split(path.sep).includes('examples');

// Verschwundene Locales als Ganzes entfernen
for (const stale of subdirsOf(docsDir)) {
  if (!locales.includes(stale)) rmSync(path.join(docsDir, stale), { recursive: true, force: true });
}

const wanted = new Set(); // „<locale>/<relPfad>“-Einträge, die nach dem Sync existieren sollen
for (const locale of locales) {
  const sources = new Map(); // relPfad → Quelle (Overlay aus content-src überschreibt zuletzt)
  for (const [abs, rel] of collect(
    path.join(contentDir, locale),
    (a) => a.endsWith('.md') && !isExample(a),
  ))
    sources.set(rel, abs);
  for (const [abs, rel] of collect(path.join(contentSrc, locale), () => true)) sources.set(rel, abs);
  for (const [rel, abs] of sources) {
    const target = path.join(docsDir, locale, rel);
    mkdirSync(path.dirname(target), { recursive: true });
    writeFileSync(target, readFileSync(abs));
    wanted.add(`${locale}/${rel}`);
    filesCopied++;
  }
}

// Dateien ohne Quelle löschen, leere Verzeichnisse abräumen
const prune = (dir) => {
  let kept = 0;
  for (const entry of readdirSync(dir)) {
    const abs = path.join(dir, entry);
    if (statSync(abs).isDirectory()) {
      if (prune(abs) === 0) rmSync(abs, { recursive: true, force: true });
      else kept++;
    } else {
      const rel = path.relative(docsDir, abs).split(path.sep).join('/');
      const [locale, ...rest] = rel.split('/');
      if (rest.length > 0 && locales.includes(locale) && !wanted.has(rel)) {
        rmSync(abs, { force: true });
        filesRemoved++;
      } else kept++;
    }
  }
  return kept;
};
prune(docsDir);

// --- 2) Post-Processing --------------------------------------------------------
const slugFor = (mdPath) =>
  mdPath
    .replace(/\.md$/i, '')
    .split('/')
    .map((s) => s.toLowerCase().replace(/\s+/g, '-'))
    .join('/');

const relUrl = (fromSlug, toSlug) => {
  const from = fromSlug === '' ? [] : fromSlug.split('/');
  const to = toSlug === '' ? [] : toSlug.split('/');
  let i = 0;
  while (i < from.length && i < to.length && from[i] === to[i]) i++;
  const up = from.length - i;
  const rest = to.slice(i);
  if (up === 0 && rest.length === 0) return './';
  const prefix = up === 0 ? ['.'] : Array(up).fill('..');
  return [...prefix, ...rest].join('/') + '/';
};

const walk = (dir) => {
  for (const entry of readdirSync(dir)) {
    const abs = path.join(dir, entry);
    if (statSync(abs).isDirectory()) {
      walk(abs);
      continue;
    }
    if (!abs.endsWith('.md')) continue;
    files++;

    let src = readFileSync(abs, 'utf8');

    // Verzeichnis-Links auf README.md des Zielordners umschreiben
    src = src.replace(/\]\(([^)#\s]+\/)\)/g, (match, link) => {
      if (/^(https?:|mailto:)/.test(link)) return match;
      const target = path.resolve(path.dirname(abs), link);
      if (
        existsSync(target) &&
        statSync(target).isDirectory() &&
        existsSync(path.join(target, 'README.md'))
      ) {
        dirLinksFixed++;
        return `](${link}README.md)`;
      }
      return match;
    });

    // Relative .md-Links in Slug-URLs umschreiben
    src = src.replace(/\]\(([^)#\s]+\.md)(#[^)\s]*)?\)/g, (match, link, anchor) => {
      if (/^(https?:|mailto:)/.test(link)) return match;
      const fromDir = path.relative(docsDir, path.dirname(abs)).split(path.sep).join('/');
      const locale = fromDir.split('/')[0];
      const normalized = path.posix.normalize(path.posix.join(fromDir, link));
      const candidates = [normalized];
      // b) ../-Kette strippen, relativ zum Locale-Root
      const stripped = link.replace(/^(\.\.\/)+/, '');
      if (stripped !== link) candidates.push(path.posix.join(locale, stripped));
      // c) content/<locale>/ im Ziel → Locale-Root
      const viaContent = normalized.match(/(?:^|\/)content\/([a-z-]+)\/(.+)$/);
      if (viaContent) candidates.push(path.posix.join(viaContent[1], viaContent[2]));
      let resolved = candidates.find((c) => existsSync(path.join(docsDir, c)));
      // d) Ziel gibt es nur im Default-Locale (z. B. examples/ nur unter de/) →
      //    trotzdem im eigenen Locale verlinken; Starlight bedient die Route als
      //    Fallback-Kopie (deutscher Inhalt + „not yet translated“-Banner).
      if (!resolved && locale !== DEFAULT_LOCALE) {
        resolved = candidates.find(
          (c) =>
            c.startsWith(`${locale}/`) &&
            existsSync(path.join(docsDir, DEFAULT_LOCALE, c.slice(locale.length + 1))),
        );
      }
      if (!resolved) return match; // Astro failt kontrolliert im Build (Dead-Link-Check)
      mdLinksRewritten++;
      const fromSlug = slugFor(path.posix.join(fromDir, path.basename(abs)));
      return `](${relUrl(fromSlug, slugFor(resolved))}${anchor ?? ''})`;
    });

    // Titel-Handling: H1 im Body = künftiger Frontmatter-Titel (oder Duplikat davon)
    // → als Frontmatter-Titel übernehmen und aus dem Body entfernen.
    const fm = src.match(/^---\n[\s\S]*?\n---\n?/);
    const fmTitle = fm?.[0].match(/^title:\s*"(.*)"\s*$/m)?.[1];
    const body = src.slice(fm ? fm[0].length : 0).replace(/^\n+/, '');
    const h1 = body.match(/^#\s+(.+)\n?/);
    if (h1 && fmTitle === undefined) {
      const title = h1[1].replaceAll('"', '\\"').trim();
      src = `---\ntitle: "${title}"\n---\n\n${body.slice(h1[0].length).replace(/^\n+/, '')}`;
      titlesInjected++;
    } else if (h1 && fmTitle === h1[1].trim()) {
      src = `${fm[0].replace(/\n+$/, '\n')}\n\n${body.slice(h1[0].length).replace(/^\n+/, '')}`;
    }

    // tlh: eigene description injizieren, falls keine vorhanden — die site-weite
    // description in astro.config.mjs ist deutsch und würde sonst als
    // og:description-Fallback in alle tlh-Seiten durchschlagen.
    const locale = path.relative(docsDir, path.dirname(abs)).split(path.sep)[0];
    if (locale === 'tlh' && !/^description:/m.test(src)) {
      src = src.replace(
        /^(---\n)/,
        '$1description: "Huch Hutlh nobmey, Terraform-Support \'ej Auth — wa\'maH jav cloud \'ej SaaS services. August 2026."\n',
      );
      descriptionsInjected++;
    }

    writeFileSync(abs, src);
  }
};
walk(docsDir);

console.log(
  `✔ ${files} Markdown-Dateien synchronisiert (${filesCopied} kopiert, ${filesRemoved} entfernt) · ${titlesInjected} Titel injiziert · ${descriptionsInjected} tlh-descriptions injiziert · ${dirLinksFixed} Verzeichnis-Links umgeschrieben · ${mdLinksRewritten} md-Links in Slug-URLs umgeschrieben`,
);
