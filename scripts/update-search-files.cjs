/**
 * Actualiza archivos de búsqueda (*-struc.json y nombre-links.json)
 * para las categorías afectadas por la inserción masiva
 */
const { readFileSync, writeFileSync, existsSync } = require("fs");
const { join } = require("path");

const ROOT =
  "c:/Users/User/Documents/programacion2025/repositorio/proyectos/links-frontend-ia-2026";
const DATES = join(ROOT, "src", "data", "dates");
const SEARCH = join(ROOT, "src", "data", "search");

// Colores para tags (rotación)
const TAG_COLORS = [
  "#dc2626",
  "#2563eb",
  "#059669",
  "#d97706",
  "#7c3aed",
  "#db2777",
  "#0891b2",
  "#65a30d",
  "#4f46e5",
  "#c026d3",
  "#ea580c",
  "#0284c7",
  "#9333ea",
  "#16a34a",
  "#b91c1c",
];

const AFFECTED = [
  "dns_seguridad_educacion",
  "ia_asistentes-desarrollo-china-imagen_1",
  "pagos_game-dev_mobile",
  "utilidades_1",
  "diseno-ui-ux_desarrollo_ide",
  "utilidades-2_cms",
  "search_messaging_image_storage",
  "dev-ops_testing_translation",
  "apis-data_databases",
];

for (const cat of AFFECTED) {
  console.log(`\n🔧 Procesando ${cat}...`);

  const recFile = join(DATES, cat, `${cat}-rec.json`);
  const strucFile = join(SEARCH, cat, `${cat}-struc.json`);
  const namesFile = join(SEARCH, cat, "nombre-links.json");

  if (!existsSync(recFile)) {
    console.log(`  ❌ No existe rec: ${recFile}`);
    continue;
  }

  const rec = JSON.parse(readFileSync(recFile, "utf-8"));
  const resources = rec.resources || [];
  const totalResources = resources.length;

  console.log(`  📊 ${totalResources} recursos totales`);

  // ========================================
  // 1. Actualizar nombre-links.json
  // ========================================
  const names = [...new Set(resources.map((r) => r.name))].sort();
  writeFileSync(namesFile, JSON.stringify(names, null, 2));
  console.log(`  ✅ nombre-links.json: ${names.length} nombres`);

  // ========================================
  // 2. Actualizar *-struc.json
  // ========================================
  let struc = {
    tags: {},
    searchIndex: {
      fields: ["name", "description", "tags", "category", "subcategory"],
      entries: [],
    },
    filters: {},
    ui: {},
  };

  if (existsSync(strucFile)) {
    struc = JSON.parse(readFileSync(strucFile, "utf-8"));
  }

  // Recolectar todos los tags con conteo
  const tagCounts = {};
  for (const r of resources) {
    for (const t of r.tags || []) {
      const tag = String(t)
        .toLowerCase()
        .replace(/[^a-z0-9-]/g, "-")
        .substring(0, 50);
      if (tag) tagCounts[tag] = (tagCounts[tag] || 0) + 1;
    }
  }

  // Preservar tags existentes con sus colores, añadir nuevos
  const newTags = {};
  let colorIdx = 0;
  const existingTagNames = Object.keys(struc.tags || {});

  // Primero preservar tags existentes
  for (const tagName of existingTagNames) {
    if (tagCounts[tagName]) {
      newTags[tagName] = {
        ...struc.tags[tagName],
        count: tagCounts[tagName],
      };
      delete tagCounts[tagName]; // Ya procesado
    }
    // Si count=0, lo mantenemos por ahora (podrían eliminarse después)
  }

  // Añadir tags nuevos
  for (const [tagName, count] of Object.entries(tagCounts).sort(
    (a, b) => b[1] - a[1],
  )) {
    if (!newTags[tagName]) {
      newTags[tagName] = {
        count,
        color: TAG_COLORS[colorIdx % TAG_COLORS.length],
        description: `Etiqueta ${tagName}`,
      };
      colorIdx++;
    }
  }

  struc.tags = newTags;

  // Reconstruir searchIndex entries
  const entries = [];
  for (const r of resources) {
    const entry = {
      id: r.id || r.slug,
      name: r.name,
      slug: r.slug,
      description: r.description || "",
      category: r.category,
      subcategory: r.subcategory,
      tags: r.tags || [],
      url: r.url,
      pricing: r.pricing,
      languages: r.languages || ["en"],
      searchText: [
        r.name,
        r.slug,
        r.description,
        r.category,
        r.subcategory,
        ...(r.tags || []),
      ]
        .join(" ")
        .toLowerCase(),
    };
    entries.push(entry);
  }
  struc.searchIndex.entries = entries;

  // Actualizar filters
  const categoryIds = [...new Set(resources.map((r) => r.category))].sort();
  const subcategoryIds = [
    ...new Set(resources.map((r) => r.subcategory)),
  ].sort();
  const pricings = [...new Set(resources.map((r) => r.pricing))].sort();
  const languages = [
    ...new Set(resources.flatMap((r) => r.languages || ["en"])),
  ].sort();

  struc.filters = {
    categories: categoryIds,
    subcategories: subcategoryIds,
    pricing: pricings,
    languages,
    status: ["active", "warning", "deprecated"],
    verified: [true, false],
    noCreditCard: [true, false],
  };

  // Actualizar UI
  const catNames = {
    ai: "AI",
    "education-learning": "Education & Learning",
    "security-vpn": "Security & VPN",
    "dns-domain": "DNS & Domain",
    utilities: "Utilities",
    "game-dev": "Game Dev",
    mobile: "Mobile",
    payments: "Payments & Jobs",
    design: "Design",
    development: "Development",
    databases: "Databases",
    apis: "APIs",
    devops: "DevOps",
    testing: "Testing",
    search: "Search",
    messaging: "Messaging",
    "image-storage": "Image Storage",
    cms: "CMS",
    analytics: "Analytics",
    monitoring: "Monitoring",
    email: "Email",
  };
  const mainCat = categoryIds[0] || cat;
  const catDisplay = catNames[mainCat] || mainCat;

  struc.ui = {
    dataset: cat,
    title: `${catDisplay} Resources - DevResources ${new Date().getFullYear()}`,
    description: `Recursos de ${catDisplay} para desarrolladores`,
    resourceCount: totalResources,
  };

  writeFileSync(strucFile, JSON.stringify(struc, null, 2));
  console.log(
    `  ✅ struc.json: ${Object.keys(newTags).length} tags, ${entries.length} entries`,
  );
}

console.log("\n🎉 Archivos de búsqueda actualizados!");
