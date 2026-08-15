# Netlify + Terraform

> Offizieller Provider `netlify/netlify` (0.x, jung). Wichtigster Punkt:
> **`netlify_site` ist keine Resource**, sondern nur eine Data-Source —
> Sites werden über UI/Git/Netlify-CLI angelegt; Terraform verwaltet
> anschließend Build-Settings, Env-Vars, DNS und Domains.

Die Anomalie, welche der Kasten ausspricht, ist die größte in der
ganzen Gattung der Formel-Häuser: das Zentrum des Dingens — die
Site — läßt sich nicht setzen; die Formel kann es nur lesen
(Data-Source), nicht erschaffen (Resource), und die Erzeugung bleibt
den älteren Formen überlassen (dem Anschauen in der UI, dem Gange
durchs Git, dem Befehle der CLI). Man hat hiermit den Fall der
umgekehrten Werkstatt: sonst setzt der Begriff die Welt und die
Anschauung liest sie ([../aws/TERRAFORM.md](../aws/TERRAFORM.md) —
der ganze Stolz des Infrastructure as Code), hier setzt die
Anschauung, und der Begriff verwaltet; und es ist dieselbe Grenze,
welche [../circle-ci/TERRAFORM.md](../circle-ci/TERRAFORM.md) an der
config.yml zog (Verfassung hier, Gesetze dort), nur tiefer: dort
blieb der Inhalt des Bauens draußen, hier das Dasein des Werkes
selbst. Die Begründung liegt im Wesen des Hauses: die Site entsteht
aus dem Repositorium (dem Gange durch Git) oder aus dem Entschlusse
(des Nutzers am Bildschirme), und beides sind Weisen des Anfangs,
welche der Formel fremd sind — die Formel setzt das Vorhandene,
nicht den ersten Anfang; oder, um es mit dem alten Worte zu sagen:
der Begriff ist die Macht über das Werden des Gewordenen, nicht über
das Werden des Anfangs.

## Provider-Setup

```hcl
terraform {
  required_providers {
    netlify = {
      source  = "netlify/netlify"
      version = "~> 0.4"
    }
  }
}

provider "netlify" {
  token = var.netlify_token # env: NETLIFY_TOKEN (Personal Access Token)
}
```

Der Block zeigt die zweite rechtmäßige Form der Einbindung (die
Variable im Blocke — [README.md](README.md) nannte beide); der
Kommentar nennt die Entsprechung mit der Env-Form, und die
Jugendlichkeit (0.x) verlangt die bekannten Sorgen (das Pinne —
[../circle-ci/TERRAFORM.md](../circle-ci/TERRAFORM.md) hat sie am
gleichaltrigen CircleCI-Provider entwickelt).

## Ressourcen-Mapping (Free Plan)

| Objekt | Terraform-Ressource |
|---|---|
| Site (lesen) | `data.netlify_site` / `data.netlify_sites` |
| Build-Settings | `netlify_site_build_settings` |
| Domains | `netlify_site_domain_settings` |
| Env-Vars | `netlify_environment_variable` (site- oder team-weit) |
| DNS | `netlify_dns_zone` + `netlify_dns_record` |
| Deploy Keys / Log Drains | `netlify_deploy_key`, `netlify_log_drain` |
| Firewall/WAF | `netlify_site_firewall_traffic_rules`, `netlify_waf_policy` |

Die Tafel beginnt mit dem Unvermögen und fährt mit dem Vermögen fort:
die erste Zeile das Lesen (data!), alle folgenden das Einrichten —
Bau, Namen, Geheimnisse, Zonen, Schlüssel, Abflüsse, Wächter; die
Sphäre der Formel ist das Peripherische um die Site (alles, was man
ihr antun kann), nicht die Site selbst (das, was sie ist); und man
sieht hier einmal mehr die Wahrheit des Satzes, daß die Verwaltung
die Verfassung voraussetzt — die Formeln sind die Gesetze des
bestehenden Hauses, nicht die Gründungsurkunde desselben.

## Beispiel: Bestehende Site konfigurieren

```hcl
data "netlify_team" "team" {}

data "netlify_site" "blog" {
  # Site per Slug/Name identifizieren (siehe Doku der Data-Source)
}

resource "netlify_site_build_settings" "blog" {
  site_id                      = data.netlify_site.blog.id
  build_command                = "npm run build"
  publish_directory            = "dist"
  production_branch            = "main"
  branch_deploy_branches       = ["preview", "staging"]
  prevent_non_git_prod_deploys = true
}

resource "netlify_environment_variable" "db" {
  team_id = data.netlify_team.team.id
  site_id = data.netlify_site.blog.id # site-level; weglassen = team-level
  key     = "DATABASE_URL"
  values = [
    { value = "postgres://…", context = "all" }
  ]
}
```

