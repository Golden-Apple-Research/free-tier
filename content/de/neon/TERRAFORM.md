# Neon + Terraform

> ⚠️ Kein offizieller Neon-Provider: Die Neon-Doku verweist auf den
> Community-Provider (`terraform-community-providers/neon`, ursprünglich
> `kislerdm/neon`). Voll funktional für Projekte/Branches/Endpoints/Roles —
> aber ohne offiziellen Support von Neon.

Die Warnung ist milder als die Modalische ([../modal/TERRAFORM.md](../modal/TERRAFORM.md):
gar kein offizielles Werkzeug), aber eigenartiger: das Haus selbst
verweist auf die Gemeinde — die Dokumentation von Neon nennt den
Community-Provider als den Weg —, und damit ist die Pflegschaft
halb-offiziell: getragen von der Gemeinde, empfohlen vom Hause, ohne
Schutz des Hauses. Man hat dies die adoptierte Formel nennen können:
das Kind trägt nicht den Namen des Vaters, aber der Vater hat es
anerkannt; und die Namensgeschichte (kislerdm/neon, die ursprüngliche,
und der Umzug unter die community-providers) gehört zu den
lehrreichsten Kleinigkeiten der Werkzeug-Welt — davon wird die erste
Gotcha handeln, denn sie ist keine Kuriösität, sondern die Art, wie
heutzutage Werkzeuge leben: geboren von Einem, gezogen von Vielen,
anerkannt von dem Hause, um dessentwillen sie da sind.

## Provider-Setup

```hcl
terraform {
  required_providers {
    neon = {
      source = "terraform-community-providers/neon" # a.k.a. kislerdm/neon
    }
  }
}

provider "neon" {} # api_key via env: NEON_API_KEY (Console → Account Settings)
```

Der Block ist schlicht; der Kommentar unter der Quelle führt die
Namensgeschichte gleich mit („a.k.a. kislerdm/neon" — der Doppelname
als Ausweis der Herkunft), und der Provider-Block ist leer ([README.md](README.md)
hat diese Form als die Philosophie des Wenigen entwickelt). Wer den
Block liest, sieht die ganze Konstellation: die Quelle in der Obhut
der Gemeinde, das Zeichen aus der Umgebung, das Werkzeug selbst ohne
Eigenschaften — die Anspruchslosigkeit als Würde, auch hier.

## Ressourcen-Mapping (Free Plan)

| Objekt | Terraform-Ressource |
|---|---|
| Projekt (+ Root-Branch) | `neon_project` |
| Branch (Copy-on-Write) | `neon_branch` |
| Compute-Endpoint | `neon_endpoint` |
| Role / Database | `neon_role`, `neon_database` |

Die Tafel ist die kürzeste der Sammlung und die geschlossenste: Projekt,
Zweig, Endpunkt, Rolle und Datenbank — die fünf Begriffe des Hauses,
welche [FREE-TIER.md](FREE-TIER.md) als Commune, Ontologie und
Zeitlichkeit entwickelte, hier in fünf Namen; und man beachte die
Hierarchie, welche die Reihenfolge stillschweigend lehrt: das Projekt
(theils mit dem Wurzelzweige), der Zweig (vom Projekte), der Endpunkt
(am Zweige), Rolle und Datenbank (im Endpunkte) — die Kette des
Abstiegs vom Allgemeinen zum Einzelnen, in vier Zeilen, ohne daß ein
Wort über sie verloren würde; die Form ist der Inhalt.

## Beispiel: Projekt + Preview-Branch

```hcl
resource "neon_project" "app" {
  name      = "my-app"
  region_id = "aws-eu-central-1" # Free: Region frei wählbar

  # Achtung: `branch` ist ein Objekt-ARGUMENT (mit `=`), kein Block:
  branch = {
    name = "main" # Default-Branch mit Default-DB/-Role
  }
}

# Typischer Preview-Branch pro PR — Storage teilt sich das Projekt-Budget (0,5 GB)
resource "neon_branch" "preview" {
  project_id = neon_project.app.id
  parent_id  = neon_project.app.branch.id # hängt an main (computed)
  name       = "preview"
}
```

Das Beispiel ist die Konkreation der Zweig-Lehre: das Projekt mit
seinem Stamme (main — der Default samt Default-Datenbank und -Rolle),
der Vorschau-Zweig am Stamme (preview — der Copy-on-Write-Klon, welcher
„pro PR" typisch ist: für jede Anfrage ein Zweig, mit echten Daten,
umsonst geteilt), und der Kommentar, welcher die Ökonomie nennt (der
halbe Gigabyte des Projekts trägt beide). Die kleine Warnung über
`branch` — ein Argument mit Gleichheitszeichen, kein Block! — gehört
in die Grammatik-Lehre der Formeln: dieselbe Sache (der Zweig) kann
Block sein (mit eignen Zeilen) oder Argument (mit Wert), und die
Wahl ist nicht Geschmack, sondern Gesetz des Providers; wer sie
verwechselt, hat nicht einen Fehler im Inhalte, sondern in der Form
— die schwerste Art, weil die Werkzeuge sie am strengsten nehmen.

