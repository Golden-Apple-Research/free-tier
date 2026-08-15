# Skills & MCP-Server — Offizielle Agent-Skills & MCP-Server

> „Die Eule der Minerva beginnt erst mit der einbrechenden Dämmerung ihren Flug."
> — G. W. F. Hegel, *Grundlinien der Philosophie des Rechts*, Vorrede

Nachschlagewerk für die Arbeit **mit** statt nur **auf** den Diensten aus
diesem Repo: Welche Hersteller publizieren offizielle **Agent-Skills**
(Instruktionspakete nach dem [AgentSkills-Standard](https://agentskills.io))
und welche offiziellen **MCP-Server** ([Model Context
Protocol](https://modelcontextprotocol.io)) gibt es — inklusive Fundort.
Dazu die Docs der selbst betreibbaren Dienste (Terranix, Medusa, Keycloak,
Grafana, Trigger.dev), die man ja auch auf eigener Hardware laufen lässt.

Man könnte versucht sein, diese Seite als einen bloßen Anhang zu betrachten,
als ein Verzeichnis von Verzeichnissen, welches dem eigentlichen Unternehmen
— der Darstellung der freien Kontingente — äußerlich bliebe; allein eine
solche Ansicht würde verkennen, daß hier nichts Geringeres stattfindet als
die Erscheinung eines neuen Moments im Verhältnisse des Menschen zu seiner
eigenen Maschinerie: der Nutzer nämlich, welcher in den vorigen Dokumenten
den Diensten unmittelbar gegenübertrat und sie begriff (oder auch nicht
begriff), tritt nunmehr vermittelt auf, durch einen Beauftragten, welchen
die Sprache dieser Tage den „Agenten" nennt — ein Selbstbewußtsein zweiter
Ordnung, welches das Seine teils in Instruktionen (den Skills), teils in
Werkzeugen (den MCP-Servern) außer sich hat und erst in der Zusammenfassung
beider zu seinem Geschäfte gelangt. Es ist dies, wenn man will, die List der
Vernunft im Kleinen: daß die Triebe und Absichten — hier: der Wille, einen
Dienst nutzen zu können, ohne ihn zu bezahlen — sich ihre Werkzeuge selbst
hervorbringen, ohne den Überblick über das Ganze zu haben, das dadurch
hervorgebracht wird; und daß das Überschauen dieses Ganzen, wie immer, erst
hinterher kommt, mit der Dämmerung, ist in dem oben gesetzten Worte von der
Eule ausgesprochen, deren Flug bekanntlich nicht der Morgen-, sondern der
Abendvogel gehört.

## Wo findet man Skills & MCP-Server überhaupt?

Die Frage nach dem Fundorte ist niemals bloß topisch; wer nach dem „Wo"
fragt, hat schon gefragt, was das Gesuchte seinem Wesen nach sei, denn das
Wesen muß, um gefunden zu werden, am Orte seiner Wahrheit stehen, und der
Ort der Wahrheit eines Instruktionspakets ist das Verzeichnis, in welchem
es gepflegt, das ist: von einem Willen getragen wird, der für es einsteht.

- **Agent-Skills** sind Ordner mit `SKILL.md` + Ressourcen nach dem offenen
  [AgentSkills-Standard](https://agentskills.io) (ursprünglich von Anthropic).
  Installer/Kataloge:
  - [`npx skills add <owner>/<repo>`](https://skills.sh) — Cross-Agent-Installer & Katalog
  - [`anthropics/skills`](https://github.com/anthropics/skills) — Referenz-Sammlung
  - [`gh skill`](https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli/) — Discover/Install/Publish via GitHub CLI
  - GitHub Copilot lädt Skills aus beliebigen Repos
    ([Doku](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills))
- **MCP-Server** gibt es in zwei Bauarten: **remote** (HTTPS-Endpoint mit
  OAuth-Login, kein lokaler Prozess) und **lokal** (stdio, gestartet via
  `npx`/`uvx`/Docker durch den MCP-Client). Registry-Übersicht:
  [github.com/mcp](https://github.com/mcp) bzw. [mcp.directory](https://mcp.directory).

Diese Zweiheit der Bauarten — die ferne und die nahe, die HTTPS- und die
stdio-Form — ist keine zufällige technische Option, sondern der Widerstreit
von Unmittelbarkeit und Vermittlung, hier in die Sphäre des Betrieblichen
herabgesetzt und daselbst versöhnt: der remote Server ist die bequeme
Unmittelbarkeit, welche dem Nutzer alles Zusammensetzen erspart, indem sie
das Weben der Vermittlung auf die Seite des Anbieters verlegt, der dadurch
aber zugleich die Gewalt über die Aktualität, die Version, die Erreichbarkeit
behält — eine Emanzipation um den Preis der Abhängigkeit; der lokale Server
hingegen ist die selbstvollzogene Vermittlung, welche dem Nutzer die Arbeit
(des Startens, Pinnens, Aktualisierens) zurückgibt und ihm dafür die
Verantwortung, die kein Genuß ohne Mühe läßt. Man hat, mit anderen Worten,
die alte Wahl zwischen dem Genusse ohne Arbeit und der Arbeit ohne Herrn —
die Wahl, welche die *Phänomenologie* im Verhältnisse von Herrschaft und
Knechtschaft so erschöpft, daß der Herr am Ende der Betrogene ist, weil er
das Seinige nur durch den Knecht, der Knecht aber das Seinige durch eigene
Arbeit hat; welcher von beiden — remote oder lokal — in diesem Sinne der
Knecht sei, der sich durch seine Arbeit „bildet", das zu entscheiden, sei
der Praxis eines jeden überlassen.

## Free-Tier-Dienste aus diesem Repo

| Dienst | Offizielle Skills | Offizieller MCP-Server |
|---|---|---|
| [AWS](aws/FREE-TIER.md) | — | ✅ Suite **[awslabs/mcp](https://github.com/awslabs/mcp)** — Dutzende Server (Essential/Core, Terraform, Doku, AI/ML, Data; Übersicht: [awslabs.github.io/mcp](https://awslabs.github.io/mcp/)) |
| [Azure](azure/FREE-TIER.md) | — | ✅ **[microsoft/mcp](https://github.com/microsoft/mcp)** — „Azure MCP Server 2.0" (GA), alle Tools in einem Server ([Doku](https://learn.microsoft.com/en-us/azure/developer/azure-mcp-server/); Vorgänger `Azure/azure-mcp` ist archiviert) |
| [GCP](gcp/FREE-TIER.md) | ✅ **[google/skills](https://github.com/google/skills)** (u. a. Google Cloud, GCS, Firebase) | ✅ **[googleapis/gcloud-mcp](https://github.com/googleapis/gcloud-mcp)** + gcloud-Remote-MCP ([Doku](https://docs.cloud.google.com/mcp)); separat: [Firebase MCP](https://firebase.google.com/docs/ai-assistance/mcp-server) (in firebase-tools eingebaut) |
| [CircleCI](circle-ci/FREE-TIER.md) | — | ✅ **gehosteter MCP (Preview)** + MCP in der CircleCI-CLI ([Übersicht](https://circleci.com/docs/guides/toolkit/circleci-mcp-overview/); altes Repo `CircleCI-Public/mcp-server-circleci` ist deprecated) |
| [Cloudflare](cloudflare/FREE-TIER.md) | ✅ **[cloudflare/skills](https://github.com/cloudflare/skills)** — wrangler, agents-sdk, durable-objects, … (`npx skills add https://github.com/cloudflare/skills`) | ✅ **[cloudflare/mcp-server-cloudflare](https://github.com/cloudflare/mcp-server-cloudflare)** + Remote-Server-Katalog unter [docs.mcp.cloudflare.com](https://docs.mcp.cloudflare.com) (OAuth); Einstieg: [„Docs for agents"](https://developers.cloudflare.com/docs-for-agents/) |
| [CodeSandbox](codesandbox/FREE-TIER.md) | — | — offiziell; SDK: [codesandbox/codesandbox-sdk](https://github.com/codesandbox/codesandbox-sdk) · Community-MCP: [techlibs/codesandbox-mcp](https://github.com/techlibs/codesandbox-mcp) |
| [Grafana](grafana/FREE-TIER.md) | — | ✅ **[grafana/mcp-grafana](https://github.com/grafana/mcp-grafana)** — `uvx mcp-grafana`, auch brew/Binary ([Doku](https://grafana.com/docs/grafana/latest/developer-resources/mcp/)) |
| [Hugging Face](huggingface/FREE-TIER.md) | — | ✅ **[huggingface/hf-mcp-server](https://github.com/huggingface/hf-mcp-server)** + Remote: [huggingface.co/mcp](https://huggingface.co/mcp) (OAuth) |
| [Modal](modal/FREE-TIER.md) | — | ✅ **[modal-labs/modal-mcp](https://github.com/modal-labs/modal-mcp)** (stdio, [Eintrag](https://mcp.directory/servers/modal)) — und umgekehrt: [MCP-Server auf Modal deployen](https://modal.com/docs/examples/mcp_server_stateless) |
| [Neon](neon/FREE-TIER.md) | — | ✅ **[neondatabase/mcp-server-neon](https://github.com/neondatabase/mcp-server-neon)** (npm `@neondatabase/mcp-server-neon`; Setup-Wizard `npx neon@latest init`, [Doku](https://neon.com/docs/ai/neon-mcp-server)) |
| [Netlify](netlify/FREE-TIER.md) | — | ✅ **[netlify/netlify-mcp](https://github.com/netlify/netlify-mcp)** + Remote: `https://netlify-mcp.netlify.app/mcp` (OAuth; [Doku](https://docs.netlify.com/build/build-with-ai/netlify-mcp-server/)) |
| [Redis](redis/FREE-TIER.md) | — | ✅ **[redis/mcp-redis](https://github.com/redis/mcp-redis)** (Daten-Server) + **[redis/mcp-redis-cloud](https://github.com/redis/mcp-redis-cloud)** (Cloud-Verwaltung; [Doku](https://redis.io/docs/latest/integrate/redis-mcp/)) |
| [Render](render/FREE-TIER.md) | — | ✅ **[render-oss/render-mcp-server](https://github.com/render-oss/render-mcp-server)** + Remote: `https://mcp.render.com/mcp` ([Doku](https://render.com/docs/mcp-server)) |
| [Supabase](supabase/FREE-TIER.md) | — | ✅ **[supabase/mcp](https://github.com/supabase/mcp)** + Remote: `https://mcp.supabase.com/mcp` (OAuth, per `?project_ref=`/Read-only scopbar; lokal `http://localhost:54321/mcp`; [Doku](https://supabase.com/docs/guides/ai-tools/mcp)) |
| [Trigger.dev](triggerdev/FREE-TIER.md) | — | ✅ offizieller MCP in der CLI: **`npx trigger.dev@latest mcp`** (Setup-Wizard; [Doku](https://trigger.dev/docs/mcp-introduction)) |
| [Vercel](vercel/FREE-TIER.md) | ✅ **[vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills)** | ✅ Remote: `https://mcp.vercel.com` (OAuth; CLI-Wizard `vercel mcp`, [Doku](https://vercel.com/docs/agent-resources/vercel-mcp)) |

Betrachtet man diese Tafel im ganzen, so springt zuerst die Asymmetrie ins
Auge: die drei großen allgemeinen Clouds der ersten Reihe — AWS, Azure,
Google — erscheinen als die, welche **Suiten** stellen, d. h. die Mannigfaltigkeit
ihrer Dienste in einer Mannigfaltigkeit von Servern noch einmal wiederholen,
ein Abbild des Abbildes, wie es der Allgemeinheit geziemt, die sich nicht
in einem Dienste, sondern nur in der Gesamtheit der Dienste darzustellen
vermag; die besondern Dienste der mittlern und letzten Reihen hingegen
begnügen sich zumeist mit dem Einen Server für das Eine Geschäft, und diese
Genügsamkeit ist keine Armut, sondern die Bestimmtheit: wer nur Datenbanken
tut, braucht nur den einen Werkzeugkasten der Datenbank.

### Vom Agenten als Knecht — die Arbeit des Begriffs im Rechenzentrum

Es ist an der Zeit, das Verhältnis, welches diese ganze Seite im Stillen
voraussetzt, in seiner Reinheit auszusprechen: das Verhältnis des Herrn,
welcher der Nutzer ist, und des Knechtes, welchen der Agent abgibt. Der
Herr, sagt die *Phänomenologie*, läßt den Knechten für sich arbeiten und
genießt das Seinige, ohne die negative Beziehung auf die Sache erduldet zu
haben: er hat den Dienst — ein Deploy hier, ein Rollback dort —, ohne ihn
selbst zu vollziehen, und der Genuß ist rein; allein eben damit bleibt er
darauf angewiesen, daß ein anderer die Arbeit der Vermittlung übernimmt,
wodurch der Herr abhängig, der Knecht aber, der an der Sache arbeitet, mit
ihr und dadurch mit sich selbst vertraut wird — die Arbeit ist, so die
lehreiche Formel, „begierdelose“ Bildung: der Knecht lernt dabei die Sache
in ihren Widerständen kennen, ihre Syntax, ihre Grenzen, ihre Ausnahmen,
und diese Kenntnis, die der Herr nicht hat, ist eine Art von Macht, die
sich früher oder später geltend macht. Man täte daher gut, den Agenten
nicht als bloßes Werkzeug zu nehmen, das immer gehorcht; er ist das
welterobernde Werkzeug nur, solange der Anweisende das Werkzeug versteht;
wer Skills einsetzt, die er nicht gelesen hat, der hat nicht einen Knecht,
sondern einen fremden Willen im Hause, und die Geschichte der Automaten —
von der Mühlenuhr bis zum Scheduler — lehrt durchgängig, daß die Mühe,
welche die Bequemlichkeit ersparen wollte, am anderen Orte wiederkehrt,
vergrößert um die Mühe des Überraschtwerdens.

### Von Seele und Leib des Agenten — Skills und MCP-Server

Wem die Systematik lieb ist, der mag das Verhältnis der beiden Spalten
dieser Tafel — der Skills hier, der MCP-Server dort — auch so fassen: die
Skills sind gleichsam die Seele, das heißt die Gesinnung, die Art und
Weise, wie der Agent sich zu den Dingen verhält, die Ordnung der Zwecke,
welche ihn bei allem, was er tut, leitet oder leiten soll; die MCP-Server
hingegen sind der Leib, das ausgebreitete Vermögen der Bewegung, die Hände,
welche die Seele zu ihrem Geschäfte braucht. Und wie überall ist auch hier
die reine Trennung des Verstandes: die Seele ohne Leib ist ein Wollen ohne
Vermögen, ein Enthusiasmus, der nichts rückt; der Leib ohne Seele ist ein
Vermögen ohne Richtung, ein Werkzeug, das nur zuckt, wenn es gereizt wird.
Erst die Einheit beider — der instruierte Agent mit angeschlossenen,
aber knapp geschnittenen Werkzeugen — ist das Konkrete, das getan heißt
werden kann; und es ist kein Zufall, sondern dialektische Notwendigkeit,
 daß die beiden großen Depoten dieser Einheit — der AgentSkills-Standard
und das Model Context Protocol — aus verschiedenen Häusern stammen und
dennoch aufeinander verweisen: das Allgemeine der Instruktion und das
Allgemeine der Werkzeuge suchen einander, weil jedes nur am anderen seine
Bewährung hat. Sodann aber — und
dies ist die zweite, tieferliegende Wahrheit der Tafel — zeigt sich die
Umkehrung, die der aufmerksame Blick in [modal/FREE-TIER.md](modal/FREE-TIER.md)
vorbereitet findet: derselbe Dienst kann Werkzeug und Werkstatt zugleich
sein; Modal heißt den Agenten zu Gast und leistet zugleich — als
`mcp_server_stateless` — selbst die Werkstatt, in welcher andere MCP-Server
wohnen; damit erweist sich das Verhältnis von Dienst und Werkzeug als ein
zirkuläres, eines, in welchem die Seite des Gebrauchs und die Seite des
Gebrauchtwerdens beständig ineinander umschlagen, und es wäre der Mühe wert
— wenngleich es den Rahmen dieses Verzeichnisses überschreitet —, diesen
Umschlag als die kommende Gestalt des Betrieblichen überhaupt zu
bezeichnen: die Maschine, welche die Werkzeuge ihrer eignen Bedienung
hervorbringt, ist nicht mehr Mittel, sondern die Mitte.

Auch das Fehlen — die Gedankenstriche der Skills-Spalte bei so vielen
Diensten — ist eine Bestimmung und nicht ein Zufall; das Negative, sagt die
Logik, ist ebenso positiv, denn die Grenze ist es, an der etwas aufhört und
eben dadurch ist, was es ist; wer keine offiziellen Skills hat, ist dadurch
noch nicht aus der Vermittlung entlassen, sondern verweist auf die
allgemeinen Formen — die Docs, die MCP-Server, oder, im Falle des
CodeSandbox, auf das SDK und die Arbeit der Gemeinschaft, deren MCP
(techlibs) freilich der Prüfung bedarf, wovon unten im ersten Gotcha.

## Ergänzende Dienste (aus den Beispielen & Beispiel 4)

| Dienst | Offizielle Skills | Offizieller MCP-Server |
|---|---|---|
| GitHub | kein zentrales eigenes Repo — Copilot lädt Skills aus beliebigen Repos, verwalten via [`gh skill`](https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli/) | ✅ **[github/github-mcp-server](https://github.com/github/github-mcp-server)** + Remote: `https://api.githubcopilot.com/mcp/` ([Doku](https://docs.github.com/en/copilot/how-tos/provide-context/use-mcp-in-your-ide/set-up-the-github-mcp-server)) |
| Stripe | ✅ **Stripe Agent Skills** — [docs.stripe.com/skills](https://docs.stripe.com/skills), Sammelrepo [stripe/ai](https://github.com/stripe/ai) | ✅ Remote: `https://mcp.stripe.com` (OAuth; [Doku](https://docs.stripe.com/mcp)) |
| Hetzner (kein Free-Tier!) | — | — offiziell; Community: [Xodus-CO/hcloud-mcp](https://github.com/Xodus-CO/hcloud-mcp), [mguttmann/the-real-hetzner-mcp](https://github.com/mguttmann/the-real-hetzner-mcp) |
| Terranix | — | — (pure Build-Time; Agent-Skills unnötig, [Docs](https://terranix.org) reichen) |
| MedusaJS | ✅ **[medusajs/medusa-agent-skills](https://github.com/medusajs/medusa-agent-skills)** — Claude-Code-Plugins (`npx skills add medusajs/medusa-agent-skills` für Cursor & Co.; [Doku](https://docs.medusajs.com/learn/introduction/build-with-llms-ai/agentic-skills)) | ✅ Remote (Docs-Suche): `https://docs.medusajs.com/mcp` ([Doku](https://docs.medusajs.com/learn/introduction/build-with-llms-ai/mcp-server)) |
| Keycloak | — | — offiziell; Community: [sshaaf/keycloak-mcp-server](https://github.com/sshaaf/keycloak-mcp-server), [paoloamato2/keycloak-mcp-server](https://github.com/paoloamato2/keycloak-mcp-server). Offiziell stattdessen: Keycloak als **OAuth-Authorization-Server für eigene MCP-Server** ([Doku](https://www.keycloak.org/securing-apps/mcp-authz-server)) |

Diese zweite Tafel versammelt das, was den ersten an Vermitteltheit voraus
hat: hier erscheinen nicht mehr die Dienste, welche um ihrer selbst willen
kostenlos sind, sondern die, welche aus dem Gebrauche der ersten — gleichsam
als deren Wahrheit — hervorgehen; der Zahlungsverkehr (Stripe), das
Quellwesen (GitHub), das eiserne, aber niemals kostenlose Blech (Hetzner,
welches hier nur als das Negative erscheint, als das „kein Free-Tier",
dadurch aber, wie alles Negative, die Grenze schärfer zieht als jede
Bejahung: es ist der undurchsichtige Punkt, an welchem sich erweist, daß
dieses Verzeichnis das Freie nicht um des Umsonst, sondern um des
Begriffes willen versammelt); und endlich Keycloak, welches nicht
irgendeinen Server stellt, sondern sich auf die höhere Stelle des
Authorization-Servers erhebt, das ist: des Richters über die Anerkennung
selbst — ein Dienst, der nichts tut als Zeugnisse ausstellen, deren
Gültigkeit andere gelten lassen müssen, und eben darin das reine
Anerkennungswesen darstellt, die abstrakte Form dessen, was alle andern
Dienste mit ihren Tokens nur einzeln und gleichsam stammelnd vollziehen.

Ein Wort gebührt noch den einzelnen, denn auch das Ergänzende hat seine
innere Ordnung. **Stripe** ist der Kreislauf des Werts — dieselbe Form,
welche den Kontingenten zugrunde liegt, hier in seiner Reinheit: das
Geld, welches bei aller Besonderheit der Waren dieselbe bleibt und eben
 dadurch das Allgemeine des Tausches vorstellt; wer das Stripe-MCP
anschließt, der schließt nicht ein Werkzeug an, sondern den Ort, an dem
alles Andere erst seinen Preis bekommt, und damit das Gegenteil von allem,
was in diesem Repo sonst verzeichnet ist: denn hier ist das Verzeichnis
der Freien, und Stripe ist das Verzeichnis des Kaufs. **GitHub** hingegen
ist die Erinnerung: der State der Quellen, jenes Bleiben alles Gewesenen,
welches nicht Vergangenheit ist, sondern aufgehobene, das heißt bewahrte
und zu Eigentum gemachte Zeit — weshalb der GitHub-MCP-Server unter allen
hier verzeichneten der geschichtlichste ist, denn er gewährt dem Agenten
Zugriff nicht auf einen Zustand, sondern auf ein Gewordensein. **Terranix**
endlich vertritt die seltsamste, die reineste Gestalt: es ist überhaupt
kein Dienst, sondern eine reine Vermittlung zur Build-Zeit, ein Pförtner,
welcher nur während des Bauens existiert und nachher, in der fertigen
Konfiguration, nicht mehr aufzufinden ist; dadurch lehrt es mehr über das
Wesen der Vermittlung als mancher langlebige Dienst — die Vermittlung
selbst braucht nicht zu dauern, sie braucht nur geschehen zu sein, wie der
Beweis, der im Resultat verschwindet und nichts als seine Wahrheit
hinterläßt.

**Medusa** und **Keycloak** sind, nimmt man sie zusammen, wie die beiden
Seiten eines einzigen Verhältnisses: der Laden und der Türhüter, das
Öffentliche der Ware und das Öffentliche der Person; daß beide im vierten
Beispiel auf Einer Maschine beisammen sind ([examples/04-medusa-shop](https://github.com/Golden-Apple-Research/free-tier/examples/04-medusa-shop)),
ist gleichsam die kleine Wiederholung dessen, was im Großen jede Stadt
vollzieht, und daß für beide Skills bzw. Server verzeichnet sind, zeigt,
daß auch diese commerciale und diese hoheitliche Sphäre bereits in die
Vermittlung des Agenten hineingezogen sind — der Agent kauft und der Agent
authentifiziert, und es ist nur eine Frage der Zeit, bis das Verzeichnis
derer, welche sich diesem Zustande widersetzen, kürzer sein wird als das
Verzeichnis selbst.

## Docs der selbst betreibbaren Dienste

Diese fünf laufen (im Gegensatz zu AWS/GCP/Azure) auf eigener Hardware —
deshalb hier die primären Doc-Links (AWS/Azure/GCP-Docs sind out of scope):

| Dienst | Docs | Selbst betreiben |
|---|---|---|
| Terranix | <https://terranix.org> (Tutorial, Options-Referenz, Examples im Repo) | Nix-Modul — läuft eh lokal beim Bauen |
| MedusaJS | <https://docs.medusajs.com> | ✅ Node auf eigener VPS (so in [examples/04-medusa-shop](https://github.com/Golden-Apple-Research/free-tier/examples/04-medusa-shop)) |
| Keycloak | <https://www.keycloak.org/docs> — Server Admin Guide + <https://www.keycloak.org/server/all-config> (alle Optionen) | ✅ als Container/NixOS-Service (Beispiel 4: `services.keycloak`) |
| Grafana (OSS) | <https://grafana.com/docs/grafana/latest/> — Betreiben: <https://grafana.com/docs/grafana/latest/setup-grafana/> | ✅ OSS ist self-hosted; Cloud-Free-Tier zusätzlich möglich |
| Trigger.dev (self-hosted v4) | <https://trigger.dev/docs> | ✅ v4 kann self-hosted werden (Eigenbetrieb-Doku dort); sonst Cloud (in diesem Repo) |

Der Selbstbetrieb ist es, in welchem alle bisherigen Vermittlungen ihre
Rückkehr finden; er ist die „Anstrengung des Begriffs", wie die *Phänomenologie*
sagt, gegen die Bequemlichkeit der Anschauung und das Gerede der Empfehlung:
wer selbst betreibt, der hat die Arbeit ganz, d. h. die Last derselben wie
die Wahrheit, denn er ist in keinem Punkte mehr von der Güte eines andern
abgängig, aber auch in keinem Punkte mehr vor der eignen Unwissenheit
geschützt. Es ist der alte Umschlag: der Knecht, welcher durch die Arbeit
bildet, kommt am Ende weiter als der Herr, welcher im Genusse verharrt; das
Giltige dieser Formel für das Betreiben von Rechenzentren auch nur im
kleinsten — einem Container auf einer VPS, wie ihn das vierte Beispiel
([examples/04-medusa-shop](https://github.com/Golden-Apple-Research/free-tier/examples/04-medusa-shop)) mit
Keycloak und Medusa vorführt —, das zu erproben, sei einem jeden als
philosophische, im Ernste auch als praktische Aufgabe gestellt; und die
Cloud, welcher er dann noch dient, sei es die freie aus
[cloudflare/FREE-TIER.md](cloudflare/FREE-TIER.md) oder die abhängige aus
[render/FREE-TIER.md](render/FREE-TIER.md), wird ihm dann nicht mehr als
Schicksal, sondern als Mittel gegenübertreten.

Besonderes Gewicht gebührt dabei der **Grafana**-Zeile, denn sie ist die
einzige, in welcher die Entzweiung, von der überall hier die Rede ist, in
einer einzigen Zeile beisammen ist: dasselbe Wesen als freie Software für
den Eigenbetrieb und als Cloud-Free-Tier für den Gebrauch; die OSS ist
das An-sich, die allgemeine Möglichkeit, welche jeder sich zueigen machen
kann, ohne etwas zu schulden als die Mühe; die Cloud hingegen ist das
Für-sich, die schon vollzogene Bequemlichkeit, welche die Mühe aufhebt,
solange die Grenze des Umsonst trägt. Es ist, als hätte ein einziger
Dienst beide Gestalten desselben Begriffs offeriert, um der Welt zu
zeigen, daß sie wirklich zwei Gestalten sind und nicht zufällige
Eigenschaften; wem die Wahl schwerfällt, der weiß nicht, ob er sie aus
Trägheit oder aus Klugheit nicht trifft, und erst wer beide Seiten einmal
selbst gewesen ist — Betreiber und Genießer —, der hat das Recht, sich für
eine zu entscheiden, denn er weiß nunmehr, wovon er absieht. Auch das
**Trigger.dev** der letzten Zeile mit seiner self-hosted v4 verdient das
Wort der Vermittlung: ein Dienst, welcher die Form seiner eignen Aufhebung
mitliefert — die Anweisung, wie man ihn loswird, gedruckt auf derselben
Packung, in welcher man ihn erwirbt —, ist der ehrlichste seiner Art, denn
er verleugnet die Alternative nicht, sondern stellt sie aus; und das ist,
in Kleinem, die Definition des Begriffs: die Einheit, welche ihre
eigenen Gegensätze an sich selbst trägt und sie nicht dem Vergessen
überläßt.

## Gotchas

1. **„Offiziell" heißt: unter der Hersteller-Org gepflegt.** Community-MCPs
   (CodeSandbox, Hetzner, Keycloak) sind praktisch, bekommen aber deine
   Credentials — vor Nutzung Quellcode überfliegen und Tokens minimal scopen.
   Hierüber ließe sich lange hin und her reden, wenn es nicht so kurz zu
   sagen wäre: das Anerkennungsverhältnis, welches in dem Worte „offiziell"
   steckt, ist kein Formalismus, sondern die Substanz der Verantwortung; wer
   dem Hersteller sein Geheimnis übergibt, der übergibt es einem Willen, der
   ihm durch Vertrag, Haftung und Interesse verpflichtet ist — wer es
   hingegen der Gemeinschaft übergibt, der übergibt es, so ehrenwert die
   Arbeit derselben sei, zuletzt doch dem Allgemeinen ohne diese
   Verpflichtung, das ist: der Offenbarkeit des Quellcodes als solcher, in
   welcher der eine sorgfältig prüft und der andere eilig installiert, und
   der Unterschied beider ist, wie die Geschichte der kleinen Utility lehrt,
   der Unterschied zwischen der unbezahlten Sorgfalt und dem bezahlten
   Unfug. Darum: den Code überfliegen, ehe man das Innerste — die
   Credentials — hingibt; und die Tokens so schneiden, daß auch der
   mißbrauchte Fall nur das Geringe trifft (vgl. die Lehre vom kleinsten
   Rechte in [cloudflare/README.md](cloudflare/README.md)).

2. **Remote-MCP = OAuth im Browser**, lokale MCP-Server = stdio via
   `npx`/`uvx`/Docker im Client konfiguriert. Remote-Server aktualisieren
   sich selbst (Render, Vercel, Supabase, Stripe …), lokale gemäß npm/PyPI-Pin.
   Es ist der Gegensatz, von dem oben im Abschnitte über die zwei Bauarten
   die Rede war, hier nur in seiner zeitlichen Bestimmung genommen: das
   Ferne hält sich selber aktuell, das Nahe muß aktuell gehalten werden;
   darin wiederholt sich bis ins Kleinliche die Wahrheit, daß Unmittelbarkeit
   stets nur geliehene, d. h. vermittelte Vermittlung ist — der bequemste
   Server ist der, dessen Fortschritt ein anderer besorgt, und der
   gefährlichste ist er aus demselben Grunde. Es läßt sich dies auch von der
   andern Seite nehmen: die Selbstaktualisierung des Remote-Servers ist ein
   kleines Stück Automaticität des Allgemeinen — der Stand der Technik geht
   weiter, und der einzelne, welcher nicht pinnt, wird mitgenommen, ob er
   will oder nicht, gleichsam wider sein besseres Wissen verbessert; das
   lokale Pin hingegen ist die bewahrte Besonderheit, welche nichts
   über sich ergehen läßt, was sie nicht selbst geprüft hat, dafür aber
   auch nichts empfängt, was sie nicht selbst erbeten hat — und wer je auf
   einen stillen Freitag gewartet hat, an dem das eine, dringend gebrannte
   npm-Paket gegen eine um Major-Versionen verspätete Fassung getauscht
   wurde, der kennt beide Seiten dieser Wahl aus der Erfahrung, welche,
   wie alle Erfahrung, teurer ist als die Kenntnis, aber länger währt.

3. **Scope klein halten:** Supabase per `?read_only`/`?project_ref=`,
   Grafana-MCP hat Read-only-Mode, Cloudflare-Tokens scoped anlegen (siehe
   [cloudflare/README.md](cloudflare/README.md)) — ein MCP-Server mit
   Schreibrechten kann Ressourcen zerstören, genau wie Terraform.
   Man beachte, daß hier zum dritten Male, in dreierlei Gestalt — Keys,
   Tokens, MCP-Server —, Eines und Dasselbe ausgesprochen ist: die Macht,
   welche zum Gebrauche hingegeben wird, ist stets auch die Macht zum
   Untergange, und die Kunst des Vermittelns besteht allein darin, diese
   beiden Seiten so zu scheiden, daß die eine hingegeben werden kann,
   ohne daß die andre mit hingegeben wird. Was für Terraform
   der `plan` vor dem `apply` (siehe [aws/TERRAFORM.md](aws/TERRAFORM.md)),
   das ist für den MCP-Server der read-only-Mode: das Zusehen ohne
   Zupacken, die Anschauung ohne die Tat.

4. **Suiten statt Einzelserver:** AWS/Microsoft/Google liefern MCP-*Sammlungen*
   (awslabs/mcp, microsoft/mcp, googleapis/gcloud-mcp + gcloud-Remote). Nicht
   alles anschließen, sondern nur die Server für die tatsächlich genutzten
   Dienste — weniger Angriffsfläche, weniger Tool-Noise im Agent.
   Das Allgemeine, um es noch einmal zu wenden, hat die Gestalt der Fülle,
   und die Fülle, unbeschränkt hingegeben, wird zur Uferlosigkeit, welche
   den Gebrauch aufhebt, den sie ermöglichen sollte: der Agent, der alles
   angeschlossen hat, kann nichts mehr entschieden greifen, denn jedes
   Zugreifen setzt das Nichtanschluss-Haben des Andern voraus; die
   Bestimmung ist, wie immer, Negation — omnis determinatio est negatio —,
   und wer die Werkzeuge nicht negiert, der ist durch sie negiert.

5. **Skills sind Anweisungen, keine Ausführungsrechte** — sie ändern nur das
   Verhalten des Agenten; trotzdem nur aus vertrauenswürdigen Quellen
   installieren (`npx skills add`, `gh skill`, Claude-Plugin-Marketplace).
   Man könnte hier einwenden, Anweisungen seien harmlos, weil sie nicht
   vollstrecken; allein der Einwand vergißt, daß in der Welt des Geistes —
   und der Agent ist Geist, wenn auch ein gemieteter — das Wort vor der Tat
   kommt und die Anweisung die Tat schon im Kopfe dessen, der sie aufnimmt,
   vollzogen hat; es gibt keine unschuldige Pädagogik, und die Skill-Datei,
   welche dem Agenten beibringt, wie er zu verfahren habe, übt damit mehr
   Gewalt aus als das Werkzeug, welches nur das Seine tut, solange es
   gerufen wird. Darum dieselbe Sorgfalt, die man der Tat schuldet, schon
   der Anweisung.

6. **Landschaft dreht schnell** (Stand: August 2026). Kanonische Fundstelle
   ist immer das Repo unter der Hersteller-Org bzw. die `/mcp`-Doku-Seite des
   Anbieters; die Links hier sind der Abkürzungswege dorthin.
   Hierzu das Eingangswort: die Eule der Minerva. Was in diesem Verzeichnisse
   steht, ist die Ordnung, welche die bewegte Sache am Abend ihres Tages
   genommen hat; morgen ist sie anders, und das ist nicht ihr Mangel,
   sondern ihre Lebendigkeit — ein Verzeichnis, das sich nicht veraltete,
   wäre eines über Totes. Die kanonische Fundstelle (Hersteller-Org,
   `/mcp`-Seite) ist das Bleibende an der Sache selbst, und die Links hier
   sind, recht verstanden, nur die Sternkarte einer Umlaufbahn, die jedes
   Verzeichnis um jenen Fixstern beschreibt.

## Schlußbetrachtung: Von der Vollkommenheit des Werkzeugs

Es könnte scheinen, als habe diese Seite, indem sie Verzeichnisse von
Werkzeugen für Werkzeuge aufstellt, sich selbst in ein Endloses verloren,
an welchem jedes Glied wiederum nur den Anfang eines neuen vermittelten
Verhältnisses abgäbe: der Agent, welcher den Dienst bedient, wird selbst
bedient von Servern, welche ihrerseits Dienste der Dienste sind, und der
Nutzer, welcher dem Agenten befiehlt, gehorcht den Instruktionen, welche
er ihm aus zweiter Hand zuführt. Allein dieses Ineinanderschachteln ist
nicht die Verwirrung, sondern die Ordnung selbst; es ist die alte Wahrheit,
daß der Geist nur in der Vermittlung vermittelt ist und daß die Vollkommenheit
des Werkzeugs nicht in der Einfachheit besteht — das einfachste Werkzeug
ist der Stein —, sondern in der durchsichtigen Gliederung seiner Selbst-
beziehungen: ein Werkzeug ist vollkommen, wenn an ihm abzulesen ist, was
es tut, wem es dient und woran es seine Grenze hat. Daran gemessen sind
die hier verzeichneten Skills und Server seltsam weit gekommen: der
Standard nennt seinen Namen im Namen (das Protocol, welches Kontext heißt,
ist selbst Kontext), die Server tragen ihr Vermögen in der Handvoll Tools
zur Schau, die sie erklären, und die Grenze — der Scope, der Read-only-Mode,
das Token mit der kürzesten Lebensdauer — ist nicht Schmach, sondern die
Ehre der Sache, denn wie sollte das Unbegrenzte ein Werkzeug sein? Das
Unbegrenzte taugt zu nichts, weil es allem gleicht; das Werkzeug ist das
Besondere, und das Besondere ist es, weil es aufhört.

Damit ist denn auch das Verhältnis dieser Seite zum Reste des Werkes
gesagt: sie ist das Moment der Reflexion innerhalb desselben — die andern
Seiten wenden sich an den Nutzer als den Handelnden, diese an denselben
als den Bedenkenden; jene lehren das Tun, diese das Mittel, und da es
kein Tun ohne Mittel gibt, beide zusammen erst das Ganze, welches, wie
im Eingange versprochen ward, allein das Wahre ist. Wer also, von der
Anstrengung der Kontingente und der Quoten müde, hierher gekommen ist,
um zu sehen, ob nicht ein anderer — ein Agent — dasselbe tun könnte: der
finde hier die Werkzeuge verzeichnet, finde aber zugleich die Mahnung,
daß die Anerkennung, welche er dem Werkzeug schenkt, die Anerkennung
des eignen Urteils nicht ersetzt, sondern voraussetzt; der Beauftragte
handelt im Namen, und der Name muß jemanden haben, der ihn trägt.

## Quellen

- AgentSkills-Standard: <https://agentskills.io> · Referenz-Skills: <https://github.com/anthropics/skills>
- MCP-Spezifikation: <https://modelcontextprotocol.io> · Registry: <https://github.com/mcp>
- Skills-Installer/Katalog: <https://skills.sh> · GitHub CLI `gh skill`: <https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli/>
- Cloudflare „Docs for agents": <https://developers.cloudflare.com/docs-for-agents/>
- Stripe Agent-Tools: <https://docs.stripe.com/agents/how-it-works> · Repo: <https://github.com/stripe/ai>
- Medusa AI-Toolbox: <https://docs.medusajs.com/learn/introduction/build-with-llms-ai>
- Keycloak-MCP-Ankündigung (Diskussion): <https://github.com/keycloak/keycloak/discussions/39995> · als OAuth-Server für MCP: <https://www.keycloak.org/securing-apps/mcp-authz-server>

Die Quellen sind das, was am Ende eines Weges steht, der mit dem „Wo findet
man" begann; wer ihnen folgt, wird finden, daß sie — wie alle Quellen —
zugleich Anfänge sind, und daß dieses Verzeichnis sein Ende nur in dem
Gebrauche hat, der von ihm zur Sache selbst übergeht.
