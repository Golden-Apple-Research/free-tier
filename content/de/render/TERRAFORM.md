# Render + Terraform

> Offizieller Provider `render-oss/render`. **Aber:** Der Provider kennt als
> `plan` nur `starter` und höher — **Free-Instanzen (750 h/Monat) lassen sich
> nicht per Terraform anlegen.** Free-Services entstehen via Dashboard oder
> Blueprint (`render.yaml`); Terraform eignet sich ab dem ersten Paid-Plan.

Die Einschränkung, welche der Kasten ausspricht, ist die radikalste
Form-Grenze der Sammlung: nicht ein Teil des Hauses bleibt der
Formel verschlossen ([../circle-ci/TERRAFORM.md](../circle-ci/TERRAFORM.md):
die Pipelines), nicht die Gründung allein
([../netlify/TERRAFORM.md](../netlify/TERRAFORM.md): die Site;
[TERRAFORM.md](../redis/TERRAFORM.md): die Zahlungsvoraussetzung) —
nein, der ganze Stand des Umsonst ist formellos: der Provider kennt
die Pläne erst vom bezahlten Anfange an (starter und höher), und die
750 Stunden, die die Halle ausmachen, sind ihm unbekannt. Man hat
damit den klarsten Fall der Zwei-Sprachen-Verfassung: das Haus
spricht mit der Hand (Dashboard — die Anschauung) oder mit dem
Blatte (render.yaml — die Beschreibung), nie mit der Formel; und die
Begründung ist nicht Willkür, sondern Ökonomie der Werkzeuge: die
Formel ist das Instrument des Bleibenden, das Umsonst ist der Stand
des Versuches, und das Versuchende wird von Hand gemacht — man
erinnere sich der Grenz-Reihe der Sammlung und sieht hier die
vollendete Form: die Gnade ist handgemacht, das Geld ist
formelhaft; es gibt kein anderes Haus, welches dies so rein zeigt.

## Provider-Setup

```hcl
terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = "~> 1.9"
    }
  }
}

provider "render" {
  api_key  = var.render_api_key  # env: RENDER_API_KEY (Dashboard → Account Settings)
  owner_id = var.render_owner_id # env: RENDER_OWNER_ID (Workspace-ID)
}
```

Der Block ist die ausdrückliche Form der Adresse ([README.md](README.md):
Schlüssel und Hausnummer, beide als Variablen mit den Env-Kommentaren)
— die Doppelung der Mitteilungsform, welche das Haus duldet, in der
ordentlichen Ausfertigung; wer die Env-Form allein will, hat sie,
wer die Block-Form will, hat sie — und der Kommentar lehrt in jedem
Falle die Herkunft der Werte.

## Ressourcen-Mapping

| Objekt | Terraform-Ressource |
|---|---|
| Web Service (ab Starter) | `render_web_service` |
| Private Service | `render_private_service` |
| Background Worker | `render_background_worker` |
| Cron Job | `render_cron_job` |
| Postgres / Key Value | `render_postgres`, `render_keyvalue` |
| Env-Vars / Secrets | `render_env_var`, `render_secret` (+ Link-Ressourcen) |

