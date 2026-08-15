import { defineConfig } from "astro/config";
import starlight from "@astrojs/starlight";

// Provider-Verzeichnisse (unter content/<locale>/) → Sidebar-Gruppen
const providers = [
  ["aws", "AWS"],
  ["azure", "Azure"],
  ["circle-ci", "CircleCI"],
  ["cloudflare", "Cloudflare"],
  ["codesandbox", "CodeSandbox"],
  ["gcp", "Google Cloud"],
  ["grafana", "Grafana Cloud"],
  ["huggingface", "Hugging Face"],
  ["modal", "Modal"],
  ["neon", "Neon"],
  ["netlify", "Netlify"],
  ["redis", "Redis"],
  ["render", "Render"],
  ["supabase", "Supabase"],
  ["triggerdev", "Trigger.dev"],
  ["vercel", "Vercel"],
];

export default defineConfig({
  // Für GitHub Pages (Projekt-Page): Überschreibbar via ENV, siehe docs-site/README.md
  site: process.env.SITE ?? "https://example.github.io",
  base: process.env.BASE ?? "/free-tier/",
  vite: {
    plugins: [
      // Dev-Fix für root-absolute Asset-urls in customCss (Klingon-Font,
      // Hintergrundbild): Der BUILD prefixt die Base automatisch in url('/fonts/…'),
      // der Dev-Server nicht — dort 404en die Assets. Hier im Serve-Modus dasselbe
      // Rewriting wie im Build, damit tlh-Seiten auch in dev mit Font/Bild rendern.
      {
        name: "css-asset-base-prefix",
        apply: "serve",
        enforce: "pre",
        transform(code, id) {
          if (!id.includes("locale-themes.css")) return;
          const base = process.env.BASE ?? "/free-tier/";
          const prefixed =
            base === "/" ? code : code.replaceAll("url('/", `url('${base}`);
          if (prefixed === code) return;
          return { code: prefixed, map: null };
        },
      },
    ],
  },
  integrations: [
    starlight({
      // Sprach-spezifische Themes (de = Preußisch-Hegelianisch, en = Pirat,
      // tlh = Klingonen) — siehe src/styles/locale-themes.css
      customCss: ["/src/styles/locale-themes.css"],
      // MarkdownContent-Override: deutsche Seiten als „aufgeschlagenes Buch“
      // (aktuelle Seite rechts, Zurück-Seite als Faksimile links) — siehe
      // src/components/BookShell.astro; en/tlh unverändert.
      components: {
        MarkdownContent: "./src/components/BookShell.astro",
      },
      // Titel pro Locale — der Key des Default-Locales (de) ist Pflicht.
      title: {
        de: "Free-Tier Übersicht",
        en: "Free-Tier Overview 🏴‍☠️",
        tlh: "Free-Tier nobmey",
      },
      description:
        "Kostenlose Kontingente, Terraform-Support und Auth für 16 Cloud- und SaaS-Dienste — Stand: August 2026",
      // Deutsch ist die Defaultsprache (/de/ als Fallback für unübersetzte Seiten).
      // en ist vollständig übersetzt („Pirate Edition“ in content/en/); tlh (tlhIngan Hol)
      // ist in der glorreichen Schlacht des August 2026 vollständig übersetzt worden.
      defaultLocale: "de",
      locales: {
        de: { label: "Deutsch", lang: "de" },
        en: { label: "English 🏴‍☠️", lang: "en" },
        tlh: { label: "tlhIngan Hol", lang: "tlh" },
      },
      sidebar: [
        {
          label: "Einstieg",
          translations: { en: "Getting Started", tlh: "Qu" },
          items: [
            {
              slug: "index",
              label: "Überblick",
              translations: { en: "Overview", tlh: "nobmey" },
            },
            {
              slug: "helpers",
              label: "Skills & MCP-Server",
              translations: {
                en: "Skills & MCP Servers",
                tlh: "Skills & MCP-Server",
              },
            },
          ],
        },
        ...providers.map(([directory, label]) => ({
          label,
          collapsed: true,
          items: [{ autogenerate: { directory } }],
        })),
        {
          label: "Beispiele",
          translations: { en: "Examples", tlh: "chavmey" },
          link: "https://github.com/Golden-Apple-Research/tree/main/free-tier/examples",
          attrs: { target: "_blank", rel: "noopener noreferrer" },
        },
      ],
    }),
  ],
});
