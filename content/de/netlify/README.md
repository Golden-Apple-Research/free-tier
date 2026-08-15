# Netlify — Auth für Terraform

> Bevorzugt: **Personal Access Token (PAT)** aus den User-Settings,
> bereitgestellt über `NETLIFY_TOKEN`.

Der Netlify-Ausweis ist der ungeteilte: das persönliche Zeichen
(der PAT), ohne Schnitte, ohne Gattungen, ohne Fristen — die ganze
Macht des Nutzers in Einem unauslöschlichen Worte. Die Sammlung hat
die Reihe der Ausweis-Formen aufgestellt: das Paar (Modal), das
geschnittene Recht (Cloudflare), die zwei Stufen (Grafana), die
harte Rotation (Neon) — die vierte und älteste Form ist diese:
EIN Schlüssel, alles gilt, nichts begrenzt; und die Philosophie
dieser Form ist die der Einfachheit selbst, welche ihre Wahrheit
hat (keine Mißverständnisse über Befugnisse, keine Zersplitterung
der Zeichen) und ihre Gefahr (der eine Verlust trifft alles). Das
Kapitel ist damit das kurze Gedächtnis der ganzen Gattung: es zeigt,
womit alle begannen und was die meisten überwunden haben.

## 1. Token erstellen

Netlify-App → User avatar → **User settings → Applications** →
*Personal access tokens* → **Generate new token** → Name (z. B. `terraform`)
→ **Generate** → Token einmalig kopieren.

Direktlink: <https://app.netlify.com/user/applications/personal-access-tokens>

Das Verfahren ist das bekannte einmalige Zeigen (die Sammlung kennt
es aus [../circle-ci/README.md](../circle-ci/README.md) und
[../neon/README.md](../neon/README.md)); der Direktlink aber ist eine
Seltenheit, welche Anerkennung verdient: das Haus nennt den vollen
Weg zum Orte des Zeichens, ohne Wegbeschreibung durch Menüs — die
Kürze der Adressen als Höflichkeit; und wer über die Kette der
Kapitel nachdenkt, wird bemerken, daß die Häuser mit der Zeit
höflicher geworden sind: die alten geben Spaziergänge durch die
Einstellungen, die jungen geben den Link.

## 2. In Terraform einbinden

```bash
export NETLIFY_TOKEN="nfp_…"   # wird automatisch gelesen
```

```hcl
provider "netlify" {}
```

Die Einbindung ist die kürzeste: eine Env-Variable, ein leerer
Block; und es sei bemerkt, daß Netlify zwei Formen duldet — die
Variable hier, den Block mit `token = var.netlify_token` in
[TERRAFORM.md](TERRAFORM.md) —, beide rechtmäßig; die Wahl ist
wieder Geschmack ([../cloudflare/TERRAFORM.md](../cloudflare/TERRAFORM.md)
hat dieselbe Doppelheit verzeichnet), und die Wahrheit beider ist
die alte Scheidung: die Umgebung trägt den Wert, die Formel die
Form.

## 3. Hinweise

- Der PAT trägt **die Rechte des Users** (Free-Plan = 1 Team-Owner) —
  kein separates Scoping möglich; also wie ein Passwort behandeln.
  Der erste Hinweis ist das Bekenntnis zur Einfachheit in ihrer
  ganzen Schärfe: kein Scoping — was der Nutzer darf, darf der Token,
  vollkommen und überall; die Empfehlung, ihn „wie ein Passwort zu
  behandeln", ist die Konsequenz: das uneingeschränkte Zeichen hat
  die Würde des Allgemeinsten und die Schutzlosigkeit des
  Allgemeinsten, und die Sammlung hat diese Lehre an vielen Orten
  wiederholt ([../circle-ci/README.md](../circle-ci/README.md): der
  Bot-User als Ausweg; [../cloudflare/README.md](../cloudflare/README.md):
  das geschnittene Recht als Fortschritt) — hier ist sie in ihrer
  Urgestalt: das Schicksal hängt am Einen, und die Sorge muß es
  auch.

