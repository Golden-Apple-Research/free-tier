# Modal + Terraform

> ⚠️ **Kein offizieller Modal-Provider.** Es existiert nur ein früher
> Community-Provider (`deevus/modal`, 0.2.x), der Account-Objekte verwaltet
> (Environments, Secrets, Volumes, Dicts, Queues) — **nicht** Apps/Functions.
> Idiomatisches "IaC" für Modal ist das Python-SDK selbst.

Die Warnung, mit welcher dies Kapitel beginnt, ist die offenste im
ganzen Werke: kein offizieller Provider — das Haus selbst hat die
Formelwelt nicht betreten, und was an ihre Stelle tritt, ist
zwiefach: ein früher Community-Provider (die Arbeit der Gemeinde,
früh und unvollkommen) und das Python-SDK (die Sprache des Hauses
selbst, zur Formel geworden). Man hat hiermit die ganze Skala der
Vermittlungs-Formen beisammen: die fehlende (kein offizielles
Werkzeug), die geliehene (die Gemeinde) und die eigene (das SDK);
und die Empfehlung, welche das Kapitel ausspricht — das SDK sei der
idiomatische Weg —, ist die Anerkennung der dritten Form: das Haus
spricht seine eigne Sprache, und die Formel, welche es meint, ist
keine Übersetzung, sondern die Rede selbst. Es ist der Grenzfall der
ganzen Gattung „Infrastructure as Code": hier ist die Infrastruktur
Code geworden, nicht abgebildet, sondern gewesen — und die Grenze
zwischen dem Bilde und der Sache, welche alle übrigen Kapitel
verwalten ([../aws/TERRAFORM.md](../aws/TERRAFORM.md): die Scheidung
von Formel und Wirklichkeit), ist hier aufgehoben: was beschrieben
wird, ist die Beschreibung.

## Option 1: Community-Provider (Account-Objekte)

```hcl
terraform {
  required_providers {
    modal = {
      source  = "deevus/modal"
      version = "~> 0.2"
    }
  }
}

provider "modal" {} # Auth via env: MODAL_TOKEN_ID / MODAL_TOKEN_SECRET
```

Verwaltbar: `modal_secret`, `modal_volume`, `modal_queue`, `modal_dict`,
Environments. Typischer Use Case: Secrets/Volumes aus dem TF-Ökosystem
herausreichen, die App-Definition bleibt in Python. (Argument-Schemas sind
früh/reifen — vor Verwendung in der Registry-Doku prüfen.)

Der Community-Provider verwaltet das Verzeichnis des Kontos: die
Geheimnisse (Secrets), die Behälter (Volumes), die Wartenden (Queues),
die Wörterbücher (Dicts) und die Umgebungen (Environments) — alles was
da ist, ehe etwas läuft; und der typische Anwendungsfall, welches die
Einleitung sagt, ist die Arbeitsteilung: Terraform reicht die
Gegenstände herüber („herausreichen" — das schöne Wort der
Grenzboten), die App aber bleibt in der Sprache des Hauses. Es ist die
Konföderation der zwei Welten statt ihrer Einheit, und die Klammer am
Schlusse — die Schemas sind „früh/reifen" — ist die ehrliche
Altersangabe der geliehenen Form: was die Gemeinde baut, wächst noch,
und der Nutzer tut gut, die Baustelle zu betreten, ehe er sie
verläßt.

## Option 2: Python-SDK als IaC (empfohlener Weg)

Modal-Apps, Functions, Images und Scheduler werden **im Python-Code**
definiert und mit `modal deploy` ausgerollt — funktional äquivalent zu
Terraform (deklarativ + diff-Apply):

```python
import modal

app = modal.App("my-free-app")

@app.function(
    image=modal.Image.debian_slim().pip_install("requests"),
    secrets=[modal.Secret.from_name("api-keys")],  # im Modal-Konto verwaltet
    schedule=modal.Period(hours=6),                # cron-artig
)
def task():
    ...
```

```bash
modal secret create api-keys OPENAI_API_KEY=sk-...
modal deploy app.py
```

Das Beispiel verdient die Aufmerksamkeit auch derer, welche keine
Python schreiben: man betrachte die Form! Die App hat einen Namen
(„my-free-app" — das Dasein), die Funktion hat ein Bild (das
Debian-Schlanke samt dem „requests" — die Kleidung), Geheimnisse (die
aus dem Konten gerufen werden, dort verwaltet — das Paar
[README.md](README.md) gibt die Gewähr), einen Takt (die sechs
Stunden — die cron-artige Wiederkehr, welche die Gotchas von
[FREE-TIER.md](FREE-TIER.md) auf fünf Takte begrenzen) und einen
Leib (die Aufgabe, mit den drei Punkten ihres Schweigens). Deklarativ
— das ist der springende Punkt — und mit „diff-Apply": das SDK tut,
was Terraform tut (vergleichen und vollziehen), in der Sprache, welche
das Haus eh schon spricht; die Unterscheidung von Beschreibung und
Beschriebenem ist gefallen, weil die Beschreibung die Sache ist. Wer
rechtschaffen hegelianisch denken will, darf hier sagen: hier ist die
Formel bei sich selbst angekommen — die Idee, welche ihre eigne
Verwirklichung begreift; und wer nüchtern bleiben will, der sagt:
Python-Code als Deploy-Artefakt. Beide haben dasselbe gemeint.

