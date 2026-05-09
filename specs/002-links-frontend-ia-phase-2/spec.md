# Feature Specification: Links Frontend IA - Phase 2 Site Architecture

**Feature Branch**: `002-links-frontend-ia-phase-2`  
**Created**: 09/05/2026  
**Status**: Draft  
**Input**: From `preproyecto/2.creacion_proyecto.md`: Crear categorías como páginas navegables, subcategorías dentro de cada página, links en cards (web) / listas (móvil), búsqueda mínimo 3 caracteres, estructura JSON/TS con validación de path-length para GitHub.

---

## User Scenarios & Testing _(mandatory)_

### User Story 1 - Category-Based Navigation (Priority: P1)

As a user, I want to browse programming resources by category so that I can find relevant links organized by topic (frontend, databases, APIs, etc.).

**Why this priority**: Core navigation structure must be in place before any link data can be displayed.

**Independent Test**: A category page loads and displays its subcategories and associated links without requiring JavaScript manipulation.

**Acceptance Scenarios**:

1. **Given** a category URL (e.g., `/diseno-ui-ux`), **When** the page loads, **Then** it displays the category name, description, and all subcategories.
2. **Given** a subcategory, **When** viewing its section, **Then** links are displayed in card format (desktop) or list format (mobile).
3. **Given** navigation menu, **When** user clicks category, **Then** page updates and URL reflects the category.

---

### User Story 2 - Responsive Layout & Data Display (Priority: P1)

As a user on mobile or desktop, I want the link data to display in appropriate formats so that the content is readable and usable on any device.

**Why this priority**: Responsive design is core to the project scope (mobile-first).

**Independent Test**: The same link data renders as a table/card on desktop and as a list on mobile without content loss.

**Acceptance Scenarios**:

1. **Given** desktop viewport, **When** links are displayed, **Then** they appear in card or table format with all fields (name, description, url, pricing, languages, status).
2. **Given** mobile viewport, **When** the page loads, **Then** links appear as a simplified list with essential fields only (name, description, url, pricing, languages).
3. **Given** a responsive layout, **When** viewport is resized, **Then** layout transitions smoothly between desktop and mobile formats.

---

### User Story 3 - Search Functionality (Priority: P2)

As a user, I want to search for specific links by name or description so that I can quickly find what I'm looking for without browsing categories.

**Why this priority**: Search improves discoverability and user experience; lower priority than core structure.

**Independent Test**: Search input filters results by name/description match with 3-char minimum; results update as user types.

**Acceptance Scenarios**:

1. **Given** a search input, **When** user types fewer than 3 characters, **Then** no results are shown (search inactive).
2. **Given** a search input with 3+ characters, **When** user types, **Then** results filter to match name or description and display in real-time.
3. **Given** search results, **When** a result is clicked, **Then** the full link opens in a new tab.

---

## Requirements _(mandatory)_

### Functional Requirements

- **FR-001**: The system MUST generate category pages dynamically from JSON data (one page per category).
- **FR-002**: Each category page MUST display subcategories as sections within the page.
- **FR-003**: Each subcategory MUST display links as cards (desktop) or list items (mobile).
- **FR-004**: Links MUST be sourced from JSON files with structure: name, description, url, status, pricing, languages, limits, verified, noCreditCard.
- **FR-005**: The system MUST implement search that filters by name/description with 3-character minimum.
- **FR-006**: Link cards MUST display: bold name, description, url (opens new tab), status icon, pricing, languages (bold), limits, verified icon, noCreditCard icon.
- **FR-007**: Link lists (mobile) MUST display simplified set: bold name, description, url (same tab), pricing, languages (bold), noCreditCard icon.
- **FR-008**: The system MUST validate file paths and naming to prevent GitHub repo path-length conflicts.
- **FR-009**: Category folder names MUST match category key names (e.g., `diseno-ui-ux` for design category).
- **FR-010**: JSON/TS file naming MUST follow pattern: `{category-name}-{type}.{ext}` (e.g., `diseno-ui-ux-rec.json`, `diseno-ui-ux-data.ts`).

### Key Entities _(include if feature involves data)_

- **Category**: Top-level grouping (e.g., Frontend, APIs, Databases). Has name, description, URL slug.
- **Subcategory**: Section within a category (e.g., "React" within Frontend). Has name, description, links.
- **Link**: Individual resource entry. Has name, description, url, status, pricing, languages, limits, verified, noCreditCard.
- **DataSource**: JSON file containing link records and metadata for a category.

### Key Constraints

- Path-length validation: No single folder path should exceed GitHub's limits (~260 chars on Windows).
- Mobile-first responsive design: Test mobile view first, scale up to desktop.
- Non-AI design: Follow `preproyecto/pre-config-general/diseño/guia-diseno_no-ia_mayo2026.md`.
- Bilingual readiness: All UI labels and content must support Spanish/English toggle (defer i18n to later phase).

## Success Criteria _(mandatory)_

### Measurable Outcomes

- **SC-001**: All 14 base categories from `preproyecto/jsons-news-interficies/` are rendered as navigable pages.
- **SC-002**: A user can click a category, view subcategories, and see links in the appropriate format (card/list) in under 2 seconds.
- **SC-003**: Search with 3+ characters returns matching results in real-time (no page refresh required).
- **SC-004**: Mobile viewport displays list format; desktop viewport displays card/table format; no data loss on either.
- **SC-005**: All file paths and names pass validation check; no conflicts with GitHub path-length limits.
- **SC-006**: Visual design matches `guia-diseno_no-ia_mayo2026.md` standards (no generic AI aesthetics).

---

## Assumptions

- Phase 1 baseline (resumen_proyecto.md) is complete and available.
- JSON data files already exist in `preproyecto/jsons-news-interficies/` with `-rec.json` structure.
- TypeScript interface files (`-data.ts`, `-rec.ts`, `-busq.ts`) can be generated from JSON or manually defined.
- Search will be client-side (JavaScript) initially; server-side search deferred to later phase.
- Category order and description come from existing JSON metadata.
- All categories are in Spanish; English translations deferred to Phase 3 (UX design phase).

---

## Notes

- Reference data from Phase 1: `resumen_proyecto.md` documents 14 categories.
- Path-length validation must happen before commits to prevent GitHub failures.
- Responsive testing should use actual devices or DevTools mobile emulation.
- Search should highlight matching terms for better UX (enhancement, not requirement).
