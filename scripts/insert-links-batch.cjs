/**
 * INSERT LINKS BATCH - Versión final
 * Inserta 489 links desde links-insertados.md en archivos *-rec.json
 */
const { readFileSync, writeFileSync, existsSync } = require("fs");
const { join } = require("path");

const ROOT =
  "c:/Users/User/Documents/programacion2025/repositorio/proyectos/links-frontend-ia-2026";
const DATES = join(ROOT, "src", "data", "dates");
const TODAY = "2026-06-24";

function slugify(text) {
  return text
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .substring(0, 80);
}

function categorize(name, url, section) {
  const u = url.toLowerCase();
  const n = name.toLowerCase();

  // YouTube → learning
  if (u.includes("youtube.com") || u.includes("youtu.be")) {
    return {
      cat: "dns_seguridad_educacion",
      catId: "education-learning",
      subcatId: "programming-courses",
      tags: ["youtube", "video", "tutorial", "learning"],
    };
  }
  // arXiv/papers → learning
  if (
    u.includes("arxiv.org") ||
    u.includes("ssrn.com") ||
    u.includes("biorxiv.org") ||
    u.includes("eurekalert.org") ||
    u.includes("mdpi.com") ||
    u.includes("researchgate.net")
  ) {
    return {
      cat: "dns_seguridad_educacion",
      catId: "education-learning",
      subcatId: "programming-courses",
      tags: ["research", "paper", "ai"],
    };
  }
  // HuggingFace → AI
  if (u.includes("huggingface.co")) {
    return {
      cat: "ia_asistentes-desarrollo-china-imagen_1",
      catId: "ai",
      subcatId: "development",
      tags: ["ai", "model", "huggingface", "open-source"],
    };
  }
  // Google Drive/Colab → learning
  if (
    u.includes("drive.google.com") ||
    u.includes("colab.research.google.com")
  ) {
    return {
      cat: "dns_seguridad_educacion",
      catId: "education-learning",
      subcatId: "programming-courses",
      tags: ["learning", "resource"],
    };
  }
  // University → learning
  if (
    u.includes("stanford.edu") ||
    u.includes("mit.edu") ||
    u.includes("cmu.edu") ||
    u.includes("harvard.edu") ||
    u.includes("illinois.edu") ||
    u.includes("cam.ac.uk") ||
    u.includes("csail.mit.edu") ||
    u.includes("mooc.fi") ||
    u.includes("aalto.fi")
  ) {
    return {
      cat: "dns_seguridad_educacion",
      catId: "education-learning",
      subcatId: "programming-courses",
      tags: ["education", "university", "learning"],
    };
  }
  // SQL/DB learning sites
  if (
    /sqlzoo|datalemur|sql-practice|mystery\.knightlab|sql-easy|aprendesql|databaseschool/.test(
      u,
    )
  ) {
    return {
      cat: "dns_seguridad_educacion",
      catId: "education-learning",
      subcatId: "programming-courses",
      tags: ["sql", "database", "learning", "tutorial"],
    };
  }
  // Learning sites
  if (
    /mltut\.com|clcoding\.com|patterns\.dev|algorithmica\.org|algorithmsbook|deeplearningbook|mlsysbook|marl-book|fairmlbook|probml\.github|cs50\.harvard|digitallearn\.org|commoncraft\.com|ocw\.mit\.edu|programming-25\.mooc|makingsoftware\.com|ppc\.cs\.aalto|cstack\.github|0xkato\.xyz|bbycroft\.net|turingpost\.com|cameronrwolfe/.test(
      u,
    )
  ) {
    return {
      cat: "dns_seguridad_educacion",
      catId: "education-learning",
      subcatId: "programming-courses",
      tags: ["education", "learning", "tutorial"],
    };
  }

  // GitHub repos
  if (u.includes("github.com")) {
    // Security/VPN
    if (
      /security|vpn|hack|pentest|cyber|firewall|malware|exploit|cve|oblivion|shard|masterdnsvpn|viper[^a-z]|ane[^a-z]|beelzebub|dsvpn|tpotce|portmaster|pangolin|seekerclaw|whatsapp.*reveng/i.test(
        n,
      )
    ) {
      return {
        cat: "dns_seguridad_educacion",
        catId: "security-vpn",
        subcatId: "security-auth",
        tags: ["security", "github"],
      };
    }
    // Databases
    if (
      /database|sql|postgres|mysql|duckdb|rushdb|tencentdb|cocoindex|databaseschool/i.test(
        n,
      )
    ) {
      return {
        cat: "apis-data_databases",
        catId: "databases",
        subcatId: "learning",
        tags: ["database", "github"],
      };
    }
    // DevOps
    if (/devops|docker|container|kubernetes|ci.cd|digger|webvm/i.test(n)) {
      return {
        cat: "dev-ops_testing_translation",
        catId: "devops",
        subcatId: "tools",
        tags: ["devops", "github"],
      };
    }
    // UI/Design
    if (
      /ui[^a-z]|design|css|tailwind|component|animation|carousel|blossom|html.to.design|ui.skills|component.party|headroom|flowkit|npxskillui|icon|font|color|template/i.test(
        n,
      )
    ) {
      return {
        cat: "diseno-ui-ux_desarrollo_ide",
        catId: "design",
        subcatId: "components",
        tags: ["design", "ui", "github"],
      };
    }
    // Video/Audio
    if (
      /video|audio|tts|voice|sound|music|song|film|radarr|sonarr|freetube|video2x|lutts|omnilingual.asr|audiobook|vinci.clips|claude.code.video|openvid|x.voice|voice.pro|whisper|sadtalker/i.test(
        n,
      )
    ) {
      return {
        cat: "ia_asistentes-desarrollo-china-imagen_1",
        catId: "ai",
        subcatId: "development",
        tags: ["ai", "video", "audio", "github"],
      };
    }
    // Game/3D/Robotics
    if (
      /game|godot|unity|unreal|3d|slam|robot|avatar|sysmocap|liveavatar|chatgarment|catvton|personalive|openhuman|vibearound|ai.avatar|abot|masfactory|algorithmvisualizer|manimml|robocrew|roboos|cactus/i.test(
        n,
      )
    ) {
      return {
        cat: "pagos_game-dev_mobile",
        catId: "game-dev",
        subcatId: "engines",
        tags: ["game-dev", "3d", "github"],
      };
    }
    // Finance/Trading/Jobs
    if (
      /payment|stripe|finance|trading|stock|market|freqtrade|quantdinger|tradingagent|quant.mind|polymarket|job|resume|lean|auto.job|solo.founder|startup|skillsmp|project.ideas/i.test(
        n,
      )
    ) {
      return {
        cat: "pagos_game-dev_mobile",
        catId: "payments",
        subcatId: "jobs",
        tags: ["monetization", "jobs", "github"],
      };
    }
    // Search/Messaging/OCR
    if (
      /search|messag|telegram|whatsapp|messenger|ocr|paddleocr|glm.ocr|omniparse|surya|geminiwatermark|imgto|callmebot|utell/i.test(
        n,
      )
    ) {
      return {
        cat: "search_messaging_image_storage",
        catId: "search",
        subcatId: "search",
        tags: ["search", "messaging", "github"],
      };
    }
    // CMS/Content
    if (
      /cms|blog|wiki|obsidian|notion|markdown|content|pdfslick|open.pencil|dolphin[^a-z]|hyper.extract|document/i.test(
        n,
      )
    ) {
      return {
        cat: "utilidades-2_cms",
        catId: "cms",
        subcatId: "platforms",
        tags: ["cms", "content", "github"],
      };
    }
    // Utilities/Tools
    if (
      /utility|tool|windows|win11|browser|extension|converter|downloader|awesome.free|clone.wars|win11debloat|portable.ai|browserai|circleto|opentabs|every.programmer|cua[^a-z]|get.it|skales/i.test(
        n,
      )
    ) {
      return {
        cat: "utilidades_1",
        catId: "utilities",
        subcatId: "productivity",
        tags: ["utilities", "tools", "github"],
      };
    }
    // Analytics
    if (/analytics|monitor|uptime|error.track|performance|seo.tool/i.test(n)) {
      return {
        cat: "analytics-monitoring_email-comunicacion",
        catId: "analytics",
        subcatId: "web-analytics",
        tags: ["analytics", "github"],
      };
    }
    // Default AI
    return {
      cat: "ia_asistentes-desarrollo-china-imagen_1",
      catId: "ai",
      subcatId: "development",
      tags: ["ai", "development", "github"],
    };
  }

  // Web resources
  if (section.includes("Productividad") || /fmhy/.test(u)) {
    return {
      cat: "utilidades_1",
      catId: "utilities",
      subcatId: "productivity",
      tags: ["productivity", "utilities"],
    };
  }
  if (section.includes("IA Herramientas")) {
    return {
      cat: "ia_asistentes-desarrollo-china-imagen_1",
      catId: "ai",
      subcatId: "development",
      tags: ["ai", "tool"],
    };
  }
  if (
    /skool|skillsmp|job|resume|hire|career|salary|freelance|monet/.test(n + u)
  ) {
    return {
      cat: "pagos_game-dev_mobile",
      catId: "payments",
      subcatId: "jobs",
      tags: ["jobs", "monetization"],
    };
  }
  if (/template|theme|shipfree|convex\.dev|astro\.build/.test(n + u)) {
    return {
      cat: "diseno-ui-ux_desarrollo_ide",
      catId: "design",
      subcatId: "templates",
      tags: ["design", "templates"],
    };
  }

  // Default learning
  return {
    cat: "dns_seguridad_educacion",
    catId: "education-learning",
    subcatId: "programming-courses",
    tags: ["learning", "resource"],
  };
}

