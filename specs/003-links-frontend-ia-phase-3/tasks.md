# Tasks: Links Frontend IA - Phase 3 i18n & UX Refinement

**Input**: Design documents from `/specs/003-links-frontend-ia-phase-3/`
**Prerequisites**: plan.md (required), spec.md (required for user stories)

**Clarifications Applied**:

- Only UI chrome is translated (labels, navigation, buttons) - resource content remains in original language
- URL structure: subdirectory format (/es/ and /en/)
- Color palette: "Negocios & Servicios" (Marfil #F8F5F0, Bronce #B46D46)
- All main components included in refactoring

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

---

## Phase 1: i18n Foundation (P1) 🎯 MVP

**Goal**: Core i18n infrastructure - language toggle, translations, persistence

**Independent Test**: Toggle language and verify all UI text changes without page reload

### User Story 1 - Language Toggle

- [x] T101 [US1] Create translation files `src/i18n/es.json` and `src/i18n/en.json` with all UI labels **Note: Only UI chrome (labels, navigation, buttons) - not resource content**
- [x] T102 [P] [US1] Create i18n store `src/i18n/index.ts` with nanostores for language state
- [x] T103 [P] [US1] Implement `LanguageToggle` component in `src/components/LanguageToggle.tsx`
- [x] T104 [US1] Add language persistence (localStorage) with browser language fallback
- [x] T105 [US1] Integrate LanguageToggle into main layout/header

### User Story 2 - SEO hreflang

- [x] T106 [US2] Update `src/layouts/Layout.astro` to include hreflang meta tags **Note: Use /es/ and /en/ subdirectory URL structure**
- [x] T107 [P] [US2] Add canonical URLs and alternate links for es/en versions **Structure: /es/category/... and /en/category/...**
- [x] T108 [US2] Configure URL structure for language versions (/es/ and /en/ paths)

---

## Phase 2: UI Translation (P1)

**Goal**: All UI elements translated to both languages

**Independent Test**: Navigate through all pages in both languages and verify no untranslated text

### User Story 1 - Language Toggle (continued)

- [x] T201 [P] [US1] Update navigation labels (categories, home, search) in both languages **UI chrome only**
- [x] T202 [P] [US1] Update SearchBar placeholder and "no results" message **UI chrome only**
- [x] T203 [P] [US1] Update category page headers and subcategory labels **UI chrome only**
- [x] T204 [US1] Update footer content (copyright, links) in both languages **UI chrome only**
- [x] T205 [US1] Update link card labels (pricing, languages, verified status) **UI chrome only**

---

## Phase 3: Design Refinements (P2)

**Goal**: Visual polish following guia-diseno_no-ia_mayo2026.md

**Independent Test**: Inspect CSS and verify 8px grid, 1.5x typography scale, human color palette

### User Story 3 - Visual Design Refinement

- [x] T301 [US3] Define CSS custom properties for 8px grid spacing in `src/styles/global.css`
- [x] T302 [P] [US3] Apply typography scale (1.5x) with proper font sizes
- [x] T303 [P] [US3] Refine color palette to follow 60-30-10 rule **Note: Use "Negocios & Servicios" palette - Marfil #F8F5F0 (bg), Bronce #B46D46 (primary), avoid pure black/white**
- [x] T304 [US3] Ensure 65ch max line length on text content
- [x] T305 [US3] Remove pure black (#000000) and white (#ffffff) - use #111111 and #f5f5f5

---

## Phase 4: Micro-interactions (P2)

**Goal**: Smooth transitions and interactive feedback

**Independent Test**: Hover over elements, navigate between pages, verify smooth 150-200ms transitions

### User Story 4 - Micro-interactions and Transitions

- [x] T401 [US4] Add hover transitions to navigation links (color, background) **Components: CategoryNavigation**
- [x] T402 [P] [US4] Add hover lift effect with shadow to category cards **Components: LinkCard, SubcategorySection**
- [x] T403 [P] [US4] Add smooth focus states for form inputs (SearchBar) **Components: SearchBar**
- [x] T404 [US4] Add toggle button animation for language switcher **Components: LanguageToggle**
- [x] T405 [US4] Implement smooth page transitions (fade effect)
- [x] T406 [US4] Add skeleton loaders for category page loading **Components: LinkListItem, SubcategorySection**

---

## Phase 5: Loading States (P3)

**Goal**: Loading indicators for async operations

**Independent Test**: Simulate slow network, verify loading states appear within 100ms

### User Story 5 - Loading States

- [ ] T501 [US5] Add loading spinner to SearchBar during filtering
- [ ] T502 [US5] Add skeleton loaders to category page content areas
- [ ] T503 [US5] Ensure loading states are non-blocking (progressive enhancement)

---

## Phase 6: Validation & Polish (P3)

**Goal**: Final testing and edge case handling

**Independent Test**: Full test suite across languages, Lighthouse validation

- [ ] T601 Test language toggle on all page types (home, category, search)
- [ ] T602 Verify language persistence across browser sessions
- [ ] T603 Check page source for correct hreflang tags
- [ ] T604 Run Lighthouse performance audit (target: >90)
- [ ] T605 Run Lighthouse accessibility audit (target: >90)
- [ ] T606 Verify no CLS (Cumulative Layout Shift) from transitions
- [ ] T607 Test fallback when localStorage is unavailable
- [ ] T608 Test search with no results shows message in correct language

---

## Dependencies & Order

```
Phase 1 (Foundation):
  T101 → T102 → T103 → T104 → T105
                    ↘
              T106 → T107 → T108

Phase 2 (UI Translation):
  T101 (complete) → T201 → T202 → T203 → T204 → T205

Phase 3 (Design):
  T301 → T302 → T303 → T304 → T305

Phase 4 (Interactions):
  T301 (complete) → T401 → T402 → T403 → T404 → T405 → T406

Phase 5 (Loading):
  T405 (complete) → T501 → T502 → T503

Phase 6 (Validation):
  All previous phases complete → T601 → T602 → ... → T608
```

## Parallel Opportunities

- **T101, T102, T106**: Can start in parallel (foundation files)
- **T201, T202, T203**: Can run in parallel (UI updates)
- **T301, T302, T303**: Can run in parallel (CSS variables)
- **T401, T402, T403**: Can run in parallel (transition styles)
- **T601-T608**: Can run in parallel (validation tasks)
