# Research: Links Frontend IA - Phase 1 Repository Analysis

## Decisions

### 1. Phase 1 output stays documentation-only

- **Decision**: Phase 1 produces `resumen_proyecto.md` and supporting planning documents only.
- **Rationale**: The feature spec explicitly scopes phase 1 to analysis and documentation.
- **Alternatives considered**: Starting implementation early or mixing later-phase UI work into the baseline. Rejected because it breaks phase order and increases drift.

### 2. Astro config source of truth

- **Decision**: `astro.config.ts` is the canonical config file; `astro.config.mjs` is legacy.
- **Rationale**: The user confirmed this choice during clarification.
- **Alternatives considered**: Treating both files as equal or keeping the canonical file unspecified. Rejected because the plan needs one working reference.

### 3. Project context comes from existing repository metadata

- **Decision**: Use the repo tree, `package.json`, `.specify`, `.agents`, `.github`, and `.git` as the authoritative phase 1 sources.
- **Rationale**: These surfaces already define the working environment and constrain later phases.
- **Alternatives considered**: Rebuilding the inventory from external docs only. Rejected because it would omit the actual repository state.

### 4. Documentation structure should be bilingual and concise

- **Decision**: The root summary will use Spanish and English sections with compact technical prose.
- **Rationale**: The spec requires bilingual documentation and future planning clarity.
- **Alternatives considered**: Single-language documentation or verbose prose. Rejected because it reduces accessibility and adds noise.

### 5. No contracts artifact is required for phase 1

- **Decision**: Skip `contracts/` for now.
- **Rationale**: Phase 1 is internal documentation only; there is no external runtime interface to formalize yet.
- **Alternatives considered**: Creating a placeholder contract file. Rejected because it would add empty ceremony without value.

## Notes

- The repository already contains a strong structural split between source, tooling, and preproject data.
- The summary file must call out the naming-length risk in the preproject data directories.
- Later phases can reuse this research as the baseline for more detailed design and implementation planning.