function getPricing(name, desc) {
  const t = `${name} ${desc}`.toLowerCase();
  if (/premium|paid|pago/.test(t)) return "premium";
  if (/freemium/.test(t)) return "freemium";
  if (/free.trial/.test(t)) return "free-trial";
  return "free";
}

function getLanguages(url, name) {
  const t = `${url} ${name}`.toLowerCase();
  if (
    /\/es\/|\/es-419|español|spanish|sql-easy\.com\/es|filmora.*\.es|aprendesql|blink\.new\/es/.test(
      t,
    )
  )
    return ["en", "es"];
  return ["en"];
}

// ============================================================
console.log("🔍 Leyendo links-insertados.md...");
const content = readFileSync(
  join(ROOT, "preproyecto", "links-insertados.md"),
  "utf-8",
);
const lines = content.split("\n");

const links = [];
let section = "";
for (const line of lines) {
  const sm = line.match(/^## (.+)/);
  if (sm) {
    section = sm[1].includes("Segunda tanda") ? "Segunda tanda" : sm[1].trim();
    continue;
  }
  const um = line.match(/\((https?:\/\/[^\)]+)\)/);
  const nm = line.match(/\|\s*\*\*([^*]+)\*\*\s*\|/);
  if (um && nm) {
    const descParts = line.split("|");
    let desc =
      descParts.length >= 3
        ? descParts[2].replace(/[*_]/g, "").trim().substring(0, 40)
        : "";
    let url = um[1].trim();
    // Normalizar URL
    url = url.replace(
      /[?&](utm_[^&]+|fbclid=[^&]+|gclid=[^&]+|si=[^&]+)/gi,
      "",
    );
    url = url.replace(/playlist\?lits=/gi, "playlist?list=");
    links.push({
      url,
      name: nm[1].replace(/[*_]/g, "").trim(),
      description: desc,
      section,
    });
  }
}
console.log(`📊 Links extraídos: ${links.length}`);

