# Documentación y Referencias Técnicas para SEO con Astro + Pagefind

Aquí tienes los enlaces completos a la documentación oficial y referencias de las tecnologías utilizadas en los manuales anteriores.

---

## 📚 1. Astro y Configuración Base

### Astro Core
- **Documentación oficial:** https://docs.astro.build
- **Guía de configuración del sitio:** https://docs.astro.build/en/reference/configuration-reference
- **Enrutamiento y páginas dinámicas:** https://docs.astro.build/en/core-concepts/routing
- **Páginas estáticas y `getStaticPaths`:** https://docs.astro.build/en/reference/api-reference/#getstaticpaths

### Proyectos con datos JSON
- **Trabajando con datos JSON en Astro:** https://docs.astro.build/en/guides/data-fetching/#working-with-json-files
- **Importación de archivos JSON:** https://docs.astro.build/en/guides/imports/#json

---

## 🗺️ 2. Sitemap y SEO Técnico

### @astrojs/sitemap
- **Documentación oficial en Astro:** https://www.astrojs.cn/en/guides/integrations-guide/sitemap 
- **Paquete npm:** https://www.npmjs.com/package/@astrojs/sitemap
- **Repositorio GitHub:** https://github.com/withastro/astro/tree/main/packages/integrations/sitemap

**Opciones avanzadas del sitemap (novedades):**

| Opción | Descripción | Documentación |
|--------|-------------|----------------|
| `customSitemaps` | Incluir sitemaps externos en el sitemap-index.xml | Añadido en v3.5.0  |
| `namespaces` | Control de namespaces XML (news, video, xhtml, image) | Disponible desde v3.6.0  |
| `chunks` | Dividir sitemap por grupos de contenido (WordPress-style) | Añadido en v3.7.0  |

**Configuración de chunks (v3.7+):**
```javascript
// astro.config.mjs
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

export default defineConfig({
  site: 'https://linksdefrontend.com',
  integrations: [
    sitemap({
      chunks: {
        posts: { matcher: /\/link\//, priority: 0.8 },
        categories: { matcher: /\/categoria\//, priority: 0.7 }
      }
    })
  ]
});
```

### Protocolo de Sitemap (estándar XML)
- **Especificación oficial sitemaps.org:** https://www.sitemaps.org/protocol.html
- **Google Sitemaps (documentación):** https://developers.google.com/search/docs/crawling-indexing/sitemaps/overview

### robots.txt
- **Especificación oficial de robots.txt:** https://developers.google.com/search/docs/crawling-indexing/robots/intro
- **Google Robots.txt especificación:** https://www.rfc-editor.org/rfc/rfc9309

---

## 🔎 3. Pagefind - Búsqueda en Sitios Estáticos

### Pagefind Core
- **Documentación oficial:** https://pagefind.app
- **Repo GitHub:** https://github.com/CloudCannon/pagefind
- **Guía de inicio rápido:** https://pagefind.app/docs
- **Atributos de indexación (`data-pagefind-*`):** https://pagefind.app/docs/indexing/#excluding-content
- **API de Pagefind UI:** https://pagefind.app/docs/ui

### astro-pagefind (Integración)
- **Paquete npm:** https://www.npmjs.com/package/astro-pagefind 
- **CDN jsDelivr:** https://www.jsdelivr.com/package/npm/astro-pagefind 

**Uso con Astro:**
```bash
npm install astro-pagefind
```

```javascript
// astro.config.mjs
import pagefind from 'astro-pagefind';

export default {
  integrations: [pagefind()]
};
```

### Pagefind Default UI
- **Paquete npm:** https://www.npmjs.com/package/@pagefind/default-ui
- **Estilos CSS:** https://pagefind.app/docs/ui/#default-ui-styles

### Alternativas de búsqueda
- **Starlight DocSearch (Algolia):** https://starlight.astro.build/guides/site-search/ 
- **Starlight DocSearch Typesense (self-hosted):** https://github.com/HiDeoo/starlight-docsearch-typesense 

