/**
 * Corrige IDs duplicados en archivos *-rec.json
 */
const { readFileSync, writeFileSync, existsSync } = require("fs");
const { join } = require("path");

const ROOT =
  "c:/Users/User/Documents/programacion2025/repositorio/proyectos/links-frontend-ia-2026";
const DATES = join(ROOT, "src", "data", "dates");

const catDirs = [
  "analytics-monitoring_email-comunicacion",
  "apis-data_databases",
  "apis-data_databases_managed-db-tools-datasets",
  "dev-ops_testing_translation",
  "diseno-ui-ux_desarrollo_ide",
  "dns_seguridad_educacion",
  "ia_asistentes-desarrollo-china-imagen_1",
  "ia_video-agentes",
  "pagos_game-dev_mobile",
  "search_messaging_image_storage",
  "utilidades-2_cms",
  "utilidades_1",
];

function slugify(text) {
  return text
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .substring(0, 80);
}

for (const cat of catDirs) {
  const fp = join(DATES, cat, `${cat}-rec.json`);
  if (!existsSync(fp)) continue;

  const data = JSON.parse(readFileSync(fp, "utf-8"));
  const resources = data.resources || [];
  const seenIds = new Map();
  let fixed = 0;

  for (const r of resources) {
    const baseId = r.id || slugify(r.name);
    if (seenIds.has(baseId)) {
      const count = seenIds.get(baseId) + 1;
      seenIds.set(baseId, count);
      r.id = `${baseId}-${count}`;
      if (r.slug === baseId) r.slug = r.id;
      // Actualizar searchIndex también
      if (r.searchIndex) {
        const oldSlugIdx = r.searchIndex.indexOf(baseId);
        if (oldSlugIdx >= 0) r.searchIndex[oldSlugIdx] = r.id;
      }
      fixed++;
    } else {
      seenIds.set(baseId, 1);
      r.id = baseId;
    }
  }

  if (fixed > 0) {
    writeFileSync(fp, JSON.stringify(data, null, 2));
    console.log(`✅ ${cat}: ${fixed} IDs corregidos`);
  } else {
    console.log(`  ${cat}: OK (${resources.length} recursos)`);
  }
}

console.log("\n🎉 IDs corregidos!");
