# Research: Links Frontend IA - Phase 2 Site Architecture

## Decisions

### 1. Dynamic routing for category pages

- **Decision**: Use Astro's `[...slug].astro` file-based routing to generate category pages dynamically.
- **Rationale**: Allows flexible category structure without pre-generating static files for each of 14 categories. Scales if categories change.
- **Alternatives considered**: Pre-generate all 14 static category pages (faster, but less flexible); server-side routing (not appropriate for Astro).

### 2. Data stays in preproyecto/; load at build time

- **Decision**: JSON files remain in `preproyecto/jsons-news-interficies/`; Astro imports them at build time.
- **Rationale**: Single source of truth; avoids duplication; easier to update data without changing source code.
- **Alternatives considered**: Copy JSONs into `src/`; fetch from external API. Rejected: adds maintenance burden and cloud dependency.

### 3. Component structure: shadcn/ui + Tailwind

- **Decision**: Use shadcn/ui for base interactive components (buttons, dialogs); extend with custom Tailwind for category-specific styling.
- **Rationale**: Reduces boilerplate; maintains design consistency; non-AI design compliance via Tailwind config.
- **Alternatives considered**: Full custom CSS (more control, higher maintenance); pure shadcn (limited customization). Chose middle ground.

### 4. Search is client-side with 3-character minimum

- **Decision**: Implement search as client-side JavaScript filter; require 3+ characters to activate results.
- **Rationale**: Fast user feedback; no server round-trip; low latency; meets requirement.
- **Alternatives considered**: Server-side search (not needed at this scale); full-text search library (overkill for MVP). Client-side is sufficient.

### 5. Mobile-first responsive with Tailwind breakpoints

- **Decision**: Use Tailwind's `sm`, `md`, `lg` breakpoints; design mobile layout first, scale up to desktop.
- **Rationale**: Mobile-first per project spec; Tailwind is already in stack; breakpoints are predictable.
- **Alternatives considered**: CSS media queries (more manual); custom breakpoints (adds config). Tailwind defaults are sufficient.

### 6. Bilingual labels: Spanish in Phase 2, i18n deferred

- **Decision**: All UI labels and category names in Spanish for Phase 2; i18n (Spanish/English toggle) deferred to Phase 3+.
- **Rationale**: Reduces scope and complexity in Phase 2; Phase 1 and later phases will handle bilingual infrastructure.
- **Alternatives considered**: Add i18n in Phase 2 (increases scope); all-English labels (conflicts with project language preference). Spanish-only is pragmatic.

## Notes

- Phase 1 identified 14 categories in `preproyecto/jsons-news-interficies/`; Phase 2 assumes all 14 have valid JSON data.
- Path-length validation must occur before commits to prevent GitHub conflicts (early warning system).
- Search logic can be enhanced later with highlighting, fuzzy matching, or pagination.
- Category ordering and descriptions come from JSON metadata; no hard-coded lists in code.
