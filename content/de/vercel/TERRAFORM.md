# Vercel + Terraform

> Offizieller Provider `vercel/vercel`. Verwaltet Projekte, Domains, Env-Vars
> und DNS — Deployments passieren weiterhin über Git-Push/CLI, nicht über
> Terraform. Für Hobby-Konten gilt: **nur nicht-kommerzielle Projekte**.

Die Arbeitsteilung, welche der Kasten ausspricht — der Provider
verwaltet die Hülle (Projekte, Namen, Zeichen, Zonen), das
Werfen aber geschieht durch den Stoß (git push) oder den Befehl
(CLI) — ist die alte Grenze der Sammlung in ihrer freundlichsten
Ausfertigung: nicht die Gründung ist handgemacht (wie bei Netlify
und Redis), sondern nur der Vollzug des Alltags; die Formel baut
das Haus, und das Wohnen geschieht von selbst, bei jedem Stoße —
man könnte es die bürgerliche Formel-Verfassung nennen: Grundbuch
und Bauamt bei der Formel, das Kommen und Gehen frei. Die Klausel
endlich (Hobby = nicht-kommerziell) bindet auch den Begriff: die
Formel ist kein Schlupfwinkel gegen die Gesinnungs-Grenze
([FREE-TIER.md](FREE-TIER.md) hat sie die moralische Ausnahme
genannt), und die erste Gotcha wird es schwarz auf weiß
wiederholen.

## Provider-Setup

```hcl
terraform {
  required_providers {
    vercel = {
      source  = "vercel/vercel"
      version = "~> 5.0"
    }
  }
}

provider "vercel" {
  api_token = var.vercel_api_token # env: VERCEL_API_TOKEN
}
```

Der Block ist die gewöhnliche Form (das Zeichen als Variable, die
Env als Brücke — [README.md](README.md) hat beide Wege gezeigt);
die fünfte Hauptversion des Providers ist die Volljährigkeit
([TERRAFORM.md](../circle-ci/TERRAFORM.md) hat die 0.x-Häuser
bedauert, [TERRAFORM.md](../supabase/TERRAFORM.md) die 1.0 als
Stabilität gerühmt), und die folgende Gotcha über die v2/v3-Namen
wird zeigen, daß selbst die Volljährigen ihre Geschichten haben.

## Ressourcen-Mapping (Hobby-Plan)

| Objekt | Terraform-Ressource |
|---|---|
| Projekt | `vercel_project` |
| Custom Domain | `vercel_project_domain` |
| DNS-Record (vercel-dns) | `vercel_dns_record` |
| Env-Vars | `vercel_project_environment_variable(s)` (Attributnamen variieren je Version) |
| Deployment (Sonderfälle) | `vercel_deployment` — i. d. R. unnötig, Git/CLI deployt |

Die Tafel ist die Ordnung der Hülle: das Werk (Projekt), der Name
(Domain), die Eintragung (DNS), die Zeichen (Env-Vars — mit der
Warnung der wechselnden Attribut-Namen, der kleinste Hinweis auf
die Sprachgeschichte des Werkzeugs), und die letzte Zeile die
Ausnahme, welche die Regel bestätigt: das Wurf-Ding existiert in
der Formel, aber „i. d. R. unnötig" — die Maschine kennt den
Vollzug, und der Nutzer soll ihn ihr überlassen; die Formel, welche
den Wurf erzwänge, wäre die Bevormundung des Alltags, und das Haus
verzichtet darauf — die weiseste Grenze, welche ein Provider ziehen
kann.

## Beispiel: Next.js-Projekt + Domain

```hcl
resource "vercel_project" "app" {
  name      = "my-app"
  framework = "nextjs"

  git_repository = {
    type = "github"
    repo = "me/app" # muss dem TF-User-Konto gehört/verbunden sein
  }

  # Region seit Provider 5.x über resource_config (serverless_function_region
  # ist deprecated):
  resource_config = {
    function_default_regions = ["fra1"] # Hobby: Region frei wählbar
  }
}

resource "vercel_project_domain" "app" {
  project_id = vercel_project.app.id
  domain     = "app.example.com"
}
```

