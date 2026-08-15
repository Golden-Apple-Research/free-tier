# Hugging Face Free Tier

> The HF platform be two-part: the **Hub** (repos fer models/datasets/
> spaces) be free, plus **Free Spaces** (CPU/GPU hosting) an' monthly
> inference credits. 2026 brought important tightenings fer hosting spaces.
> That's not what you expected, eh? Aye, even the free seas shift their
> currents — an' the harbor master o' Spaces tightened the moorin' rules.

## Free Scope

The free bounty o' the machine-learning fleet:

| Area | What's it fer? | Quota |
|---|---|---|
| **[Hub](https://huggingface.co/docs/hub)** | Git-based platform fer models, datasets an' spaces — "GitHub fer machine learning". The great library o' learned ships, models an' maps | unlimited public repos (models, datasets, spaces); private repos with fair-use quota |
| **Static Spaces** | Spaces without compute — pure hosting fer static demos an' frontends. The figureheads — free to carve an' display | free fer everyone (pure frontend hosting) |
| **[Spaces — CPU Basic](https://huggingface.co/docs/hub/spaces)** | Free container (2 vCPU / 16 GB RAM) where ML demos (Gradio/Streamlit) run as web apps. A free sloop with a full deck fer yer demos | 2 vCPU / 16 GB RAM, $0 (environment generally: 2 CPU, 16 GB RAM, 50 GB ephemeral disk) |
| **[Spaces — ZeroGPU](https://huggingface.co/docs/hub/spaces-zerogpu)** | Shared NVIDIA GPUs with a time quota — GPU demos without yer own GPU costs. The communal cannon deck — shared, timed, an' free | Nvidia RTX Pro 6000 Blackwell (up to 96 GB VRAM), dynamic, **free with quota**; free accounts: up to 2 Gradio spaces on ZeroGPU |
| **[Inference Providers](https://huggingface.co/docs/inference-providers)** | Unified API to call hosted models via partner providers (Together, Fireworks …). The harbor brokers — call any model through one gangplank | **$0.10 credits/month** (free user), $2/month with PRO ($9/month) |

## Important Rule Since ~2025/2026

> **Gradio an' Docker spaces (everything with compute) require a paid plan
> fer new creation** (PRO fer private accounts, Team/Enterprise fer orgs).
> Grandfathering: free accounts may keep running **up to 2 Gradio spaces on
> ZeroGPU**; Static Spaces stay free fer everyone. The free compute slips be
> reserved fer the old berths — new ones demand the paid harbor.

## Gotchas

> *Old salt's tale:* the free fleet here once sailed wider waters — then
> came the tightenings o' 2026, an' the harbormaster moved the free moorin's
> to the outer quay. Old salts grumbled, shook their peg legs at the sky,
> an' adjusted course — as freebooters always have. Two ZeroGPU berths an'
> a grand public library still fly the free flag, an' a wise crew makes
> port there. The seas shift, matey; so does a pirate.

1. Spaces sleep after **48 h inactivity** (compute spaces) — wake demo links
   fer applications/pitches beforehand. The crew goes ashore after two
   quiet days — rouse 'em before the interviewers knock on the gangplank.
2. The ZeroGPU quota be **time-limited per day/week** (GPU-seconds pool) —
   PRO raises the quota significantly; Free suffices fer demos, not fer
   continuous load. The shared cannons be rationed by the hourglass — free
   fer a demo volley, not fer a siege.
3. The $0.10 inference credits be spent quickly (~a few requests o' large
   models); afterwards buy credits or use provider keys directly. Ten cents
   o' model calls vanish like a doubloon tossed in the sea — a few grand
   questions, an' the purse be empty.
4. Disk in spaces (50 GB) be **not persistent** — restart = data loss;
   write weights/outputs into the space storage or HF datasets. The chalk
   deck be wiped at every relaunch — stow the heavy cargo in the datasets
   hold. That's not what you expected, eh? Aye, the free disk be but a
   rumor — gone by morning.
5. Private repos have storage limits (fair use); public ones be unlimited —
   host model weights publicly to save quota. And ye bloody landrat really
   thought ye had to pay fer it? Nay — the public seas be wide an' free.
   Rrr, that's what we pirates like — hoist the weights to the open deck,
   an' the private hold stays roomy.

## Sources

- Pricing (space hardware, PRO): <https://huggingface.co/pricing>
- Spaces overview (rules fer Gradio/Docker/Static): <https://huggingface.co/docs/hub/spaces-overview>
- Inference providers pricing: <https://huggingface.co/docs/inference-providers/en/pricing>
