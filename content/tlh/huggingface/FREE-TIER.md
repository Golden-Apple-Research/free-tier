# Hugging Face Free Tier

> HF-platform — cha' parts: **Hub** (repos: models/datasets/spaces) — Huch Hutlh;
> **Free Spaces** (CPU/GPU-hosting) 'ej Hoch jar inference-Huch je tu'lu'.
> 2026-Daq — spaces-hosting — restrictions law', chenmoHlu'.

## Huch Hutlh scope

| area | nuq vaD 'oH? | nob |
|---|---|---|
| **[Hub](https://huggingface.co/docs/hub)** | Git-based platform — models, datasets, spaces; "GitHub for machine-learning" rur | public repos — limit Hutlh (models, datasets, spaces); private repos — fair-use quota |
| **Static Spaces** | spaces, compute Hutlh — static demos 'ej frontends vaD neH hosting | Hoch vaD — Huch Hutlh (frontend-hosting neH) |
| **[Spaces — CPU Basic](https://huggingface.co/docs/hub/spaces)** | container, Huch Hutlh (cha' vCPU / wa'maH jav GB RAM) — ML-demos (Gradio/Streamlit), pa'-Daq, web-app rur, qet | 2 vCPU / 16 GB RAM, $0 (environment: 2 CPU, 16 GB RAM, 50 GB ephemeral disk) |
| **[Spaces — ZeroGPU](https://huggingface.co/docs/hub/spaces-zerogpu)** | NVIDIA-GPUs, shared, time-quota — GPU-demos, GPU-costs-lIj Hutlh | Nvidia RTX Pro 6000 Blackwell (up to HutmaH jav GB VRAM), dynamic, **Huch Hutlh — quota je**; Free-accounts: up to cha' Gradio spaces, ZeroGPU-Daq |
| **[Inference Providers](https://huggingface.co/docs/inference-providers)** | uniform API — hosted models, partner-providers via (Together, Fireworks …), qem | **Huch $0.10 / Hoch jar** (Free User), $2 / Hoch jar, PRO (9 $ / Hoch jar) |

## 'ut rule (2025/2026-vo')

> **Gradio 'ej Docker spaces (compute ghajbogh) — creation chu' vaD Paid Plan 'ut**
> (PRO — private accounts; Team/Enterprise — orgs vaD). Grandfathered:
> Free-accounts — **up to cha' Gradio spaces, ZeroGPU-Daq**, qetlaH; Static
> spaces — Hoch vaD, Huch Hutlh, taH.

## Gotchas

1. Compute-spaces — **wejmaH chorgh rep, lo'be'lu'taHvIS, qaSpu'DI', mev**. Demo-links
   (applications/pitches vaD) — mevpa' yIqetqa'.
2. ZeroGPU-quota — **jaj/Hogh, poH-limited** (GPU-seconds-pool). PRO — quota law'
   chenmoH. Huch Hutlh — demos vaD yap; reH-load vaD Qapbe'.
3. inference-Huch $0.10 — rapid lo'chu'lu' ('op tlhobmey — models tIn). ghIq:
   Huch yIje' pagh provider-keys directly yIlo'.
4. Spaces-disk (vaghmaH GB) — **persistent 'oHbe'** — restart = De' QIH. Weights/outputs
   — space-storage pagh HF-datasets-Daq yIqon.
5. Private repos — storage-limits (fair-use); public repos — limit Hutlh.
   Model-weights — public yIhost — quota yIqan.

## Sources

- Pricing (spaces-hardware, PRO): <https://huggingface.co/pricing>
- Spaces overview (rules: Gradio/Docker/Static): <https://huggingface.co/docs/hub/spaces-overview>
- Inference-providers-pricing: <https://huggingface.co/docs/inference-providers/en/pricing>
