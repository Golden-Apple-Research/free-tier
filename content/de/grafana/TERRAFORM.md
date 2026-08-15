# Grafana Cloud + Terraform

> Offizieller Provider `grafana/grafana`. Zwei-Ebenen-Muster: ein Provider
> für das **Cloud-Konto** (Stacks anlegen) und ein zweiter, pro Stack
> konfigurierter Provider für Dashboards/Datasources/Alerting. Das Anlegen
> eines Stacks ist im Free-Plan gratis.

Das Zwei-Ebenen-Muster, von welchem der Kasten spricht, ist das
vollständigste Beispiel einer Lehre, welche durch diese ganze Sammlung
geht: die Lehre von den Stufen der Vermittlung. Es gibt hier nämlich
nicht Ein Werkzeug und Eine Welt, sondern Zwei Werkzeuge und Zwei
Welten, von welchen die höhere die niedere hervorbringt (der Cloud-
Provider erschafft den Stack) und die niedere das Werk vollbringt (der
Stack-Provider verwaltet, was im Stack ist: Anschauungen, Quellen,
Regeln); und die Mitte zwischen beiden — das Bindeglied — ist der
Stack-Token, welcher in der höhern Welt erzeugt und der niedern
übergeben wird, wie das Amt, welches von oben verliehen und unten
verwaltet wird. Das Anlegen des Stacks gratis zu stellen ist dabei die
großmütige Konsequenz des Hauses, dessen ganzes Wesen die Anschauung
ist ([FREE-TIER.md](FREE-TIER.md)): der Stack — der Ort des Schauens —
kostet nichts; das Umsonst beginnt beim Dasein, nicht erst bei der
Menge.

## Provider-Setup (Cloud-Ebene)

```hcl
terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = ">= 3.0"
    }
  }
}

provider "grafana" {
  alias                 = "cloud"
  cloud_access_policy_token = var.grafana_cloud_token # Cloud-Policy mit stacks:write & Co.
}
```

Der Block ist die höhere Stufe: der Alias benennt sie (`cloud`), und
der Kommentar nennt die Bedingung — die Policy mit den Rechten der
Stiftung (stacks:write und was dazu gehört); die Stufenordnung, welche
[README.md](README.md) als die Verfassung dieses Hauses entwickelte,
tritt hier in die Formeln, und wer den Aufbau liest, sieht die
Politik im Kleinen: ein Alias, ein Zeichen (das Token), ein Kommentar
(die Amtsbeschreibung) — mehr gehört nicht zur Herrschaft, wenn sie
recht eingerichtet ist.

## Ressourcen-Mapping (Free Plan)

| Ebene | Objekt | Ressource |
|---|---|---|
| Cloud | Stack | `grafana_cloud_stack` |
| Cloud | Service Account + Token | `grafana_cloud_stack_service_account(_token)` |
| Stack | Dashboards/Folder | `grafana_dashboard`, `grafana_folder` |
| Stack | Datasources | `grafana_data_source` |
| Stack | Alerting | `grafana_rule`, `grafana_contact_point`, `grafana_mute_timing` |
| Stack | OnCall | `grafana_oncall_*` (Integrationen, Schedules) |

Die Tafel ist nach den Ebenen geordnet — die zwei ersten Zeilen der
höheren (was stiftet und bevollmächtigt), die vier letzten der niedern
(was erscheint, woher es stammt, was es meldet, wer es empfängt) —,
und diese Ordnung ist keine Äußerlichkeit der Darstellung, sondern die
Sache selbst: in den Ressourcennamen kehrt sie wieder
(`grafana_cloud_*` gegen `grafana_*`), und wer die Namen liest, liest
die Stufen; es ist das stilreinste Beispiel der Namenslehre, welche
die Sammlung an den v4/v5-Renamings ([../cloudflare/TERRAFORM.md](../cloudflare/TERRAFORM.md))
und den UUID-Sachen ([../circle-ci/TERRAFORM.md](../circle-ci/TERRAFORM.md))
entwickelt hat: die Präfixe sind die Weltanschauung des Werkzeugs.

## Beispiel: Free-Stack + Admin-Zugriff darauf

```hcl
resource "grafana_cloud_stack" "stack" {
  provider    = grafana.cloud
  name        = "myfree-obs"
  slug        = "myfree-obs"
  region_slug = "eu" # Stack-Region (z. B. eu, us)
}

resource "grafana_cloud_stack_service_account" "tf" {
  provider   = grafana.cloud
  stack_slug = grafana_cloud_stack.stack.slug
  name       = "terraform"
  role       = "Admin"
}

resource "grafana_cloud_stack_service_account_token" "tf" {
  provider           = grafana.cloud
  stack_slug         = grafana_cloud_stack.stack.slug
  service_account_id = grafana_cloud_stack_service_account.tf.id
  name               = "tf-token"
}
```