- `data.netlify_site` / alle Ressourcen hängen an der **Team-ID** —
  bei mehreren Teams pro Account die richtige im Data-Source-Lookup treffen.
  Der zweite ist die Lehre von der Adresse der Sachen: alles hängt am
  Teams (die Team-ID — die Hausnummer, welche
  [../circle-ci/README.md](../circle-ci/README.md) als Organization-ID
  und [../gcp/README.md](../gcp/README.md) als Projekt kannte), und wer
  mehrere Häuser hat, muß im Suchblicke (Data-Source-Lookup) das rechte
  treffen — die Zweiheit von Schlüssel und Hausnummer, hier zur
  Pflicht des Treffens gesteigert, weil die Formel nicht errät.

- Token lassen sich nicht zeitlich begrenzen — Rotation durch Löschen +
  Neuanlegen; bei Verdacht sofort widerrufen.
  Der dritte ist die Ewigkeit des ungeteilten Zeichens: keine Fristen
  (anders die Secrets von [../circle-ci/README.md](../circle-ci/README.md),
  welche von selbst verfallen), also die harte Rotation als einzige
  Erneuerung — Löschen und Neugeburt ([../neon/README.md](../neon/README.md)
  hat diese Form ausführlich betrachtet: die Lücke, das sofortige Ende);
  und der Zusatz „bei Verdacht sofort widerrufen" gibt die Moral der
  ganzen Konstruktion: das ewige Zeichen ist nur erträglich unter der
  Bedingung der jederzeitigen Tötung, und die Wachsamkeit ist der
  Preis der Einfachheit.

- Env-Vars für Builds (`netlify_environment_variable`) sind vom PAT
  unabhängig — die Werte landen im TF-State, Backend verschlüsseln.
  Der vierte endlich scheidet die beiden Geheimnisse: die des
  Zuganges (der PAT, das Zeichen des Nutzers am Hause) und die des
  Betriebes (die Env-Vars, die Zeichen der Anwendungen im Hause) —
  sie sind unabhängig, aber die letzteren teilen das Schicksal der
  State-Gebundenheit ([../circle-ci/TERRAFORM.md](../circle-ci/TERRAFORM.md)
  hat die Lehre vom klaren Werte im Staate entwickelt; Netlify, ohne
  Hash-Kniff — [../circle-ci/README.md](../circle-ci/README.md) zeigte
  den Ausweg des Abdruckes —, braucht die stärkere Medizin: das
  verschlüsselte Backend), und die Sammlung kann an dieser Stelle
  ihren kleinen Satz über die Geschichte des Geheimnisses im Staate
  wiederholen: das Behalten ist das Problem, das Zeigen die Lösung,
  und die Verschlüsselung die Vermeidung beider.

## Quellen

- Provider: <https://registry.terraform.io/providers/netlify/netlify/latest/docs>
- Token-Erstellung: <https://docs.netlify.com/cli/get-started/#obtain-a-token-in-the-netlify-ui>

## Vermittelte Verhältnisse

Die Ausweise vermitteln zwischen den Gaben ([FREE-TIER.md](FREE-TIER.md))
und dem Begriffe ([TERRAFORM.md](TERRAFORM.md)) des währungsfreundlichsten
Hauses; ihre Lehren gehören der Urgeschichte der Zeichen an — das
Eine, das Allesgeltende, das Ewige —, und wer sie mit den
fortgeschrittenen Formen vergleicht (dem Paare, dem Schnitte, den
Stufen), der sieht die Entwicklung im Rückspiegel: was alle Häuser
einmal waren, hat dies Haus treu bewahrt, und die Frage, ob es die
letzte Festung der Einfachheit ist oder die nächste zur Umstellung
steht, sei als geschichtliche Frage offen gelassen — die
Kredit-Wende seines Kontingentes ([FREE-TIER.md](FREE-TIER.md))
zeigt jedenfalls, daß das Haus das Abstrahieren nicht scheut, wenn
die Sache reif ist; vielleicht reift auch der Ausweis.
