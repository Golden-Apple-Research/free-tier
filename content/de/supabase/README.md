# Supabase — Auth für Terraform

> Bevorzugt: **Personal Access Token (PAT)** der Management-API über
> `SUPABASE_ACCESS_TOKEN`. Der Token steuert Projekte/Keys — nichts am
> Projekt-Datenbank-Login.

Die Ausweis-Ordnung dieses Hauses ist die der getrennten Welten, und
der Kasten sagt es gleich mit: der PAT steuert die Projekte und ihre
Zeichen — nichts am Datenbank-Login des Projektes; das Haus hat
also ZWEI Ausweis-Systeme (das Verwaltungs-Zeichen des Kontos und
die Projekt-Schlüssel der Instanz), und die Verwechslung beider ist
der Kardinalfehler, vor welchen die nachfolgende Anleitung mit
Recht warnt. Die Sammlung hat die Zwei-Welten-Lehre in mehreren
Gestalten getroffen ([README.md](../redis/README.md): Login gegen
Paar; [README.md](../render/README.md): Schlüssel und Hausnummer) —
hier ist sie am reinsten: dieselbe Person hat zwei Zeichen für zwei
Welten, und die Welten berühren sich nicht.

## 1. Token erstellen

<https://supabase.com/dashboard/account/tokens> → **Generate new token** →
Name (z. B. `terraform`) → **Generate** → Token (`sbp_…`) einmalig kopieren.

Das Verfahren ist das bekannte (der Direktlink, der Name, das
einmalige Kopieren — die Höflichkeiten der jüngeren Häuser, welche
die Sammlung an [README.md](../netlify/README.md) und
[README.md](../render/README.md) rühmte); die Zeichenkette `sbp_…`
sei als Namensform vermerkt — die Buchstabenkunde
([README.md](../grafana/README.md): glc gegen glca) hat hier ihr
freundlichstes Beispiel: der Anfang verrät die Welt, zu welcher das
Zeichen gehört, und wer die Anfänge kennt, verwechselt die Welten
nicht.

## 2. In Terraform einbinden

```bash
export SUPABASE_ACCESS_TOKEN="sbp_…"   # wird automatisch gelesen
```

```hcl
provider "supabase" {}
```

Zusätzlich benötigt: die **Organization-ID** (der Org-Slug aus der
Dashboard-URL, z. B. `supabase.com/dashboard/org/<slug>/…`) für
`supabase_project.organization_id`.

Die Einbindung ist die einfachste Form (eine Variable, ein leerer
Block), und der Zusatz führt die zweite Adresse ein: die
Organisations-Kennung, hier in ihrer freundlichsten Gestalt — der
Slug, das heißt der lesbare Name aus der Adreßzeile des
Dashboard, keine UUID, keine Nummer: das Haus gibt dem Nutzer eine
Hausnummer, welche er lesen kann; es ist die humanste Form der
Adresse in der ganzen Sammlung, und man erkennt daran den Charakter:
das Haus, welches mit Lesbarkeit rechnet, rechnet mit Menschen.

## 3. Hinweise