Der Stack-Token füttert den zweiten Provider (z. B. in einem eigenen
Root-Modul) — Achtung: das Token liegt im Attribut `key` (nicht `token`):

```hcl
provider "grafana" {
  alias = "stack"
  url   = grafana_cloud_stack.stack.url
  auth  = grafana_cloud_stack_service_account_token.tf.key
}
```

Das Beispiel ist die Stiftung im Ganzen: der Stack (mit Namen, Slug
und Region — das Dasein am Orte), der Service Account (das Amt, hier
„terraform" genannt, mit der Rolle „Admin" — die Vollmacht in der
niedern Welt), der Token (das Zeichen des Amtes) und der zweite
Provider, welcher das Zeichen empfängt (`auth = … tf.key`) und fortan
in der niedern Welt wirkt. Die Verweis-Kette — vom Stack zum Amte,
vom Amte zum Zeichen, vom Zeichen zum Provider — ist die vollständige
Linie der Vermittlung: jede Stufe trägt die nächste, und keine trägt
sich selbst; und der kleine Warnsatz über das Attribut `key` (nicht
`token`!) gehört in die Zeichenkunde: dieselbe Sache heißt hier anders
als anderswo, und der Buchstabensinn ([README.md](README.md), erster
Hinweis: `glc_` gegen `glca_`) wacht auch über die Feldnamen.

## Gotchas

1. Der Cloud-Policy-Token braucht die **richtigen Scopes** (stacks:read/write,
   service-accounts, ...) — fehlende Scopes äußern sich erst zur Laufzeit.
   Die erste ist die bekannte Lehre vom zu klein geschnittenen Staate
   ([../cloudflare/README.md](../cloudflare/README.md), zweiter Hinweis:
   die 403 am Apply), hier für die Stiftung selbst: die Verfassung,
   welcher ein Artikel fehlt, versagt nicht bei der Errichtung, sondern
   bei der Ausübung — und die Ausübung ist hier die Erzeugung der
   niedern Welt; wer also nicht stiften kann, prüfe die Artikel, nicht
   den Willen.

2. Das Zwei-Provider-Muster erzwingt meist **zwei State-Phasen** (Stack-URL
   erst nach Apply bekannt) — ggf. in getrennte Root-Module aufteilen.
   Die zweite ist die zeitliche Wahrheit der Stufen: die niedere Welt
   kennt ihre Adresse erst, wenn die höhere gewirkt hat (die URL des
   Stacks entsteht mit dem Stacks), und was erst entsteht, kann nicht
   vorausgesetzt werden; die Zwei-Phasen-Ordnung (erst anwenden, dann
   fortbauen) bzw. die Aufteilung der Root-Module ist die technische
   Form dieser Chronologie — das Nacheinander der Schöpfung, in
   Verzeichnissen organisiert, und wer dagegen handelt, wer die Adresse
   vor dem Dasein sucht, der erfährt den ältesten Fehler der Formeln:
   den Verweis auf das Noch-Nicht.

3. Free-Limits (10 k Serien, 50 GB Logs/Traces, 3 aktive User) gelten
   weiter: Dashboards mit hochkardinalen Datasources sauber filtern
   (Adaptive Telemetry).
   Die dritte koppelt den Begriff an die Gaben: die Formel erzeugt
   Dashboards ohne Maß, aber das Kontingent mißt die Anschauung
   (zehntausend Serien — [FREE-TIER.md](FREE-TIER.md) hat die Lehre von
   der Mannigfaltigkeit und dem stillen Fallenlassen der Seltenen
   entwickelt), und die Pflicht der Filterung bleibt beim Nutzer auch
   im Zeitalter der Formeln; der Begriff erhebt nicht über die Grenzen,
   er verwaltet sie nur ordentlicher.

