# Grafana Cloud — Auth für Terraform

> Bevorzugt: **Access Policy Token** aus dem Grafana Cloud Portal (nicht ein
> Service-Account-Token des Stacks!) via `GRAFANA_CLOUD_ACCESS_POLICY_TOKEN`.
> Für Stack-Ressourcen wird danach per TF ein eigener Stack-Token erzeugt.

Diese Ausweisordnung hat eine Eigentümlichkeit, welche sie über die
bloße Technik hinaushebt: sie ist zweistufig, und die Stufen sind nicht
Willkür, sondern Notwendigkeit der Sache. Der erste Token (der
Bootstrap-Token, `glca_…`) erschafft die Stacks und deren eigene
Ausweise; der zweite (der Stack-Token, aus dem Dienste selbst) verwaltet
das Innere des Geschaffenen; der erste ist also der Stifter, der zweite
der Verwalter, und die Trennung beider ist der ganze Inhalt der
Weisheit dieser Seite. Man hat in der politischen Metaphorik dieser
Sammlung schon manche Gestalt gefunden — die Verfassung und die
Gesetze ([../circle-ci/TERRAFORM.md](../circle-ci/TERRAFORM.md)), die
Person und den Beauftragten ([../gcp/README.md](../gcp/README.md)) —;
hier ist es die konstituierende und die gesetzgebende Gewalt: die
eine, welche den Zustand setzt, darf nicht die sein, welche ihn
erhält, und das Zurückstutzen des Bootstrap-Tokens (der zweite Hinweis
unten) ist der Verzicht des Stifters — der schönste Vorgang der
politischen Technik, hier in drei Zeilen YAML vollzogen.

## 1. Bootstrap-Token erstellen

