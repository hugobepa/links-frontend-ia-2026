# Feature Specification: Links Frontend IA - Phase 3 i18n & UX Refinement

**Feature Branch**: `003-links-frontend-ia-phase-3`  
**Created**: 09/05/2026  
**Status**: Draft  
**Input**: User description: "Crear la especificación para la Fase 3 del proyecto links-frontend-ia-2026 con i18n (español/inglés) y UX Design Refinement"

---

## Clarifications

### Session 2026-05-09

- Q: ¿Qué contenido debe traducirse? → A: Solo UI chrome (traducir solo labels, no contenido de recursos)
- Q: ¿Qué estructura de URLs i18n? → A: URLs subdirectorio (/es/ y /en/)
- Q: ¿Qué paleta de colores? → A: Paleta Negocios & Servicios (Marfil + Bronce)
- Q: ¿Qué componentes incluir en la refactorización? → A: Todos los componentes principales

---

## User Scenarios & Testing _(mandatory)_

### User Story 1 - Language Toggle (Priority: P1)

As a user, I want to toggle between Spanish and English so that I can view all UI labels, navigation, and messages in my preferred language.

**Why this priority**: i18n is a core requirement for reaching a broader audience (Spanish and English speakers). This is essential for the project's international visibility.

**Independent Test**: Toggle language and verify all visible UI text changes to the selected language without page reload.

**Acceptance Scenarios**:

1. **Given** a language toggle button in the UI, **When** the user clicks it, **Then** all labels, navigation items, and messages switch to the selected language.
2. **Given** a language preference stored in localStorage, **When** the user returns to the site, **Then** the previously selected language is applied automatically.
3. **Given** the site in either language, **When** the user navigates between pages, **Then** the language preference persists across all pages.
4. **Given** search functionality, **When** the user searches, **Then** placeholder text and "no results" messages appear in the selected language.

---

### User Story 2 - SEO hreflang Implementation (Priority: P1)

As a site owner, I want proper hreflang tags so that search engines serve the correct language version to users in different regions.

**Why this priority**: hreflang is critical for SEO and preventing duplicate content issues in multilingual sites. Without it, search engines may not correctly identify language variants.

**Independent Test**: View page source and verify correct hreflang tags for Spanish (default) and English versions.

**Acceptance Scenarios**:

1. **Given** the site has Spanish as default language, **When** search engines crawl the page, **Then** hreflang="es" is present and points to the Spanish URL.
2. **Given** the English version exists, **When** search engines crawl, **Then** hreflang="en" is present and points to the English URL.
3. **Given** both language versions, **When** crawlers process the page, **Then** hreflang="x-default" is present for the fallback version.

---

### User Story 3 - Visual Design Refinement (Priority: P2)

As a user, I want a polished visual experience with improved spacing, typography, and colors so that the site feels more professional and easier to read.

**Why this priority**: Visual refinement improves user trust and engagement. Following the design guide ensures consistency and avoids "AI-generated" aesthetics.

**Independent Test**: Compare visual elements against the design guide checklist; verify spacing uses 8px grid, typography follows 1.5x scale, colors match the defined palette.

**Acceptance Scenarios**:

1. **Given** the current design, **When** applying refinements, **Then** spacing follows the 8px grid system (8, 16, 24, 32, 48, 64px).
2. **Given** typography elements, **When** rendered, **Then** font sizes follow the 1.5x scale (12, 14, 16, 18, 20, 32, 40, 48px).
3. **Given** color palette, **When** applied, **Then** it uses the 60-30-10 rule with human tones (no pure blacks/whites, no generic AI blues/purples).
4. **Given** text content, **When** displayed, **Then** line length respects the 65ch maximum for optimal readability.

---

### User Story 4 - Micro-interactions and Transitions (Priority: P2)

As a user, I want smooth transitions between pages and interactive elements so that the site feels responsive and polished.

**Why this priority**: Micro-interactions improve perceived performance and create a more engaging experience. They provide visual feedback for user actions.

**Independent Test**: Interact with elements (hover, click, navigate) and verify smooth transitions without jank or layout shifts.

**Acceptance Scenarios**:

1. **Given** navigation links, **When** hovered, **Then** they show smooth color/background transitions (150-200ms duration).
2. **Given** category cards, **When** hovered, **Then** they have subtle lift effect with shadow transition.
3. **Given** page navigation, **When** clicking a link, **Then** the transition between pages is smooth (fade or slide).
4. **Given** search input, **When** focused, **Then** it shows a smooth border color transition.
5. **Given** toggle buttons, **When** clicked, **Then** they animate smoothly between states.

---

### User Story 5 - Loading States (Priority: P3)

As a user, I want to see loading indicators when content is being fetched so that I know the system is working and don't think the site is broken.

**Why this priority**: Loading states prevent user frustration during data fetching. They set expectations and provide feedback.

