# Neon — Auth für Terraform

> Bevorzugt: **API Key** aus dem Neon Console (Account Settings),
> bereitgestellt über `NEON_API_KEY`.

Die Ausweisordnung dieses Hauses ist die schlichteste der Sammlung:
Ein Schlüssel, Eine Variable — keine Stufen, keine Gattungen, keine
Föderation; und die Schlichtheit ist, wie immer, das Ergebnis von
Vereinfachungen, welche ihre Geschichte haben. Die folgende Anleitung
zeigt die zwei großen Momente dieser Geschichte: das einmalige Zeigen
(das alte Geheimnis der Erzeugung, welches die Sammlung von
[../circle-ci/README.md](../circle-ci/README.md) bis
[../gcp/README.md](../gcp/README.md) verfolgt hat) und die harte
Rotation (das Ende ohne Übergang, das Widerspiel zum weichen Rollen
der Cloudflare-Token); zwischen beiden spannt sich das ganze Problem
des Zeichenwechsels, und Neon hat sich für die harte Form entschieden
— aus welchen Gründen, wird zu bedenken sein.

## 1. Key erstellen

Neon Console (<https://console.neon.tech>) → Avatar (oben rechts) →
**Account settings → API keys** → **Create new API key** → Name vergeben →
Key einmalig kopieren.

(Projekt- oder Org-scoped Keys liegen stattdessen unter der jeweiligen
Org → **Settings → API keys**.)

Das Verfahren ist das bekannte; der Klammerzusatz aber ist die
neuartige Zugabe: es gibt nämlich zwei Gattungen von
Schlüsselorten — die persönlichen (unter dem Account) und die
umfangsgebundenen (unter der jeweiligen Org, projekt- oder
organisationsscoped) —, und damit kehrt die Gattungslehre der Token
([../modal/README.md](../modal/README.md): Workspace gegen User), von
der die Sammlung schon handelt, auch hier wieder: Person und Amt,
persönliches Zeichen und umgrenztes; der Unterschied der Häuser ist
nur, ob die Gattung in die Ausstellung selbst gelegt ist (Modal: zwei
Menü-Pfade) oder in den Aufbewahrungsort (Neon: zwei Settings-Seiten)
— die Sache bleibt dieselbe, und der dritte Hinweis unten wird sie in
die Empfehlung übersetzen.

## 2. In Terraform einbinden

```bash
export NEON_API_KEY="napi_…"   # Community-Provider liest diese Env-Var
```

```hcl
provider "neon" {}
```

Der leere Provider-Block — die reinste Form, welche diese Sammlung
kennt (auch [../cloudflare/README.md](../cloudflare/README.md) hat
ihn) —, und der Kommentar nennt die eine Bedingung: der
Community-Provider liest die Env-Var. Man beachte die Zusammensetzung
der drei Einfachheiten: die Ausweisform (ein Schlüssel), die
Mitteilungsform (eine Variable), die Werkzeugform (ein leerer Block)
— die Philosophie des Wenigen, hier in drei Zeilen, und es scheint
fast, als sei die Einfachheit selbst das Kennzeichen der jüngeren
Häuser, welche aus der Geschichte der älteren gelernt haben, daß die
Vollkommenheit des Ausweises in seiner Anspruchslosigkeit besteht.

## 3. Hinweise

- Der Key wird **nur einmal bei Erstellung** angezeigt — sofort im
  Secret-Manager (1Password/Vault/CI-Secrets) ablegen.
  Der erste Hinweis ist die alte Tragik des einmaligen Zeigens
  ([../modal/README.md](../modal/README.md) hat sie am Token-Paare,
  [../circle-ci/README.md](../circle-ci/README.md) am CircleCI-Token):
  das Haus weiß das Geheimnis nur in der Sekunde seiner Geburt, der
  Nutzer muß es in derselben Sekunde in Sicherheit bringen (den
  „Secret-Manager" — den Tresor der Zeichen, in welcher Gestalt auch
  immer), und wer die Sekunde verstreichen läßt, der hat nichts
  Verlorenes, sondern ein Nie-Gehabtes; die Erzeugung als einmalige
  Gnade der Sichtbarkeit.

- Rotation = alten Key **revozieren** (sofort & endgültig!) + neuen
  erstellen + überall updaten — kein paralleler Betrieb während der Rotation
  möglich.
  Der zweite ist die harte Rotation, das Widerspiel aller Weichheit:
  der alte Schlüssel stirbt sofort und endgültig (keine Frist, keine
  Übergangszeit), und es gibt kein Nebeneinander der Zeichen — die
  Anerkennung ist entweder ganz die alte oder ganz die neue. Die
  Folge ist die Unterbrechung: „kein paralleler Betrieb während der
  Rotation möglich" — zwischen dem Tode des alten und der Ankunft des
  neuen an allen Orten herrscht die Lücke, der Zustand ohne gültiges
  Zeichen; man vergleiche das Rollen von
  [../cloudflare/README.md](../cloudflare/README.md) (der alte Token
  bleibt bis Ablauf — die kontinuierliche Erneuerung) und sehe den
  Gegensatz vollständig: dort der Wechsel ohne Lücke (das Mittel
  trägt die Übergangszeit), hier die Lücke ohne Mittel (die Sicherheit
  verlangt die vollzogene Anerkennung vor jeder neuen). Die Klugheit
  des Nutzers besteht hier im Timing — die Rotation in der toten
  Stunde, da niemand fragt —, dort in der Bequemlichkeit; jede Form
  hat ihren Preis, und die harte Form zahlt mit der Unterbrechung,
  die weiche mit der vorübergehenden Doppelgültigkeit; wer zwischen
  ihnen wählt, wählt zwischen zwei Risiken, und es gibt keine
  risikolose Erneuerung — das tiefste Wort, welches diese Seite zu
  sagen hat.

- Personal Keys gelten account-weit; für CI lieber einen Org- oder
  Project-Scoped Key mit minimaler Reichweite.
  Der dritte ist die Empfehlung der Gattungslehre: das persönliche
  Zeichen (account-weit, überall gültig) für die Person, das
  umgrenzte (Org- oder Project-Scope, „minimale Reichweite") für die
  Maschine; es ist dieselbe Arbeitsteilung, welche die Sammlung
  überall empfiehlt ([../aws/README.md](../aws/README.md): least
  privilege; [../circle-ci/README.md](../circle-ci/README.md): der
  Bot-User), hier mit der besonderen Ehrlichkeit, daß die
  Gattungsunterschiede im Aufbewahrungsorte (Account oder Org) schon
  angelegt sind — die Ordnung des Hauses kommt dem klugen Nutzer
  entgegen, und wer ihr folgt, hat die Verfassung der Zeichen, ohne
  sie selbst setzen zu müssen.

- Der Provider ist Community-gepflegt (`terraform-community-providers/neon`)
  — Version pinnen (siehe TERRAFORM.md).
  Der vierte endlich verweist auf das Schicksal des Werkzeugs: die
  Gemeinde pflegt es ([TERRAFORM.md](TERRAFORM.md) erzählt die
  Namensgeschichte des Wechsels von kislerdm zu den
  community-providers), und die Jugend/Pflegschaft eines solchen
  Werkzeugs verlangt die bekannte Sorgfalt — das Pinne, das Review
  des Aufstiegs ([../circle-ci/TERRAFORM.md](../circle-ci/TERRAFORM.md)
  am 0.x-Zustande); die Zeichen folgen dem Werkzeuge, und das
  Werkzeug folgt der Gemeinde — die Abhängigkeitskette, an deren
  Ende der Nutzer steht.

## Quellen

- API-Keys verwalten: <https://neon.com/docs/manage/api-keys>
- TF-Guide: <https://neon.com/docs/reference/terraform>

## Vermittelte Verhältnisse

Die Ausweise vermitteln zwischen den Gaben ([FREE-TIER.md](FREE-TIER.md))
und dem Begriffe ([TERRAFORM.md](TERRAFORM.md)) des werdenden
Postgres; ihre Lehren — das einmalige Zeigen, die harte Rotation, die
Gattungsordnung — gehören in den großen Zusammenhang, welchen die
Sammlung als die Geschichte der Zeichen erzählt: von der einfachen
Münze (Access Key) über das Paar (Modal), das geschnittene Recht
(Cloudflare), die zwei Stufen (Grafana) bis zu diesem einfachen
Schlüssel mit der harten Erneuerung; und wer alle Kapitel der
Zeichen gelesen hat, der weiß, daß keine Form die letzte ist und jede
ihr Haus nach ihrem Wesen baut — das Haus des Werdens (Neon) braucht
die härteste Erneuerung, denn es hat es mit dem Nichts zu tun, und
das Nichts duldet keine Übergänge.
