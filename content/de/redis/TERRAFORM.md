# Redis Cloud + Terraform

> Offizieller Provider `RedisLabs/rediscloud` (von Redis selbst gepflegt).
> Deckt Essentials und Pro ab — aber der **Free-30-MB-Plan ist der Sonderfall**:
> Anlage am einfachsten über die Konsole, dann per `terraform import`
> übernehmen.

Der Sonderfall, von welchem der Kasten spricht, ist die
lehrreichste Ausnahme der ganzen Formel-Welt: der offizielle
Provider (vom Hause selbst gepflegt — die seltenste der Stufen,
welche [../modal/TERRAFORM.md](../modal/TERRAFORM.md) als die fehlende
und [../neon/TERRAFORM.md](../neon/TERRAFORM.md) als die adoptierte
kannte) deckt beide Welten ab, die der umsonsten Vorschule und die
des bezahlten Ernstes — und gerade für die umsonste ist er
„zickig" (die starke Genauigkeit dieses Alltagswortes sei
gerühmt): die Form will die Zahlungsweise, der Plan hat keine. Die
Lösung des Hauses ist der doppelte Weg: Hand am Anfange (Konsole),
Begriff am Ende (Import) — die Aneignung des Handgemachten, und es
ist derselbe Weg, welchen [../netlify/TERRAFORM.md](../netlify/TERRAFORM.md)
an der Site vorführte, hier am eigenen Free-Plane wiederholt; die
Sammlung hat damit die vollständige kleine Reihe der
Anfangs-Probleme: das Haus, dessen Gründung formellos ist (Netlify),
das Haus, dessen Gründung formlos bleibt (Neon, die Gemeinde), das
Haus, dessen Gründung die Form verweigert (Redis, die Zahlungsweise)
— drei Weisen, daß der Anfang dem Begriffe widerstrebt, und der
Import als das allgemeine Heilmittel: die Erinnerung nimmt, was die
Formel nicht gab.

## Provider-Setup

```hcl
terraform {
  required_providers {
    rediscloud = {
      source  = "RedisLabs/rediscloud"
      version = "~> 2.0"
    }
  }
}

provider "rediscloud" {
  api_key    = var.redis_api_key    # env: REDISCLOUD_ACCESS_KEY
  secret_key = var.redis_secret_key # env: REDISCLOUD_SECRET_KEY
  # Keys: Redis Cloud Console → Account Settings → API Keys
}
```

Es ist die Blockform des Paares — beide Stücke ausdrücklich, je mit
dem Kommentare der Env-Form daneben (die Doppelheit der
Mitteilungsformen, welche [README.md](README.md) verzeichnete) —,
und die Zeile unter dem Blocke führt den Weg zu den Schlüsseln
selbst an; die Deutlichkeit des Hauses in seinen Formeln ist die
eines guten Lehrbuches: es sagt nicht nur WAS, sondern WOHER und
WOZU.

## Ressourcen-Mapping

| Objekt | Terraform-Ressource |
|---|---|
| Essentials-Subscription (inkl. Free) | `rediscloud_essentials_subscription` |
| Essentials-Datenbank | `rediscloud_essentials_database` |
| Essentials-Pläne (lesen) | `data.rediscloud_essentials_plan` |
| Pro-Subscription | `rediscloud_subscription` (+ `rediscloud_database`) |
| Payment Method (lesen) | `data.rediscloud_payment_method` |

Die Tafel führt beide Welten in Einer Ordnung: die drei ersten
Zeilen die Vorschule (Subscription, Datenbank, die Pläne als
Lese-Sache — das Nachschlagen des Stufenbuches), die vierte den
Ernst (Pro samt der eignen Datenbank), die fünfte — die
Zahlungsweise als lesbares Objekt — die Brücke zwischen beiden, und
zugleich die Erklärung des Sonderfalles: die Formel-Welt kennt die
Zahlungsweise als Ding unter Dingen (lesbar, referenzierbar), und
deshalb verlangt sie dieselbe auch dort, wo nichts zu zahlen ist;
die Voraussetzung wird zum Bestandteile der Grammatik, und die
Gnade, welche keine Zahlungsweise hat, wird sprachlos — das ist die
ganze „Zickigkeit" im Lichte der Logik.

## Beispiel: Essentials-Plan nachschlagen

```hcl
# Verfügbare Essentials-Pläne (Größe/Region/Provider) nachschlagen:
data "rediscloud_essentials_plan" "plan" {
  name           = "Single-Zone_30MB" # Free-Plan; verfügbare Namen via API prüfen
  cloud_provider = "AWS"
  region         = "us-west-1"
}

output "plan_id" {
  value = data.rediscloud_essentials_plan.plan.id
}
```

Free-Subscription in der Konsole anlegen und importieren:

```bash
terraform import rediscloud_essentials_subscription.free sub-xxxxxxxxxxxx
```

