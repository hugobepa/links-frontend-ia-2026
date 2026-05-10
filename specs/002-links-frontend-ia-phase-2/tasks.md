# Tasks: Links Frontend IA - Phase 2 Site Architecture

**Input**: Design documents from `/specs/002-links-frontend-ia-phase-2/`
**Prerequisites**: plan.md, spec.md, research.md, data-model.md, quickstart.md

**Tests**: Component and integration testing with actual JSON data. Responsive validation required.

**Organization**: Tasks are grouped by user story for independent implementation and testing.

## Format: `[ID] [P?] [Story] Description with file path`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (US1, US2, US3)
- Include exact file paths in descriptions
- Phase 2 is UI + data integration; no data modification

---

## Phase 1: Setup & Data Loading

**Purpose**: Establish foundation for category pages and data integration.

- [x] T001 Sample one JSON file from preproyecto/jsons-news-interficies/ to understand structure
- [x] T002 Create TypeScript types for Category, Subcategory, Link entities in src/types/categories.ts
- [x] T003 Implement data loader in src/lib/loaders.ts to import JSON from preproyecto/
- [x] T004 Create path-length validation script in scripts/validate-paths.ts
- [x] T005 [P] Set up responsive breakpoints in tailwind.config.ts (mobile-first defaults)

---

## Phase 2: User Story 1 - Category-Based Navigation (Priority: P1) 🎯 MVP

**Goal**: Create dynamic category pages that load and display subcategories and links.

**Independent Test**: A category page renders correctly when accessed via `/categories/{category-slug}` with all subcategories and links displayed.

### Implementation for User Story 1

- [x] T006 [US1] Create src/pages/categories/[...slug].astro for dynamic routing
- [x] T007 [US1] Implement category page layout in [...slug].astro with fallback/not-found handling
- [x] T008 [US1] Load category data in [...slug].astro using loaders from src/lib/loaders.ts
- [x] T009 [P] [US1] Create src/components/SubcategorySection.tsx to render subcategories
- [x] T010 [P] [US1] Create src/components/navigation/CategoryNav.tsx for category menu/sidebar
- [x] T011 [US1] Integrate CategoryNav into layout; test menu navigation to all 14 categories
- [x] T012 [US1] Verify 404 handling for invalid category slugs
- [x] T013 [US1] Add breadcrumb navigation (Home > Category > Subcategory) to [...slug].astro

**Checkpoint**: User Story 1 complete - all 14 categories render with subcategories visible

---

## Phase 3: User Story 2 - Responsive Layout & Data Display (Priority: P1)

**Goal**: Render links in cards (desktop) or lists (mobile) with responsive transitions.

**Independent Test**: Same category page renders correctly on mobile (320px) and desktop (1024px+) without data loss or layout breaks.

### Implementation for User Story 2

- [x] T014 [P] [US2] Create src/components/LinkCard.tsx (desktop: all fields, icons, new tab)
- [x] T014b [P] [US2] Create src/components/LinkListItem.tsx (mobile: essential fields only, same tab)
- [x] T015 [US2] Create responsive wrapper in SubcategorySection.tsx to show card/list based on viewport
- [x] T016 [US2] Implement viewport detection hook in src/lib/useViewport.ts (mobile-first)
- [x] T017 [P] [US2] Create icon components for status (green/red), verified, noCreditCard
- [x] T018 [US2] Add Tailwind responsive styles in src/styles/categories.css for breakpoints
- [x] T019 [US2] Test responsive layout at 320px (mobile), 768px (tablet), 1024px (desktop)
- [x] T020 [US2] Verify smooth transitions on viewport resize (no layout shift/flicker)
- [x] T021 [US2] Format link fields: bold name, pricing text, languages bold, status icons
- [x] T022 [US2] Ensure "url" field opens in new tab (desktop) vs same tab (mobile)

**Checkpoint**: User Story 2 complete - responsive layout works; no data loss on any viewport

---

## Phase 4: User Story 3 - Search Functionality (Priority: P2)

**Goal**: Implement client-side search that filters links by name/description with 3-character minimum.

**Independent Test**: Search bar filters results in real-time; 3-char minimum enforced; results update without page reload.

### Implementation for User Story 3

- [x] T023 [P] [US3] Create src/components/SearchBar.tsx with input validation (3-char minimum)
- [x] T024 [US3] Implement search filter logic in src/lib/search.ts (name + description matching)
- [x] T025 [US3] Integrate SearchBar into category pages (global or per-category scope)
- [x] T026 [US3] Wire search filter to LinkCard/LinkListItem components
- [x] T027 [US3] Test search with <3 chars (no results); test with 3+ chars (live filtering)
- [x] T028 [US3] Add search result count display ("X results for 'term'")
- [x] T029 [US3] Implement clear search button to reset results
- [x] T030 [US3] Test search across different categories; verify scope (global vs per-category)

