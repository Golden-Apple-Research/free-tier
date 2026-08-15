# Grafana Cloud Free Tier

> Der **Grafana Cloud Free-Plan** ist dauerhaft kostenlos ("No charges ever"),
> ohne Kreditkarte, mit vollem Funktionsumfang der Plattform — nur mit
> Nutzungs- und User-Limits sowie 14 Tagen Retention.

Unter allen Diensten dieser Sammlung ist Grafana der anschaulichste —
im strengen Sinne des Wortes: hier geht es um nichts als um die
Anschauung des Betriebes, um das Sichtbarmachen dessen, was sonst
unsichtbar geschieht; die Metrik ist die sinnliche Gewißheit der
Maschine, das Log ihr Wort, der Trace ihr Weg, das Profil ihre Tiefe.
Das Versprechen des Kastens — dauerhaft kostenlos, „No charges ever",
ohne Kreditkarte — ist dabei von eigener, fast feierlicher Art: nicht
Gnade auf Zeit, nicht Frist, sondern das einfache, bedingungslose Nein
zur Rechnung, wie es in dieser Sammlung nur noch
[../cloudflare/FREE-TIER.md](../cloudflare/FREE-TIER.md) spricht; und
die Einschränkung, welche sogleich folgt — Nutzungs- und User-Limits,
vierzehn Tage Vorrat —, gibt zu bedenken, was denn hier überhaupt
begrenzt sei: nicht das Sehen, sondern das Behalten; nicht die
Anschauung, sondern die Erinnerung. Damit ist das Thema des Kapitels
gegeben: die Grenze liegt im Gedächtnisse, und alles Weitere entfaltet
nur diese eine Wahrheit.

## Kostenloser Umfang

