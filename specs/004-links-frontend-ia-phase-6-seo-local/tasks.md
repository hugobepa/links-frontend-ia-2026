# Tasks: Links Frontend IA - Phase 6 Local SEO

**Input**: Design documents from `/specs/004-links-frontend-ia-phase-6-seo-local/`
**Prerequisites**: plan.md (required), spec.md (required for user stories)

**Organization**: Tasks are grouped by implementation slice so SEO baseline, discovery routes, deduplication, and validation can be delivered independently.

## Format: `[ID] [P?] [Slice] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Slice]**: Which implementation slice the task belongs to
- Include exact file paths in descriptions

---

## Slice 1: SEO Baseline

**Goal**: Add consistent head metadata to the current ES/EN public pages.

**Independent Test**: Inspect the source for home, search, and category pages and confirm title, description, canonical, and alternate language links are present.

- [x] T601 [SEO-Baseline] Create `src/components/SEO.astro` with props for `title`, `description`, `canonicalPath`, `lang`, `alternatePaths`, and `noIndex`
- [x] T602 [P] [SEO-Baseline] Wire `src/components/SEO.astro` into `src/pages/index.astro`
- [x] T603 [P] [SEO-Baseline] Wire `src/components/SEO.astro` into `src/pages/buscador/index.astro`
- [x] T604 [P] [SEO-Baseline] Wire `src/components/SEO.astro` into `src/pages/categories/index.astro` and `src/pages/categories/[slug].astro`
- [x] T605 [P] [SEO-Baseline] Wire `src/components/SEO.astro` into `src/pages/en/index.astro`
- [x] T606 [P] [SEO-Baseline] Wire `src/components/SEO.astro` into `src/pages/en/buscador/index.astro`
- [x] T607 [P] [SEO-Baseline] Wire `src/components/SEO.astro` into `src/pages/en/categories/index.astro` and `src/pages/en/categories/[slug].astro`

---

## Slice 2: Crawl and Discovery Routes

**Goal**: Add local crawl instructions and sitemap outputs.

**Independent Test**: Visit `/robots.txt`, `/llms.txt`, and `/sitemap-index.xml` locally and verify valid responses.

- [x] T608 [SEO-Discovery] Update `astro.config.ts` to enable sitemap generation if required by the current Astro setup
- [x] T609 [SEO-Discovery] Create `src/pages/robots.txt.js` with crawl directives for the current public routes
- [x] T610 [SEO-Discovery] Create `src/pages/llms.txt.js` with a concise IA-oriented description of the site and route families
- [x] T611 [SEO-Discovery] Create `src/pages/sitemap-index.xml.js` referencing the page and content sitemap outputs
- [x] T612 [SEO-Discovery] Create `src/pages/sitemap-pages.xml.js` for static public pages
- [x] T613 [SEO-Discovery] Create `src/pages/sitemap-links.xml.js` for dynamic category, subcategory, and resource routes

---

## Slice 3: Deduplication and Normalization

**Goal**: Normalize tags, terms, and search signals before serializing SEO outputs.

**Independent Test**: Inspect sitemap and llms outputs to confirm repeated terms are collapsed and page content is unchanged.

- [x] T614 [P] [SEO-Normalization] Extend `src/lib/utils.ts` with small helpers for lowercase trimming, unique filtering, and canonical path assembly
- [x] T615 [SEO-Normalization] Update `src/lib/loaders.ts` so SEO outputs can consume deduplicated tags, terms, and search-index values
- [x] T616 [SEO-Normalization] Feed normalized data into `src/pages/sitemap-links.xml.js`
- [x] T617 [SEO-Normalization] Feed normalized data into `src/pages/llms.txt.js`

---

## Slice 4: Local Validation and Traceability

**Goal**: Verify the SEO phase locally and record it in project docs.

**Independent Test**: `bun run build` passes and the phase is recorded in the repo docs.

- [x] T618 [SEO-Validation] Run `bun run build` and confirm existing ES/EN routes still resolve
- [x] T619 [SEO-Validation] Check the rendered head for home, search, and category pages in the browser
- [x] T620 [SEO-Validation] Update `preproyecto/proyecto_estructura.md` with the phase 6 SEO local entry
- [x] T621 [SEO-Validation] Update `resumen_proyecto.md` with the phase 6 SEO local status and version bump

---

## Dependencies & Order

```text
Slice 1 (SEO Baseline):
  T601 → T602/T603/T604/T605/T606/T607

Slice 2 (Discovery):
  T608 → T609 → T610 → T611 → T612 → T613

Slice 3 (Normalization):
  T614 → T615 → T616 → T617

Slice 4 (Validation):
  T618 → T619 → T620 → T621
```

## Parallel Opportunities

- `T602`, `T603`, `T604`, `T605`, `T606`, `T607` can run in parallel after `T601`.
- `T609`, `T610`, `T611`, `T612`, `T613` can run in parallel after `T608` if route contracts are stable.
- `T614` can run in parallel with the discovery route implementation if the helper surface is kept small.
