# Skills & MCP Servers — Official Agent Skills & MCP Servers

> A reference chart fer workin' **with** rather than only **on** the services
> in this here repo: which makers publish official **agent skills**
> (instruction packets followin' the [AgentSkills standard](https://agentskills.io))
> an' which official **MCP servers** ([Model Context
> Protocol](https://modelcontextprotocol.io)) be out there — plus where to find
> 'em. And then the docs o' the self-hostable services (Terranix, Medusa,
> Keycloak, Grafana, Trigger.dev) — the ones ye can run on yer own ship,
> should the fancy strike ye. Rrr, that's what we pirates like — teach yer
> agent crew the trade, an' let the machines talk to each other in secret
> whispers. Skills be the trainin' o' yer powder monkeys; MCP servers be
> the parrots what carry whispers from ship to ship without a shot fired.
> Me own parrot learned `npx skills add` before it learned "pieces o'
> eight" — an' now it drafts Terraform plans while I nap in the hammock.
> Smart bird. Worth every doubloon I didn't pay fer it.

## Where in the Seven Seas do ye find Skills & MCP Servers?

- **Agent skills** be folders with `SKILL.md` + resources followin' the open
  [AgentSkills standard](https://agentskills.io) (originally from Anthropic).
  Installers/catalogs:
  - [`npx skills add <owner>/<repo>`](https://skills.sh) — cross-agent installer & catalog
  - [`anthropics/skills`](https://github.com/anthropics/skills) — reference collection
  - [`gh skill`](https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli/) — discover/install/publish via the GitHub CLI
  - GitHub Copilot loads skills from any repo
    ([docs](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills))
- **MCP servers** come in two builds: **remote** (HTTPS endpoint with
  OAuth login, no local process) an' **local** (stdio, started via
  `npx`/`uvx`/Docker by the MCP client). Registry overview:
  [github.com/mcp](https://github.com/mcp) or [mcp.directory](https://mcp.directory).

## Free-Tier Services from this here Repo

| Service | Official Skills | Official MCP Server |
|---|---|---|
| [AWS](aws/FREE-TIER.md) | — | ✅ Suite **[awslabs/mcp](https://github.com/awslabs/mcp)** — dozens o' servers (Essential/Core, Terraform, Docs, AI/ML, Data; overview: [awslabs.github.io/mcp](https://awslabs.github.io/mcp/)) |
| [Azure](azure/FREE-TIER.md) | — | ✅ **[microsoft/mcp](https://github.com/microsoft/mcp)** — "Azure MCP Server 2.0" (GA), all tools in one server ([docs](https://learn.microsoft.com/en-us/azure/developer/azure-mcp-server/); predecessor `Azure/azure-mcp` be archived) |
| [GCP](gcp/FREE-TIER.md) | ✅ **[google/skills](https://github.com/google/skills)** (among others Google Cloud, GCS, Firebase) | ✅ **[googleapis/gcloud-mcp](https://github.com/googleapis/gcloud-mcp)** + gcloud remote MCP ([docs](https://docs.cloud.google.com/mcp)); separate: [Firebase MCP](https://firebase.google.com/docs/ai-assistance/mcp-server) (built into firebase-tools) |
| [CircleCI](circle-ci/FREE-TIER.md) | — | ✅ **hosted MCP (preview)** + MCP in the CircleCI CLI ([overview](https://circleci.com/docs/guides/toolkit/circleci-mcp-overview/); old repo `CircleCI-Public/mcp-server-circleci` be deprecated) |
| [Cloudflare](cloudflare/FREE-TIER.md) | ✅ **[cloudflare/skills](https://github.com/cloudflare/skills)** — wrangler, agents-sdk, durable-objects, … (`npx skills add https://github.com/cloudflare/skills`) | ✅ **[cloudflare/mcp-server-cloudflare](https://github.com/cloudflare/mcp-server-cloudflare)** + remote server catalog under [docs.mcp.cloudflare.com](https://docs.mcp.cloudflare.com) (OAuth); gettin' started: ["Docs for agents"](https://developers.cloudflare.com/docs-for-agents/) |
| [CodeSandbox](codesandbox/FREE-TIER.md) | — | — official; SDK: [codesandbox/codesandbox-sdk](https://github.com/codesandbox/codesandbox-sdk) · Community MCP: [techlibs/codesandbox-mcp](https://github.com/techlibs/codesandbox-mcp) |
| [Grafana](grafana/FREE-TIER.md) | — | ✅ **[grafana/mcp-grafana](https://github.com/grafana/mcp-grafana)** — `uvx mcp-grafana`, also brew/binary ([docs](https://grafana.com/docs/grafana/latest/developer-resources/mcp/)) |
| [Hugging Face](huggingface/FREE-TIER.md) | — | ✅ **[huggingface/hf-mcp-server](https://github.com/huggingface/hf-mcp-server)** + remote: [huggingface.co/mcp](https://huggingface.co/mcp) (OAuth) |
| [Modal](modal/FREE-TIER.md) | — | ✅ **[modal-labs/modal-mcp](https://github.com/modal-labs/modal-mcp)** (stdio, [entry](https://mcp.directory/servers/modal)) — an' the other way round: [deploying MCP servers on Modal](https://modal.com/docs/examples/mcp_server_stateless) |
| [Neon](neon/FREE-TIER.md) | — | ✅ **[neondatabase/mcp-server-neon](https://github.com/neondatabase/mcp-server-neon)** (npm `@neondatabase/mcp-server-neon`; setup wizard `npx neon@latest init`, [docs](https://neon.com/docs/ai/neon-mcp-server)) |
| [Netlify](netlify/FREE-TIER.md) | — | ✅ **[netlify/netlify-mcp](https://github.com/netlify/netlify-mcp)** + remote: `https://netlify-mcp.netlify.app/mcp` (OAuth; [docs](https://docs.netlify.com/build/build-with-ai/netlify-mcp-server/)) |
| [Redis](redis/FREE-TIER.md) | — | ✅ **[redis/mcp-redis](https://github.com/redis/mcp-redis)** (data server) + **[redis/mcp-redis-cloud](https://github.com/redis/mcp-redis-cloud)** (cloud management; [docs](https://redis.io/docs/latest/integrate/redis-mcp/)) |
| [Render](render/FREE-TIER.md) | — | ✅ **[render-oss/render-mcp-server](https://github.com/render-oss/render-mcp-server)** + remote: `https://mcp.render.com/mcp` ([docs](https://render.com/docs/mcp-server)) |
| [Supabase](supabase/FREE-TIER.md) | — | ✅ **[supabase/mcp](https://github.com/supabase/mcp)** + remote: `https://mcp.supabase.com/mcp` (OAuth, scoped per `?project_ref=`/read-only; local `http://localhost:54321/mcp`; [docs](https://supabase.com/docs/guides/ai-tools/mcp)) |
| [Trigger.dev](triggerdev/FREE-TIER.md) | — | ✅ official MCP in the CLI: **`npx trigger.dev@latest mcp`** (setup wizard; [docs](https://trigger.dev/docs/mcp-introduction)) |
| [Vercel](vercel/FREE-TIER.md) | ✅ **[vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills)** | ✅ Remote: `https://mcp.vercel.com` (OAuth; CLI wizard `vercel mcp`, [docs](https://vercel.com/docs/agent-resources/vercel-mcp)) |

## Supplementary Services (from the examples & Example 4)

The friendly allies o' the free fleet — not in the main table, but worth
knowin' on any voyage:

| Service | Official Skills | Official MCP Server |
|---|---|---|
| GitHub | no central repo o' its own — Copilot loads skills from any repo, managed via [`gh skill`](https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli/) | ✅ **[github/github-mcp-server](https://github.com/github/github-mcp-server)** + remote: `https://api.githubcopilot.com/mcp/` ([docs](https://docs.github.com/en/copilot/how-tos/provide-context/use-mcp-in-your-ide/set-up-the-github-mcp-server)) |
| Stripe | ✅ **Stripe Agent Skills** — [docs.stripe.com/skills](https://docs.stripe.com/skills), collection repo [stripe/ai](https://github.com/stripe/ai) | ✅ Remote: `https://mcp.stripe.com` (OAuth; [docs](https://docs.stripe.com/mcp)) |
| Hetzner (no free tier!) | — | — official; community: [Xodus-CO/hcloud-mcp](https://github.com/Xodus-CO/hcloud-mcp), [mguttmann/the-real-hetzner-mcp](https://github.com/mguttmann/the-real-hetzner-mcp) |
| Terranix | — | — (pure build-time; agent skills unnecessary, [docs](https://terranix.org) be enough) |
| MedusaJS | ✅ **[medusajs/medusa-agent-skills](https://github.com/medusajs/medusa-agent-skills)** — Claude Code plugins (`npx skills add medusajs/medusa-agent-skills` fer Cursor & co.; [docs](https://docs.medusajs.com/learn/introduction/build-with-llms-ai/agentic-skills)) | ✅ Remote (docs search): `https://docs.medusajs.com/mcp` ([docs](https://docs.medusajs.com/learn/introduction/build-with-llms-ai/mcp-server)) |
| Keycloak | — | — official; community: [sshaaf/keycloak-mcp-server](https://github.com/sshaaf/keycloak-mcp-server), [paoloamato2/keycloak-mcp-server](https://github.com/paoloamato2/keycloak-mcp-server). Officially instead: Keycloak as an **OAuth authorization server fer yer own MCP servers** ([docs](https://www.keycloak.org/securing-apps/mcp-authz-server)) |

## Docs of the Self-Hostable Services

These five run (unlike AWS/GCP/Azure) on yer own hardware —
so here be the primary doc links (AWS/Azure/GCP docs are out of scope).
No harbor toll, no harbormaster — the dock be all yer own. Sailin' under
yer own flag, answerin' to no Crown: 'tis the buccaneer's dream, an' these
five be the ships what make it true.

| Service | Docs | Self-host |
|---|---|---|
| Terranix | <https://terranix.org> (tutorial, options reference, examples in the repo) | Nix module — runs local anyway when building |
| MedusaJS | <https://docs.medusajs.com> | ✅ Node on yer own VPS (as in [examples/04-medusa-shop](https://github.com/Golden-Apple-Research/free-tier/examples/04-medusa-shop)) |
| Keycloak | <https://www.keycloak.org/docs> — Server Admin Guide + <https://www.keycloak.org/server/all-config> (all options) | ✅ as a container/NixOS service (Example 4: `services.keycloak`) |
| Grafana (OSS) | <https://grafana.com/docs/grafana/latest/> — operating: <https://grafana.com/docs/grafana/latest/setup-grafana/> | ✅ OSS be self-hosted; Cloud free tier additionally possible |
| Trigger.dev (self-hosted v4) | <https://trigger.dev/docs> | ✅ v4 can be self-hosted (self-hosting docs there); otherwise cloud (in this repo) |

## Gotchas

> *Old salt's tale:* Long John Silver once installed a community MCP from
> a repo what smelled o' bilge water, handed it his master key, an' went
> ashore fer rum. Came back to a ransacked hold an' a daemon singin' sea
> shanties in his production database. He laughed, forgave the scallywag,
> an' pinned the version. The leg, though — the leg were not so lucky.
> Scope yer tokens, ye daft buccaneer.

1. **"Official" means: maintained under the maker's org.** Community MCPs
   (CodeSandbox, Hetzner, Keycloak) be handy, but they get yer credentials —
   skim the source code before usin' 'em an' scope yer tokens to the minimum.
   A friendly stranger's spyglass still be a spyglass — peer through the
   glass before ye invite him aboard. That's not what you expected, eh?
   Aye, community tools be grand — but they see yer secrets too.
2. **Remote MCP = OAuth in the browser**, local MCP servers = stdio via
   `npx`/`uvx`/Docker configured in the client. Remote servers update
   themselves (Render, Vercel, Supabase, Stripe …), local ones per npm/PyPI pin.
3. **Keep the scope small:** Supabase via `?read_only`/`?project_ref=`,
   the Grafana MCP has a read-only mode, Cloudflare tokens created scoped (see
   [cloudflare/README.md](cloudflare/README.md)) — an MCP server with write
   rights can wreck resources, just like Terraform. Dead men tell no tales,
   but they also don't destroy yer database.
4. **Suites instead of single servers:** AWS/Microsoft/Google deliver MCP
   *collections* (awslabs/mcp, microsoft/mcp, googleapis/gcloud-mcp + gcloud remote). Don't
   hook up everything — only the servers fer the services ye actually use —
   less attack surface, less tool noise in the agent. A whole armory o'
   cannons be grand, but ye only need the ones ye'll fire.
5. **Skills be instructions, not execution rights** — they only change the
   behavior o' the agent; still, only install from trustworthy sources
   (`npx skills add`, `gh skill`, Claude plugin marketplace).
6. **The landscape turns fast** (as of: August 2026). The canonical place to
   find things be always the repo under the maker's org or the vendor's
   `/mcp` docs page; the links here be the shortcut paths to there. The seas
   shift an' the charts age — when a link smells stale, sail to the source
   harbor an' ask the harbormaster.

## Sources

- AgentSkills standard: <https://agentskills.io> · reference skills: <https://github.com/anthropics/skills>
- MCP specification: <https://modelcontextprotocol.io> · registry: <https://github.com/mcp>
- Skills installer/catalog: <https://skills.sh> · GitHub CLI `gh skill`: <https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli/>
- Cloudflare "Docs for agents": <https://developers.cloudflare.com/docs-for-agents/>
- Stripe agent tools: <https://docs.stripe.com/agents/how-it-works> · repo: <https://github.com/stripe/ai>
- Medusa AI toolbox: <https://docs.medusajs.com/learn/introduction/build-with-llms-ai>
- Keycloak MCP announcement (discussion): <https://github.com/keycloak/keycloak/discussions/39995> · as OAuth server fer MCP: <https://www.keycloak.org/securing-apps/mcp-authz-server>