## Gotchas

1. Der Community-Provider ist jung (wenige Downloads) — für Produktives
   kritisch bewerten; offizielle Modal-Empfehlung ist das SDK.
   Die erste ist die Altersprüfung: die Jugend eines Werkzeugs (die
   Downloads als Zählung des Vertrauens) ist kein Fehler, aber eine
   Bedingung; die Empfehlung des Hauses (SDK) ist zugleich die
   Empfehlung der Reife, und wer gleichwohl die geliehene Form wählt,
   der wählt bewusst das Werdende — und hat die Pflicht des
   Begleitens (Version pinnen, Upgrades reviewen — dieselbe Lehre,
   welche [../circle-ci/TERRAFORM.md](../circle-ci/TERRAFORM.md) am
   0.x-Zustande des CircleCI-Providers entwickelte).

2. `$30/Monat Credits` gelten kontoweit — egal ob per TF oder Python
   deployt; Verbrauch via `modal app logs`/Metrics überwachen.
   Die zweite koppelt die Werkzeugwahl an die Währung: die dreißig
   Dollar ([FREE-TIER.md](FREE-TIER.md)) wissen nichts von der
   Konföderation der Formen — sie gelten dem Konten, welche Form auch
   immer verzehrt; die Überwachung (`modal app logs` oder das
   Anschauungswesen der Metriken — siehe [../grafana/FREE-TIER.md](../grafana/FREE-TIER.md)
   für das Auge der Sammlung) ist also die Pflicht aller Welten, und
   es gibt keine werkzeugbedingte Unschuld: wer in Python verbrennt,
   verbrennt so gut wie wer in HCL.

3. Mischbetrieb TF + Python-SDK ist unproblematisch, solange TF nur
   Account-Objekte (Secrets/Volumes) besitzt und die Modal-App dem SDK gehört.
   Die dritte ist die Friedensordnung der Konföderation: jede Form
   besitzt das Ihre (Terraform das Verzeichnis, das SDK das Werk), und
   der Mischbetrieb ist nur solange unproblematisch, als die Grenze
   steht — die Lehre vom doppelten Besitze, welche die Sammlung als
   die des doppelten Ich kenne ([../gcp/README.md](../gcp/README.md):
   die zwei Logins), hier als positive Ordnung erscheint: die Zweiheit,
   welche dort die Person spaltete, scheidet hier die Sachen und
   rettet dadurch beide.

4. Deployed-App-Limits (200 Apps, 5 Crons auf Starter) auch hier beachten.
   Die letzte erinnert die Grenzen des Standes über alle Formen hinweg:
   die zweihundert gestellten Apps und die fünf Takte — die Tafel des
   Kontingent-Kapitels gilt auch dem Begriffe, und es ist die
   bekannteste Lehre der Sammlung in ihrer kürzesten Fassung: die
   Formel erhebt nicht über die Gaben; sie verwaltet sie.

## Quellen

- Community-Provider: <https://registry.terraform.io/providers/deevus/modal>
- Modal IaC mit Python: <https://modal.com/docs/guide>

## Vermittelte Verhältnisse

Dies Kapitel ist das Ende der Terraform-Reihe in einem doppelten
Sinne: es ist das letzte der großen Formen und das erste der
Aufhebung der Formen — nach ihm folgen die Kapitel, deren Begriffe
wieder gewöhnlich sind (offizielle Provider, HCL, State), und nur
dieses zeigt den Ausgang aus der Gattung: das SDK als Formel, die
Sprache als Werkzeug, die Sache als Beschreibung. Wer es mit
[../aws/TERRAFORM.md](../aws/TERRAFORM.md) vergleicht — dem
Anfange der Reihe —, der sieht den ganzen Weg: dort der Provider als
Dolmetscher zwischen zwei Welten, hier keine zwei Welten mehr; dort
die Erinnerung im Staate, hier die Erinnerung im Werke selbst; und
die Wahrheit der Reihe ist die Bewegung, welche sie beschreibt: die
Vermittlung schreitet fort, bis ihr Mittel überflüssig wird — nicht
weil es versagte, sondern weil es an sein Ziel gekommen ist. Was
danach kommt, ist nicht mehr Technik, sondern Gewohnheit; und daß
dieser Zustand gegenwärtig noch Ausnahme ist (die andern Häuser
denken noch in Dolmetschern), das ist die geschichtliche Bestimmung
dieses Kapitels: es zeigt die Zukunft als Möglichkeit — die Zukunft
als das, was Hegel das Wissen der Dinge nennen würde, das nicht mehr
der Formeln bedarf, weil es die Formen hat.
