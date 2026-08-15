# CodeSandbox Free Plan

> CodeSandbox ist seit dem CDE-Relaunch VM-basiert (Development Environments
> in der Cloud). Der **Free/Build Plan** enthält 400 VM-Credits/Monat —
> unbegrenzt Browser-Sandboxes laufen weiterhin gratis.

Die Werkstätte — von allen Bildern, welche diese Sammlung gebraucht hat,
ist dies das unmittelbarste: nicht der Tempel der Kontingente, nicht das
Amt der Ausweise, sondern die Werkstätte, in welcher der Arbeitende
seine Arbeit hat; und die Eigentümlichkeit dieses Hauses ist, daß es
zwei Werkstätten gibt, von denen die eine umsonst ist (die im Browser,
die Web-Container-Welt, ohne Server, ohne Rechnung, die reine
Gegenwart des Arbeitens) und die andere auf Credits steht (die echte
Wolken-Maschine mit Wurzelrechten, dem vollkommenen Rechte des
Werkstättenbesitzers). Es ist die Scheidung des Leichten vom Schweren
als Hausordnung: das Leichte (Skizze, Versuch, das kleine Gelingen)
wohnt im Browser und kostet nichts für immer; das Schwere (Docker,
Dienste, alles was einen Boden braucht) wohnt in der Maschine und
kostet die Monatsgabe — und der Kluge verteilt sein Arbeiten nach
dieser Topographie, wie er von jeher sein Arbeiten nach der Schwere
verteilt hat: erst der Zettel, dann die Werkbank.

## Free (Build) Plan

