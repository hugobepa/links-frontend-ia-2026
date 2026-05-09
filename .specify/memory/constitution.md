# Links Frontend IA 2026 Constitution

## Core Principles

### I. Phase Order Is Mandatory

All work follows the declared sequence and hierarchy in `preproyecto/2.creacion_proyecto.md`. No skipping, no reordering, no parallel execution of future phases.

### II. Local-First Delivery

Development is strictly local until phase 9. No remote pushes, no GitHub Pages setup, and no cloud deployment before local validation gates are met.

### III. Data and Naming Integrity

Category structures, JSON/TS contracts, and naming conventions must remain consistent across folders and files, maximizing descriptiveness while preventing path-length issues in Git and GitHub.

### IV. Quality Gates Per Subphase

Each subphase requires runnable local verification (`bun run dev` or `preview`) and functional checks for navigation, search, tags, responsive behavior, and critical UI flows.

### V. Living Documentation and Traceability

After each relevant change, project tracking artifacts must be updated (`preproyecto/proyecto_estructura.md` and later `resumen_datos.md`/`resumen_proyecto.md`) with concise, technical, bilingual records.

## Technical and Product Constraints

- Primary stack: Astro + TypeScript + Tailwind + shadcn/ui, mobile-first and responsive.
- UX scope: category/subcategory navigation, searchable resources, tag filtering, web table vs mobile list views.
- SEO scope: technical SEO plus AI-oriented discoverability using tags, categories, subcategories, and terms.
- Design scope: non-generic UI aligned with project design guides under `preproyecto/pre-config-general/diseño`.
- Build checks (`bun run build`) are reserved for critical phases and explicit checkpoints.

## Workflow and Quality Gates

- Speckit command flow is normative: `/speckit.constitution` -> `/speckit.specify` -> `/speckit.clarify` (optional) -> `/speckit.plan` -> `/speckit.tasks` -> `/speckit.analyze` (optional) -> `/speckit.implement`.
- Feature scope must be confirmed before each major step.
- One branch per phase in local git workflow, with deterministic commit naming convention.
- No destructive git operations without explicit user approval.
- All generated outputs must preserve maintainability, low technical debt, and clear structure.

## Governance

- This constitution overrides ad hoc decisions for this repository.
- Any amendment requires explicit user approval and a changelog entry.
- All reviews and planning artifacts must validate compliance with these principles.
- If a conflict appears between speed and quality, quality and traceability take precedence.

**Version**: 1.0.0 | **Ratified**: 2026-05-09 | **Last Amended**: 2026-05-09
