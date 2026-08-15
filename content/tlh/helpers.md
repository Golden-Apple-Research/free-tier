# Skills & MCP-Server — Official Agent-Skills & MCP-Server

> paq vam: services **'e' lo'meH** — not neH services-Daq legh. Nuq manufacturers
> official **Agent-Skills** (instruction-packages, [AgentSkills standard](https://agentskills.io)
> pabwI') nob — 'ej nuq manufacturers official **MCP-Servers**
> ([Model Context Protocol](https://modelcontextprotocol.io)) nob — nuqDaq tu'lu' je.
> Terranix, Medusa, Keycloak, Grafana, Trigger.dev — self-hosted services, Docs je.

## nuqDaq Skills 'ej MCP-Servers tu'lu'?

- **Agent-Skills** — folder: `SKILL.md` + resources, open
  [AgentSkills standard](https://agentskills.io) pab (wa'DIch Anthropic).
  Installer/catalogs:
  - [`npx skills add <owner>/<repo>`](https://skills.sh) — cross-agent installer 'ej catalog
  - [`anthropics/skills`](https://github.com/anthropics/skills) — reference collection
  - [`gh skill`](https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli/) — discover/install/publish, GitHub CLI lo'
  - GitHub Copilot — skills, repo Hoch-Daq tu'lu'bogh, qemlaH
    ([Docs](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills))
- **MCP-Servers** — cha' forms: **remote** (HTTPS-endpoint, OAuth-login, local process
  Hutlh) 'ej **local** (stdio, npx/uvx/Docker via MCP-client qIHlu'). Registry:
  [github.com/mcp](https://github.com/mcp) 'ej [mcp.directory](https://mcp.directory).

## Free-Tier services — paq vamvo'

| service | official Skills | official MCP-Server |
|---|---|---|
| [AWS](aws/FREE-TIER.md) | — | ✅ Suite **[awslabs/mcp](https://github.com/awslabs/mcp)** — servers law' (Essential/Core, Terraform, Docs, AI/ML, Data; overview: [awslabs.github.io/mcp](https://awslabs.github.io/mcp/)) |
| [Azure](azure/FREE-TIER.md) | — | ✅ **[microsoft/mcp](https://github.com/microsoft/mcp)** — "Azure MCP Server 2.0" (GA), Hoch tools, wa' server-Daq ([Docs](https://learn.microsoft.com/en-us/azure/developer/azure-mcp-server/); predecessor `Azure/azure-mcp` archived) |
| [GCP](gcp/FREE-TIER.md) | ✅ **[google/skills](https://github.com/google/skills)** (Google Cloud, GCS, Firebase 'ej latlh) | ✅ **[googleapis/gcloud-mcp](https://github.com/googleapis/gcloud-mcp)** + gcloud remote-MCP ([Docs](https://docs.cloud.google.com/mcp)); latlh: [Firebase MCP](https://firebase.google.com/docs/ai-assistance/mcp-server) (firebase-tools-Daq tu'lu') |
| [CircleCI](circle-ci/FREE-TIER.md) | — | ✅ **hosted MCP (Preview)** + MCP, CircleCI-CLI-Daq ([overview](https://circleci.com/docs/guides/toolkit/circleci-mcp-overview/); repo ngo' `CircleCI-Public/mcp-server-circleci` deprecated) |
| [Cloudflare](cloudflare/FREE-TIER.md) | ✅ **[cloudflare/skills](https://github.com/cloudflare/skills)** — wrangler, agents-sdk, durable-objects, … (`npx skills add https://github.com/cloudflare/skills`) | ✅ **[cloudflare/mcp-server-cloudflare](https://github.com/cloudflare/mcp-server-cloudflare)** + remote-server catalog — [docs.mcp.cloudflare.com](https://docs.mcp.cloudflare.com) (OAuth); yIghoS: ["Docs for agents"](https://developers.cloudflare.com/docs-for-agents/) |
| [CodeSandbox](codesandbox/FREE-TIER.md) | — | — official tu'lu'be'; SDK: [codesandbox/codesandbox-sdk](https://github.com/codesandbox/codesandbox-sdk) · community-MCP: [techlibs/codesandbox-mcp](https://github.com/techlibs/codesandbox-mcp) |
| [Grafana](grafana/FREE-TIER.md) | — | ✅ **[grafana/mcp-grafana](https://github.com/grafana/mcp-grafana)** — `uvx mcp-grafana`, brew/binary je ([Docs](https://grafana.com/docs/grafana/latest/developer-resources/mcp/)) |
| [Hugging Face](huggingface/FREE-TIER.md) | — | ✅ **[huggingface/hf-mcp-server](https://github.com/huggingface/hf-mcp-server)** + remote: [huggingface.co/mcp](https://huggingface.co/mcp) (OAuth) |
| [Modal](modal/FREE-TIER.md) | — | ✅ **[modal-labs/modal-mcp](https://github.com/modal-labs/modal-mcp)** (stdio, [entry](https://mcp.directory/servers/modal)) — 'ej reverse: [MCP-Server, Modal-Daq, qIHlu'laH](https://modal.com/docs/examples/mcp_server_stateless) |
| [Neon](neon/FREE-TIER.md) | — | ✅ **[neondatabase/mcp-server-neon](https://github.com/neondatabase/mcp-server-neon)** (npm `@neondatabase/mcp-server-neon`; setup-wizard `npx neon@latest init`, [Docs](https://neon.com/docs/ai/neon-mcp-server)) |
| [Netlify](netlify/FREE-TIER.md) | — | ✅ **[netlify/netlify-mcp](https://github.com/netlify/netlify-mcp)** + remote: `https://netlify-mcp.netlify.app/mcp` (OAuth; [Docs](https://docs.netlify.com/build/build-with-ai/netlify-mcp-server/)) |
| [Redis](redis/FREE-TIER.md) | — | ✅ **[redis/mcp-redis](https://github.com/redis/mcp-redis)** (data-server) + **[redis/mcp-redis-cloud](https://github.com/redis/mcp-redis-cloud)** (cloud-management; [Docs](https://redis.io/docs/latest/integrate/redis-mcp/)) |
| [Render](render/FREE-TIER.md) | — | ✅ **[render-oss/render-mcp-server](https://github.com/render-oss/render-mcp-server)** + remote: `https://mcp.render.com/mcp` ([Docs](https://render.com/docs/mcp-server)) |
| [Supabase](supabase/FREE-TIER.md) | — | ✅ **[supabase/mcp](https://github.com/supabase/mcp)** + remote: `https://mcp.supabase.com/mcp` (OAuth, `?project_ref=`/read-only scope-lu'laH; local `http://localhost:54321/mcp`; [Docs](https://supabase.com/docs/guides/ai-tools/mcp)) |
| [Trigger.dev](triggerdev/FREE-TIER.md) | — | ✅ official MCP, CLI-Daq: **`npx trigger.dev@latest mcp`** (setup-wizard; [Docs](https://trigger.dev/docs/mcp-introduction)) |
| [Vercel](vercel/FREE-TIER.md) | ✅ **[vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills)** | ✅ remote: `https://mcp.vercel.com` (OAuth; CLI-wizard `vercel mcp`, [Docs](https://vercel.com/docs/agent-resources/vercel-mcp)) |

## latlh services (examples 'ej example 4)

| service | official Skills | official MCP-Server |
|---|---|---|
| GitHub | central repo tu'lu'be' — Copilot skills qem, repo Hoch-Daq tu'lu'bogh; ra': [`gh skill`](https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli/) | ✅ **[github/github-mcp-server](https://github.com/github/github-mcp-server)** + remote: `https://api.githubcopilot.com/mcp/` ([Docs](https://docs.github.com/en/copilot/how-tos/provide-context/use-mcp-in-your-ide/set-up-the-github-mcp-server)) |
| Stripe | ✅ **Stripe Agent Skills** — [docs.stripe.com/skills](https://docs.stripe.com/skills), collection-repo [stripe/ai](https://github.com/stripe/ai) | ✅ remote: `https://mcp.stripe.com` (OAuth; [Docs](https://docs.stripe.com/mcp)) |
| Hetzner (Free-Tier tu'lu'be'!) | — | — official tu'lu'be'; community: [Xodus-CO/hcloud-mcp](https://github.com/Xodus-CO/hcloud-mcp), [mguttmann/the-real-hetzner-mcp](https://github.com/mguttmann/the-real-hetzner-mcp) |
| Terranix | — | — (build-time neH; Agent-Skills 'utbe', Docs yap, [Docs](https://terranix.org)) |
| MedusaJS | ✅ **[medusajs/medusa-agent-skills](https://github.com/medusajs/medusa-agent-skills)** — Claude-code-plugins (`npx skills add medusajs/medusa-agent-skills` — Cursor 'ej latlh; [Docs](https://docs.medusajs.com/learn/introduction/build-with-llms-ai/agentic-skills)) | ✅ remote (Docs-search): `https://docs.medusajs.com/mcp` ([Docs](https://docs.medusajs.com/learn/introduction/build-with-llms-ai/mcp-server)) |
| Keycloak | — | — official tu'lu'be'; community: [sshaaf/keycloak-mcp-server](https://github.com/sshaaf/keycloak-mcp-server), [paoloamato2/keycloak-mcp-server](https://github.com/paoloamato2/keycloak-mcp-server). Official latlh: Keycloak — OAuth-authorization-server, MCP-servers-lIj vaD ([Docs](https://www.keycloak.org/securing-apps/mcp-authz-server)) |

## Docs — self-hosted services

vagh vam — AWS/GCP/Azure je 'ach hardware-lIj-Daq qet — DaH primary Docs-links
(AWS/Azure/GCP-Docs: out of scope):

| service | Docs | self-host |
|---|---|---|
| Terranix | <https://terranix.org> (tutorial, options-reference, examples, repo-Daq) | Nix-module — build-Daq local qet |
| MedusaJS | <https://docs.medusajs.com> | ✅ Node, VPS-lIj-Daq (rur [examples/04-medusa-shop](https://github.com/Golden-Apple-Research/free-tier/examples/04-medusa-shop)) |
| Keycloak | <https://www.keycloak.org/docs> — Server Admin Guide + <https://www.keycloak.org/server/all-config> (Hoch options) | ✅ container/NixOS-service (example 4: `services.keycloak`) |
| Grafana (OSS) | <https://grafana.com/docs/grafana/latest/> — operate: <https://grafana.com/docs/grafana/latest/setup-grafana/> | ✅ OSS self-hosted; Cloud-Free-Tier je tu'lu' |
| Trigger.dev (self-hosted v4) | <https://trigger.dev/docs> | ✅ v4 self-hosted-laH (self-host Docs pa'Daq); latlh: Cloud (paq vam) |

## Gotchas

1. **"official"** — manufacturer-org-Daq ra'lu'. community-MCPs (CodeSandbox, Hetzner,
   Keycloak) — useful, 'ach credentialslIj luHevlaH. lo'pa' source-code yIlegh 'ej
   tokens — scope mach yIchenmoH.
2. **remote-MCP** — OAuth, browser-Daq. **local MCP-servers** — stdio,
   npx/uvx/Docker via client-Daq config-lu'. Remote-servers — nIteb choH
   (Render, Vercel, Supabase, Stripe …); local — npm/PyPI-pin pab.
3. Scope mach: Supabase — `?read_only`/`?project_ref=`; Grafana-MCP — laD-neH mode;
   Cloudflare-tokens — scope mach chenmoH ([cloudflare/README.md](cloudflare/README.md) yIlaD).
   MCP-server, rights qon ghajbogh — resources QIHlaH, Terraform rur.
4. Suites yIlo' — servers nIteb Hutlh: AWS/Microsoft/Google MCP-collections nob
   (awslabs/mcp, microsoft/mcp, googleapis/gcloud-mcp + gcloud-remote). Hoch yIlo'Qo' —
   servers, services lo'lu'bogh, neH yIlo'. Attack-surface mach, tool-noise mach.
5. Skills — instructions 'oH, execution-rights Hutlh — agent behavior neH chenmoH.
   'ach: install — trusted sources neHvo' (`npx skills add`, `gh skill`,
   Claude-plugin-marketplace).
6. Landscape rapid choH (August 2026). Canonical: manufacturer-org repo 'ej
   /mcp-Docs-page. Links vam — shortcuts pa'Daq neH.

## Sources

- AgentSkills standard: <https://agentskills.io> · reference-skills: <https://github.com/anthropics/skills>
- MCP-specification: <https://modelcontextprotocol.io> · registry: <https://github.com/mcp>
- Skills-installer/catalog: <https://skills.sh> · GitHub CLI `gh skill`: <https://github.blog/changelog/2026-04-16-manage-agent-skills-with-github-cli/>
- Cloudflare "Docs for agents": <https://developers.cloudflare.com/docs-for-agents/>
- Stripe agent-tools: <https://docs.stripe.com/agents/how-it-works> · repo: <https://github.com/stripe/ai>
- Medusa AI-toolbox: <https://docs.medusajs.com/learn/introduction/build-with-llms-ai>
- Keycloak-MCP-announcement (discussion): <https://github.com/keycloak/keycloak/discussions/39995> · as OAuth-server for MCP: <https://www.keycloak.org/securing-apps/mcp-authz-server>