| Resource | Wofür ist das? | Wert |
|---|---|---|
| **VM-Credits** | Betriebszeit echter Cloud-VMs für VM-Sandboxes und Repos (Nano-VM ≈ 10 Credits/Stunde) | 400 / Monat ≈ **40 h auf einer Nano-VM** |
| **[Browser-Sandboxes](https://codesandbox.io/docs)** | Laufzeit komplett im Browser (WebContainer-Technologie) — kein Server nötig, startet in Sekunden | unbegrenzt und gratis (laufen im Browser) |
| **VM-Sandboxes** | Vollwertige Linux-VMs mit root-Rechten — beliebige Sprachen/Dienste, auch per SDK in CI automatisierbar | bis zu **10 gleichzeitig** |
| **Private Sandboxes/Repos** | Nicht-öffentliche Projekte — bei vielen Konkurrenten Bezahl-Feature | im Free Tier inklusive |
| **Laufzeit** | Das Guthaben und der Plan verfallen nicht — kein Ablaufdatum | verfällt nie („Free plans never expire“) |

Die Tafel verlangt nach zweierlei Betrachtung: nach der der Gaben und
nach der der Währung. Die Währung ist der Credit — vierhundert im
Monate, und die Umrechnung steht gleich dabei: die Nano-VM verzehrt
deren zehn die Stunde, also vierzig Stunden; die Größeren (Small,
Medium, Large) verzehren schneller, und damit gilt auch hier die
Lehre von den Ständen der Maschinen, welche
[../circle-ci/FREE-TIER.md](../circle-ci/FREE-TIER.md) entwickelt hat:
derselbe Credit kauft verschiedene Zeit, je nach dem Adel der Maschine,
und die Head-Zahl (400) ist eine Anweisung auf die kleinste, nicht ein
Versprechen für alle. Die Gaben aber — und hier hebt sich dies Haus
von der meisten Konkurrenz — sind die unbegrenzten Browser-Sandboxes:
die Werkstätte ohne Boden, welche im Geräte des Nutzers selbst lebt
und daher nichts kostet als die Geduld des Browsers; die zehn
gleichzeitigen VMs; die Privatsphäre inklusive („bei vielen
Konkurrenten Bezahl-Feature", bemerkt die Tafel mit dem Stolz dessen,
welcher das Vaterländische besser macht); und — die letzte Zeile, die
schönste — das Guthaben verfällt nie: kein Ablaufdatum, keine Frist,
keine Kulanz; die Credits resetten zwar monatlich (die vierte Gotcha
sagt es), aber der Plan selbst ist ein Stand, kein Zeitverhältnis —
man vergleiche den Satz „Free plans never expire" mit den
Kontoschlüssen von [../aws/FREE-TIER.md](../aws/FREE-TIER.md): dort
stirbt das Konto nach einem halben Jahre, hier lebt der Plan ewig; es
ist der Unterschied der Häuser-Charaktere, vollständiger kaum zu
haben.

Größenordnung: Eine kleine React-App auf einer Nano-VM ~40 h/Monat
entwickeln. Größere VM-Größen (Small/Medium/Large) verbrauchen Credits
schneller.

## Gotchas

1. **VM friert ein, wenn Credits aufgebraucht sind** — Workspace pausiert bis
   zum Monatsreset oder Upgrade; laufende Arbeit vorher committen.
   Die erste Lehre ist die vom Erfrieren: die Maschine hört nicht auf zu
   sein — sie hört auf zu dürfen; der Zustand des Pausierten ist die
   Bewegungslosigkeit des Bereitgehaltenen, das Winterschlaf-Gegenstück
   zum Aufbrauchen, und die Mahnung, vorher zu committen, ist die
   praktische Moral des ganzen Zustandes: das Werk, welches noch nicht
   im Repositorium ist, ist nicht; die Erinnerung ist das Repositorium,
   und nur was ihr gegeben ward, übersteht den Frost.

2. Browser-Sandboxes sind gratis, aber ohne echtes Backend/Terminal — für
   Docker, Node-Services o. Ä. braucht es VM-Credits.
   Die zweite wiederholt die Topographie des Anfangs: das Leichte hat
   keine Tiefe; wer Docker braucht (die schwere Form des Versiegens von
   Umgebungen), wer Dienste braucht (das Miteinander der Prozesse),
   der braucht den Boden — und der Boden kostet; es ist die
   wiederkehrende Wahrheit aller Rand- und Licht-Welten
   ([../cloudflare/FREE-TIER.md](../cloudflare/FREE-TIER.md) über die
   10 Millisekunden): was ohne Grund läuft, läuft leicht und schmal.

3. SDK-Automatisierung (CI-artige Sandbox-Workflows) ist auf 10 gleichzeitige
   VMs begrenzt — für mehr braucht es Scale/Enterprise.
   Die dritte ist die Grenze der Arbeitsteilung: zehn Maschinen zugleich
   — die Concurrentzahl, welche [../circle-ci/FREE-TIER.md](../circle-ci/FREE-TIER.md)
   mit dreißig Jobs überbietet —, und die Stufenweise dahinter (Scale,
   Enterprise) als die kaufmännische Steigerung der Arbeit; wer mehr
   zugleich will, der will nicht mehr Arbeit, sondern mehr Ordnung der
   Arbeit, und Ordnung der Arbeit ist hier wie überall die teuerste
   aller Waren.

4. Credits resetten monatlich, kein Rollover.
   Die letzte endlich ist die Monatlichkeit gegen die Ewigkeit des
   Planes: der Plan verfällt nie, die Credits verfallen monatlich —
   zweierlei Zeitlichkeiten in Einem Hause, die dauernde des Standes
   und die wiederkehrende der Gabe; kein Rollover heißt: was nicht
   gebraucht ward, ist verloren, und damit gilt auch hier die Lehre
   vom Ungenutzten ([../azure/FREE-TIER.md](../azure/FREE-TIER.md)):
   die Gabe gilt dem Gebrauche, nicht dem Haben; sie ist kein Vermögen,
   sondern eine Anweisung auf Tätigkeit, und wer sie liegen läßt, der
   hat sie nicht gehabt.

## Quellen

- Pricing: <https://codesandbox.io/pricing>
- SDK-Pricing (Concurrency-Limits): <https://codesandbox.io/docs/sdk/pricing>
- Plan-Übersicht: <https://codesandbox.stream/docs/learn/plans/subscriptions>

Die Quellen — drei an der Zahl, wie es sich für ein Haus gehört, welches
die Dreiteilung liebt (Preis, Grenze der Arbeitsteilung, Ordnung der
Stände) —, sind die Urkunden der beiden Werkstätten; wer zwischen
Browser und Maschine schwankt, lese die zweite (SDK-Pricing) für die
Grenzen der Automatisierung und die erste (Pricing) für die Währung,
und er wird finden, daß die Wahl zwischen den Werkstätten keine der
Bequemlichkeit ist, sondern der Schwere: danach allein richtet sich,
wo die Arbeit zuhause ist.

## Vermittelte Verhältnisse

Dies Kapitel ist das der Werkstätte innerhalb der Sammlung; sein
Gegenstück im Geistigen ist [../circle-ci/FREE-TIER.md](../circle-ci/FREE-TIER.md)
— dort das Fürstentum des Bauens, hier die Akademie des Versuchens —,
und das Eine wie das Andere hängt an Credits: die Währung der Arbeit.
Für die Lehre vom Stande gegen die Frist vergleiche man
[../aws/FREE-TIER.md](../aws/FREE-TIER.md) (das Konto auf Zeit) und
für das unbegrenzte Leichte die Static Assets von
[../cloudflare/FREE-TIER.md](../cloudflare/FREE-TIER.md) — das Erscheinen
ohne Maß. Es hat dies Haus kein eigenes Auth- und kein eigenes
Terraform-Kapitel (das Repositorium verzeichnet nur dieses Eine
Dokument), und das hat seinen guten Sinn: die Werkstätte ist der
einfachste aller Verhältnisse — man kommt, arbeitet, geht —, und was
keine Verfassung braucht, braucht auch keine Urkunden; die anderen
Dienste mögen hierin eine Lehre sehen, welche größer ist als manche
Gabe: das Umsonst ist am vollkommensten, wo es am wenigsten
verwaltet wird.
