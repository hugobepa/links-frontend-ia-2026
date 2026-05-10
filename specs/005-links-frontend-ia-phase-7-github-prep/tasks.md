# Tasks: Links Frontend IA - Phase 7 GitHub Prep

**Input**: Design documents from `/specs/005-links-frontend-ia-phase-7-github-prep/`
**Prerequisites**: plan.md (required), spec.md (required for user stories)

**Organization**: Tasks are grouped by implementation slice so GitHub repo creation, configuration, metadata, and deployment can be delivered independently.

## Format: `[ID] [P?] [Slice] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Slice]**: Which implementation slice the task belongs to
- Include exact file paths in descriptions

---

## Slice 1: Astro Configuration for Production

**Goal**: Update Astro configs with production site URL for GitHub Pages.

**Independent Test**: Run `bun run build` and verify the build uses the production URL.

- [x] T701 [Config-Production] Update `astro.config.ts` with production site URL
- [x] T702 [P] [Config-Production] Update `astro.config.mjs` with production site URL
- [x] T703 [Config-Production] Verify build completes successfully with new config

---

## Slice 2: GitHub Repository Creation

**Goal**: Create the GitHub repository and link it to the local project.

**Independent Test**: Verify the repository exists on GitHub and local repo is linked.

- [ ] T704 [GitHub-Repo] Create public GitHub repository via MCP
- [ ] T705 [GitHub-Repo] Link local repository to remote origin

---

## Slice 3: GitHub Pages Configuration

**Goal**: Enable GitHub Pages for the repository.

**Independent Test**: Verify GitHub Pages is enabled in repository settings.

- [ ] T706 [GitHub-Pages] Enable GitHub Pages deployment via MCP

---

## Slice 4: Repository Metadata

**Goal**: Add description, topics, and license to the repository.

**Independent Test**: Check the GitHub repo page for all metadata elements.

- [x] T707 [Metadata] Create MIT LICENSE file
- [ ] T708 [P] [Metadata] Add repository description via MCP
- [ ] T709 [P] [Metadata] Add repository topics/tags via MCP

---

## Slice 5: CI/CD Pipeline

**Goal**: Create GitHub Actions workflow for automated deployment.

**Independent Test**: Verify the workflow file exists and is valid YAML.

- [x] T710 [CI-CD] Create `.github/workflows/deploy.yml` workflow file

---

## Slice 6: Documentation

**Goal**: Update README with proper documentation.

**Independent Test**: Verify README has all required sections in ES/EN.

- [ ] T711 [Docs] Update README.md with ES/EN documentation

---

## Slice 7: Deployment Verification

**Goal**: Push to main and verify the deployed site works.

**Independent Test**: Visit the GitHub Pages URL and verify all routes work.

- [ ] T712 [Deploy] Push to main and trigger workflow
- [ ] T713 [Deploy] Verify deployed site functionality

---

## Dependencies & Order

```text
Slice 1 (Config):
  T701 → T702 → T703

Slice 2 (Repo):
  T704 → T705

Slice 3 (Pages):
  T706

Slice 4 (Metadata):
  T707 → T708 → T709

Slice 5 (CI/CD):
  T710

Slice 6 (Docs):
  T711

Slice 7 (Deploy):
  T712 → T713

Cross-slice dependencies:
  T703 (after Slice 1)
  T705 (after Slice 2)
  T706 (after Slice 2)
  T709 (after Slice 3)
  T711 (after Slice 5)
  T712 (after Slices 1-6)
  T713 (after T712)
```

## Parallel Opportunities

- T702 can run in parallel with T701 after T701 completes
- T708 and T709 can run in parallel after T707 completes
- T710 can run in parallel with Slice 4 if the workflow is independent
