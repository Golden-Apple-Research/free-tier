# Hugging Face Free Tier

> Die HF-Platform ist zweiteilig: Der **Hub** (Repos für Models/Datasets/
> Spaces) ist gratis, dazu kommen **Free Spaces** (CPU/GPU-Hosting) und
> monatliche Inference-Credits. 2026 gab es wichtige Verschärfungen beim
> Hosting von Spaces.

Man könnte, ohne Übertreibung, sagen: unter allen Diensten dieser
Sammlung ist Hugging Face der geistigste — der einzige, dessen
Gegenstand nicht die Maschine, sondern das ist, was die Maschinen
gelernt haben; der Hub versammelt Modelle, das heißt in der Sprache
dieser Sammlung: das Aufgehobene von Arbeit, die jemand anderes
getan hat, in Formen, welche jedeR weiterverwenden kann. Die
Zweiteilung der Plattform (der Hub als das Bleibende, die Spaces als
das Erscheinende) wiederholt dabei eine alte Scheidung: die des
Werkes und der Aufführung — das Modell, welches im Repositorium ruht,
und der Raum, in welchem es sich zeigt; und die Verschärfungen des
Jahres 2026, von welchem der Kasten spricht, betreffen — wie zu
erwarten — die Aufführung, nicht das Werk: das Umsonst des Geistes
bleibt (der Hub), das Umsonst der Bühne wird knapp (die Compute-
Spaces); es ist die gleiche Bewegung, welche [FREE-TIER.md](../aws/FREE-TIER.md)
am Credit-Beispiele zeigte, hier an der Grenze zwischen Werk und
Auftritt vollzogen.

## Kostenloser Umfang