Das Beispiel ist die Schule des Lesens vor dem Schreiben: zuerst das
Team (die Instanz), dann die Site (die Sache, gefunden per
Slug/Namen — der Suchblick), dann — erst jetzt! — die Einstellungen
(Bau-Befehl, Verzeichnis, Zweige, das Verbot der formlosen Würfe:
`prevent_non_git_prod_deploys = true` ist die ganze Moral des
Häuslichen: nichts ins Leben ohne den Weg durchs Repositorium), und
zuletzt die Geheimnisse (die DATABASE_URL mit ihrem „context = all",
welcher für alle Umgebungen gilt — das Allgemeine des Zeichens in
einem Worte). Der Aufbau des Beispiels — Instanz, Sache, Ordnung,
Geheim — ist dabei nicht Zufall der Darstellung, sondern die
natürliche Reihenfolge alles Verwaltens; wer ihn einmal gesehen hat,
liest alle Beispiele dieser Sammlung als Variationen Eines Schemas.

## Gotchas

1. **Site-Anlage geht nicht per TF** — Workflow: Site via UI/CLI/Git anlegen,
   dann mit der Data-Source in den State nehmen. Wer volle IaC-Site-Erstellung
   will, muss auf die Netlify-API/CLI ausweichen.
   Die erste Lehre ist der Kompromiß mit dem Unvermögen: der Workflow in zwei
   Akten — Erzeugung draußen (UI/CLI/Git), Aneignung drinnen (Data-Source in
   den State) —, und der Ausweg für die Unzufriedenen (die API/CLI als
   Formel-Ersatz); es ist die bekannte Grenze von [../modal/TERRAFORM.md](../modal/TERRAFORM.md)
   (das SDK als eigne Sprache) in abgeschwächter Form: dort die eigne
   Form, hier die fremde (das UI) mit nachholender Formel. Der State, welcher
   die angeeignete Site aufnimmt, ist dabei die Erinnerung des Fremden:
   was nicht von ihm gesetzt ward, wird von ihm bewahrt, als wäre es
   gesetzt — die Versöhnung der beiden Welten im Gedächtnisse.

2. Env-Var-Werte landen **im Klartext im State** — State-Backend
   verschlüsseln (Terraform Cloud/S3+KMS).
   Die zweite ist die State-Lehre ohne den Hash-Trick (Netlify kennt den
   Abdruck nicht, welchen [../circle-ci/README.md](../circle-ci/README.md)
   an der Context-Variable rühmte): der Wert steht im Klartext in der
   Erinnerung, also muß die Erinnerung selbst verschlossen werden — das
   Backend als Tresor (die Cloud-Form oder die S3-Form mit dem
   Schlüsseldienste KMS); die Sammlung hat dies an allen Ecken gelehrt
   und lernt hier die Alternative: der Abdruck (CircleCI) oder der Tresor
   (Netlify) — zwei Wege, dieselbe Sorge.

3. Provider ist 0.x — Schema kann sich noch ändern; Version pinnen und
   Upgrades testen.
   Die dritte ist die bekannte Alterslehre — dasselbe Wort wie bei
   CircleCI (0.x), dieselbe Sorge; die Gleichheit der Jugend zweier
   Häuser ist übrigens ein stiller Hinweis auf das Alter der Gattung
   selbst: die Formel-Häuser des Frontend-Bauens sind die jüngsten
   Ausläufer der Terraform-Welt, und ihre Werkzeuge tragen es.

4. Free-Plan-Credits (300/Monat) verbrauchen auch die 15 Credits je
   Produktions-Deploy — Deploy-Frequenz unter IaC-Betrieb mitbedenken.
   Die letzte endlich ist die Koppelung der Währung an die Formel: wer
   automatisiert, verteilt öfter — die Bequemlichkeit der Formel zahlt
   sich in Deploy-Häufigkeit aus, und jede von ihnen kostet fünfzehn
   ([FREE-TIER.md](FREE-TIER.md) hat die Tarife gelehrt); das
   „Mitbedenken" ist die Pflicht des rechnenden Automatisierers, und die
   Sammlung hat den Satz an allen Orten wiederholt, welcher hier seine
   letzte Fassung findet: die Formel ist billig im Setzen und teuer im
   Vollziehen — die Erinnerung daran schützt vor dem Schicksal aller
   Automatisierung, der geschäftigen Wiederholung dessen, was die Hand
   seltener getan hätte.

## Quellen

- Provider: <https://registry.terraform.io/providers/netlify/netlify/latest>
- Netlify TF-Guide: <https://docs.netlify.com/terraform-provider/>

## Vermittelte Verhältnisse

Dies Kapitel vermittelt die Zeichen ([README.md](README.md)) und die
Gaben ([FREE-TIER.md](FREE-TIER.md)) des währungsfreundlichen Hauses;
seine Anomalie — die ungeformte Site — stellt es an die Seite der
grenzgeschichteten Kapitel ([../circle-ci/TERRAFORM.md](../circle-ci/TERRAFORM.md):
die config.yml; [../modal/TERRAFORM.md](../modal/TERRAFORM.md): das
SDK), mit welchen es die kleine Typologie der Formgrenzen bildet:
das Haus, welches die Bau-Gesetze auslagert; das Haus, welches die
Formel ganz ersetzt; das Haus, welches die Gründung auslagert — drei
Stufen der Bescheidenheit der Formeln, und keine ist ein Mangel,
jede eine Wahrheit über das, was Formeln können: sie verwalten das
Allgemeine und lassen das Erste den andern Formen. Wer die drei
zusammenliest, dem ist geholfen mit der Frage aller Anfänger, ob man
denn „alles" mit Terraform könne: die Antwort ist nein — und das
Nein ist das Interessante.