**Checkpoint**: User Story 3 complete - search is functional, 3-char guard works, results update in real-time

---

## Phase 5: Data Integration & Validation

**Purpose**: Ensure all 14 categories load correctly and path-length validation passes.

- [x] T031 Run path-length validation script against all 14 categories
- [x] T032 [P] Verify all 14 categories load without errors in local dev (`bun run dev`)
- [x] T033 [P] Spot-check data in 3+ categories (verify JSON structure matches types)
- [x] T034 [P] Test error handling if a JSON file is missing/malformed
- [x] T035 Verify URLs are valid (sample 10+ links; spot-check domains)

**Checkpoint**: All data validated; no path-length conflicts; 14 categories confirmed working

---

## Phase 6: Navigation & Home Page Updates

**Purpose**: Integrate category pages into main navigation and home page.

- [x] T036 Update src/pages/index.astro with category links/grid
- [x] T037 [P] Create category card component for home page (category name, link count, icon)
- [x] T038 [P] Add "Browse by Category" section to home page
- [x] T039 Update main navigation to include category menu/links
- [x] T040 Test navigation: home → category → subcategory → link (end-to-end)

**Checkpoint**: Navigation is complete; users can browse from home page

---

## Phase 7: Design Compliance & Polish

**Purpose**: Ensure UI follows non-AI design guide and layout is polished.

- [x] T041 Review design against guia-diseno_no-ia_mayo2026.md (color, typography, spacing)
- [x] T042 [P] Verify no generic AI aesthetics; adjust colors/fonts if needed
- [x] T043 [P] Test hover/focus states on cards, buttons, links
- [x] T044 [P] Optimize images/icons for performance (use Lucide icons, no heavy assets)
- [x] T045 Test accessibility: keyboard navigation, color contrast, screen reader labels
- [x] T046 Add loading state for category pages (skeleton/spinner while data loads)

**Checkpoint**: Design is compliant; UI is polished and accessible

---

## Phase 8: Validation & Final Testing

**Purpose**: Ensure all requirements are met before handoff to Phase 3.

- [x] T047 [P] Run SC-001: Verify all 14 categories render as pages
- [x] T048 [P] Run SC-002: Test page load time (<2s) on desktop/mobile
- [x] T049 [P] Run SC-003: Test search filters and real-time updates
- [x] T050 [P] Run SC-004: Test responsive layout (mobile/tablet/desktop; no data loss)
- [x] T051 [P] Run SC-005: Verify path-length validation passes
- [x] T052 [P] Run SC-006: Confirm design matches non-AI guide
- [x] T053 Review all 3 user stories independently; verify each is testable without others
- [x] T054 Update proyecto_estructura.md with Phase 2 completion entry
- [x] T055 Final code review: no console errors, proper TypeScript types, clean code

**Checkpoint**: All success criteria met; Phase 2 ready for handoff to Phase 3

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - must complete first
- **User Stories (Phase 2-4)**: All depend on Setup completion
  - US1 (P1) is MVP - must complete first
  - US2 (P1) can start in parallel with US1 after setup
  - US3 (P2) can start after US1+US2 foundation
- **Integration (Phase 5-8)**: Depends on all user stories being complete

### Within Phase 2

- Setup tasks (T001-T005) must complete before any user story work
- US1 (T006-T013) is MVP; blocks nothing but blocks US3
- US2 (T014-T022) can run in parallel with US1 after setup (different components)
- US3 (T023-T030) depends on US1/US2 completion (needs rendered links to search)
- Integration & validation (T031-T055) happens after all stories are complete

### Parallel Opportunities

- After setup: T009 (SubcategorySection), T010 (CategoryNav), T014 (LinkCard), T014b (LinkListItem) can run in parallel
- T017 (icons), T018 (styles), T019 (responsive testing) can run in parallel after layout
- T032-T035 (data validation) can run in parallel
- T037-T044 (home page, design) can run in parallel
- T047-T052 (final testing) can run in parallel

---

## Implementation Strategy

### Phase 2 MVP (User Story 1 + 2 Only)

1. Complete Setup (T001-T005)
2. Complete US1 (T006-T013)
3. Complete US2 (T014-T022)
4. **STOP and VALIDATE**: Verify all 14 categories render in card/list format
5. Ready for code review as Phase 2 MVP

### Incremental Delivery

1. Setup → US1 → Validate & review
2. Add US2 → Validate responsive layout
3. Add US3 → Validate search
4. Phase 5-8: Integration & final validation
5. Phase 2 complete and ready for Phase 3

---

## Notes

- Phase 2 is UI + data integration; no modifications to JSON files
- All 14 categories must render; "zero-category" edge case deferred
- Search is client-side only; server-side search deferred to Phase 4+
- Bilingual: Spanish labels in Phase 2; i18n deferred to Phase 3+
- No pushing to remote until Phase 9 per constitution
- Validation gates are checkpoints to ensure independent user story completion
