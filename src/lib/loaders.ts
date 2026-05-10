import type { Category, Link, Subcategory } from "@/interfaces/categories";
import fs from "fs";
import path from "path";

const DATA_ROOT = path.join(process.cwd(), "src", "data");
const DATES_ROOT = path.join(DATA_ROOT, "dates");
const SEARCH_ROOT = path.join(DATA_ROOT, "search");

// Load a single category's JSON data
export async function loadCategory(
  categoryId: string,
): Promise<Category | null> {
  try {
    const recPath = path.join(DATES_ROOT, categoryId, `${categoryId}-rec.json`);
    const strucPath = path.join(
      SEARCH_ROOT,
      categoryId,
      `${categoryId}-struc.json`,
    );

    if (!fs.existsSync(recPath)) {
      return null;
    }

    const recData = JSON.parse(fs.readFileSync(recPath, "utf-8"));
    const strucData = fs.existsSync(strucPath)
      ? JSON.parse(fs.readFileSync(strucPath, "utf-8"))
      : {};

    // Transform raw data into Category structure
    // Generate name and description from category ID with special formatting
    let formattedName = categoryId
      .replace(/-/g, " ")
      .replace(/_/g, " ")
      .replace(/\b\w/g, (c) => c.toUpperCase()); // Capitalize first letter of each word

    // Special case replacements for better readability
    const replacements: Record<string, string> = {
      "Apis Data Databases": "APIs, Data & Databases",
      "Apis Data Databases Managed Db Tools Datasets":
        "APIs, Data & Databases (Managed DB Tools & Datasets)",
      "Dev Ops Testing Translation": "DevOps, Testing & Translation",
      "Diseno Ui Ux Desarrollo Ide": "Diseño UI/UX & Desarrollo IDE",
      "Dns Seguridad Educacion": "DNS, Seguridad & Educación",
      "Ia Asistentes Desarrollo China Imagen 1":
        "🤖 IA: Asistentes, Desarrollo, China & Imagen",
      "Ia Video Agentes": "🎬 IA: Video & Agentes",
      "Pagos Game Dev Mobile": "💳 Pagos, Game Dev & Mobile",
      "Search Messaging Image Storage":
        "🔍 Búsqueda, Mensajería, Imagen & Storage",
      "Utilidades 1": "🛠️ Utilidades",
      "Utilidades 2 Cms": "🛠️ Utilidades & CMS",
      "Analytics Monitoring Email Comunicacion":
        "📊 Analytics, Monitoring, Email & Comunicación",
    };

    if (replacements[formattedName]) {
      formattedName = replacements[formattedName];
    }

    const category: Category = {
      id: categoryId,
      name: formattedName,
      description: `Recursos de ${formattedName}`,
      slug: categoryId,
      subcategories: buildSubcategories(recData, strucData),
      order: strucData.order,
      icon: strucData.icon,
    };

    return category;
  } catch (error) {
    console.error(`Error loading category ${categoryId}:`, error);
    return null;
  }
}

// Load all categories
export async function loadAllCategories(): Promise<Category[]> {
  const categories: Category[] = [];

  try {
    if (!fs.existsSync(DATES_ROOT)) {
      console.warn(`Data path not found: ${DATES_ROOT}`);
      return categories;
    }

    const dirs = fs.readdirSync(DATES_ROOT);

    for (const dir of dirs) {
      const fullPath = path.join(DATES_ROOT, dir);
      const recPath = path.join(fullPath, `${dir}-rec.json`);

      if (fs.statSync(fullPath).isDirectory() && fs.existsSync(recPath)) {
        const category = await loadCategory(dir);
        if (category) {
          categories.push(category);
        }
      }
    }

    // Sort by order if available
    categories.sort((a, b) => (a.order || 999) - (b.order || 999));
  } catch (error) {
    console.error("Error loading all categories:", error);
  }

  return categories;
}

// Load all resources from all categories for global search
export interface GlobalResource {
  id: string;
  name: string;
  description: string;
  url: string;
  tags: string[];
  searchIndex: string[];
  category: string;
  subcategory: string;
  pricing: "free" | "freemium" | "premium" | "paid";
  languages: string[];
}

export interface SeoDiscoveryIndex {
  categories: string[];
  categorySlugs: string[];
  tags: string[];
  searchIndex: string[];
}

export async function loadAllResources(): Promise<GlobalResource[]> {
  const allResources: GlobalResource[] = [];

  try {
    if (!fs.existsSync(DATES_ROOT)) {
      console.warn(`Data path not found: ${DATES_ROOT}`);
      return allResources;
    }

    const dirs = fs.readdirSync(DATES_ROOT);

    for (const dir of dirs) {
      const fullPath = path.join(DATES_ROOT, dir);
      const recPath = path.join(fullPath, `${dir}-rec.json`);

      if (fs.statSync(fullPath).isDirectory() && fs.existsSync(recPath)) {
        const recData = JSON.parse(fs.readFileSync(recPath, "utf-8"));

        if (Array.isArray(recData?.resources)) {
          for (const resource of recData.resources) {
            allResources.push({
              id:
                resource.id ||
                resource.name?.toLowerCase().replace(/\s+/g, "-"),
              name: resource.name || "",
              description: resource.description || "",
              url: resource.url || "",
              tags: resource.tags || [],
              searchIndex: Array.isArray(resource.searchIndex)
                ? resource.searchIndex
                : [],
              category: dir,
              subcategory: resource.subcategory || "all",
              pricing: resource.pricing || "free",
              languages: resource.languages || ["es", "en"],
            });
          }
        }
      }
    }
  } catch (error) {
    console.error("Error loading all resources:", error);
  }

  return allResources;
}