**Independent Test**: Simulate slow network and verify loading indicators appear within 100ms and disappear when content loads.

**Acceptance Scenarios**:

1. **Given** search functionality, **When** typing a query, **Then** a subtle loading indicator appears while filtering.
2. **Given** category page, **When** loading, **Then** skeleton loaders or spinners appear in place of content.
3. **Given** any async action, **When** in progress, **Then** the user can still interact with other parts of the UI (non-blocking).

---

### Edge Cases

- What happens when localStorage is unavailable or disabled? → Fall back to browser language detection or default to Spanish.
- What happens when search returns zero results? → Show friendly message in current language with suggestions.
- What happens with very long category or link names? → Truncate with ellipsis and show full text on hover.
- What happens on first visit with no language preference? → Detect browser language; if Spanish or English, use it; otherwise default to Spanish.

---

## Requirements _(mandatory)_

### Functional Requirements

- **FR-001**: The system MUST provide a language toggle button visible in the header/navigation area.
- **FR-002**: The system MUST support Spanish (es) as default and English (en) as secondary language.
- **FR-003**: All UI labels, navigation items, buttons, placeholders, and messages MUST be translated in both languages. **Note**: Only UI chrome is translated (labels, navigation, buttons); resource content (category names, link titles, descriptions) remains in original language.
- **FR-004**: Language preference MUST be persisted in localStorage with key "preferred-language".
- **FR-005**: On page load, the system MUST check localStorage for language preference; if not found, detect browser language.
- **FR-006**: The system MUST include hreflang meta tags in the `<head>` for both Spanish and English versions. **Note**: URLs use subdirectory structure (/es/ and /en/).
- **FR-007**: Each page MUST have canonical URL and alternate links for both languages. **Structure**: `/es/category/...` for Spanish, `/en/category/...` for English.
- **FR-008**: The system MUST implement the 8px grid spacing system from the design guide.
- **FR-009**: Typography MUST follow the 1.5x scale and 65ch maximum line length.
- **FR-010**: Color palette MUST follow the 60-30-10 rule with human tones (no pure #000000 or #ffffff). **Note**: Using "Negocios & Servicios" palette (Marfil #F8F5F0 background, Bronce #B46D46 primary).
- **FR-011**: Hover states on interactive elements MUST have smooth transitions (150-200ms, ease-out).
- **FR-012**: Page navigation transitions MUST be smooth without jarring layout shifts.
- **FR-013**: Loading states MUST appear within 100ms of initiating an async action.
- **FR-014**: Search placeholder and "no results" message MUST be in the current language.

### Key Entities _(include if data is involved)_

- **LanguagePreference**: Stores user's selected language (es/en). Persisted in localStorage.
- **TranslationKey**: Unique identifier for each translatable string (e.g., "search.placeholder", "nav.categories").
- **TranslatedContent**: Collection of all UI text in both languages.

- Q: ¿Qué componentes incluir en la refactorización? → A: Todos los componentes principales

### Key Constraints

- **Backward compatibility**: Existing category pages and links must work unchanged; i18n wraps existing content.
- **Performance**: Language switch must not cause full page reload; use client-side state.
- **SEO requirement**: hreflang implementation must not create duplicate content issues.
- **Design compliance**: All visual changes must align with `guia-diseno_no-ia_mayo2026.md` using the "Negocios & Servicios" palette.
- **Accessibility**: Language changes must be announced to screen readers; toggle must be keyboard accessible.
- **Components in scope**: All main components (CategoryNavigation, LinkCard, LinkListItem, SearchBar, SubcategorySection) will be refactored with new design tokens and transitions.

---

## Success Criteria _(mandatory)_

### Measurable Outcomes

- **SC-001**: User can toggle between Spanish and English, and all UI text updates instantly without page reload.
- **SC-002**: Language preference persists across sessions (verified by closing and reopening browser).
- **SC-003**: Page source contains correct hreflang tags for es, en, and x-default.
- **SC-004**: All spacing values are multiples of 8px (8, 16, 24, 32, 48, 64).
- **SC-005**: Typography scale follows 1.5x progression (12, 14, 16, 18, 20, 32, 40, 48px).
- **SC-006**: Hover transitions complete in 150-200ms with smooth easing.
- **SC-007**: Loading indicators appear within 100ms of async action start.
- **SC-008**: Lighthouse accessibility score remains above 90 after changes.
- **SC-009**: No layout shifts (CLS) introduced by transitions or loading states.

---

## Assumptions

- The project uses Astro's i18n support or a lightweight i18n solution (no heavy framework).
- Existing content (category names, link descriptions) remains in original language; only UI chrome is translated.
- English translations for UI will be created based on Spanish originals.
- Browser language detection uses `navigator.language` or `Accept-Language` header.
- The site is deployed on a platform that supports proper hreflang (Vercel, Netlify, GitHub Pages).