- Der PAT hat **dieselben Rechte wie der User-Account** — inkl. Löschrecht
  über alle Projekte. Wie ein Passwort behandeln, niemals committen.
  Der erste ist die ungeteilte Vollmacht ([README.md](../netlify/README.md)
  hat diese Form gewürdigt und gewarnt), hier mit der schärfsten
  Zutat: das Löschrecht über ALLE Projekte — die Macht des
  Abreißens in Einem Zeichen; die Pflege („wie ein Passwort") und
  das Verbot („niemals committen") sind die Begleiter, welche
  diese Macht fordert, und die Sammlung hat das Wort von der
  Landkarte ([README.md](../aws/README.md): der geleakte Provider-
  Block als Schatzkarte) hier nur zu wiederholen.

- Nicht verwechseln: Der PAT (Management) ist etwas anderes als die
  Projekt-Keys (`anon`/`service_role` aus `data.supabase_apikeys`) —
  letztere hängen am Projekt, nicht am User.
  Der zweite ist die Zwei-Welten-Lehre selbst: das Verwaltungs-Zeichen
  am Konten, die Projekt-Schlüssel am Projekte — und die zwei
  Schlüssel des Projektes noch einmal untereinander (der `anon`,
  welcher die Höflichkeit der Öffentlichkeit ist und alles darf,
  was die Regeln erlauben, und der `service_role`, welcher die
  Allmacht im Bereiche des Projektes ist und alles darf, ohne die
  Regeln zu fragen); es gibt also drei Stufen (Konto, Projekt, Rolle),
  und jede hat ihr Zeichen — die vollständigste Zeichenhierarchie
  der Sammlung, und wer sie einmal geordnet hat, verwechselt sie
  nie wieder.

- `database_password` wird im State plaintext landen → `random_password`
  + verschlüsseltes Remote-State-Backend.
  Der dritte ist die State-Sorge in der Lehre von den drei Mitteln:
  das Paßwort (welches die Datenbank selbst verlangt — die vierte
  Zeichenschicht!) fällt in die Erinnerung im Klartext, also das
  erste Mittel (die Erzeugung durch die Formel: `random_password`,
  welches nie eine Hand berührt hat), das zweite (der Tresor: das
  verschlüsselte Backend, fern vom Werke); die Sammlung hat die
  Reihe der State-Sorgen von [TERRAFORM.md](../aws/TERRAFORM.md)
  (die Erinnerung als heikelstes Gut) bis hierher geführt, und das
  Haus gibt dem Nutzer beide Mittel im Zusammenhange — die
  Formel-Erzeugung als Kind der Formel-Welt, der Tresor als ihr
  Archiv.

- Free-Plan: 2 Projekte — Apply scheitert bei Projekt 3 mit klarer
  API-Fehlermeldung.
  Der vierte endlich ist die Höflichkeit der Grenze: die Zweiheit
  ([FREE-TIER.md](FREE-TIER.md) hat sie als das Dasein gefeiert)
  wird von der Formel gewahrt — der dritte Versuch scheitert
  LAUT („klare API-Fehlermeldung"), nicht still ([README.md](../modal/README.md)
  hat das stille Scheitern der alten Modal-Variablen als das
  Furchtbare gezeichnet); die zwei Familien des Fehlers — die
  laute, welche belehrt, und die stille, welche verwirrt — sind
  hiermit in der Sammlung vollständig vertreten, und das Haus
  gehört zur besseren.

## Quellen

- Provider: <https://registry.terraform.io/providers/supabase/supabase/latest>
- Management-API & PAT: <https://supabase.com/docs/reference/api/introduction>
- TF-Reference: <https://supabase.com/docs/guides/deployment/terraform/reference>

## Vermittelte Verhältnisse

Die Ausweise vermitteln zwischen dem Sein ([FREE-TIER.md](FREE-TIER.md))
und dem Begriffe ([TERRAFORM.md](TERRAFORM.md)) dieses Hauses; ihre
Zeichen-Hierarchie (Konto — Projekt — Rolle — Datenbank) ist die
vollständigste der Sammlung und verweist auf die
Gattungs-Geschwister ([README.md](../azure/README.md): die drei
Titel; [README.md](../gcp/README.md): die zwei Logins), die
State-Sorge auf die ganze Lehre der Erinnerung
([TERRAFORM.md](../aws/TERRAFORM.md)), und die klare Grenze auf die
Fehlerkunde ([TERRAFORM.md](../render/TERRAFORM.md): den 403 als
Echo der falschen Adresse). Wer dies Kapitel liest und daneben das
Neon-README, der hat die Zeichen-Ordnung beider Postgres-Welten:
einfach und hart dort (ein Paar, eine harte Rotation), hierarchisch
und höflich hier — und die Wahl der Zeichen folgt der Wahl der
Welten, welche [FREE-TIER.md](FREE-TIER.md) am Schlusse dem
Charakter des Lesers überließ.
