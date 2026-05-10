# Links Frontend IA - Phase 7 GitHub Prep Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Prepare the project for GitHub Pages deployment by creating the repository, configuring the project, adding metadata, and setting up CI/CD.

**Architecture:** Use GitHub MCP tools to create the repo, update Astro configs for the production URL, add repository metadata, and create a GitHub Actions workflow for automated deployment.

**Tech Stack:** Astro 6, GitHub MCP, GitHub Actions, existing ES/EN route structure

---

## File Structure

### Source files to modify

- `astro.config.ts` - update `site` URL for GitHub Pages production
- `astro.config.mjs` - update `site` URL for GitHub Pages production
- `.gitignore` - ensure `dist/` is ignored for CI/CD generation
- `README.md` - update with proper documentation in ES/EN
- Create: `.github/workflows/deploy.yml` - GitHub Actions workflow

### GitHub operations

- Create public GitHub repository (via MCP)
- Configure GitHub Pages (via MCP)
- Add repository description (via MCP)
- Add repository topics/tags (via MCP)
- Add MIT license (via MCP)

---

### Task 1: Update Astro Configuration for Production

**Files:**

- Modify: `astro.config.ts`
- Modify: `astro.config.mjs`

- [ ] **Step 1: Identify the GitHub Pages URL**

Determine the expected GitHub Pages URL format: `https://hugobepa.github.io/links-frontend-ia-2026/` or similar.

- [ ] **Step 2: Update astro.config.ts**

Add the production `site` URL to the Astro config.

- [ ] **Step 3: Update astro.config.mjs**

Add the production `site` URL to the legacy Astro config.

- [ ] **Step 4: Verify the changes**

Run `bun run build` and verify the build completes successfully.

- [ ] **Step 5: Commit**

```bash
git add astro.config.ts astro.config.mjs
git commit -m "chore(config): add production site URL for GitHub Pages"
```

---

### Task 2: Create GitHub Repository

**Operations:**

- Create public repository via GitHub MCP
- Verify repository was created successfully

- [ ] **Step 1: Create the repository**

Use GitHub MCP to create a public repository named `links-frontend-ia-2026` under the user `hugobepa` with no initial README.

- [ ] **Step 2: Link local repo to remote**

```bash
git remote add origin https://github.com/hugobepa/links-frontend-ia-2026.git
```

- [ ] **Step 3: Commit**

```bash
git commit -m "chore(repo): link local repo to GitHub remote"
```

---

### Task 3: Configure GitHub Pages

**Operations:**

- Enable GitHub Pages in the repository settings
- Configure to deploy from `gh-pages` branch or use Actions

- [ ] **Step 1: Enable GitHub Pages**

Use GitHub MCP to enable GitHub Pages and configure the deployment source.

- [ ] **Step 2: Commit**

```bash
git commit -m "chore(github): enable GitHub Pages deployment"
```

---

### Task 4: Add Repository Metadata

**Files:**

- Create: `LICENSE` (MIT license)
- Modify: Repository description via GitHub MCP
- Modify: Repository topics via GitHub MCP

- [ ] **Step 1: Create MIT License**

Create a `LICENSE` file with the MIT license text.

- [ ] **Step 2: Add repository description**

Use GitHub MCP to add: "Curated programming links focused on frontend, web applications, and modern development."

- [ ] **Step 3: Add repository topics**

Use GitHub MCP to add topics: astro, frontend, web-development, programming, resources, links, typescript, react, tailwind

- [ ] **Step 4: Commit**

```bash
git add LICENSE
git commit -m "docs(license): add MIT license and repository metadata"
```

---

### Task 5: Create GitHub Actions Workflow

**Files:**

- Create: `.github/workflows/deploy.yml`

- [ ] **Step 1: Create the workflow file**

Create `.github/workflows/deploy.yml` with:

- Trigger on push to main
- Setup Bun and Node.js
- Install dependencies
- Build the Astro project
- Deploy to GitHub Pages using `actions/upload-pages-artifact` and `actions/deploy-pages`

- [ ] **Step 2: Commit**

```bash
git add .github/workflows/deploy.yml
git commit -m "ci(github): add deployment workflow for GitHub Pages"
```

---

### Task 6: Update README

**Files:**

- Modify: `README.md`

- [ ] **Step 1: Update README**

Update the README with:

- Project title and description in ES/EN
- Features list
- Installation instructions
- Deployment status badge
- License badge
- Links to live site (once deployed)

- [ ] **Step 2: Commit**

```bash
git add README.md
git commit -m "docs(readme): update with comprehensive documentation"
```

---

### Task 7: Verify Deployment

**Operations:**

- Push to main and verify workflow runs
- Check the deployed site

- [ ] **Step 1: Push to main**

```bash
git push -u origin main
```

- [ ] **Step 2: Monitor the workflow**

Wait for the GitHub Actions workflow to complete.

- [ ] **Step 3: Verify the deployed site**

Visit the GitHub Pages URL and verify:

- Home page loads
- Navigation works
- Categories load
- Search works
- All routes resolve correctly

- [ ] **Step 4: Commit**

```bash
git commit -m "chore(deploy): verify GitHub Pages deployment"
```

---

## Validation Checklist

- [ ] Astro config has production site URL
- [ ] GitHub repository exists and is public
- [ ] GitHub Pages is enabled
- [ ] Repository has description, topics, and license
- [ ] GitHub Actions workflow exists and runs
- [ ] Deployed site is accessible and functional
- [ ] All routes work on the deployed site
- [ ] README is updated with deployment status