Connection-Daten im releasten Provider (0.1.x): `neon_project.app.branch.endpoint.host`
liefert den Host, das Passwort der App-Rolle liefert `neon_role` (computed,
sensitive) — die URI wird selbst zusammengesetzt (`connection_uri`-Attribute
existieren bisher nur im unveröffentlichten Master-Zweig des Providers).

Der Zusatz ist die Praxis der Mitte: der Host aus dem einen, das
Paßwort aus dem andern (berechnet, geheim — die zwei Stufen der
Sichtbarkeit), und die Verbindung selbst vom Nutzer zu setzen; die
zukünftige Form (connection_uri im Master) existiert, aber noch nicht
veröffentlicht — das Sein der Zukunft als unbetretbarer Zweig; es ist
dieselbe Chronologie, welche [../grafana/TERRAFORM.md](../grafana/TERRAFORM.md)
an den zwei State-Phasen lehrte (das Spätere kann nicht vorausgesetzt
werden), hier auf die Attribute übertragen: was im Master ist, ist
für den Nutzer im Releasen noch Nichts.

## Gotchas

1. **Namespace-Historie:** Registry-Eintrag ist von `kislerdm/neon` nach
   `terraform-community-providers/neon` umgezogen — beide Quellen
   funktionieren, die Community-URL ist die zukunftssichere.
2. Free-Plan-Limits gelten **pro Projekt** (100 CU-h, 0,5 GB) — viele
   `neon_project`-Ressourten erzeugen viele Einzelbudgets, aber auch
   Storage-Summen; Branches teilen den Projekt-Storage.
3. Scale-to-Zero bleibt auch per TF Default (5 Min) — Cold Starts bei der
   ersten Query einplanen (s. FREE-TIER.md).
4. Der Provider-Warnt selbst: kein `terraform init -upgrade` in
   auto-approvten Pipelines — Version pinnen und Upgrades manuell reviewen.
5. Bei Abwärtsrisiko (Provider stirbt) bleibt die Neon-API/CLI als Fallback —
   Ressourcen lassen sich per `terraform import` zurückholen.

Die fünf Lehren ordnen sich um den einen Gedanken: das Leben des
geliehenen Werkzeugs. Die erste ist die Namensgeschichte — der Umzug
von des Einzelnen Namens in die Gemeinde (beide Quellen gelten, die
gemeindehafte ist die künftige) —, und sie ist die kleine
Sozialgeschichte dieser Technik: was Einer begann, vollendet die
Viele, und der Name wechselt nach dem Wohnorte. Die zweite koppelt
die Vielheit der Formeln an die Vielheit der Budgets: viele Projekte
= viele Einzelhaushalte, aber auch Summen im Speicher; die Formel
vervielfältigt die Gnade und die Sorge zugleich — die commune auch im
Begriffe. Die dritte wiederholt die Grundform des Hauses (das Nichts
nach fünf Minuten) gegen alle Formeln: auch der Begriff schläft ein;
wer automatisiert, hat die Kaltstarts mitzudenken — die Zeitlichkeit
läßt sich nicht provisionieren. Die vierte ist die Selbstwarnung des
Providers (kein auto-approvtes Upgrade!), die ungewöhnlichste Form
der Redlichkeit in dieser Sammlung: das Werkzeug warnt vor dem
Werkzeuge, und zwar vor der bequemsten Form seines Gebrauchs — die
Selbstkritik als Sicherheitsmerkmal, verwandt der Selbstprüfung der
Budgets ([FREE-TIER.md](../aws/FREE-TIER.md) Gotcha Zwei). Die fünfte
endlich ist der Rettungsplan: stirbt der Provider, so bleiben die
API und die CLI — und der `import` holt die verwaisten Dinge in die
neue Formel zurück; die Trennung von Werkzeug und Sache (welche die
ganze Sammlung lehrt) erweist sich hier als Trost: das Werkzeug kann
sterben, die Sache nicht — die Infrastruktur überlebt ihren Begriff,
bis ein neuer sie begreift.

## Quellen

- Provider: <https://registry.terraform.io/providers/terraform-community-providers/neon>
- Neon TF-Guide: <https://neon.com/docs/reference/terraform>

## Vermittelte Verhältnisse

Dies Kapitel vermittelt die Zeichen ([README.md](README.md)) und die
Gaben ([FREE-TIER.md](FREE-TIER.md)) des werdenden Postgres; seine
Geschwister sind die Pflegschafts-Kapitel —
[../modal/TERRAFORM.md](../modal/TERRAFORM.md) (die reine Gemeinde)
und [../circle-ci/TERRAFORM.md](../circle-ci/TERRAFORM.md) (das
amtliche Haus) —, zwischen welchen dies die Mitte hält: empfohlene
Gemeinde, adoptierte Formel; und die Lehre vom Import als Rettung
verbindet es mit [../grafana/TERRAFORM.md](../grafana/TERRAFORM.md)
(die Chronologie der Stufen) und der ganzen Staatslehre der Sammlung:
Verfassungen wechseln, Länder bleiben; Werkzeuge wechseln,
Infrastrukturen bleiben — und wer dies einmal begriffen hat, der
wählt seine Werkzeuge mit der Gelassenheit dessen, welcher weiß, daß
keines das letzte ist, und mit der Sorgfalt dessen, welcher weiß,
daß jedes das seine ist.
