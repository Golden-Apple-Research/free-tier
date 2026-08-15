# Azure — Auth für Terraform

> Bevorzugt: **`az login` (CLI)** lokal, **Service Principal** (Client Secret
> oder besser OIDC) für CI. Der azurerm-Provider liest alles aus
> `ARM_*`-Umgebungsvariablen.

Die Authentisierung bei Azure hat, mehr noch als die bei AWS, den Charakter
des Feierlichen; denn diese Wolke kennt Instanzen und Titel — den Tenant,
die Subscription, den Principal —, und wer sich ihr gegenüber beglaubigt,
der beglaubigt sich nicht bloß als irgendjemand, der einen Schlüssel hat,
sondern als ein Rechtssubjekt in einem Gefüge von Rechtssubjekten, welches
Struktur hat: das Reich (der Tenant), die Provinz (die Subscription) und
die Beauftragten (die Principals). Es ist, mit einem Wort, das
kontinentale Amtswesen unter den Authentisierungen, gegen das angelsächsische
des bloßen Access Keys, und wie alles Amtswesen ist es umständlicher
und sicherer, langsam in der Ausgabe, aber fest in der Zusage; die
folgenden drei Optionen sind die drei Weisen, in diesem Amtswege zu
erscheinen: als Person, als Beauftragter oder als Beglaubigter ohne
Schrift.

## 1. Credential erstellen

**Option A — Azure CLI (empfohlen, lokal):**

```bash
az login                 # interaktiver Browser-Login
az account set --subscription "<subscription-id>"
```

Die erste Option ist die persönliche Erscheinung: der Browser öffnet sich,
die Person weist sich aus, wie sie ist, mit allem, was sie ist, und die
Subscription, welche hernach gewählt wird, ist das Amt, in welchem sie
fortan verkehrt; das ist die Unmittelbarkeit der Anerkennung — kein
Beauftragter, kein doppeltes Siegel, sondern die Person selbst am Tore —,
und ihre Tugend ist die Wahrhaftigkeit (es gibt kein engeres oder weiteres
Recht als das der Person), ihr Mangel die Unveräußerlichkeit (nur die
anwesende Person kann sich so ausweisen; jede Maschine, welcher man diesen
Login geben wollte, müßte schon die Person sein). Der interaktive
Browser-Login ist also die personale Grenze des Verfahrens: hier
endet, was delegierbar wäre, und es beginnt, was nur gelebt werden kann.

**Option B — Service Principal (CI):**

```bash
az ad sp create-for-rbac --name "tf-free-tier" \
  --role Contributor \
  --scopes /subscriptions/<subscription-id>
```

Liefert `appId` (Client-ID), `password` (Secret) und `tenant`.

Die zweite Option schafft den Beauftragten: der Service Principal ist ein
nichtmenschliches Rechtssubjekt, ein Titel, den es nur für Zwecke gibt —
eine juristische Person der Maschine, wie sie das bürgerliche Recht seit
Jahrhunderten kennt, hier in die Identitätsverwaltung der Cloud versetzt;
die Rolle (Contributor) begrenzt, was der Beauftragte darf, der Scope
(die Subscription), wo er es darf, und die drei Ausweise, welche die
Einrichtung liefert — `appId`, `password`, `tenant` —, sind Personalbogen,
Vollmacht und Zuständigkeitsbereich in Einem. Es ist die vernünftigste
aller Formen, denn sie ist die beschränkteste: das Schiff, welcher man den
Beauftragten gibt, kann nicht mehr segeln, als die Vollmacht reicht, und
die Vollmacht reicht nur die Subscription, nur die Rolle — das least
privilege, hier als Titel und Amtssitz von Rechts wegen.

**Option C — CI ohne Secret:** Federated Credentials (OIDC), z. B.
GitHub Actions via `azure/login` mit Client-ID + Tenant-ID + Subscription-ID.

Die dritte endlich ist die federierte Beglaubigung: kein Secret, welches
getragen und verloren werden könnte, sondern das Wort des einen Kreises
(Aussteller), geglaubt vom andern (Empfänger), kraft einer vorher
festgelegten Vertrauensbeziehung — dasselbe Prinzip, welches
[README.md](../aws/README.md) für AWS als die List der Maschine entwickelte:
die CI sagt, wer sie sei, ein Dritter bestätigt es, und Azure prüft die
Bestätigung gegen die Liste derer, denen es die Föderation zugesagt hat;
das Secret, dieses stete Sorgenkind alles Authentischen (man vgl. den
dritten Hinweis unten), wird damit aus der Welt geschafft, nicht weil es
vergessen, sondern weil es ersetzt ist — die Beglaubigung durch Zeugnis
an der Stelle der Beglaubigung durch Besitz, ein Fortschritt, welcher in
der Theorie der Anerkennung längst gemacht war und hier, in der Praxis
der Pipelines, nachzieht.

## 2. In Terraform einbinden

```bash
export ARM_CLIENT_ID="<appId>"
export ARM_CLIENT_SECRET="<password>"   # nur bei Option B
export ARM_TENANT_ID="<tenant>"
export ARM_SUBSCRIPTION_ID="<subscription-id>"
# Bei Option A (az login): nichts exportieren
```

```hcl
provider "azurerm" {
  features {}
}
```

