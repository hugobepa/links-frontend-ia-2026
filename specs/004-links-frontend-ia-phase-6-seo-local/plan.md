# Links Frontend IA - Phase 6 Local SEO Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add local SEO foundations for the current ES/EN site without changing user-facing navigation or content behavior.

**Architecture:** Centralize page metadata generation so home, search, and category routes share consistent canonical and language signals. Add crawl/discovery outputs as Astro route files plus a small SEO helper, then wire them into the current page templates and verify that deduplicated tags and terms feed the generated outputs.

**Tech Stack:** Astro 6, TypeScript, Astro route files, sitemap integration, current JSON datasets, existing ES/EN route structure

---

## File Structure

### Source files to modify

- `astro.config.ts` - add sitemap integration and any SEO-related build configuration needed for local discovery output.
- `src/components/SEO.astro` - central SEO head helper for canonical, alternate language links, titles, and descriptions.
- `src/pages/index.astro` - consume the SEO helper and expose the home page metadata.
- `src/pages/buscador/index.astro` - expose search metadata without changing filtering behavior.
- `src/pages/categories/index.astro` - expose category listing metadata.
- `src/pages/categories/[slug].astro` - expose per-category canonical and metadata.
- `src/pages/en/index.astro` - mirror SEO metadata for the English home route.
- `src/pages/en/buscador/index.astro` - mirror SEO metadata for the English search route.
- `src/pages/en/categories/index.astro` - mirror SEO metadata for the English categories index.
- `src/pages/en/categories/[slug].astro` - mirror SEO metadata for the English category route.
- `src/lib/loaders.ts` - surface the dataset fields needed to build deduplicated SEO inputs if they are not already available.
- `src/lib/utils.ts` - add small helpers for canonical URL assembly and deduplication if needed.
- `preproyecto/proyecto_estructura.md` - record the phase 6 plan and implementation trace after completion.
- `resumen_proyecto.md` - keep the bilingual summary aligned with the SEO phase once implementation lands.

### SEO route files to create

- `src/pages/robots.txt.js` - local crawl directives.
- `src/pages/llms.txt.js` - IA-facing discovery guidance.
- `src/pages/sitemap-index.xml.js` - sitemap index that references the page and content sitemaps.
- `src/pages/sitemap-pages.xml.js` - static page sitemap.
- `src/pages/sitemap-links.xml.js` - dynamic content sitemap for categories and links.
- `pagefind.toml` - optional only if Pagefind remains part of the final local SEO strategy.

---

### Task 1: Lock the SEO baseline

**Files:**

- Modify: `src/pages/index.astro`
- Modify: `src/pages/buscador/index.astro`
- Modify: `src/pages/categories/index.astro`
- Modify: `src/pages/categories/[slug].astro`
- Modify: `src/pages/en/index.astro`
- Modify: `src/pages/en/buscador/index.astro`
- Modify: `src/pages/en/categories/index.astro`
- Modify: `src/pages/en/categories/[slug].astro`
- Create: `src/components/SEO.astro`

- [ ] **Step 1: Write the failing test**

Check the rendered page source for the home page and one category page and confirm that title, meta description, canonical, and alternate language links are missing or incomplete before the helper is wired in.

- [ ] **Step 2: Run the validation check**

Run: `bun run dev`

Open the local pages and inspect the head for missing or incomplete SEO tags.

- [ ] **Step 3: Write minimal implementation**

Create `src/components/SEO.astro` with props for `title`, `description`, `canonicalPath`, `lang`, `alternatePaths`, and `noIndex`, then use it in the home, search, and category pages.

- [ ] **Step 4: Run the validation check again**

Run: `bun run dev`

Expected: the inspected pages now expose consistent title, description, canonical, and alternate tags.

- [ ] **Step 5: Commit**

```bash
git add src/components/SEO.astro src/pages/index.astro src/pages/buscador/index.astro src/pages/categories/index.astro src/pages/categories/[slug].astro src/pages/en/index.astro src/pages/en/buscador/index.astro src/pages/en/categories/index.astro src/pages/en/categories/[slug].astro
git commit -m "feat(seo): add local metadata baseline"
```

