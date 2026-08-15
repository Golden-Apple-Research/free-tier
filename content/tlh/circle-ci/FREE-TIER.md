# CircleCI Free Plan

> Free-Plan-Daq CircleCI — wejnetlh Huch/Hoch jar nob. Build-minutes ~javSaD
> yap, Docker-executors mach-Daq. Executor-choice — nobmey law'qu', macOS je.

## Free Plan

| resource | nuq vaD 'oH? | value |
|---|---|---|
| **Huch** | Huchmey: job Hoch Huch lo' — resource-class pab (build-machine size) | 30,000 / jar |
| **Build-minutes** | rule-of-thumb: Huch → job-time neH (docker-class mach) | up to ~javSaD (Docker-resource-class mach) |
| **lo'wI'pu' active** | ghom-members, pipelines triggerlu'bogh pagh code contributelu'bogh | up to vagh / jar |
| **Concurrency** | jobs, wa' poH qaStaHvIS qetlaHbogh — law' = poH mach (pipeline) | wejmaH jobs, wa' poH qaStaHvIS |
| **[Executors](https://circleci.com/docs/)** | environments, jobs qetbogh pa'Daq: Docker-containers, Linux-VMs, ARM, Windows, macOS | Docker, Linux, **ARM, Windows, macOS**, self-hosted qetwI' |
| **[Self-Hosted qetwI'](https://circleci.com/docs/guides/execution-runner/runner-overview/)** | hardware-lIj — CI-executor; macOS-builds pagh internal networks, cloud-access Hutlhbogh, vaD | wa' tu'lu' |

Huch-usage — resource-class 'ej executor pab: Docker-jobs mach — Huch
mach; Linux-VMs tIn, Windows, macOS — Huch law', tup Hoch, lo'
(macOS — Huch law' qu').

## Gotchas

1. **"javSaD tup" — Docker-classes mach neH.** macOS pagh job tIn —
   Huch 30,000 QIH, poH 'op neH-Daq. READMEs/CircleCI-config reH
   `resource_class: small` yIlegh.
2. lo'wI'pu' active — vagh neH, Hoch jar, Free-Plan-Daq, yap; law' — tu'lu'be'
   (lo'wI'pu', active-be'bogh, qelbe'lu').
3. Huch lo'chu'pu'chugh — builds Hoch queue — jar chu' qaSpa'.
   wejmaH-concurrency-Daq — late leghlu'.
4. wejmaH jobs, wa' poH qaStaHvIS — nobmey law'qu'. Monorepos, workflows law' ghajbogh:
   Free-Plan-Daq poH mach — GitHub-Actions-Free-Daq poH law'.

## Sources

- Pricing: <https://circleci.com/pricing/>
- Plan Overview (Docs): <https://circleci.com/docs/guides/plans-pricing/plan-overview/>