Die vier `ARM_*`-Variablen sind die Amtspapiere des Beauftragten,
zusammengesetzt aus den drei Stücken der Vollmacht und dem Zuständigkeitsorte
(Client, Secret, Tenant, Subscription); daß sie als Env-Variablen gesetzt
und nicht in den Provider-Block geschrieben werden, ist dieselbe Scheidung
des Öffentlichen vom Geheimen, welche [../aws/README.md](../aws/README.md)
im Zusammenhange begründet hat — der Block nennt die Form, die Umgebung
birgt den Wert —, und der kleine Kommentar (bei Option A nichts
exportieren) enthält die ganze Wahrheit der Zweiheit: entweder die Person
oder der Beauftragte, aber nicht beide, denn die Anerkennung duldet keine
Doppelheit, ohne dem Widerspruche zu verfallen, wovon sogleich.

## 3. Hinweise

- `az login` hat Vorrang vor keinen ARM_*-Vars: Wer beide mischt,
  überrascht sich. In CI immer den Service Principal setzen.
  Der erste Hinweis ist ein Satz, den man zweimal lesen muß, und der
  gerade deswegen wichtig ist, weil er die Schwerkraft der
  Anerkennungsverhältnisse lehrt: die Person (der CLI-Login) überstrahlt
  den Beauftragten (die Vars) — oder überstrahlt ihn nicht; in beiden
  Fällen aber entsteht aus der Vermengung ein Zustand, in welchem der
  Nutzer nicht mehr weiß, als welcher er eigentlich spricht, und das ist
  bei Anerkennungen der schlimmste Zustand: nicht die Verweigerung (die
  wäre deutlich), sondern die Ungewißheit über die eigne Rolle. Die Regel
  — lokal die Person, in CI der Principal — ist also keine Konvention,
  sondern die Forderung der Einheit des Ausweises; wer sie hält, weiß
  stets, wer er ist, und wird von keinem System mehr danach gefragt, als
  er sagen kann.

- Nach Ablauf des 30-Tage-Startguthabens wird die Subscription auf
  "deaktiviert" gesetzt — TF-Applies laufen dann auf Fehler; Restlaufzeit
  der 12-Monats-Services separat überwachen.
  Der zweite Hinweis knüpft an [FREE-TIER.md](FREE-TIER.md) an und zeigt,
  wie die Frist des Guthabens bis in das Innerste der Technik durchschlägt:
  die Deaktivierung ist nicht die Kündigung (die 12-Monats-Services
  laufen ja fort), sondern die Sistierung — ein Zwischenzustand zwischen
  Geltung und Erlöschung, in welchem die Formeln des Nutzers auf Fehler
  laufen, weil das Amt, bei welchem sie vorstellig werden, den Dienst
  eingestellt hat, ohne die Beamten zu entlassen; die Separatüberwachung
  der Restlaufzeit, welche hier empfohlen wird, ist also das
  Gegenstück zur Kalenderpflicht des zwölften Monats (siehe die Gotchas
  des Kontingent-Kapitels): zwei Fristen, zwei Uhren, und die Klugheit
  besteht darin, beide zu stellen, ehe die eine abläuft und die andere
  noch läuft — ein Zustand, den man die riskanteste aller Zeitlichkeiten
  nennen kann, weil er das Scheinbare des Fortbestehens mit dem
  Wirklichen des Endes verbindet.

- Client Secrets laufen ab (Standard 6–24 Monate) — Ablauf im Kalender
  notieren oder OIDC nutzen.
  Der dritte endlich lehrt die Vergänglichkeit des Beauftragten selbst:
  auch das Secret, die Vollmacht des Principals, hat seine Frist, und es
  ist die feinste Entsprechung dieses ganzen Kapitels, daß die Wolke der
  Fristen (Azure) auch ihren Schlüsseln Fristen gibt — der Nutzer mag
  sie im Kalender notieren, wie er die zwölf Monate notiert, oder er mag,
  mit der federierten Option, das Geheimnis überhaupt abschaffen und mit
  ihm die Notwendigkeit, sein Ablaufen zu überleben; die Wahrheit über
  die Vergänglichkeit der Geheimnisse ist damit ausgesprochen: nichts,
  was getragen wird, ist unverlierbar, und was unverlierbar sein soll,
  muß statt getragen zu werden, beglaubigt werden.

## Quellen

- Provider-Auth: <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#authenticating-to-azure>
- Service Principal: <https://learn.microsoft.com/azure/developer/terraform/authenticate-to-azure>

## Vermittelte Verhältnisse

Die Anerkennung ist das Mittelste der drei Dokumente: ohne sie kein Zugang
zu den Gaben ([FREE-TIER.md](FREE-TIER.md)), ohne die Gaben kein Ziel des
Begriffs ([TERRAFORM.md](TERRAFORM.md)), ohne den Begriff kein Grund, sich
zu erkennnen; der Kreis ist geschlossen, und es ist derselbe Kreis, welcher
sich in [../aws/README.md](../aws/README.md) und, demnächst zu lesen, in
allen folgenden READMEs dieses Werkes schließen wird — mit immer andern
Titeln (Token, Key, Principal, PAT), aber immer demselben Inhalte: daß der
Wille sich ausweisen muß, um zu gelten, und daß die Form des Ausweises
die Form des Vertrauens ist, welches die Welt der Dienste einander
entgegenbringt — ein Vertrauen, dessen Vollkommenheit in der Aufhebung
seiner eignen Mittel besteht, von welcher die federierte Beglaubigung der
bislang erreichte höchste Grad ist.