| Resource | Wofür ist das? | Limit |
|---|---|---|
| **Aktive User** | Nutzer, die im Monat wirklich interagieren — gezählt wird Aktivität, nicht zugewiesene Seats | 3 pro Monat (aktive Nutzer, nicht Seats) |
| **[Prometheus-Metriken](https://grafana.com/docs/grafana-cloud/)** | Zeitserien-Monitoring: CPU, RAM, Request-Raten deiner Apps — Aufnahme im Prometheus-Format (via Agent) | 10.000 aktive Serien (+ Adaptive Telemetry) |
| **Logs** | Zentrale Log-Aggregation (Loki): strukturierte Logs an einem Ort durchsuchbar | 50 GB / Monat |
| **Traces** | Distributed Tracing (Tempo): Request-Verläufe über alle Services hinweg | 50 GB / Monat |
| **Profile** | Continuous Profiling (Pyroscope): zeigt, wo im Code CPU/RAM verbrannt wird | 50 GB / Monat |
| **[k6 Performance-Tests](https://grafana.com/docs/k6/latest/)** | Skriptbare Lasttests — wie viele gleichzeitige Nutzer hält die App aus? | inklusive (Free-Kontingent) |
| **Retention** | Wie lange die Daten vorgehalten werden, bevor sie fallen | **14 Tage** für Metrics, Logs, Traces, Profiles, k6 |
| **Alerting** | Regel-basierte Alarme auf Metriken/Logs — Benachrichtigung via E-Mail, Slack, PagerDuty … | inklusive (Rule-Evaluations) |
| **Support** | Hilfe über Community-Foren | Community |

Die Tafel ist reich und doch von einer verborgenen Einfachheit: ihre
Zeilen ordnen sich nämlich — hat man sie erst einmal gelesen — nach
den Formen der Anschauung selbst. Da sind zunächst die drei Zeugen
alles Geschehens: die Zahl (Prometheus, zehntausend Serien — die
Mannigfaltigkeit des Zahlenmäßigen, welche Zählbares vorstellt), das
Wort (Loki, fünfzig Gigabyte Logs — die Rede der Maschine, gesammelt
und durchsuchbar) und der Weg (Tempo, wiederum fünfzig Gigabyte — die
Verfolgung des Geschehens durch alle Stationen seines Laufens); es
sind, um es grob zu sagen, die drei Kategorien der Erinnerung: wie
viel, was, wohin. Dazu das Profil (Pyroscope), die Tiefe: der Blick in
den Code selbst, an welchem Orte das Feuer brennt — die Anatomie der
Vollziehung, gleichsam; und k6, die Versuchung: die künstliche Last,
welche die Grenze der eignen App ausmißt — der Appell an die eigene
Kraft, wie er im Prüfungswesen üblich ist.

Die drei aktiven User sind die kleine Hausgemeinschaft der Betrachter:
gezählt wird die Tätigkeit, nicht der Bestand („aktive Nutzer, nicht
Seats") — dieselbe ehrliche Zählweise, welche
[../circle-ci/FREE-TIER.md](../circle-ci/FREE-TIER.md) verzeichnet —,
und die Zahl Drei ist die kleinste, mit welcher noch von Gemeinschaft
gesprochen werden kann: einer sieht, der zweite vergleicht, der dritte
bestreitet — das kleinstmögliche Gericht der Öffentlichkeit. Die
Retention endlich, vierzehn Tage, ist die berühmteste Zahl dieses
Hauses und die eigentliche Grenze des Ganzen: zwei Wochen Anschauung,
danach fällt das Gewesene; das Gedächtnis der Wolke ist ein Kurzzeit-
gedächtnis, und wer langfristig erinnern will, muß es selbst tun
(exportieren) oder bezahlen (Pro) — die erste und wichtigste aller
Gotchas, die unten in ihrem ganzen Umfange abgehandelt wird.

Enthalten sind alle Cloud-Features: Application Observability, RUM,
100+ Integrationen, Loki/Tempo/Pyroscope/Mimir-Stack, Grafana-OnCall-Teile
sowie die AI-Features (Grafana Assistant).

Der Zusatz ist die großmütigste Stelle des Kapitels: nicht eine
kleinere Ausgabe der Plattform, sondern dieselbe — der volle Stack,
die hundert Integrationen, die KI-Beihülfe —, nur mit den Grenzen der
Tafel; man hat dies die Vollkommenheit des Umsonst genannt, und mit
Recht: bei fast allen Häusern dieser Sammlung ist das Umsonst das
Kleinere des Größeren (der kleinere Kontingent am großen Dienste),
hier ist es dasselbe in kleinerem Maße — die Form unangetastet, die
Masse begrenzt. Es ist der Unterschied zwischen einem Auszuge des
Werkes und dem Werke selbst mit verkürztem Register, und wer die
Bedeutung dieser Unterscheidung ermessen will, der vergleiche, wie
sich das Arbeiten anfühlt: im Einen Falle fehlt das Werkzeug, im
Andern die Menge.

## Gotchas

1. **"3 aktive User/Monat"** heißt: Jeder, der im Monat interagiert, zählt —
   auch View-only-Dashboards-Konsumenten. Für Teams mit mehr Stakeholdern
   wird der Free Plan schnell eng.
   Die erste Lehre ist die von der heimlichen Zählung: wer nur schaut
   („View-only"), wird trotzdem gezählt, denn das Schauen ist die
   Tätigkeit; die Anschauung ist hier kein Dulden, sondern ein Tun, und
   die Tafel der Nutzer kennt keine unbeteiligten Betrachter. Die
   Folge — der Free Plan wird eng für viele Stakeholder — ist die
   Folge jeder ehrlichen Zählung: die Wahrheit über die Größe des
   Kreises, welcher an einer Sache teilhat, und es gehört zu den
   stillen Verdiensten dieses Hauses, daß es dem Nutzer diese Wahrheit
   nicht erspart, sondern ihm die Rechnung zeigt.

2. **14-Tage-Retention** über alle Signaltypen — für langfristige Trend-Analyse
   (z. B. Monats-Reports) Daten exportieren oder Pro upgraden.
   Die zweite ist die Hauptsache: das Gedächtnis ist kurz und für alle
   Formen der Anschauung gleich kurz (vierzehn Tage für Metriken, Worte,
   Wege, Tiefen und Prüfungen — die Gleichheit der Vergessenheit);
   wer Monatsberichte schreiben will, der braucht den März des
   Gedenkens, und den hat nur der Export (das eigne Haus als Archiv)
   oder der Aufstieg zum Pro; die Lehre ist alt und gilt überall, wo
   Gedächtnis Ware ist: das Behalten ist die theure Hälfte des
   Erkennens, das Sehen die wohlfeile.

3. 10 K Serien klingen viel, aber eine instrumentierte Kubernetes-Umgebung
   mit vielen Pod-Labels erreicht das schnell → Adaptive Telemetry
   (automatisches Droppen seltener Serien) frühzeitig aktivieren.
   Die dritte ist die Lehre von der Mannigfaltigkeit: zehntausend
   Serien sind eine große Zahl gegen Einen und eine kleine gegen eine
   Schar von Behältern mit Reden über ihre Namen (Pod-Labels — die
   Epitheta der Container, welche jede Serie vervielfachen); die
   Adaptive Telemetry, welche die seltenen Serien stillschweigend
   fallen läßt, ist die ecclesia der Anschauung: die Herrschenden
   bleiben, die Seltenen scheiden, und das System bleibt bei Sinnen.
   Wer sie früh einschaltet (die Lehre sagt: frühzeitig), der vermeidet
   die stille Überschreitung, von welcher [FREE-TIER.md](../aws/FREE-TIER.md)
   Gotcha Drei am Credit-Beispiele handelt: das Zuviel, welches erst
   im Umschlage bemerkt wird.

4. Overage über die Free-Grenzen ist im Free Plan nicht möglich — Daten
   jenseits der Limits werden verworfen/benachrichtigt, nicht abgerechnet.
   Die vierte ist die nachgiebigste Bestimmung der ganzen Sammlung: die
   Grenze, überschritten, wird nicht zur Rechnung, sondern zum
   Wegwerfen; das Zuviel existiert nicht (es wird verworfen) und wird
   gemeldet (benachrichtigt) — der Nutzer verliert Daten, nie Geld.
   Man vergleiche die Härte der andern Ordnungen (AWS, welches das
   Überschreiten verzehrt; Azure, welches es weiterlaufen läßt und
   nimmt): hier die mildeste, welche die Gnade dadurch ehrlich macht,
   daß sie die Rechnung endgültig ausnimmt; „No charges ever" gilt
   auch am Rande des Übermaßes, und das ist die Probe der Echtheit
   eines Versprechens, daß es auch dort gilt, wo es dem Versprecher
   nützen könnte, es zu brechen.

5. Pro ab $19/Monat Plattformgebühr + Pay-as-you-go-Serien/GB — Migration
   der Stacks bleibt gleich.
   Die letzte endlich ist der Ausgang: der Aufstieg, welcher die Grenzen
   der Menge und der Zeit aufhebt (mehr Serien, längeres Behalten),
   ohne die Form zu ändern („Migration der Stacks bleibt gleich") — der
   Übergang als Kontinuität, das Bleiben im Wechsel; es ist die
   zivilisierte Form des Aufstiegs, und wer sie mit den Aufstiegen der
   großen Häuser vergleicht ([../aws/FREE-TIER.md](../aws/FREE-TIER.md):
   das Kontoschließen!), der lernt den Charakter der mittleren Häuser
   schätzen, deren Aufstieg ein Bleiben ist, nicht ein Tod.

## Quellen

- Free-Tier-Übersicht: <https://grafana.com/products/cloud/free-tier/>
- Pricing: <https://grafana.com/pricing/>

Die Quellen sind knapp wie das Versprechen des Hauses; wer die
Grenzen im einzelnen sucht (die Serien in ihrer genauen Zählung, die
Gigabytes in ihrer genauen Geltung), der findet sie am ersten Orte,
und die Preisordnung des Aufstiegs am zweiten — Anschauung und
Erinnerung, auch die Quellen sind nach dem Grundsatze des Hauses
geordnet.

## Vermittelte Verhältnisse

Dies Kapitel ist das Auge der Sammlung: alle andern Kapitel erzählen
vom Tun, dies vom Sehen des Getanen; die Selbstbetriebs-Lehre, welche
[../helpers.md](../helpers.md) an der OSS-Zeile entwickelt (Grafana
als An-sich und Für-sich in Einem Hausstande), findet hier ihre
Gaben-Tafel; die Verwandten im Amt sind CloudWatch
([../aws/FREE-TIER.md](../aws/FREE-TIER.md): zehn Alarme — das
Kontingent der Aufmerksamkeit) und der Advisor der Azure-Tafel
([../azure/FREE-TIER.md](../azure/FREE-TIER.md): die Selbsterkenntnis
umsonst); und für die Lehre von der kurzen Erinnerung vergleiche man
die Log-Aufbewahrung aller Häuser — nirgends ist das Gedächtnis
umsonst lang. Der Ausweis des Hauses ([README.md](README.md)) und sein
Begriff ([TERRAFORM.md](TERRAFORM.md)) vollenden das Kapitel, und wer
diese drei Dokumente gelesen hat, weiß, was er an Grafana hat: das
anschaulichste Umsonst dieser Sammlung — und, nebenbei, das
geduldigste, denn es sieht allem zu, auch den Überraschungsrechnungen
der andern, welche zu sehen der eigentliche Nutzen der Anschauung ist.