4. `grafana_dashboard` mit `config_json` aus JSON-Dateien + `jsonencode` —
   Dashboard-JSON-Export ("Share → Export") als Single Source nutzen.
   Die letzte endlich ist die Lehre von der Einen Quelle: das
   Dashboard, welches im Browser entsteht (das Ergebnis des Schauens
   und Ord-nens), soll als JSON (das Ergebnis des Formulierens)
   zum Grunde gelegt werden, und der Export ist die Brücke zwischen
   beiden Welten — die Anschauung, welche zur Formel wird, damit sie
   bleiben kann; es ist dasselbe Verhältnis, welches überall in dieser
   Sammlung zwischen dem Tun (Dashboard) und dem Begriffe (Formel)
   besteht, hier von der anschaulichsten Seite: das Bild wird Schrift,
   und die Schrift ist es, welche das Haus verwaltet — die Umkehrung
   des Anfangs, welcher die Schrift (Terraform) zum Bilde (Infrastruktur)
   macht; im Kreise der Vermittlungen hat auch die Anschauung ihre
   Rückkehr.

## Quellen

- Provider: <https://registry.terraform.io/providers/grafana/grafana/latest>
- Cloud-Stack-Guide: <https://grafana.com/docs/grafana-cloud/as-code/infrastructure-as-code/terraform/>

### Nachbetrachtung über das Beispiel als Stiftungsakt

Es sei zum Schlusse gestattet, auf das obige Beispiel noch einmal
zurückzukommen, denn es verdient eine Betrachtung, welche über die
Technik hinausgeht: es ist in seiner Art ein vollständiger
Stiftungsakt, wie ihn die politische Philosophie seit jeher
geschildert hat — nur daß er hier in vier kleinen Blöcken
vollzogen wird und in Sekunden. Da ist zuerst die Sache selbst, der
Stack mit Namen und Orte — das Volk, so könnte man sagen, welches
sich einen Namen gibt und ein Gebiet; sodann das Amt, der Service
Account mit der Rolle — die Verfassung, welche die Vollmacht
bestimmt; sodann das Zeichen, der Token — die Insignie, das
sichtbare Siegel der unsichtbaren Vollmacht; und endlich der zweite
Provider, welcher das Zeichen entgegennimmt und kraft seiner fortan
amtiert — der Amtsantritt, die Übergabe der Gewalt an die Verwaltung.
Wer diese vier Schritte in Einem Formelwerke beisammen sieht, der
sieht zum ersten Male mit Augen, was die Stiftung ist: nicht ein
Akt, sondern ein Verhältnis von Akten, wobei jeder folgende den
vorangehenden voraussetzt und alle zusammen erst das begründen, was
nachher als selbstverständlich gilt. — Und hierin liegt die Lehre
für alle andern Kapitel dieser Sammlung: auch der einfachste
Provider-Block irgendwo ist immer schon das Ergebnis von Stiftungen,
welche nicht in ihm stehen — Konten, Rollen, Rechte, ja das Repositorium
selbst —, und die Formel, welche nur das Letzte setzt, setzt das
Frühere stillschweigend voraus. Die Technik nennt dies
Abhängigkeiten; die Philosophie hat dafür seit jeher das tiefere
Wort: Vermittlung; und zwischen beiden Worten liegt der ganze Weg,
welchen diese Sammlung geht — vom Verzeichnisse der Gaben über die
Ordnung der Zeichen zur Lehre von den Stufen, auf welchen das
Einfache immer das Ende, nie der Anfang ist.

## Vermittelte Verhältnisse

Dies Kapitel ist der Begriff des anschaulichsten Hauses und damit —
man verzeihe die Steigerung — die Selbstreflexion der Sammlung: hier
wird nicht nur Infrastruktur formuliert, sondern die Stätte des
Sehens selbst; wer diesen Provider schreibt, der richtet das Auge ein,
welches alle andern Kapitel dieser Sammlung prüfen werden (das
Monitoring der Überraschungen, von welchem [FREE-TIER.md](FREE-TIER.md)
am Schlusse sprach). Die Geschwister der Form sind die Zweiheiten der
Sammlung — [../gcp/README.md](../gcp/README.md): zwei Logins;
[grafana/README.md](README.md): zwei Token; dies: zwei Provider —,
und die Steigerung ist regelmäßig: was auf der Ausweis-Stufe zwei
Zeichen war, ist auf der Werk-Stufe zwei Werkzeuge; man sieht die
Stufenlehre selbst im Fortschreiten, und es wäre zu verwundern, wenn
die nächste Stufe (zwei Formeln-Sprachen) nicht irgendwo schon
warte — sie wartet, und sie heißt in dieser Sammlung Terranix
([../helpers.md](../helpers.md), die Tafel der selbstbetriebenen
Dienste): die Vermittlung der Vermittlungen, von der besten Seite
gesehen, nämlich als die letzte.