Die Tafel ist vollständig — die Werkzeuge des Hauses stehen alle
da: das Öffentliche (Web), das Verborgene (Private), das Stille
(Background — der Arbeiter ohne Fenster), das Wiederkehrende (Cron),
die Substanz (Postgres), das Flüchtige (Key Value) und die Zeichen
(Env-Vars, Secrets) —, aber die Vollständigkeit ist eine des
bezahlten Hauses; die erste Zeile sagt es in der Klammer („ab
Starter"), und alle folgenden erben die Schweigepflicht: das
Umsonst erscheint nicht. Es ist die Präzedenz-Tafel der Formeln:
was der Provider nicht kennt, ist nicht; die Wirklichkeit der 750
Stunden existiert nur außerhalb seiner Sprache — und die Sprache,
wie immer, macht die Wirklichkeit, mit der sie rechnet.

## Beispiel: Web Service (bezahlter Starter-Plan)

```hcl
resource "render_web_service" "web" {
  name          = "my-app"
  plan          = "starter" # ⚠️ "free" ist KEIN gültiger Wert im Provider
  region        = "frankfurt"
  start_command = "npm start"

  runtime_source = {
    native_runtime = {
      repo_url      = "https://github.com/me/app"
      branch        = "main"
      build_command = "npm install"
      runtime       = "node"
      auto_deploy   = true
    }
  }
}
```

Für **Free-Services** stattdessen Blueprint (Alternative zu Terraform):

```yaml
# render.yaml
services:
  - type: web
    plan: free           # via Blueprint problemlos möglich
    runtime: node
    buildCommand: npm install
    startCommand: npm start
```

Das Doppel-Beispiel ist die Lehre selbst, in zwei Sprachen
geschrieben: oben die Formel (starter — mit der Warnung, „free" sei
KEIN gültiger Wert: das Ausrufungszeichen der Unmöglichkeit mitten
in der Syntax), unten das Blatt (render.yaml — die Sprache der
Gnade, in welcher plan: free problemlos möglich ist); dieselbe
Sache (ein Web-Dienst, Knoten, installieren, starten) in der
bezahlten und in der umsonsten Grammatik, und der Vergleich der
beiden Stufen ist das klarste Lehrstück über die Grenze, welches
die Sammlung enthält: nicht die Worte sind verschieden (type, plan,
runtime — beide Male), sondern die Geltung — dasselbe Wort
(plan) meint in der Einen Sprache die ganzen Stufen, in der andern
nur die bezahlten; die Sprache entscheidet über die Wirklichkeit,
welche sie benennt, und wer die falsche Sprache für seine Zwecke
wählt, wählt die falsche Wirklichkeit.

## Gotchas

1. **Free ≠ TF:** Der 750-h-Free-Tier ist bewusst nicht im Provider — Free
   über Dashboard/Blueprint, TF erst ab Starter ($7/Monat).
   Die erste Lehre ist die Bewußtheit der Grenze: „bewusst nicht im
   Provider" — das Haus hat die Formel der Gnade nicht versäumt,
   sondern verweigert; die zwei Wege (Dashboard/Blueprint) sind die
   rechtmäßigen Formen des Umsonst, und die sieben Dollar des Starter
   sind die Eintrittskarte der Formel-Welt. Es ist die vollendete
   Zwei-Klassen-Verfassung, welche [FREE-TIER.md](FREE-TIER.md)
   Gotcha Fünf vorbereitete (das Upgrade hebt die Grenzen nicht
   auf): die Klassen sind hier so fest gebaut wie nirgends, und die
   Aufrichtigkeit des Hauses — es sagt die Grenze, es begründet sie,
   es verkauft den Übergang — verdient den Respekt, welchen man
   klaren Verhältnissen schuldet.

2. `terraform destroy` löscht die Service inkl. Data; für Free-Postgres gilt
   zusätzlich das 30-Tage-Ablauffenster (s. FREE-TIER.md) — DBs nicht via
   TF-Plan für Dauerhaftes einplanen.
   Die zweite ist die Doppel-Endlichkeit des Löschens: der Befehl
   nimmt das Ganze (inkl. der Daten — die letzte Gewalt der Formel,
   welche [../aws/TERRAFORM.md](../aws/TERRAFORM.md) als Generalprobe
   des Endens feierte), und die Natur des Umsonst nimmt ohnehin
   (das Dreißig-Tage-Fenster — die zweite Uhr, welche auch ohne
   Befehl läuft); die Konsequenz („DBs nicht via TF-Plan für
   Dauerhaftes einplanen") ist die Summe aus beiden Uhren: was zwei
   Enden hat, ist nicht der Ort des Bleibenden — die Substanz wohnt
   woanders ([FREE-TIER.md](../neon/FREE-TIER.md),
   [FREE-TIER.md](../supabase/FREE-TIER.md)), und die Halle ist für
   den Tag gebaut.

3. `owner_id` ist die Workspace-/Team-ID, nicht der persönliche User —
   FAQ der Render-Docs bei "403 not authorized" prüfen.
   Die dritte wiederholt die Adreß-Lehre ([README.md](README.md),
   dritter Hinweis) in der Fehler-Form: der 403 als Echo der
   verwechselten Adresse (User statt Team — die Person, welche
   angibt, wo der Verein gefragt war); die FAQ als Ort der
   Belehrung — die Häuser schreiben die Fehlerkunde in ihre Bücher,
   und wer sie liest, erspart sich die Erfahrung, welche theurer
   ist als das Buch.

4. Blueprints und Terraform mischen = Konflikte: pro Service entscheiden,
   wer der Owner der Konfiguration ist.
   Die letzte endlich ist das Souveränitäts-Gebot: ein Ding, ein
   Herr — der Service, welcher von zwei Herren beschrieben wird
   (Blueprint und Terraform), gerät in den Zustand der doppelten
   Wahrheit, und der Konflikt ist nicht Bug, sondern Logik: die
   Erinnerung, welche zwei Erinnerer hat, erinnert sich streitend.
   Die Entscheidung pro Service (wer der Owner der Konfiguration
   ist) ist die kleine Landfriedensordnung der Formeln, und sie
   gilt weit über dies Haus hinaus — die Sammlung hat an
   [TERRAFORM.md](../circle-ci/TERRAFORM.md) (die Arbeitsteilung)
   und [TERRAFORM.md](../modal/TERRAFORM.md) (den Mischbetrieb mit
   Friedensbedingung) die Verwandten; überall derselbe Satz: die
   Vermischung der Verfassungen ist der Streit, die Scheidung der
   Sachen ist der Friede.

## Quellen

- Provider: <https://registry.terraform.io/providers/render-oss/render/latest>
- Render TF-Doku: <https://render.com/docs/terraform-provider>
- Blueprints: <https://render.com/docs/blueprints>

## Vermittelte Verhältnisse

Dies Kapitel ist der Begriff der Halle — aber der Begriff einer
Halle, welche sich dem Begriffe entzieht; seine Geschwister sind die
Grenzhäuser ([TERRAFORM.md](../netlify/TERRAFORM.md): die Site;
[TERRAFORM.md](../redis/TERRAFORM.md): die Voraussetzung;
[TERRAFORM.md](../circle-ci/TERRAFORM.md): die Gesetze), und die
Steigerung ist deutlich: Render grenzt nicht Teile ab, sondern den
Stand. Damit bildet dies Kapitel mit [FREE-TIER.md](FREE-TIER.md)
(drei Formen der Endlichkeit) und [README.md](README.md) (den
Ausweis, welcher dem Gelde folgt) die geschlossenste Dreiheit der
Sammlung: ein Haus, welches weiß, was es ist — die Halle des
Versuchs —, und welches den Versuch der Hand überlässt und das
Ernstste der Formel; wer dies Kapitel gelesen hat, versteht zum
ersten Male die ganze Terraform-Abteilung der Sammlung als das, was
sie ist: die Verfassung des Bleibenden, und der Versuch — der
Schlaf, das Flüchtige, der Verfall — braucht keine Verfassung, denn
er hat die Zeit, welche die Verfassung ersetzt, solange er dauert.
