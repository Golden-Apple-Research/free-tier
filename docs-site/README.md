# Docs-Site — Astro Starlight (Deutsch + Pirate-English + Klingonisch)

> Die Dokumentations-Website des Repos: [Astro Starlight](https://starlight.astro.build)
> mit **prefixed Locales** — Deutsch unter `/de/` (Defaultsprache & Fallback),
> **English** („Pirate Edition“ 🏴‍☠️) unter `/en/` und **tlhIngan Hol** unter `/tlh/`.
> Der Site-Einstieg `/` ist eine statische Redirect-Seite auf `/de/`. Deploy-Ziel ist
> GitHub Pages (Workflow liegt bei). Kanonische Quelle ist `content/<locale>/` im
> Repo — die Website wird per Sync-Skript daraus **generiert**.

## Architektur

```
Repo-Top-Level                  docs-site/                        dist/
├── content/de/        ┌──►  src/content/docs/de/   ┌──►  /de/… (vollständig)
│   ├── index.md       │     src/content/docs/en/   │     /en/… (Pirate Edition, vollständig)
│   ├── helpers.md     │     src/content/docs/tlh/  │     /tlh/… (Fallback + Stub)
│   └── <16 Provider>/ │     (generiert,            │     / → Redirect auf /de/
├── content/en/ ───────┤      in .gitignore)        │     + Pagefind-Index, Sitemap
│   (Pirate-English)   │  scripts/sync-content.mjs  │
├── examples/ ─────────┤                           │
└── docs-site/         │  content-src/tlh/index.md = Locale-Stub
    └── content-src/ ──┘
```

Das Sync-Skript (läuft automatisch vor jedem `dev`/`build`) kopiert `content/<locale>/`
(nur `.md`), examples/ (komplett, nur in die Default-Sprache) und die Stubs aus
`content-src/` — mit vier Fixups:

| Fixup | Wofür |
|---|---|
| `title`-Frontmatter aus der ersten H1 injizieren | Starlight benötigt `title` pro Seite |
| Verzeichnis-Links (`](01-todo-app/)`) → `README.md` | Astro löst keine reinen Ordner-Links auf |
| Relative `.md`-Links → relative Slug-URLs (`../../supabase/readme/`) | Astro löst md-Links nur im Original-Locale auf; in Fallback-Kopien unter `/en/`/`/tlh/` wären sie sonst 404 |
| Link-Resolver mit Fallback-Kandidaten | Im Repo GitHub-gültige Pfade (`../../examples/…`, `../../content/de/<provider>/…`) sollen auch funktionieren, obwohl die Site den Baum anders flacht: `../`-Ketten strippen bzw. `content/<locale>/`-Segmente auf den Locale-Root mappen |
| Ziel nur im Default-Locale (z. B. `examples/`) → trotzdem im eigenen Locale verlinken | Starlight bedient die Route als Fallback-Kopie (deutscher Inhalt + Banner) — Links von `/en/`-Seiten auf die Examples bleiben so gültig, ohne das Locale zu wechseln |

## Befehle

| Befehl | Wirkung |
|---|---|
| `bun install` | Abhängigkeiten installieren (Alternativ: `npm install`) |
| `bun run dev` | Sync + Dev-Server unter `localhost:4321` (leitet auf `/de/` weiter) |
| `bun run build` | Sync + Produktions-Build nach `dist/` |
| `bun run preview` | Build lokal ausprobieren |

## Sprachen & i18n

| Locale | URL | Status |
|---|---|---|
| `de` (Deutsch) | `/de/` | ✅ vollständig (Default & Fallback) |
| `en` (English) | `/en/` | ✅ vollständig übersetzt — **„Pirate Edition“** 🏴‍☠️ (Piraten-Englisch in `content/en/`) |
| `tlh` (tlhIngan Hol) | `/tlh/` | 🔰 registriert, Stub-Startseite, **nicht übersetzt** |

Unübersetzte Seiten (z. B. die deutschen `examples/` unter `/en/`) zeigen automatisch den
**Inhalt der Defaultsprache mit „not yet translated“-Banner** — jede Seite existiert in
jedem Locale, nichts ist 404.

### Übersetzen (weitere Sprachen, z. B. tlhIngan Hol)

1. **Seiteninhalte**: Deutsche Seite nach `content/<locale>/<gleicher-relativer-Pfad>.md`
   kopieren und übersetzen — z. B. `content/de/aws/FREE-TIER.md` →
   `content/tlh/aws/FREE-TIER.md`. Der Sync hebt das Locale automatisch hoch (alle
   Verzeichnisse unter `content/` zählen als Locales). Einzelne Seiten reichen —
   der Rest fällt weiter auf Deutsch zurück (so entstanden die `en`-Stubs anfangs;
   `content/en/` ist inzwischen vollständig als „Pirate Edition“ übersetzt, sein Stub
   wurde deshalb gelöscht). Die zugehörige Stub-Startseite
   (`content-src/tlh/index.md`) dann löschen, sobald echte Seiten entstehen.
2. **UI-Strings** („Search“, „On this page“ …): Datei `src/content/i18n/en.json` bzw.
   `tlh.json` anlegen (Vorlage im Ordner `src/content/i18n/README.md`), z. B.:
   ```json
   { "search.label": "nej", "tableOfContents.onThisPage": "tetlh" }
   ```
   Fehlende UI-Sprachen (wie Klingonisch) fallen ansonsten auf die Defaultsprache
   (Deutsch) zurück — `en` hat Starlights eingebaute englische UI-Strings.
3. **Sidebar-Labels** stehen in `astro.config.mjs` — dort ggf. `translations`
   ergänzen (siehe [Starlight: Sidebar i18n](https://starlight.astro.build/guides/sidebar/#internationalization)).

## GitHub Pages

Der Workflow `.github/workflows/docs.yml` baut bei jedem Push auf `main` und deployt
über `actions/deploy-pages`. Nach dem ersten Push einmalig aktivieren:
**Settings → Pages → Source: GitHub Actions**.

`site`/`base` werden im Workflow automatisch gesetzt (`https://<owner>.github.io` +
`/<repo-name>/`). Für eine User-Site (`<user>.github.io`-Repo) in der Workflow-Datei
`BASE: /` setzen. Der Root-Redirect (`src/pages/index.astro`) nutzt eine relative
URL (`./de/`) und funktioniert daher mit jedem Base-Pfad.

## Gotchas

1. **`src/content/docs/` ist generiert** — niemals manuell editieren; beim nächsten
   Sync ist alles weg. Kanonische Quelle ist `content/` im Repo-Root (+ `examples/`).
2. **Editieren geht in `content/de/` weiter wie bisher**: Provider-Verzeichnisse,
   `helpers.md`, `index.md` und `examples/` bleiben die Single Source of Truth —
   auch fürs GitHub-Browsing ohne Website.
3. **Der „not yet translated“-Banner erscheint nur, wenn das Locale mindestens eine
   echte Seite besitzt** — deshalb liegt die Stub-Startseite in `content-src/tlh/`.
   (`en` hat mittlerweile echte Seiten in `content/en/`, sein Stub wurde entfernt.)
   Den Stub NICHT löschen, solange nicht wirklich übersetzt wurde (sonst
   verschwindet der Banner von allen Fallback-Seiten dieses Locales).
4. **Relative `.md`-Links schreibt der Sync um** (siehe Fixups-Tabelle) — im Repo
   GitHub-gültig schreiben, das Skript macht daraus Slug-URLs. Unauflösbare Ziele
   bleiben roh und **failen im Build** (Astro Dead-Link-Check) — gewollt.
5. **Links von `examples/` auf Provider-Docs** gehören in der Form
   `../../content/de/<provider>/<Datei>.md` ins Repo (2 Ebenen hoch, nicht 3!) —
   der Sync mapped sie über den `content/<locale>/`-Fallback auf den Locale-Root.
6. **Caret-Falle bei Starlight `0.x`**: `^0.36.0` erlaubt nur Patches (0.36.x) —
   wichtige Features/Syntax (z. B. `autogenerate`-Sidebar-Items) kamen erst in 0.41.
   Der Pin steht auf `^0.41.0`; nach Major-Updates von Astro ggf.
   `bun add astro@latest @astrojs/starlight@latest` und Build prüfen.
7. **Beim ersten Deploy** muss GitHub Pages auf „GitHub Actions“ als Source gestellt
   werden, sonst deployed der Workflow ins Leere.
8. **Sync läuft in-place** (überschreibt Datei für Datei, löscht Verschwnundene
   einzeln — kein `rm -rf`): ein laufender `astro dev` bekommt Änderungen so live
   per File-Watcher mit. Früher fraß das Aufräumen des Wurzelverzeichnisses den
   Watch, und der Dev-Server zeigte dauerhaft alte Inhalte (tlh z.B. als
   „nicht übersetzt“-Fallback). Nach einem `astro`-Major-Update oder globalen
   Umbauten den Dev-Server trotzdem einmal neu starten.
9. **Assets in CSS brauchen base-korrekte urls**: Der Build prefixt die Base
   (`/free-tier/`) automatisch in root-absolute `url('/fonts/…')` (public/-Assets),
   der Dev-Server aber nicht — dort erledigt das der Vite-Plugin
   `css-asset-base-prefix` in `astro.config.mjs` (nur `apply: 'serve'`,
   `enforce: 'pre'`, damit das Rewriting vor Vites CSS-Extraktion läuft).
   Klingon-Font (`public/fonts/klingon.ttf`) und Hintergrundbild
   (`public/images/klingon-bg.png`) laufen so in dev UND auf GitHub Pages.
   Achtung: `base: '/'` 404t aktuell ALLE Starlight-Routen in dev (Starlight
   0.41/Astro 7) — deswegen läuft dev ebenfalls unter `/free-tier/`.
10. **Buch-Layout für de**: `src/components/BookShell.astro` überschreibt
   Starlights `MarkdownContent` (`components:` in astro.config.mjs) — deutsche
   Seiten als aufgeschlagenes Buch: rechts die aktuelle Seite (inkl. Kapiteltitel),
   links ein Faksimile der Pagination-prev-Seite (gerendert via `render()` aus
   `astro:content`; hrefs der pagination enthalten die BASE, Entry-Ids nicht!).
   Klickfläche „zurück“ = leeres `<a class="book-page-link">` als Overlay über
   dem Blatt (Card-Link-Muster). NICHT den Inhalt in ein `<a>` legen: Der
   Markdown-Inhalt enthält Links, `<a>` in `<a>` ist verboten — der HTML-Parser
   bricht die Struktur auf (beobachtet: drei `<a>`-Klone, Inhalt als Grid-
   Waisen, 21k px hoher Stapel). Innere Links sind via `.book-facsimile a`
   neutralisiert (Tinte), `data-pagefind-ignore` hält den Suchindex sauber.
   Das Original-Titel-Panel blendet CSS aus (`main:has(.open-book) …`).
   en/tlh/Hero/404 rendern das unveränderte Original. Styling: Ende von
   `locale-themes.css` (Papier-Palette, Ledereinband, Falz-Overlay über die
   ganze Buchfläche — links als langer Tint-Schweif, der an der Schatten-
   kante ähnlich dunkel beginnt und zum Blattrand sanft auswascht),
   Bundsteg 3,6em, Blattbreite 52rem, progressiver Blur
   auf dem Faksimile mit wachsendem Radius — zwei gestapelte backdrop-
   filter-Layer (4px fein + 15px grob) mit LANG gestreckten mask-Gradienten
   (sanfter Start an der Falzschatten-Kante, volle Stärke erst unter der
   Sidebar); Mobile: nur rechte Seite). Geometrie: rechtes Blatt = Lesespalte (bleibt
   dank Starlights symmetrischem Layout zentriert); das Buch
   läuft mit `width: 200% / margin-left: -100%` nach links aus ihr heraus —
   der Falz sitzt an der linken Spaltenkante, das linke Blatt rutscht bei
   schmalen Fenstern unter die fixierte Sidebar (`overflow-x: clip` auf
   html/body hält den Scrollbalken weg; Print/Mobile resetten einblättrig).
   Nach Starlight-Updates BookShell mit dem Original
   `MarkdownContent.astro` vergleichen (Signature des Slots).
11. **Dev-Ghost „Theme-Styles verschwinden nach dem Laden“**: Astro/Vite
   liefert customCss doppelt — inline als `<style data-vite-dev-id>` UND
   nach dem Load als Vite-Modul, das den Style-Tag per `updateStyle()`
   überschreibt. Verhallt der Client-Transform im Modul-Graph leer
   (seltenere HMR-Race nach CSS-Edits; Reproduktion nicht deterministisch —
   Builds/Syncs waren im Isolationstest UNSCHULDIG), überschreibt der Browser
   den korrekten Inline-Style mit `""` → Buch/Theme weg. Diagnose:
   `curl …/src/styles/locale-themes.css?import` — steht dort `__vite__css = ""`,
   hilft nur ein Dev-Restart (Edits/touch heilen nicht; SSR und Build sind
   nie betroffen — die deployte Site ist immer korrekt).

## Quellen

- Starlight i18n (Locales, Fallback, UI-Übersetzungen): <https://starlight.astro.build/guides/i18n/>
- Starlight Sidebar (Autogenerate, Gruppen): <https://starlight.astro.build/guides/sidebar/>
- Starlight auf GitHub Pages deployen: <https://starlight.astro.build/guides/deploy/#github-pages>
- Astro Content Collections: <https://docs.astro.build/en/guides/content-collections/>