export async function loadSeoDiscoveryIndex(): Promise<SeoDiscoveryIndex> {
  const categories = await loadAllCategories();
  const resources = await loadAllResources();

  return {
    categories: uniqueStrings(categories.map((category) => category.name)),
    categorySlugs: uniqueStrings(categories.map((category) => category.slug)),
    tags: uniqueStrings(resources.flatMap((resource) => resource.tags)),
    searchIndex: uniqueStrings(
      resources.flatMap((resource) => resource.searchIndex),
    ),
  };
}

// Helper: Transform raw JSON into subcategories
function buildSubcategories(recData: any, strucData: any): Subcategory[] {
  const subcategories: Subcategory[] = [];
  const metadataEntries = Array.isArray(recData?.subcategories)
    ? recData.subcategories
    : [];
  const metadataMap = new Map(
    metadataEntries
      .filter((subcategory: any) => subcategory && subcategory.id)
      .map((subcategory: any, index: number) => [
        subcategory.id,
        { ...subcategory, index },
      ]),
  );

  if (Array.isArray(recData?.resources)) {
    const groupedResources = new Map<string, any[]>();

    for (const resource of recData.resources) {
      const subcategoryId = resource?.subcategory || "all";
      const existing = groupedResources.get(subcategoryId) || [];
      existing.push(resource);
      groupedResources.set(subcategoryId, existing);
    }

    for (const [subcategoryId, links] of groupedResources.entries()) {
      const metadata = (metadataMap.get(subcategoryId) || {}) as {
        name?: string;
        description?: string;
        order?: number;
        index?: number;
      };

      subcategories.push({
        id: subcategoryId,
        name: metadata.name ?? subcategoryId,
        description: metadata.description ?? "",
        links: links.map((item) => transformLink(item)),
        order: metadata.order ?? metadata.index,
      });
    }

    subcategories.sort((a, b) => (a.order ?? 999) - (b.order ?? 999));
    return subcategories;
  }

  // If recData is an array, treat it as flat links in default subcategory
  if (Array.isArray(recData)) {
    return [
      {
        id: "all",
        name: strucData.defaultSubcategory || "Resources",
        links: recData.map((item) => transformLink(item)),
      },
    ];
  }

  // If recData is an object with subcategories
  if (typeof recData === "object") {
    Object.entries(recData).forEach(([key, value]: [string, any]) => {
      if (Array.isArray(value)) {
        const metadata = (strucData.subcategories?.[key] ||
          metadataMap.get(key) ||
          {}) as {
          name?: string;
          description?: string;
          order?: number;
          index?: number;
        };

        subcategories.push({
          id: key,
          name: metadata.name ?? key,
          description: metadata.description ?? "",
          links: value.map((item) => transformLink(item)),
          order: metadata.order ?? metadata.index,
        });
      }
    });
  }

  // Sort by order
  subcategories.sort((a, b) => (a.order || 999) - (b.order || 999));
  return subcategories;
}

// Helper: Transform raw link object
function transformLink(rawLink: any): Link {
  const tags = Array.isArray(rawLink.tags)
    ? Array.from(new Set(rawLink.tags))
    : [];
  const searchIndex = Array.isArray(rawLink.searchIndex)
    ? Array.from(new Set(rawLink.searchIndex))
    : [];

  return {
    name: rawLink.name || "",
    description: rawLink.description || "",
    url: rawLink.url || "",
    status: rawLink.status === "active" ? "active" : "inactive",
    pricing: rawLink.pricing || "free",
    languages: Array.isArray(rawLink.languages)
      ? rawLink.languages
      : [rawLink.languages || "en"],
    tags: tags as string[],
    searchIndex: searchIndex as string[],
    limits: rawLink.limits,
    verified: rawLink.verified ?? false,
    noCreditCard: rawLink.noCreditCard ?? true,
  };
}

// Validate path lengths for GitHub safety
export function validatePathLengths(categoryId: string): {
  valid: boolean;
  message?: string;
} {
  const categoryPath = path.join(DATES_ROOT, categoryId);

  if (categoryPath.length > 260) {
    return {
      valid: false,
      message: `Path too long for GitHub (${categoryPath.length} chars): ${categoryPath}`,
    };
  }

  return { valid: true };
}

function uniqueStrings(values: Array<string | undefined | null>): string[] {
  return [
    ...new Set(
      values.filter(Boolean).map((value) => value!.trim().toLowerCase()),
    ),
  ];
}
