# Figures Index

Each file is a standalone `\begin{figure}...\end{figure}` block.
Include via `\input{figures/fig-NAME.tex}` in the corresponding chapter.

## Chapter 1 — Анализ предметной области

| File | Label | Where to insert |
|------|-------|-----------------|
| fig-custdev-bars.tex | fig:custdev-bars | After §1.1.3 (CustDev results) |
| fig-tam-sam-som.tex | fig:tam-sam-som | After §1.1.5 (TAM/SAM/SOM text) |
| fig-competitor-radar.tex | fig:competitor-radar | After table 1.1 (competitor matrix) |
| fig-positioning-map.tex | fig:positioning-map | After §1.2.4 (positioning discussion) |

## Chapter 2 — Эксперименты и технологии

| File | Label | Where to insert |
|------|-------|-----------------|
| fig-bloom-by-category.tex | fig:bloom-by-category | After table 2.4 (B2 results) |
| fig-bloom-levels.tex | fig:bloom-levels | After fig:bloom-by-category |
| fig-generation-time.tex | fig:generation-time | After B2 time discussion |
| fig-tech-stack-flow.tex | fig:tech-stack-flow | After §2.2.3 (MVP component chain) |

## Chapter 3 — Техническая реализация

| File | Label | Where to insert |
|------|-------|-----------------|
| fig-agent-graph.tex | fig:agent-graph | In §3.2.1 (StateGraph description) |
| fig-ingestion-pipeline.tex | fig:ingestion-pipeline | In §3.3.1 (Document Ingestion) |
| fig-course-sequence.tex | fig:course-sequence | In §3.3.2 (Course generation flow) |
| fig-actualization-cycle.tex | fig:actualization-cycle | In §3.3.4 (Auto-actualization) |

## Chapter 4 — Валидация и бизнес

| File | Label | Where to insert |
|------|-------|-----------------|
| fig-b2-vs-target.tex | fig:b2-vs-target | In §4.3.1 (results summary) |
| fig-unit-economics-waterfall.tex | fig:unit-economics | In §4.4.1 (unit economics) |
| fig-financial-forecast.tex | fig:financial-forecast | In §4.4.3 (financial model) |
| fig-risk-matrix.tex | fig:risk-matrix | After table 4.x (risk matrix) |
| fig-roadmap.tex | fig:roadmap | In §4.4.6 (roadmap section) |

## Editing tips

- Each figure is self-contained — edit colors/data in the file directly
- `fig-agent-graph-c4.puml` is the PlantUML/C4 source for `fig-agent-graph-c4.png`;
  regenerate the PNG after changing the source.
- pgfplots data is inline (no external CSV) for portability
- To change colors globally, search for `fill=` and `draw=` patterns
- Compile with XeLaTeX (required for Times New Roman + tikz)
