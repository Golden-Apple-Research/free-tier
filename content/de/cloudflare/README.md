# Cloudflare — Auth für Terraform

> Bevorzugt: **Scoped API Token** (nicht der Global API Key!) aus einem
> Account-Template, bereitgestellt über `CLOUDFLARE_API_TOKEN`.

Der erste Satz enthält eine ganze Politik: das geschnittene (scoped)
Token gegen den globalen Schlüssel. Der Global Key ist die_absolute
Macht — alles, überall, immer —, und wie alle absolute Macht ist sie
unbrauchbar für die Zwecke der Vernunft, denn sie gibt dem Werkzeug,
welches sie trägt, mehr Rechte, als irgend ein Zweck verlangt; das
scoped Token hingegen ist der Verfassungsstaat der Ausweise: die Macht,
geteilt nach Gegenständen, zugemessen nach Zwecken, umrissen nach
Ressourcen. Es ist dies die fortgeschrittenste aller in dieser Sammlung
vorgeführten Ausweis-Ordnungen — AWS trennt nach Person und Amt,
Azure nach Titel und Scope, Google nach Projekt und Föderation, aber
Cloudflare schneidet das Recht nach der Tätigkeitsart (Scripts lesen
oder schreiben, D1, KV, R2, Pages, Queues — je eigene Zeile) —, und
die folgende Anweisung ist daher weniger ein Rezept als eine kleine
Staatsgründung: man errichtet sein Token wie eine Verfassung, Artikel
für Artikel, und zwar von den Templates her („Edit Cloudflare Workers"),
welche die Erfahrung des Hauses in fertige Grundgesetze gegossen hat.

## 1. Token erstellen

Dashboard → **My Profile → API Tokens** (oder Account → *Manage Account* →
*API Tokens*) → **Create Token** → Template **"Edit Cloudflare Workers"** →
*Use template*.

Für das komplette Free-Tier-Setup (Workers, D1, R2, KV, Queues) unter
*Permissions* ergänzen:

| Permission | Ressource | Zugriff |
|---|---|---|
| Worker Scripts | Account | Edit |
| D1 | Account | Edit |
| Workers KV Storage | Account | Edit |
| Cloudflare Pages | Account | Edit |
| R2 | Account | Edit |
| Queues | Account | Edit |
| Zone / DNS (optional) | Zone | Edit |

Unter *Account Resources* das eigene Free-Konto auswählen → *Continue to
summary* → **Create Token** → Token **einmalig** kopieren.

Die Tafel der Befugnisse ist das eigentliche Dokument: jede Zeile ein
Artikel (Worker Scripts: Edit; D1: Edit; KV: Edit; …), die letzte Zeile
die Kann-Bestimmung (Zone/DNS, optional — die Ausdehnung auf die
Namenwelt, falls das Werk auch die Namen verwaltet), und die Spalte
„Ressource" die raumordnerische Nebenbestimmung (Account oder Zone —
das Haus oder das Gebiet); wer diese Tafel ausfüllt, gibt seinem Token
eine Persönlichkeit, und zwar eine beschränkte: das Token darf alles
für die Workers-Familie und sonst nichts — ein Fachmann, kein Herrscher.
Das Template am Anfange ist dabei die Vorauswahl, welche das Haus
trifft; man beginnt nicht mit dem leeren Blatte, sondern mit einer
Empfehlung, und die Ergänzungen (die Tafel oben) sind die Anpassung der
Empfehlung an das eigene Vorhaben — die Mischung aus Erfahrung und
Willkür, aus welcher alle Verfassungen leben.

## 2. In Terraform einbinden

```bash
export CLOUDFLARE_API_TOKEN="…"   # Provider liest diese Env-Var automatisch
export TF_VAR_account_id="<account-id>"  # Dashboard → Overview → rechts Account ID
```

```hcl
provider "cloudflare" {}   # Token kommt aus der Env-Var — nichts hardcodieren
```

Der leere Provider-Block ist die Vollendung der ganzen Bewegung: das
Werk nennt sich selbst (cloudflare), aber es enthält nichts — kein
Geheimnis, keine Adresse, keine Konfiguration; alles ist in die
Umgebung gewandert (das Token), in die Variablen (die Account-ID), in
die Ordnung der Tafeln oben. Es ist der Zustand, welchen alle
vorhergehenden Kapitel anstrebten ([../aws/README.md](../aws/README.md),
[../gcp/README.md](../gcp/README.md)): der Block als reine Form, die
Sicherheit als lauter Umgebung, und der Kommentar ist der Kern des
Ganzen — „nichts hardcodieren", das Gebot der Trennung von Form und
Inhalt, hier als Ein-Wort-Verfassung.