---

### Task 2: Add crawl and discovery routes

**Files:**

- Create: `src/pages/robots.txt.js`
- Create: `src/pages/llms.txt.js`
- Create: `src/pages/sitemap-index.xml.js`
- Create: `src/pages/sitemap-pages.xml.js`
- Create: `src/pages/sitemap-links.xml.js`
- Modify: `astro.config.ts`

- [ ] **Step 1: Write the failing test**

Request `/robots.txt`, `/llms.txt`, and `/sitemap-index.xml` from the local server and confirm that they are not yet available.

- [ ] **Step 2: Run the validation check**

Run: `bun run dev`

Use the browser or `curl` to confirm the SEO route files are missing before implementation.

- [ ] **Step 3: Write minimal implementation**

Add Astro route files for robots, llms, and the sitemap family, and update `astro.config.ts` to register sitemap generation if the integration is required.

- [ ] **Step 4: Run the validation check again**

Run: `bun run dev`

Expected: the new SEO routes respond with valid text or XML and the sitemap index references the page and content sitemap endpoints.

- [ ] **Step 5: Commit**

```bash
git add astro.config.ts src/pages/robots.txt.js src/pages/llms.txt.js src/pages/sitemap-index.xml.js src/pages/sitemap-pages.xml.js src/pages/sitemap-links.xml.js
git commit -m "feat(seo): add crawl and sitemap routes"
```

---

### Task 3: Build deduplicated SEO inputs

**Files:**

- Modify: `src/lib/loaders.ts`
- Modify: `src/lib/utils.ts`
- Modify: `src/pages/sitemap-links.xml.js`
- Modify: `src/pages/llms.txt.js`

- [ ] **Step 1: Write the failing test**

Inspect the current dataset loading path and confirm that repeated tags, terms, or search index values are still visible in the raw source data.

- [ ] **Step 2: Run the validation check**

Run: `bun run dev`

Check that the current data loaders expose duplicate values before deduplication is added.

- [ ] **Step 3: Write minimal implementation**

Add a small normalization helper that lowercases, trims, and deduplicates tags and terms before they are serialized into sitemap and discovery outputs.

- [ ] **Step 4: Run the validation check again**

Run: `bun run dev`

Expected: sitemap and discovery outputs only include unique SEO terms while page content stays unchanged.

- [ ] **Step 5: Commit**

```bash
git add src/lib/loaders.ts src/lib/utils.ts src/pages/sitemap-links.xml.js src/pages/llms.txt.js
git commit -m "feat(seo): dedupe discovery inputs"
```

---

### Task 4: Verify SEO safety locally

**Files:**

- Modify: `preproyecto/proyecto_estructura.md`
- Modify: `resumen_proyecto.md`

- [ ] **Step 1: Write the failing test**

Check the local build and page source for regressions after the SEO files are in place.

- [ ] **Step 2: Run the validation check**

Run: `bun run build`

Expected: the build passes and no existing ES/EN route breaks.

- [ ] **Step 3: Write minimal implementation**

Record the SEO phase completion in the project summary and structure log once the build and local checks pass.

- [ ] **Step 4: Run the validation check again**

Run: `bun run build`

Expected: the build still passes after the documentation updates.

- [ ] **Step 5: Commit**

```bash
git add preproyecto/proyecto_estructura.md resumen_proyecto.md
git commit -m "docs(seo): record phase 6 local baseline"
```

---

## Validation Checklist

- Home, buscador, and category pages expose consistent metadata.
- ES/EN routes preserve canonical and alternate language signals.
- `robots.txt`, `llms.txt`, and sitemap routes resolve locally.
- Duplicate tags and terms are removed from SEO outputs.
- `bun run build` passes after the SEO phase changes.
- User-facing navigation, filters, and layout behavior remain unchanged.