Das Beispiel ist die Lese-Form der Vorschule: das Nachschlagen des
Free-Plan-Namens (Single-Zone_30MB — der Name als die knappste
Beschreibung: die Zone und das Maß in Einem Worte), die Wahl des
Wolken-Trägers und der Örtlichkeit — und der Output, welcher die
Nummer des Planes zurückgibt; die Doppel-Klammer des Beispiels sei
dem Originale nachgelassen (ein Überbleibsel des Wachstums, dem
kein Übelstand folgt, solange niemand es tilgt). Der zweite Teil —
die Konsole-Anlage und der Import — ist der doppelte Weg selbst:
draußen gründen (die Hand), drinnen aneignen (die Formel), und die
Zeile des Import-Befehles ist die Einbürgerungsurkunde: die
Subscription, unter ihrer Kennung (sub-…), wird Staatsbürgerin des
Staates (State), mit allen Rechten der Erinnerten.

## Gotchas

1. **Free-Plan via TF ist zickig:** `rediscloud_essentials_subscription`
   erwartet i. d. R. eine Payment-Method-ID (Data-Source) — für den
   kostenlosen 30-MB-Plan ist der Konsole+Import-Weg der stressfreie.
   Die erste ist die oben entwickelte Voraussetzungs-Lehre in der
   Praxis: die Ressource WILL die Zahlungsweise (i. d. R. — die
   Formulierung ehrt die Ausnahme, ohne sie zu versprechen), und der
   Weg über die Hand ist der „stressfreie" — der einzige Fall in
   dieser Sammlung, in welchem die Bequemlichkeit des Handgemachten
   ausdrücklich empfohlen wird; die Wahrheit dahinter ist groß: die
   Formeln sind für die Welt gemacht, welche bezahlt, und die Welt,
   welche nicht bezahlt, ist ihre Ausnahme — das Umsonst als
   Grenzfall der Grammatik, und der Import als der Übergangs-Verkehr
   für Grenzgänger.

2. Auth braucht **API-Key + Secret** aus der Konsole (nicht der Login-Creds).
   Die zweite wiederholt die Gattungslehre von [README.md](README.md):
   das Paar der Boten, nicht die Zeichen der Person; wer die Login-Creds
   in die Formel brächte, der brächte die Person zur Maschine — die
   alte Vermengung, welche [../azure/README.md](../azure/README.md)
   (CLI gegen ARM-Variablen) und [../gcp/README.md](../gcp/README.md)
   (die zwei Logins) auf ihre je eigene Weise verboten.

3. Essentials-Datenbanken sind single-instance ohne HA — gotchas aus
   FREE-TIER.md (100 Ops/s, 30 Verbindungen) gelten auch per TF.
   Die dritte koppelt die Form an die Gaben: die Einsamkeit der
   Instanz (das Leben ohne Zeugen — [FREE-TIER.md](FREE-TIER.md) hat
   es die Verneinung des Großen genannt) und die kleinen Maße (der
   Puls, die Hände) bleiben auch in der Formel-Welt dieselben; die
   Formel verwandelt die Grenzen nicht, sie verwaltet sie — das
   bekannteste und am häufigsten vergessene Wort der Sammlung.

4. Pro-Ressourcen (`rediscloud_subscription`) können **echte Kosten**
   auslösen — im Free-Kontext nicht anfassen.
   Die letzte endlich ist das Verbot am alimentossträchtigen Objekte:
   die Pro-Ressource, mit denselben Zeichen erreichbar (die volle
   Macht des Paares — [README.md](README.md), zweiter Hinweis), kann
   das Geld bewegen; die Ermahnung „nicht anfassen" ist die
   elementarste Form aller Haftungspflicht — die Formel kennt den
   Preis nicht, die Hand muß ihn kennen —, und die Sammlung hat das
   Verbots-Genre an allen Ecken wiederholt; hier ist es am kürzesten
   und am direktesten: die Kosten als das Reale, welches der Begriff
   nicht sieht.

## Quellen

- Provider: <https://registry.terraform.io/providers/RedisLabs/rediscloud/latest>
- TF-Guide: <https://redis.io/docs/latest/integrate/terraform-provider-for-redis-cloud/>

## Vermittelte Verhältnisse

Dies Kapitel vermittelt die Zeichen ([README.md](README.md)) und die
Gaben ([FREE-TIER.md](FREE-TIER.md)) des Gedächtnis-Hauses; seine
Lehre vom doppelten Wege (Hand und Begriff) verbindet es mit
[../netlify/TERRAFORM.md](../netlify/TERRAFORM.md) (die formlose
Site) und dem Import-Motiv von [../neon/TERRAFORM.md](../neon/TERRAFORM.md)
(die Rettung beim Tode des Werkzeugs — hier die Rettung bei der
Geburt der Gnade: derselbe Befehl, zwei Wunder); die
Zahlungs-Lehre (die Voraussetzung der Form) aber gehört in den
größten Zusammenhang der Sammlung: das Billing-Konto als Bedingung
des Umsonst ([FREE-TIER.md](../gcp/FREE-TIER.md), erster Hinweis)
erscheint hier in der Formel-Welt wieder — dieselbe Wahrheit, zweimal
ausgesprochen, in der Sprache der Gaben und in der Sprache der
Begriffe, und wer beide Stellen nebeneinander hält, der hat das
Grundgesetz aller Kontingent-Welt in seiner vollen Paradoxie: das
Umsonst existiert nur im Reiche des Geldes, als seine Ausnahme,
seine Vorschule, sein Lockmittel — oder, um es freundlich zu
sagen: als sein Lehrgang, dessen letzte Lektion die Zahlung ist.