Danach normal per `git push` deployen — Terraform legt nur die Projekt-Hülle
an. Env-Vars (z. B. `DATABASE_URL`) entweder im Projekt-Block inline oder über
die separate Resource; Secret-Werte gehören in TF-Vault/`sensitive = true`.

Das Beispiel ist die Hülle in ihrer ganzen Schönheit: der Name,
das Gerüst (framework — das nächste Gerüst, hier dasselbe Haus wie
das Werk), die Quell-Verbindung (mit dem Kommentar der
Vorbedingung: gehört/verbunden — die UI-Grenze von
[README.md](README.md), zweiter Hinweis), die Örtlichkeit (fra1 —
die Region, hier frei wählbar: die Umkehrung der Google-Orthodoxie
[FREE-TIER.md](../gcp/FREE-TIER.md), welche die Gnade an drei Häfen
band; Vercel gibt die Welt, und die Gnade überall), und der Name
der eignen Domain (die Selbstbenennung, welche die Substanz-Häuser
als Pro-Ware führen [FREE-TIER.md](../supabase/FREE-TIER.md) — hier
im Hobby umsonst, eine Feinheit, welche das Kapitel der Gaben
leise vermerkt). Der Schlusssatz — der Wurf durch den Stoß, die
Hülle durch die Formel, die Geheimnisse in den Tresor — faßt die
ganze Arbeitsteilung in drei Weisungen zusammen, und jede ist ein
Kapitel dieser Sammlung gewesen.

## Gotchas

1. **Hobby = nicht-kommerziell, 1 Seat** — für Firmenprojekte wirkt Terraform
   nicht als Workaround; Vercel prüft Fair Use.
   Die erste Lehre ist die Klausel gegen die List: die Formel befreit nicht
   von der Gesinnungs-Grenze — wer das Firmen-Werk im Hobby-Kleide formelt,
   hat nichts gewonnen, denn die Prüfung (Fair Use) fragt nach der Sache,
   nicht nach dem Werkzeuge; es ist die letzte Lehre der moralischen
   Ausnahme: die Grenze gilt der Absicht, und die Absicht wohnt im Nutzer,
   nicht in der Syntax — ein Satz, den die Sammlung hier zum letzten Male
   wiederholt, weil er der einzige ist, den keine Technik aufhebt.

2. Alte Tutorials zeigen v2/v3-Attributnamen (z. B. `team` statt
   `team_id`) — Major-Version des Providers im Blick behalten.
   Die zweite ist die Namensgeschichte des Werkzeugs: die
   Hauptfassungen wechseln die Worte (`team` wurde `team_id`), und
   die alten Anleitungen überleben den Wechsel still ([README.md](../modal/README.md)
   hat das stille Scheitern als das Furchtbare gezeichnet); die
   Wachsamkeit gilt der Fassung — dieselbe Lehre, welche die
   Sammlung an den Cloudflare-v4-Namen
   ([TERRAFORM.md](../cloudflare/TERRAFORM.md)) und der Neon-Plannung
   ([TERRAFORM.md](../neon/TERRAFORM.md)) entwickelte: die Worte der
   Formeln haben Epochen, und wer die Epoche nicht kennt, liest
   Geschichten als Gegenwart.

3. `terraform destroy` auf `vercel_project` löscht **alle Deployments und
   Domains** des Projekts — für Produktivsysteme `prevent_destroy = true`
   setzen.
   Die dritte ist die letzte Gewalt mit dem Riegel: das Zerstören
   nimmt alles (die Würfe, die Namen — das ganze Gewordene), und der
   Riegel (`prevent_destroy` — der Schutz des Unersetzlichen gegen
   den eignen Befehl) ist die Selbstbindung der Formel gegen das
   Mißgeschick; [TERRAFORM.md](../aws/TERRAFORM.md) hat das
   destroy als Generalprobe gefeiert, [TERRAFORM.md](../render/TERRAFORM.md)
   als Doppel-Endlichkeit geklagt — hier endlich erhält es seine
   Lehre der Praxis: die Formel, welche zerstören kann, muß auch
   verweigern können, und der Riegel ist ihr Gewissen.