## 3. Hinweise

- Global API Key (`CLOUDFLARE_EMAIL` + `CLOUDFLARE_API_KEY`) hat
  Vollzugriff auf **alles** — für Terraform nicht verwenden.
  Der erste Hinweis ist das Verbot der absoluten Macht, von welcher der
  Eingang sprach; wer ihn übertritt, der hat die Bequemlichkeit eines
  Schlüssels für alles und die Gefahr von allem, und die Geschichte
  aller geleakten Schlüssel ist die Geschichte dieses Übertritts. Es
  gehört zu den stillen Ironien der Technik, daß der alte globale
  Schlüssel aus einer Zeit stammt, in welcher es noch nichts zu
  schneiden gab — die Absolutheit war damals Unschuld, heute ist sie
  Nachlässigkeit.

- Fehlende Permissions melden sich erst zur Apply-Zeit als 403/9109 —
  Token-Scope von Anfang an passend zum Ressourcen-Set bauen.
  Der zweite ist die Lehre vom zu klein geschnittenen Staate: die
  Verfassung, welche Artikel vergißt, fällt nicht bei der Errichtung
  auf, sondern erst bei der Ausübung — der 403 (und sein Hausgeist
  9109) ist die verweigerte Handlung, nicht die verweigerte Errichtung;
  wer den Scope nach dem Baukasten der Tafel richtet (alle Familien,
  welche der Plan berührt), der baut die Verfassung einmal richtig und
  hat Frieden; wer sie enger baut und nachbessert, der lernt die
  Fehlerliste der Handlungen kennen — die umgekehrte Reihenfolge des
  Erkennens, theuer erkauft und doch die übliche.

- Token-Rotation: In der Token-Liste → *Roll* — alter Token bleibt bis
  Ablauf gültig, erlaubt Zero-Downtime-Rotation.
  Der dritte endlich ist die zeitliche Vollendung des Ganzen: das Rollen
  — der Wechsel des Zeichens ohne Unterbrechung der Geltung — läßt den
  alten Token leben, bis der neue überall angekommen ist; es ist die
  kontinuierliche Erneuerung, wie sie der wahrhafte Kreislauf fordert:
  kein Sterben vor der Geburt des Nachfolgers, kein Loch in der
  Kontinuität der Anerkennung. Wer dies mit der strengen Gültigkeit der
  andern Häuser vergleicht ([../circle-ci/README.md](../circle-ci/README.md):
  das einmalige Zeigen; [../gcp/README.md](../gcp/README.md): die JSON-
  Datei als volle Münze), der sieht die Stufen einer Entwicklung: vom
  unverlierbaren Besitz zum rollenden Zeugnis, und die Richtung der
  Entwicklung ist klar — die Anerkennung wird verläßlicher, indem sie
  flüchtiger wird.

## Quellen

- Provider-Auth: <https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs>
- Token erstellen: <https://developers.cloudflare.com/fundamentals/api/get-started/create-token/>
- Token-Templates: <https://developers.cloudflare.com/fundamentals/api/reference/template/>

## Vermittelte Verhältnisse

Die Ausweise dieses Randes vermitteln zwischen den Gaben
([FREE-TIER.md](FREE-TIER.md)) und dem Begriffe ([TERRAFORM.md](TERRAFORM.md));
die allgemeine Lehre vom geschnittenen Rechte gehört in den Zusammenhang,
welchen [../helpers.md](../helpers.md) (die Scopes der Agenten) und
[../aws/README.md](../aws/README.md) (least privilege als Bürgerverfassung)
tragen. Wer hier gelernt hat, die Macht zu schneiden, hat überall
gelernt, die Macht zu schneiden — denn es ist in allen Wolken dasselbe
Werk, unter verschiedenen Namen: der Scope hier, die Rolle dort, die
Ressource drüben; und das Gemeinsame aller dieser Namen ist der eine
Satz, welcher über dieser ganzen Seite stünde, wenn Seiten Leitsätze
trügen: die vollkommene Macht ist die begrenzte.
