# Feature Specification: Links Frontend IA - Phase 6 Local SEO

**Feature Branch**: `004-links-frontend-ia-phase-6-seo-local`  
**Created**: 10/05/2026  
**Status**: Draft  
**Input**: User description: "Fase 6: seo en local. Revisar el estado actual del sitio, adaptar la orden Speckit a la fase real del repo y preparar la base SEO local para home, buscador, categorias, subcategorias y rutas EN/ES sin romper lo existente."

---

## User Scenarios & Testing _(mandatory)_

### User Story 1 - Local SEO Baseline (Priority: P1)

As a maintainer, I want every public page to have consistent metadata and crawl instructions so that the site can be indexed correctly in local validation before any future remote publishing step.

**Why this priority**: Core SEO signals must exist before optional enhancements; without them, the site remains hard to discover and validate.

**Independent Test**: Inspect page source for the home page, a category page, and the search page; verify title, description, canonical, and language alternates are present and point to the correct URL.

**Acceptance Scenarios**:

1. **Given** the home page, **When** I inspect the head, **Then** it includes a unique title, description, canonical URL, and the correct ES/EN alternates.
2. **Given** a category or subcategory page, **When** search engines crawl it, **Then** the page exposes stable metadata without duplicate canonical targets.
3. **Given** the search page, **When** crawled locally, **Then** it remains discoverable while preserving the existing filtering UI.

---

### User Story 2 - IA and Search Discoverability (Priority: P1)

As a user or crawler, I want categories, subcategories, tags, and search terms to be represented in a machine-readable way so that the content is easier to understand and surface.

**Why this priority**: The project is a curated links directory, so discoverability depends on structured content signals, not only visual navigation.

**Independent Test**: Verify that sitemap and text-based discovery files reference the live routes and that duplicate search/index terms are removed from generated outputs.

**Acceptance Scenarios**:

1. **Given** the generated sitemap set, **When** I review the files, **Then** it covers static pages and dynamic category routes.
2. **Given** the content datasets, **When** SEO artifacts are generated, **Then** duplicate terms and repeated index entries are collapsed.
3. **Given** the IA-facing discovery files, **When** they are opened directly, **Then** they describe the site clearly for search systems and assistants.

---

### User Story 3 - Crawl-Safe Validation (Priority: P2)

As a maintainer, I want SEO changes to stay compatible with the current local site so that the phase does not introduce broken routes, invalid assets, or build regressions.

**Why this priority**: SEO work must remain safe and reversible while the site is still evolving locally.

**Independent Test**: Run the local build and verify that the current routes still resolve, the sitemap is generated, and no SEO asset conflicts are introduced.

**Acceptance Scenarios**:

1. **Given** the current Astro project, **When** SEO files are added, **Then** existing pages still render and the build remains green.
2. **Given** the search and category routes, **When** validation runs, **Then** the SEO layer does not alter the user-facing behavior.
3. **Given** optional discovery tooling such as Pagefind, **When** it is enabled, **Then** it stays behind local validation and does not replace core metadata.

---

### Edge Cases

- The site already uses ES and EN route families; SEO must respect the current route structure rather than invent a new one.
- Existing data may contain repeated tags or terms; SEO outputs must deduplicate them before exposure.
- Some pages may have sparse content; they still need canonical and robots guidance even if their text footprint is small.
- If Pagefind is not retained, the phase still succeeds with sitemap, robots, llms, and metadata coverage.

---

## Requirements _(mandatory)_

### Functional Requirements

- **FR-001**: The system MUST provide consistent page metadata for home, search, category, and subcategory pages.
- **FR-002**: The system MUST include canonical URLs and alternate language links for the existing ES/EN route families.
- **FR-003**: The system MUST expose crawl instructions through `robots.txt` and IA-oriented discovery guidance through `llms.txt`.
- **FR-004**: The system MUST generate a sitemap set that covers static pages and dynamic category routes.
- **FR-005**: The system MUST extract SEO-relevant signals from the current datasets, including categories, subcategories, tags, search terms, and slugs.
- **FR-006**: The system MUST remove duplicate terms and repeated index entries before generating SEO outputs.
- **FR-007**: The system MUST preserve current user-facing behavior on the home page, categories, subcategories, and `/buscador`.
- **FR-008**: The system MUST keep SEO changes local-first and build-safe until the project reaches its later release phases.
- **FR-009**: The system SHOULD support optional Pagefind-style discovery only if it improves local indexing without adding instability.

### Key Entities _(include if data is involved)_

- **SEOProfile**: Metadata, canonical links, alternates, and crawl directives for each public page.
- **DiscoveryIndex**: Sitemap entries and IA-facing text references derived from the current content sets.
- **RouteGroup**: The existing ES/EN route families for home, search, and categories.
- **DeduplicatedTerms**: Normalized tags, terms, and search keys used to avoid repeated index output.

---

## Success Criteria _(mandatory)_

### Measurable Outcomes

- **SC-001**: Home, search, and category pages expose the required metadata in local page source checks.
- **SC-002**: The sitemap output covers the active public route set without duplicate route entries.
- **SC-003**: Duplicate SEO terms are removed from generated outputs before they are published locally.
- **SC-004**: The local build completes successfully after SEO files are added.
- **SC-005**: User-facing navigation and filtering behavior remain unchanged after the SEO phase.

## Assumptions

- The project keeps its current ES/EN route structure.
- SEO is implemented locally first, with no remote deployment dependency in this phase.
- Existing content remains the source of truth for titles, descriptions, tags, and terms.
- Optional discovery tooling is evaluated only after the metadata and sitemap baseline is stable.
