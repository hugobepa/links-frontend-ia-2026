# Data Model: Links Frontend IA - Phase 2 Site Architecture

## Entities

### Category

Represents a top-level grouping of links (e.g., Frontend, APIs, Databases).

**Fields**

- `id`: Unique identifier (URL slug, e.g., `diseno-ui-ux`)
- `name`: Display name in Spanish
- `description`: Short description of the category
- `order`: Sort order in navigation
- `subcategories`: Array of Subcategory objects

**Relationships**

- Contains multiple Subcategories.
- Referenced by Category Navigation menu.
- Data sourced from `{category-id}-struc.json` in `preproyecto/jsons-news-interficies/`.

### Subcategory

Represents a section within a category (e.g., "React" within Frontend).

**Fields**

- `id`: Unique identifier within category
- `name`: Display name
- `description`: Optional description
- `links`: Array of Link objects
- `order`: Sort order within category

**Relationships**

- Belongs to a Category.
- Contains multiple Links.

### Link

Represents an individual resource entry.

**Fields**

- `name`: Resource name (bold in UI)
- `description`: Short description
- `url`: Full URL (opens new tab on desktop, same tab on mobile)
- `status`: Active/Inactive indicator (green checkmark or red X)
- `pricing`: Free/Paid/Freemium/Custom
- `languages`: Array of language codes (ES, EN, etc.) — displayed bold
- `limits`: Free tier limits (text or "no limits")
- `verified`: Verified/Unverified flag (icon)
- `noCreditCard`: Requires credit card or not (icon)

**Relationships**

- Belongs to a Subcategory.
- Data sourced from `{category-id}-rec.json` in `preproyecto/jsons-news-interficies/`.

### SearchResult

Represents a link matching user's search query.

**Fields**

- `linkId`: Reference to matching Link
- `categoryId`: Parent category ID
- `subcategoryId`: Parent subcategory ID
- `matchedField`: Field that matched (name or description)
- `snippet`: Excerpt of matched text

**Relationships**

- References a Link.
- Temporary entity created during search operation (not persisted).

### DataSource

Represents the JSON file containing category data.

**Fields**

- `categoryId`: Category identifier
- `recordsFile`: Path to `{category-id}-rec.json`
- `structureFile`: Path to `{category-id}-struc.json`
- `lastUpdated`: Timestamp of last data refresh

**Relationships**

- Provides data for a Category.
- Loaded at build time by Astro.

## Validation Rules

- Category ID must match folder name in `preproyecto/jsons-news-interficies/`.
- All URLs must be valid HTTP/HTTPS links.
- Languages must be 2-letter ISO codes (ES, EN, FR, etc.).
- Status and verified fields must be boolean or icon-compatible.
- Search must require 3+ characters before filtering.
- Path-length validation: entire folder path must not exceed 260 characters (GitHub Windows limit).
- Pricing field must match known values: Free, Paid, Freemium, Custom, Free Trial.

## Relationships Diagram

```
Category
  |
  +-- Subcategory[]
       |
       +-- Link[]
            |
            +-- Languages (array)
            +-- Status (icon)
            +-- Verified (icon)
            +-- noCreditCard (icon)

DataSource
  |
  +-- Category (references via categoryId)
  +-- JSON files (preproyecto/)

SearchResult (temporary)
  |
  +-- Link (reference)
  +-- Category (reference, for breadcrumbs)
```