---

## 🤖 4. llms.txt y GEO (Generative Engine Optimization)

### Especificación llms.txt
- **Sitio oficial del estándar:** https://llmstxt.org 
- **Especificación completa:** https://llmstxt.org/spec
- **Repositorio GitHub:** https://github.com/AnswerDotAI/llms-txt

**Estructura requerida del archivo:**
1. Línea 1: `# Título del Proyecto`
2. Línea 3: `> Resumen en una sola línea`
3. Contenido adicional sin headings
4. Sección final con links en lista

### Herramientas para llms.txt
- **@polyseam/llms-txt (validador/npx):** https://jsr.io/@polyseam/llms-txt 
- **llms-txt CLI (Deno):** `deno run -A jsr:@polyseam/llms-txt fmt`
- **Generador online:** https://llmstxt.org/generator

---

## 📊 5. SEO General y Buenas Prácticas

### Componente SEO para Astro
- **Implementación de SEO.astro (ejemplo):** https://github.com/search?q=SEO.astro+astro&type=code 
- **Estructura de metadatos recomendada:** https://docs.astro.build/en/guides/seo

### JSON-LD (Datos Estructurados)
- **Especificación oficial Schema.org:** https://schema.org
- **Guía de Google para datos estructurados:** https://developers.google.com/search/docs/appearance/structured-data/search-gallery
- **Tipos recomendados para directorios:**
  - `ItemList`: https://schema.org/ItemList
  - `BreadcrumbList`: https://schema.org/BreadcrumbList
  - `CollectionPage`: https://schema.org/CollectionPage
  - `Article`: https://schema.org/Article

### Google Search Console y Validación
- **Google Search Console:** https://search.google.com/search-console
- **Rich Results Test:** https://search.google.com/test/rich-results
- **PageSpeed Insights:** https://pagespeed.web.dev
- **Mobile-Friendly Test:** https://search.google.com/test/mobile-friendly

---

## 🧩 6. Tecnologías Adicionales Recomendadas

### Astro Integraciones SEO
- **@astrojs/sitemap** (v3.7+): https://www.npmjs.com/package/@astrojs/sitemap
- **astro-robots-txt:** https://www.npmjs.com/package/astro-robots-txt
- **astro-seo:** https://www.npmjs.com/package/astro-seo

### Herramientas de Análisis
- **Lighthouse CI:** https://github.com/GoogleChrome/lighthouse-ci
- **Web Vitals:** https://web.dev/vitals

### Framework UI para Búsqueda
- **Pagefind Default UI:** https://pagefind.app/docs/ui
- **Tailwind CSS (opcional):** https://tailwindcss.com

---

## 📋 7. Referencias Rápidas - Cheat Sheet

| Tecnología | Enlace | Uso |
|------------|--------|-----|
| Astro Docs | https://docs.astro.build | Framework base |
| @astrojs/sitemap | https://docs.astro.build/en/guides/integrations-guide/sitemap | Mapa del sitio |
| Pagefind | https://pagefind.app | Búsqueda interna |
| llms.txt spec | https://llmstxt.org | SEO para IA |
| Schema.org | https://schema.org | JSON-LD |
| Google Search Console | https://search.google.com/search-console | Monitoreo SEO |

---

## 🔧 8. Ejemplos de Configuración (Repositorios de Referencia)

### Configuración de sitemap con chunks
**Referencia:** https://github.com/frontman-ai/frontman/issues/579 

### Integración Pagefind con Astro
**Referencia:** https://starlight.astro.build/guides/site-search/ 

### Componente SEO.astro
**Referencia:** https://github.com/ishinova/ishinova.co.jp/issues/50 

---

Con esta documentación completa, "Links de Frontend" tendrá acceso directo a todas las referencias necesarias para implementar el SEO óptimo con Astro, sitemaps avanzados, Pagefind y optimización para motores de IA.