// URLs existentes
const existingUrls = new Set();
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
for (const d of catDirs) {
  const fp = join(DATES, d, `${d}-rec.json`);
  if (existsSync(fp)) {
    const data = JSON.parse(readFileSync(fp, "utf-8"));
    if (data.resources)
      for (const r of data.resources) {
        const clean = r.url.trim().replace(/\/$/, "").toLowerCase();
        existingUrls.add(clean);
        existingUrls.add(clean.replace(/^https?:\/\//, ""));
      }
  }
}
console.log(`📚 URLs existentes: ${existingUrls.size}`);

// Filtrar nuevos
const newLinks = links.filter((l) => {
  const nu = l.url.trim().replace(/\/$/, "").toLowerCase();
  return (
    !existingUrls.has(nu) && !existingUrls.has(nu.replace(/^https?:\/\//, ""))
  );
});
console.log(`✨ Links nuevos: ${newLinks.length}`);
if (newLinks.length === 0) {
  console.log("✅ Nada que insertar.");
  process.exit(0);
}

// Categorizar y generar recursos
const batches = {};
for (const link of newLinks) {
  const cat = categorize(link.name, link.url, link.section);
  const pricing = getPricing(link.name, link.description);
  const langs = getLanguages(link.url, link.name);
  const slug = slugify(link.name);

  const resource = {
    id: slug,
    name: link.name,
    slug,
    description: link.description || link.name,
    url: link.url,
    status: "active",
    tags: [...new Set([...cat.tags, cat.subcatId])],
    searchIndex: [
      link.name,
      slug,
      link.description || link.name,
      cat.catId,
      cat.subcatId,
      ...cat.tags.slice(0, 4),
    ],
    category: cat.catId,
    subcategory: cat.subcatId,
    pricing,
    languages: langs,
    limits: pricing === "free" ? "no-limits" : "freemium",
    added: TODAY,
    verified: false,
    noCreditCard: pricing === "free",
  };

  if (!batches[cat.cat]) batches[cat.cat] = [];
  batches[cat.cat].push(resource);
}

// Mostrar distribución
console.log("\n📋 Distribución por archivo:");
for (const [k, v] of Object.entries(batches).sort(
  (a, b) => b[1].length - a[1].length,
)) {
  console.log(`  ${k}: ${v.length}`);
}

// Insertar
const results = {};
for (const [catKey, resources] of Object.entries(batches)) {
  const fp = join(DATES, catKey, `${catKey}-rec.json`);
  if (!existsSync(fp)) {
    console.log(`❌ No existe: ${fp}`);
    continue;
  }

  const data = JSON.parse(readFileSync(fp, "utf-8"));
  data.resources.push(...resources);

  // Actualizar contadores de subcategorías
  for (const res of resources) {
    if (data.subcategories) {
      const subcat = data.subcategories.find((s) => s.id === res.subcategory);
      if (subcat) subcat.resourceCount = (subcat.resourceCount || 0) + 1;
    }
    if (data.categories) {
      if (Array.isArray(data.categories)) {
        const cat = data.categories.find((c) => c.id === res.category);
        if (cat) cat.resourceCount = (cat.resourceCount || 0) + 1;
      } else if (data.categories.id === res.category) {
        data.categories.resourceCount =
          (data.categories.resourceCount || 0) + 1;
      }
    }
  }

  writeFileSync(fp, JSON.stringify(data, null, 2));
  results[catKey] = resources.length;
  console.log(
    `✅ ${catKey}: +${resources.length} → ${data.resources.length} total`,
  );
}

const total = Object.values(results).reduce((a, b) => a + b, 0);
console.log(
  `\n🎉 TOTAL INSERTADO: ${total} links en ${Object.keys(results).length} archivos`,
);