| Bereich | Wofür ist das? | Kontingent |
|---|---|---|
| **[Hub](https://huggingface.co/docs/hub)** | Git-basierte Plattform für Models, Datasets und Spaces — „GitHub für Machine Learning“ | unbegrenzte öffentliche Repos (Models, Datasets, Spaces); private Repos mit Fair-Use-Quota |
| **Static Spaces** | Spaces ohne Compute — reines Hosting für statische Demos und Frontends | für alle gratis (reines Frontend-Hosting) |
| **[Spaces — CPU Basic](https://huggingface.co/docs/hub/spaces)** | Gratis-Container (2 vCPU / 16 GB RAM), in dem ML-Demos (Gradio/Streamlit) als Web-App laufen | 2 vCPU / 16 GB RAM, $0 (Umgebung generell: 2 CPU, 16 GB RAM, 50 GB ephemeral Disk) |
| **[Spaces — ZeroGPU](https://huggingface.co/docs/hub/spaces-zerogpu)** | Gemeinsam genutzte NVIDIA-GPUs mit Zeit-Quota — GPU-Demos ohne eigene GPU-Kosten | Nvidia RTX Pro 6000 Blackwell (bis 96 GB VRAM), dynamisch, **gratis mit Quota**; Free-Accounts: bis zu 2 Gradio Spaces auf ZeroGPU |
| **[Inference Providers](https://huggingface.co/docs/inference-providers)** | Einheitliche API, um gehostete Models über Partner-Provider (Together, Fireworks …) aufzurufen | **$0.10 Credits/Monat** (Free User), $2/Monat mit PRO ($9/Monat) |

Die Tafel enthält die erstaunlichste Zeile aller Kontingent-
Verzeichnisse dieser Sammlung: die ZeroGPU — gemeinsam genutzte
Beschleuniger der Blackwell-Klasse mit bis zu 96 GB Erinnerung,
gratis, mit Quota. Man muß dies zweimal lesen: die theuerste
Maschinerie der Gegenwart, unentgeltlich, dem Volke — die Anstalt,
welche die neuere Zeit den Fürstenhöfen vorbehalten hätte, hier als
Allmende; und die Bedingung (die Quota, die Zeit, die Zweiheit der
Räume) ist dieselbe, welche alle Allmenden ordnet: die Zeit wird
geteilt, weil die Sache nicht geteilt werden kann. Der Hub mit den
unbegrenzten öffentlichen Repositorien ist die andere Kehrseite
derselben Großmut: das Werk, welches öffentlich ist, kostet nichts —
das Private hat Fair-Use-Grenzen —, und damit kehrt hier das
Prinzip der [Static Assets](FREE-TIER.md) von
[../cloudflare/FREE-TIER.md](../cloudflare/FREE-TIER.md) wieder: das
Fertige, Geteilte ist frei, das Werden, das Eigene ist begrenzt;
Öffentlichkeit als Sparmittel — eine Wahrheit, welche die ganze
Sammlung durchgeht und nirgends so rein wie hier, weil hier das
Geteilte wirklich das Höchste ist (die Gewichte der Modelle).

Die Inference-Credits endlich — $0.10 monatlich dem freien Nutzer —
sind die kleinste Gabe der Tafel und die lehrreichste: der Anruf der
Modelle bei den Partnern (Together, Fireworks und anderen) ist
umsonst nur als Probe; wer wirklich schließen will (inference im
Ernstfalle), muß kaufen oder die Schlüssel der Partner unmittelbar
führen; es ist die Struktur des Probe-und-Kaufs, welche die Sammlung
von den Trials kennt ([../azure/FREE-TIER.md](../azure/FREE-TIER.md)),
hier auf die Welt des Geistes angewandt — der Gedanke als Probe
umsonst, der Gedanke als Arbeit bezahlt.

## Wichtige Regelung seit ~2025/2026

> **Gradio- und Docker-Spaces (alles mit Compute) erfordern für die Neuerstellung
> einen Paid Plan** (PRO für private Accounts, Team/Enterprise für Orgs).
> Bestandsschutz: Free-Accounts können weiterhin **bis zu 2 Gradio-Spaces auf
> ZeroGPU** betreiben; Static Spaces bleiben für alle gratis.

Die Regelung ist ein Lehrstück der Geschichtlichkeit der Gaben: was
gestern umsonst war (das Eröffnen von Compute-Spaces), ist heute
bezahlt, und was war, bleibt (der Bestandsschutz für die Zweiheit der
ZeroGPU-Räume) — das Kontingent hat damit eine Vorwärts- und eine
Rückwärtsseite, und die Nutzer stehen zwischen beiden wie zwischen
zwei Verheißungen; die Statik (das Starre, das Erscheinende ohne
Rechnen) bleibt gratis — die unbewegliche Form der Öffentlichkeit
wird erhalten, die tätige verknappen. Wer die Geschichte der
Cloud-Gnaden studieren will, findet hier ein Kapitel für sich: die
Verschärfung, welche nichts zurücknimmt und doch alles ändert, die
Revolution im Kleinen, welche die Bestände ehrt und die Anfänge
bezahlt — gemäßigt und undurchsichtig zugleich, wie es für Übergänge
eigentümlich ist.

## Gotchas

1. Spaces schlafen nach **48 h Inaktivität** ein (Compute-Spaces) — Demo-Links
   für Bewerbungen/Pitches vorher aufwecken.
   Die erste Lehre ist die vom Schlaf der Erscheinung: das Modell,
   welches zwei Tage nicht gerufen wird, geht in den Schlummer
   ([../render/FREE-TIER.md](../render/FREE-TIER.md) kennt die
   Viertelstunde, [../supabase/FREE-TIER.md](../supabase/FREE-TIER.md)
   die Woche — hier der Tag-zwei-Schlaf, die großzügigste Form der
   drei), und die praktische Moral („Demo-Links vorher aufwecken")
   ist die Lehre vom Vorlauf: die Anwesenheit, welche man für einen
   Termin braucht, muß vorher bestellt werden, wie ein Saal; das
   Umsonst schläft, die Bewerbung nicht.

2. ZeroGPU-Quota ist **zeitlich begrenzt pro Tag/Woche** (GPU-Sekunden-Pool) —
   PRO erhöht die Quota deutlich; Free reicht für Demos, nicht für Dauerlast.
   Die zweite ist die Zeitform der Allmende: der Pool der GPU-Sekunden,
   geteilt nach Tagen und Wochen — die Commune der Kostbarsten, welche
   nur im Wechsel leben kann; und die Wahrheit „Free reicht für Demos,
   nicht für Dauerlast" ist die Inhaltsbestimmung des ganzen Free-Tier
   dieser Welt: das Zeigen umsonst, das Wirken bezahlt — die Aufführung
   gegen die Vorstellung, in Preisen ausgedrückt.

3. Die $0.10 Inference-Credits sind schnell verbraucht (~ein paar Requests
   großer Modelle); danach Credits kaufen oder Provider-Keys direkt nutzen.
   Die dritte setzt die Inhaltsbestimmung in Zahlen: der Zehntel-Dollar
   vergeht an „ein paar" Rufen der Großen — die Größenordnung lehrt, was
   ein Gedanke heutzutage kostet, wenn er aus dem größten Fass geschöpft
   wird; das Kaufen oder die direkten Schlüssel sind die zwei Wege des
   Ernstfalles, und es ist der gleichen Struktur, welche die Sammlung
   beim Credit-Ende kennt ([../circle-ci/FREE-TIER.md](../circle-ci/FREE-TIER.md):
   das Queuen; hier: das Zahlen).

4. Disk in Spaces (50 GB) ist **nicht persistent** — Neustart = Datenverlust;
   Gewichte/Outputs in den Space-Storage oder HF Datasets schreiben.
   Die vierte ist die bekannte Flüchtigkeit des Behälters
   ([../render/FREE-TIER.md](../render/FREE-TIER.md): das ephemere
   Dateisystem; die Gotchas der Free Key Value), hier mit der
   ausdrücklichen Moral: was bleiben soll, muß an die bleibenden Orte
   geschrieben werden — der Space-Storage oder die Datasets; die Regel
   ist die alte Scheidung von Ort und Behälter: der Behälter ist der
   Wiederholung unterworfen (Neustart als Untergang), der Ort ist es
   nicht; wer die Scheidung nicht kennt, verliert den Unterschied auf
   die harte Weise — durch Verlust.

5. Private Repos haben Storage-Limits (Fair Use); öffentliche sind unbegrenzt
   — Modellgewichte public hosten spart Quota.
   Die letzte endlich ist die ökonomische Form der großen Wahrheit
   dieses Hauses: das Öffentliche ist das Sparsame; wer die Gewichte
   öffentlich macht, der macht sie unbegrenzt und gratis zugleich —
   die Großmut des Gebens zahlt sich aus als Ersparnis des Behaltens,
   und es wäre schwer, das Prinzip der Gemeinschaft knapper zu fassen:
   das Eigene kostet, das Geteilte nicht; wer teilt, dem wird es
   leichter — die einzige Wirtschaft, in welcher die Tugend der
   Klugkeit unmittelbar dient.

## Quellen

- Pricing (Spaces-Hardware, PRO): <https://huggingface.co/pricing>
- Spaces Overview (Regeln für Gradio/Docker/Static): <https://huggingface.co/docs/hub/spaces-overview>
- Inference-Providers-Pricing: <https://huggingface.co/docs/inference-providers/en/pricing>

Die Quellen sind die Urkunden der Verschärfungen; wer die Regelungen
im Wortlaute sucht (den Stand der Bestimmungen über Compute-Spaces
und Quotas), der lese die zweite, und wer die Preise des Geistes
kennenlernen will, die dritte — die erste endlich ordnet die
Hardware, welche die Tafel nur andeutet; drei Schriften, ein Haus.

## Vermittelte Verhältnisse

Dies Kapitel ist das des Geistes in der Sammlung: sein Gegenstück im
Rechnen ist [../modal/FREE-TIER.md](../modal/FREE-TIER.md) — dort die
Grafik-Kraft als Werkzeug, hier als Bühne; seine Verwandten im
Öffentlichen sind der Hub (unbegrenzte Repositorien) und die Static
Assets von [../cloudflare/FREE-TIER.md](../cloudflare/FREE-TIER.md);
sein Widerspiel im Credits ist [../circle-ci/FREE-TIER.md](../circle-ci/FREE-TIER.md)
(Währung der Arbeit gegen Währung des Denkens); und seine Lehre vom
Schlaf teilt es mit [../supabase/FREE-TIER.md](../supabase/FREE-TIER.md)
und [../render/FREE-TIER.md](../render/FREE-TIER.md) — die drei
Stufen des Vergessens (Tag-zwei, Woche, Viertelstunde), welche die
Sammlung als Typologie der Schlummer bereithält. Wie das Haus hier
kein eigenes Auth- und kein eigenes Terraform-Kapitel hat (das
Repositorium verzeichnet nur dies Eine Dokument), so ist auch seine
Lehre einfach zu fassen: der Geist umsonst — solange er öffentlich
ist, probend bleibt und schlafen darf; wer mehr will, bezahlt; und
das ist, wenn man recht bedenkt, das ganze Programm der Aufklärung
in einem Preismodell.
