# Netlify Free Plan

> Netlify hat sein Free-Angebot auf ein **Credit-System** umgestellt: 300 Credits
> pro Monat, aus denen sich Bandbreite, Builds, Compute und Requests gemeinsam
> finanzieren. Alte Guides mit "100 GB Bandbreite + 300 Build-Minuten" sind
> veraltet.

Die Umstellung, von welcher der Kasten berichtet, ist die
lehrreichste Wende in der ganzen Geschichte dieser Sammlung: was
einst ein Bündel fester Freimengen war (hundert Gigabyte hier,
dreihundert Minuten dort), ist nun EINE Währung — dreihundert Credits
—, aus welcher alles gemeinschaftlich bezahlt wird; die Teilmengen
sind gefallen, das Geld ist geblieben. Man erkennt die Bewegung: die
Kontingent-Welt schreitet von den Naturmaßen (Stunden, Gigabytes —
die Maße der Dinge) zu der abstrakten Einheit (dem Credit — dem Maße
der Werte), und diese Abstraktion hat die bekannten zwei Seiten: sie
befreit (alles mit Allem teilbar, keine verschwendete Freimenge) und
sie entfremdet (nichts ist mehr unmittelbar verständlich; was „100 GB
gratis" hieß, ist eine Rechenaufgabe geworden). Der Vergleich mit den
Schwestern liegt nahe: [../vercel/FREE-TIER.md](../vercel/FREE-TIER.md)
hält die alten Naturmaße (100 GB Bandbreite als eigene Zeile),
Cloudflare ([../cloudflare/FREE-TIER.md](../cloudflare/FREE-TIER.md))
geht in die andere Richtung (maßlos im Erscheinen) — Netlify allein
wagt die volle Vergeldung des Umsonst, und die Zahl dreihundert wird
damit zum Inbegriff eines ganzen Haus-Charakters.

## Free Plan (Einzelnutzer)

| Resource | Wofür ist das? | Wert |
|---|---|---|
| **Credits** | Abrechnungswährung des neuen Modells — Deploys, Bandbreite und Compute zehren daran | 300 / Monat (Hard Limit, kein Auto-Recharge, kein Rollover) |
| **Concurrent Builds** | Builds, die gleichzeitig laufen dürfen — bei 1 reihen sich weitere Pushes in die Warteschlange | 1 |
| **Team** | Rollen im Team: 1 Owner (verwaltet/zahlt), Reviewer dürfen Previews nur lesen/kommentieren | 1 Team-Owner, unbegrenzte Reviewer (nur Lese-/Kommentarrolle) |
| **Projekte** | Sites/Projekte pro Team | 500 |
| **Deploy Previews** | Jeder Pull-Request bekommt automatisch ein eigenes Deployment unter Preview-URL | unbegrenzt |
| **[Form Submissions](https://docs.netlify.com/forms/setup/)** | Formular-Backend für statische Sites: Formular ins HTML, Einsendungen landen im Dashboard (optional per E-Mail) | unbegrenzt und gratis (seit April 2026) |
| **[Netlify Database](https://docs.netlify.com/build/data-and-storage/netlify-database/)** | Gemanagte Postgres-Datenbank mit Branching, direkt ins Netlify-Projekt integriert | 3 Datenbanken, 20 aktive Branches, 7 Tage Backup-Retention |
| **Custom Domains + SSL** | Eigene Domains auf Projekte mappen; TLS-Zertifikate stellt Netlify automatisch | inklusive |

Die Tafel zeigt sofort die Eigentümlichkeit: eine Zeile Geld und
sonst lauter Unbegrenztheiten — fünfhundert Projekte, unbegrenzte
Vorschauen, unbegrenzte Formulare (seit April 2026 ganz gratis — eine
der seltenen Ausweitungen in dieser Sammlung!), drei Datenbanken mit
zwanzig Zweigen und siebentägiger Sicherung; das Haus gibt die Formen
grenzenlos und die Kraft begrenzt: solange die dreihundert reichen,
ist alles unendlich, und wenn sie nicht reichen, ist nichts mehr
unendlich. Es ist die konsequenteste Form der Währungs-Wahrheit:
das Umsonst ist kein Besitz mehr, sondern ein Guthaben; der
Hard-Limit-Vermerk (kein Auto-Recharge — der Schutz; kein Rollover —
die Monatlichkeit) vollendet den Charakter. Die Team-Zeile — ein
Eigentümer, unbegrenzte Zuschauer (nur lesen und kommentieren) — ist
die kleine Ständekunde: der Zahlende allein ist Handelnder, die
Öffentlichkeit ist Publikum; man vergleiche die drei Nutzer
von [../grafana/FREE-TIER.md](../grafana/FREE-TIER.md) (alle tätig)
und die fünf Aktiven von [../circle-ci/FREE-TIER.md](../circle-ci/FREE-TIER.md)
— drei Stufen der Zulassung zur Tätigkeit, und Netlify wählt die
restlose Scheidung von Tun und Schauen.

## Credit-Verbrauch (What costs how much)

| Aktion | Credits |
|---|---|
| Produktions-Deploy | 15 (Preview-/Branch-Deploys und fehlgeschlagene Builds gratis) |
| Bandbreite | 20 pro GB |
| Web Requests (inkl. Edge Functions) | 2 pro 10.000 Requests |
| Compute (Functions, Preview Server, Agent Runners, DB) | 10 pro GB-Stunde |
| AI-Inferenz | 180 pro $1 Modellkosten |

Beispiel: 300 Credits reichen für ~15 GB Bandbreite **oder** 20 Produktions-Deploys
**oder** 1,5 Mio. Requests — Kombinationen teilen sich das Budget.

Die Verbrauchstafel ist das Preisverzeichnis der Abstraktion —
fünfzehn für den Wurf, zwanzig für das Gigabyte, zwei für zehntausend
Rufe, zehn für die GB-Stunde und — die krönende Zeile — hundertachtzig
für den Dollar Geist: die KI-Rechnung als Aufschlag auf das Geld
selbst, Geld für Geist, in Credits bezahlt; hier begegnen sich die
zwei Welten dieser Sammlung, die Arbeit der Maschine
([../circle-ci/FREE-TIER.md](../circle-ci/FREE-TIER.md)) und der
Geist der Modelle ([../huggingface/FREE-TIER.md](../huggingface/FREE-TIER.md)),
in Einer Zahl. Die Beispielrechnung ist die Rückübersetzung der
Abstraktion in Naturmaße — fünfzehn Gigabyte oder zwanzig Würfe oder
anderthalbe Millionen Rufe —, und das Oder ist der Kern: das Budget
ist eins, die Verwendung vieles, und die Wahl zwischen ihnen ist die
ökonomische Freiheit, welche das alte Modell nicht kannte (dort war
jede Freimenge für sich verspielt oder verfallen, hier ist alles
flüssig geworden). Der feine Zug am Rande — Vorschau-Würfe und
fehlgeschlagene Builds gratis — zeigt die Pädagogik des Hauses: das
Probieren soll frei sein, das Veröffentlichen kostet; die
Übereinstimmung mit der allgemeinen Weisheit der Sammlung (das Werden
billig, das Sein teuer — [../neon/FREE-TIER.md](../neon/FREE-TIER.md)
hat sie am Scale-to-Zero) ist vollkommen.

## Gotchas

1. **Credits sind ein gemeinsames Budget:** Ein einziger viraler Traffic-Peak
   (20 Credits/GB!) kann die 300 Credits in Stunden aufbrauchen — danach pausieren
   Projekte bis zum Monatswechsel. Bei alten Anleitungen ("100 GB gratis") täuscht
   das neue Modell deutlich kleinere Freimengen vor.
   Die erste Lehre ist der Umschlag der Abstraktion: die Währung, welche alles
   teilbar machte, macht auch das Ende gemeinsam — der eine Tag der Berühmtheit
   (zwanzig Credits das Gigabyte!) verzehrt alles in Stunden, und alle Dienste
   des Nutzers pausieren bis zum Monatswechsel, nicht nur der berühmte; das
   alte Modell hätte den Traffic gedrosselt und die Builds laufen lassen, das
   neue pausiert alles — die Vergeldung hat die Ausfälle verallgemeinert. Die
   Klage über die alten Anleitungen („100 GB gratis") ist die bekannte
   Geschichtslehre: das Bekannte, welches nicht erkannt ist, in der dritten
   Ausfertigung ([FREE-TIER.md](../aws/FREE-TIER.md) AWS-Tutorials,
   [FREE-TIER.md](../neon/FREE-TIER.md) 191,7 CU-h).

2. Nur **1 gleichzeitiger Build** — bei mehreren Pushes stauen sich die Builds.
   Die zweite ist die Enge des Bauens: ein Werken zur Zeit — die Warteschlange,
   welche [../circle-ci/FREE-TIER.md](../circle-ci/FREE-TIER.md) mit dreißig
   gleichzeitigen Jobs aufs Prächtigste überbietet; der Charakter zeigt sich
   im Vergleiche: das Fürstentum des Bauens baut parallel, das Haus des
   Erscheinens läßt eine Baustelle zu — die Würde des Hauses liegt anderswo
   (im unbegrenzten Erscheinen), und die Einfachheit des Bauens ist der Preis.

3. Developer-/Admin-Rollen für Teammitglieder gibt es erst in bezahlten Plänen.
   Die dritte ist die Stände-Lehre in der Bezahlt-Form: das Amt des Entwicklers
   ist käuflich; die kostenlose Welt kennt nur den Eigentümer und die
   Zuschauer, und wer beide zugleich sein will (Herr und Knecht der eignen
   Site — der kleine Kreisgang der *Phänomenologie*), der muß eins bleiben:
   alles selbst zu tun, was die Rollen sonst teilen.

4. Credits verfallen monatlich, kein Rollover; kein Kauf einzelner Extras ohne
   Plan-Upgrade (Personal/Pro ab ~$20).
   Die letzte endlich ist die doppelte Schwelle: die Zeit-Schwelle (monatlicher
   Verfall — die bekannte Lehre vom Ungenutzten) und die Kauf-Schwelle (keine
   einzelnen Extras, sondern nur der ganze Plan): das Haus verkauft keine
   Nachschub-Pakete für die Währung, sondern nur die Währung selbst in der
   größeren Form; es ist die entgegengesetzte Politik zu
   [../modal/FREE-TIER.md](../modal/FREE-TIER.md) (dort Credits nach Bedarf)
   und die verwandte mit [../grafana/FREE-TIER.md](../grafana/FREE-TIER.md)
   (die Plattformgebühr) — drei Weisen des Aufstiegs, und die hiesige ist die
   geschlossenste: alles oder nichts, außer am Monatsende, wo das Nichts von
   selbst wiederkommt.

## Quellen

- Credit-Pläne: <https://docs.netlify.com/manage/accounts-and-billing/billing/billing-for-credit-based-plans/credit-based-pricing-plans/>
- Pricing: <https://www.netlify.com/pricing/>
- Credit-Raten-Update April 2026: <https://www.netlify.com/changelog/2026-04-14-pricing-updates-april-2026/>

Die Quellen sind die Urkunden der Wende: die erste das Tarifgesetz
des neuen Modells, die dritte der Erlaß vom April 2026, an welchem
die Raten neu gesetzt wurden — die Gesetzgebung der Währung, mit
Datum; wer die Geschichte der Umstellung studiert (die Sammlung hat
sie als Typologie begonnen: AWS Juli 2025, Neon und sein 191,7,
Netlify April 2026), der findet in diesen Datumszeilen die
Regierungsjahre der Kontingent-Welt, und es fehlt nur noch der
künftige Historiker, welcher sie in Annalen schreibt.

## Vermittelte Verhältnisse

Dies Kapitel gehört zur Familie des Erscheinens —
[../vercel/FREE-TIER.md](../vercel/FREE-TIER.md) (die Maße),
[../cloudflare/FREE-TIER.md](../cloudflare/FREE-TIER.md) (die
Maßlosigkeit), [../render/FREE-TIER.md](../render/FREE-TIER.md)
(die Schlafenden) und dies (die Währung) — vier Weisen, das
Erscheinen umsonst zu geben, und die Wahrheit der vier ist ihr Zug:
von den Maßen zur Währung, von der Währung zur Maßlosigkeit —
welche Richtung die Zukunft hat, steht dahin; die Credit-Lehren
teilt dies Kapitel mit [../circle-ci/FREE-TIER.md](../circle-ci/FREE-TIER.md)
(Währung der Arbeit) und [../modal/FREE-TIER.md](../modal/FREE-TIER.md)
(Währung des Werdens), die Ausweise verwaltet [README.md](README.md)
(das ungeschnittene PAT — die einfachste, gefährlichste Form), der
Begriff [TERRAFORM.md](TERRAFORM.md) (die Grenze der Daten-Quelle —
das Handgemachte am Anfange eines Formel-Hauses). Wer dies Kapitel
mit dem Vercel-Kapitel zusammenliest, sieht die zwei Zukünfte des
Frontend-Umsonst nebeneinander: die festen Gnaden und das flüssige
Geld — und wird, nach der Lektüre der Gotchas, wissen, welche der
beiden er lieber verwaltet.
