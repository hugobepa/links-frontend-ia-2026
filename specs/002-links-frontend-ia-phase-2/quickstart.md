# Quickstart: Links Frontend IA - Phase 2 Site Architecture

## Goal

Implement the site architecture with category pages, responsive layouts, and search. Integrate existing JSON data from `preproyecto/jsons-news-interficies/` and render using Astro dynamic routing.

## Inputs

- Phase 1 baseline: `resumen_proyecto.md`
- Existing JSON data: `preproyecto/jsons-news-interficies/{category}/**`
- Design guide: `preproyecto/pre-config-general/diseño/guia-diseno_no-ia_mayo2026.md`
- Constitution: `.specify/memory/constitution.md`

## Phase 2 Workflow

1. **Review Phase 1 data**: Verify 14 categories are documented in Phase 1.
2. **Inspect JSON structure**: Sample one category's JSON files to understand data format.
3. **Create data loader**: Implement TypeScript loaders to import JSON at build time.
4. **Build components**: Create reusable components (CategoryCard, LinkCard, LinkListItem, SearchBar).
5. **Implement routing**: Create `src/pages/categories/[...slug].astro` for dynamic category pages.
6. **Add search logic**: Implement client-side search filter with 3-character minimum.
7. **Responsive testing**: Test mobile-first (320px+), scale to desktop (1024px+).
8. **Path-length validation**: Run validation script before commits.
9. **Update navigation**: Add category links to main navigation and home page.
10. **Validate**: Confirm all 14 categories render; search works; layout is responsive.

## What Phase 2 Must Deliver

- ✅ 14 category pages accessible via `/categories/{category-slug}`
- ✅ Each category displays subcategories and links
- ✅ Desktop view: cards with all fields; icons for status/verified/noCreditCard
- ✅ Mobile view: simplified list; essential fields only
- ✅ Search bar: filters by name/description; 3-char minimum; real-time updates
- ✅ Responsive transitions: smooth layout change on viewport resize
- ✅ Navigation: menu or sidebar to browse categories
- ✅ Path-length validation: no GitHub conflicts
- ✅ Non-AI design: follows guia-diseno_no-ia_mayo2026.md

## What to Avoid

- Do not add i18n (deferred to Phase 3+)
- Do not implement backend search/APIs (client-side only)
- Do not modify JSON data structure (use as-is from preproyecto/)
- Do not push to remote until Phase 9

## Expected Result

A fully functional site with 14 category pages, responsive layout (mobile-first), working search, and integrated data. Ready for Phase 3 (UX design refinement) and Phase 4+ (additional features).

## Key Tasks (Summary)

- [x] Spec written
- [x] Plan created
- [ ] Research & data-model completed (this phase)
- [ ] Task checklist generated (next: `/speckit.tasks`)
- [ ] Implementation plan ready
