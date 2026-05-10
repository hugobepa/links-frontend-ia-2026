# Implementation Plan: Links Frontend IA - Phase 3 i18n & UX Refinement

**Branch**: `003-links-frontend-ia-phase-3` | **Date**: 09/05/2026 | **Spec**: [spec.md](spec.md)
**Input**: Feature specification from `/specs/003-links-frontend-ia-phase-3/spec.md`

## Summary

Implement internationalization (Spanish/English) with language toggle and persistence, plus UX design refinements including 8px grid spacing, typography improvements, micro-interactions, and loading states. All changes must align with the `guia-diseno_no-ia_mayo2026.md` design guide.

## Technical Context

**Language/Version**: TypeScript 5.x, Astro 6.x, React 19  
**Primary Dependencies**: `@astrojs/react`, `tailwindcss` v4, `nanostores` (for i18n state)  
**Storage**: localStorage for language preference persistence  
**Testing**: Manual browser testing, Lighthouse for performance/accessibility  
**Target Platform**: Web (static site with client-side interactivity)  
**Performance Goals**: <100ms language switch, no CLS from transitions, loading states within 100ms  
**Constraints**: Must not break existing category pages; backward compatible with existing data  
**Scale/Scope**: 11 categories, 78 subcategories, 730 resources - UI chrome only

## Constitution Check

- [x] Project has valid `package.json` with Astro 6.x
- [x] Tailwind CSS 4 configured
- [x] React 19 integration present
- [x] Existing category pages functional (Phase 1-2 complete)

## Project Structure

### Documentation (this feature)

```text
specs/003-links-frontend-ia-phase-3/
├── spec.md              # Feature specification (this file's input)
├── plan.md              # This file
├── tasks.md             # Task breakdown
├── research.md          # (optional) Technical research notes
└── checklists/          # Validation checklists
    └── requirements.md  # Spec quality checklist
```

### Source Code (repository root)

```text
src/
├── i18n/                    # NEW: i18n implementation
│   ├── index.ts             # i18n store and utilities
│   ├── es.json              # Spanish translations
│   └── en.json              # English translations
├── components/
│   ├── LanguageToggle.tsx   # NEW: Language switcher component
│   ├── SearchBar.tsx        # (update for i18n)
│   ├── CategoryNavigation.astro  # (update for i18n)
│   └── ui/                  # (update for transitions)
├── layouts/
│   └── Layout.astro         # (update for hreflang)
├── pages/
│   ├── index.astro          # (update for i18n)
│   └── categories/
│       └── [category].astro # (update for i18n)
└── styles/
    └── global.css           # (update for design refinements)
```

## Technical Approach

### i18n Implementation

1. **State Management**: Use `nanostores` for lightweight, framework-agnostic state
2. **Translations**: JSON files with dot-notation keys (e.g., `nav.categories`, `search.placeholder`)
3. **Language Detection**: Check localStorage first → browser language → default Spanish
4. **Toggle Component**: Accessible button with keyboard support and ARIA labels

### SEO hreflang

1. **Dynamic Tags**: Add hreflang to Layout.astro based on current page
2. **URL Structure**: Use `/es/` and `/en/` path prefixes or query params
3. **Canonical**: Each page has self-referential canonical + alternates

### Design Refinements

1. **CSS Variables**: Define spacing (8px grid), typography scale (1.5x), colors (60-30-10)
2. **Transitions**: Use CSS `transition` with `ease-out` timing, 150-200ms duration
3. **Loading States**: Skeleton loaders for content, subtle spinners for search

## Dependencies

- `nanostores` - Lightweight state management (i18n)
- `@nanostores/react` - React bindings for nanostores
- No additional heavy dependencies required

## Risks & Mitigations

| Risk                     | Impact   | Mitigation                                     |
| ------------------------ | -------- | ---------------------------------------------- |
| localStorage unavailable | Medium   | Fall back to browser language detection        |
| SEO duplicate content    | High     | Proper hreflang + canonical tags               |
| Performance regression   | Medium   | Keep transitions CSS-only, avoid JS animations |
| Existing content breaks  | Critical | Test all existing pages after changes          |

## Phases

### Phase 1: i18n Foundation (P1)

- Create translation JSON files
- Implement i18n store with nanostores
- Add language toggle component
- Update Layout for hreflang

### Phase 2: UI Translation (P1)

- Translate all navigation labels
- Translate search placeholder and messages
- Translate category headers
- Translate footer content

### Phase 3: Design Refinements (P2)

- Apply 8px grid spacing system
- Apply typography scale (1.5x)
- Apply color palette refinements
- Ensure 65ch max line length

### Phase 4: Micro-interactions (P2)

- Add hover transitions to interactive elements
- Add focus states for accessibility
- Add page transition effects
- Add loading states

### Phase 5: Validation (P3)

- Test language toggle across all pages
- Verify hreflang in page source
- Run Lighthouse for performance/accessibility
- Verify no CLS from transitions
