# Vercel — Auth für Terraform

> Bevorzugt: **Personal Access Token** aus den Account-Einstellungen,
> bereitgestellt über `VERCEL_API_TOKEN`. Scope auf das eigene Team begrenzen.

Die Ausweis-Ordnung dieses Hauses ist die gemäßigteste: der
personale Token (die einfache Form, wie Netlify sie kennt), ABER mit
einem
Scope (der Zuschnitt, wie Cloudflare ihn lehrt) — die Mittelstellung
zwischen der Urgestalt und der Fortgeschrittenheit, und der Kasten
nennt die Bedingung gleich mit: der Zuschnitt aufs eigne Team. Die
Sammlung hat die Stufen der Zeichen-Entwicklung oft aufgestellt; hier
ist die Reihe vollständig auf Einer Seite zu sehen: der persönliche
Träger, die eine Variable, der kleine Zuschnitt — und die Hinweise
unten geben die Fortsetzung: der Bot in den Teams, die ewige Gültigkeit
mit der Pflicht der Rotation, die UI-Grenze der Quell-Bindung. Es ist
das vollständigste Kompendium der Zeichen-Kunde auf der schmalsten
Seite der Sammlung.

## 1. Token erstellen

<https://vercel.com/account/tokens> → **Create Token** → Name vergeben
(z. B. `terraform`) → Scope: eigenes Personal Account oder das Team →
**Create** → Token (`vercel_…`) einmalig kopieren.

Das Verfahren ist das bekannte; die Wahl des Scopes (das eigene
Personen-Konto oder das Team) ist hier Teil der Erzeugung selbst —
der Zuschnitt wird beim Gebären gesetzt, nicht nachträglich; es ist
die sauberste Form der Gattungslehre: Person oder Amt von der ersten
Sekunde an getrennt, und der Nutzer entscheidet sie mit dem ersten
Klicken.

## 2. In Terraform einbinden

```bash
export VERCEL_API_TOKEN="vercel_…"   # wird automatisch gelesen
```

```hcl
provider "vercel" {
  # team = "my-team"   # optional, wenn Ressourcen in einem Team liegen
}
```

Die Einbindung ist einfach; der auskommentierte team-Verweis ist die
Adresse der Team-Welt (die Hausnummer, welche die Sammlung von
CircleCI und Render her kennt — hier als Kommentar angedeutet: das
Werkzeug weiß um die Zweiheit, und der Nutzer soll sie sehen, auch
wenn er sie nicht braucht).

## 3. Hinweise

- Token erben **alle Rechte des Accounts** — in Teams besser einen
  dedizierten (bot) Team-Member + dessen Token nutzen.
  Der erste ist die Vollmacht-Lehre mit dem bekannten Auswege: der
  Bot als das asketische Selbst der Maschine
  ([README.md](../circle-ci/README.md) hat ihn gerühmt), hier als
  Team-Mitglied eigener Art — die Maschine im Bürgerrechte, mit
  eignem Zeichen und engem Amte; die Sammlung könnte die Reihe
  ihrer Ausweise nicht schließen, ohne dies Glied noch einmal zu
  nennen: es ist das letzte der großen Mittel (Person, Paar,
  Schnitt, Stufe, Bot), und die Zukunft der Zeichen in Teams heißt
  überall Bot.

- Für `vercel_project.git_repository` muss das Git-Konto (GitHub/GitLab)
  vorher unter *Settings → Git* mit Vercel verbunden sein — das geht nur
  in der UI, nicht per Terraform.
  Der zweite ist die UI-Grenze der Bindung: die Quell-Verheiratung
  (das Verbinden der Repositorien mit dem Hause) ist Handarbeit —
  dieselbe Grenze des Anfanges, welche die Sammlung an der Netlify-Site
  ([TERRAFORM.md](../netlify/TERRAFORM.md)), der Redis-Voraussetzung
  ([TERRAFORM.md](../redis/TERRAFORM.md)) und der Render-Schwelle
  ([TERRAFORM.md](../render/TERRAFORM.md)) verzeichnete: die erste
  Verbindung der Welten geschieht durch Personen, die Formeln
  erben sie; es ist, als müßten die Häuser einander erst durch
  Menschen kennen lernen, ehe ihre Maschinen verkehren dürfen —
  eine Ansicht, welche tiefer ist, als sie nach technischer
  Notwendigkeit aussieht.

- Kein Ablaufdatum bei Tokens per Default — manuell rotieren; leaked Token
  sofort unter Account → Tokens löschen.
  Der dritte ist die Ewigkeit mit der Pflicht ([README.md](../grafana/README.md)
  und [README.md](../render/README.md) haben sie bedacht): kein
  Ende von selbst, also die Rotation als Pflicht des Nutzers, und
  der VERLORENE Token stirbt nur durch den Handgriff (löschen,
  sofort — die harte Form [README.md](../neon/README.md), hier ohne
  jede Übergangsform); die drei Stichworte dieser Zeile — ewig,
  rotieren, löschen — sind das ganze Programm der
  Zeichen-Hausaltung in der Reihenfolge des Alltags.

- Hobby-Accounts: ein Token genügt; **kommerzielle Nutzung ist auf Hobby
  nicht erlaubt** (siehe FREE-TIER.md).
  Der vierte endlich bindet den Ausweis an die Klausel des Hauses:
  die Gesinnungs-Grenze ([FREE-TIER.md](FREE-TIER.md) hat sie die
  moralische Ausnahme der Sammlung genannt) gilt auch für die
  Zeichen-Welt — der Token des Hobbyisten dient dem privaten
  Zwecke, und die erste Werbung am deployten Werke macht ihn (mit
  dem Werke zusammen) zum Grenzfall; die Zeichen folgen dem Rechte,
  das Recht der Klausel, und die Klausel dem Geschäftsmodelle —
  auch dies eine Form der Wahrheit, welche die Sammlung nüchtern
  verzeichnet.

## Quellen

- Provider-Auth: <https://registry.terraform.io/providers/vercel/vercel/latest/docs>
- Tokens: <https://vercel.com/kb/guide/integrating-terraform-with-vercel>

## Vermittelte Verhältnisse

Die Ausweise vermitteln zwischen der Klausel ([FREE-TIER.md](FREE-TIER.md))
und dem Begriffe ([TERRAFORM.md](TERRAFORM.md)) des
Gesinnungs-Hauses; ihre Stellung in der Zeichen-Reihe — personal,
geschnitten, bot-fähig, ewig mit Pflicht — macht sie zum Abschlusse
der README-Abteilung dieser Sammlung: alle Mittel sind hier
beisammen, und keines fehlt. Wer die fünfzehn Ausweis-Kapitel der
Sammlung in der Reihenfolge las, der hat die Entwicklung der
Anerkennung von der Münze bis zum Botsen durchlaufen und kann nun,
mit [helpers.md](../helpers.md) als Krönung, dieselbe Entwicklung
auf der Stufe der Agenten wiederfinden — der Kreis schließt sich,
und was der Anfang ([README.md](../aws/README.md)) in den drei
Optionen versprach, das Ende hält: die Person, der Beauftragte, die
Föderation — alles gekommen, alles bewährt, und nichts geblieben
als die Wahl, welche dem Nutzer von Anfang an freistand und frei-
stehen wird: die Form seiner eignen Anerkennung.