Grafana Cloud Portal (<https://grafana.com>) → **Access policies** →
**Create access policy** → Name (z. B. `terraform`) → Region → unter
**Scopes** mindestens setzen:

| Scope | Nötig für |
|---|---|
| `accesspolicies:read/write/delete` | Policies selbst verwalten |
| `stacks:read/write/delete` | `grafana_cloud_stack` anlegen/ändern |
| `stack-service-accounts:write` | Stack-Service-Accounts/-Tokens |

→ **Create** → Tab **Tokens** → **Add token** → Name `tf-bootstrap` →
Token einmalig kopieren.

Die Tafel der Scopes ist die bekannte Verfassungsliste — jedes Recht
ein Artikel, benannt nach dem Gegenstande —, und die Anordnung lehrt
die Stiftung: die erste Zeile (die Policies selbst) ist das
Selbstsetzungsrecht, die zweite (die Stacks) das Werkrecht, die dritte
die Amtssetzungs-Befugnis für die künftigen Verwalter; wer die drei
setzt, hat die konstituierende Gewalt vollständig, und das Haus ist
weislich eingerichtet, denn es trennt die Policy (die bleibende
Ordnung) vom Token (dem vergänglichen Zeichen): dieselbe Ordnung kann
viele Zeichen nacheinander haben, wie dasselbe Amt viele Amtsträger —
eine Trennung, welche [../cloudflare/README.md](../cloudflare/README.md)
am Rollen der Token als der kontinuierlichen Erneuerung entwickelte,
hier als die Grundform des Ganzen.

## 2. In Terraform einbinden

```bash
export GRAFANA_CLOUD_ACCESS_POLICY_TOKEN="glca-…"   # Cloud-Provider-Ebene
```

```hcl
provider "grafana" {
  alias = "cloud"   # Token kommt aus der Env-Var
}
```

Der Bootstrap-Token wird **nur** für Stack + Stack-Service-Account benutzt
(Beispiel in TERRAFORM.md); alle Ressourcen im Stack (Dashboards, Alerts,
Datasources) verwaltet der zweite Provider mit dem erzeugten Stack-Token
(Env `GRAFANA_AUTH` oder `auth = …`).

Der Alias (`alias = "cloud"`) ist das technische Mittel der Zweiheit:
derselbe Provider unter zwei Namen, einmal für die Cloud (den
Stiftungs-Bereich), einmal für den Stack (den Verwaltungs-Bereich);
und der Kommentar am Schlusse — alle Inneres gehöre dem zweiten — ist
die Amtsgrenze, das Grundgesetz der Stufen. Man sieht hier die
Scheidung, welche sonst die Häuser scheiden (AWS gegen Azure, Cloud
gegen Stack), innerhalb Eines Providers vollzogen: die vertikale Welt
in Einem Formelwerke, und es gehört zu den erfreulichen Erfahrungen
dieser Sammlung, wenn die Technik einmal nicht der Wahrheit
hinterherhinkt, sondern sie vorführt.

## 3. Hinweise

- Nicht die Verwechslungsfalle: `glc_…` (Grafana-API-Token) vs.
  `glca_…` (Cloud-Access-Policy-Token) — Terraform-Cloud-Ressourcen brauchen
  `glca_…`.
  Der erste Hinweis ist der vom doppelten Anfange: zwei
  Zeichenfolgen, durch einen einzigen Buchstaben geschieden (das `a` — das
  zweite Glied der Kette!), bezeichnen zwei Welten (die des Stacks und
  die der Cloud), und die Verwechslung ist die übliche — beide fangen
  gleich an, beide sind Token, beide gelten —, aber nur die Eine gilt
  für das, was der Nutzer hier will. Es ist die dünnste aller
  Namensgrenzen und darum die tückischste; die Lehre von der
  Zeichenkunde (welche [../cloudflare/TERRAFORM.md](../cloudflare/TERRAFORM.md)
  an den v4/v5-Namen und [../circle-ci/TERRAFORM.md](../circle-ci/TERRAFORM.md)
  an der UUID entwickelte) hat hier ihren Fall für den
  Buchstabensinn: ein `a` entscheidet über Zutritt und Versagen.

- Least Privilege nach dem Bootstrap: Das `tf-bootstrap`-Token kann
  zurückgestutzt werden (nur `stacks:*`), sobald Stacks + Stack-Admin-Token
  per TF existieren.
  Der zweite ist der Verzicht des Stifters, oben schon gefeiert: wenn
  das Geschaffene seine eignen Ausweise hat, dann schrumpft der
  Schöpfer zum Gast — das Bootstrap-Token behält nur das Recht am
  Bestande (nichts löschen, nichts stiften), und die konstituierende
  Gewalt tritt ab; wer dies vollzieht, hat die höchste Stufe der
  Sicherheitstechnik erreicht, welche nicht Vermehrung der Schlüssel,
  sondern Verminderung ist: die Macht, welche sich selbst aufhebt,
  nachdem sie gewirkt — die Aufhebung im dreifachen Sinne, denn sie
  endet die Vollmacht, bewahrt das Gewirkte und hebt den Zustand der
  Gründung in den der Verwaltung empor.

- Access Policy Tokens laufen standardmäßig **nie** ab — Kalender-rotation
  selbst organisieren.
  Der dritte endlich ist die Kehrseite der Ewigkeit: was nie endet,
  das wechselt auch nie von selbst, und der Nutzer muß die Zeit
  selbst herbeiholen („Kalender-Rotation selbst organisieren") — die
  Pflicht, welche bei [../circle-ci/README.md](../circle-ci/README.md)
  die Frist von sich aus erledigt (Secrets laufen 6–24 Monate) und
  welche hier dem Hause selbst zufällt, weil das Haus nichts verfallen
  läßt; die Ewigkeit der Gültigkeit ist also kein Geschenk ohne Preis:
  sie verlagert die Sorge vom Gesetzgeber auf den Nutzer, und wer
  ewige Token hält, ohne sie zu rollen, der hat die Sicherheit des
  Vergänglichen (den Schlüssel, der bleibt) ohne die Entschuldigung
  des Vergänglichen (er verfiel mir ja) — der schlechteste aller
  Zustände, wie die Lehre vom Rollen ([../cloudflare/README.md](../cloudflare/README.md),
  dritter Hinweis) am Ende zeigt.

## Quellen

- Provider-Auth: <https://registry.terraform.io/providers/grafana/grafana/latest/docs>
- Access Policies: <https://grafana.com/docs/grafana-cloud/account-management/authentication-and-permissions/access-policies/>

## Vermittelte Verhältnisse

Die Ausweise vermitteln zwischen den Gaben ([FREE-TIER.md](FREE-TIER.md))
und dem Begriffe ([TERRAFORM.md](TERRAFORM.md)) des anschaulichsten
Hauses; die Zweiheit der Stufen hat ihre Geschwister in der Sammlung —
[../netlify/README.md](../netlify/README.md) (PAT ohne Scoping), deren
Einfachheit hier als überwunden erscheint, und [../gcp/README.md](../gcp/README.md)
(User und Beauftragter), deren Zweiheit hier verdoppelt ist —, und die
allgemeine Lehre vom Zurückstutzen gehört in den Zusammenhang des
kleinsten Rechtes, welchen [../helpers.md](../helpers.md) über die
Scopes der Agenten und [../aws/README.md](../aws/README.md) über das
least privilege entwickelt haben. Wer dies Kapitel liest, lernt die
höchste Lektion der Ausweis-Welt: daß der beste Schlüssel der ist,
welcher nach dem Werke schrumpft — denn die Macht ist nur solange
schön, als sie gebraucht wird, und danach ist sie nur noch Gefahr.
