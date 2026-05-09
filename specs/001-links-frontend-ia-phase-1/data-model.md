# Data Model: Links Frontend IA - Phase 1 Repository Analysis

## Entities

### Repository Profile

Represents the current project state that phase 1 must document.

**Fields**

- `repoName`: Repository name
- `branch`: Active feature branch
- `rootStructure`: High-level folder layout
- `supportSurfaces`: `.specify`, `.agents`, `.github`, `.git`
- `canonicalConfig`: Active Astro config file
- `legacyConfig`: Legacy Astro config file

**Relationships**

- Contains the technology inventory.
- References the agent catalog.
- Anchors the phase log.

### Technology Inventory

Represents the current stack and tooling recorded from project metadata.

**Fields**

- `runtimeStack`: Astro, TypeScript, React, Tailwind, Bun
- `uiStack`: shadcn/ui, Radix UI, Lucide
- `docsStack`: Starlight and related docs tooling
- `versionRefs`: Package and tool versions observed in the repo

**Relationships**

- Belongs to the repository profile.
- Feeds the root summary document.

### Agent Catalog

Represents the Copilot skills available in `.agents`.

**Fields**

- `agentName`: Skill name
- `description`: Short purpose summary
- `category`: Work area or technology domain

**Relationships**

- Belongs to the repository profile.
- Is documented in `resumen_proyecto.md`.

### Phase Log

Represents the traceability record for phase 1 documentation work.

**Fields**

- `version`: Incremental version label
- `phaseName`: Phase label
- `changeSummaryEs`: Short Spanish change note
- `changeSummaryEn`: Short English change note
- `completedAt`: Madrid-local completion timestamp

**Relationships**

- Belongs to the repository profile.
- Extends over time as later phase 1 refinements are made.

## Validation Rules

- The repository profile must reflect the real current repo tree.
- The technology inventory must only list technologies present in project metadata.
- The agent catalog must keep descriptions short and category labels consistent.
- The phase log must remain append-only and ordered.
- The summary document must remain bilingual and concise.