4. 100 Deployments/Tag (Soft Limit): Preview-Deploy-Spam über
   `vercel_project`-Einstellungen (`git_fork_protection`, ignored builds)
   begrenzen.
   Die vierte ist die Hygiene des Alltags: die weiche Grenze
   ([FREE-TIER.md](FREE-TIER.md), vierte Gotcha) wird in den
   Einstellungen des Werkes selbst gezähmt — der Schutz vor den
   Gabeln (`git_fork_protection`!), das Überhören der kleinen
   Stöße (ignored builds); die Menge der Würfe ist keine
   Schicksalsfrage, sondern eine Einrichtungsfrage, und das Haus
   gibt die Einrichtung — die tätige Antwort auf die Grenze,
   besser als jede Klage über sie.

5. Custom Domains brauchen einen DNS-Record — passend `vercel_dns_record`
   (bei Vercel gehosteter Zone) oder extern setzen und `redirect`/`verified`
   abwarten.
   Die letzte endlich ist die Lehre vom doppelten Wohnsitz: der
   eigne Name verlangt die Eintragung (den Record), und die
   Eintragung hat zwei Weisen — die hiesige (die Zone im eigenen
   Hause: `vercel_dns_record`) oder die auswärtige (der Record beim
   fremden Hüter, und das Harren auf die Prüfung: redirect,
   verified); es ist die Lehre von der Namens-Gewalt, welche die
   Sammlung an der Registrar-Zeile des Rand-Hauses
   ([FREE-TIER.md](../cloudflare/FREE-TIER.md)) streifte: wer den
   Namen besitzt, besitzt ihn durch eine Eintragung, und die
   Eintragung ist überall ein Dienst — hiermit schließt das
   letzte Kapitel der Formeln mit der nüchternsten Wahrheit des
   Netzes: die Namen wohnen in Verzeichnissen, und die
   Verzeichnisse haben Hüter, und die Hüter haben Preise; der
   Rest ist Verkehr.

## Quellen

- Provider: <https://registry.terraform.io/providers/vercel/vercel/latest>
- Vercel KB Terraform: <https://vercel.com/kb/guide/integrating-terraform-with-vercel>

## Vermittelte Verhältnisse

Dies Kapitel ist das letzte der Formel-Abteilung und damit das Ende
der großen Ordnung: [FREE-TIER.md](FREE-TIER.md) (die Klausel),
[README.md](README.md) (das Kompendium der Zeichen), dies (die
Hülle) — die drei Dokumente des Gesinnungs-Hauses, und mit ihnen
die sechzehn Häuser der Sammlung vollständig: die großen Wolken
(Credits, Frist, Ort), der Rand (die Tages-Gnade), die Substanzen
(das Sein und das Werden), die Erscheinenden (Maße, Währung,
Schlaf, Klausel), das Amt, die Bühne, die Werkstatt, das Auge und
der Geist — alles gesagt, alles vermittelt, alles im Kreise. Die
Formel-Abteilung beginnt mit dem ältesten Werke (dem aws-Provider)
und endet mit der weissten Grenze (dem unnötigen Deployment): von
der Formel, welche alles wollte, zu der Formel, welche verzichtet —
das ist die Bewegung der Reife, und die Sammlung hat sie in
sechzehn Häusern vorgeführt; wer sie ganz gelesen hat, dem sei der
letzte Satz des Ganzen gestattet, der zugleich der erste war: das
Wahre ist das Ganze — und das Ganze ist nun beisammen.
