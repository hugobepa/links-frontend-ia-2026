# Manual SEO + Pagefind para "Links de Frontend" con Astro y JSON

Este manual completo cubre todo lo necesario para optimizar tu web "Links de Frontend" para buscadores, implementar búsqueda interna con Pagefind y configurar sitemaps profesionales.

---

## 1. Arquitectura de Datos (JSON)

### Estructura Recomendada

```json
// src/data/frontend-links.json
{
  "links": [
    {
      "id": "react-19-guia",
      "titulo": "React 19 - Guía Completa",
      "descripcion": "Aprende todas las novedades de React 19 y cómo implementarlas",
      "slug": "react-19-guia-completa",
      "categoria": "frameworks",
      "categoriaNombre": "Frameworks JavaScript",
      "autor": "Carlos Frontend",
      "fecha": "2025-03-15",
      "imagen": "/images/react-19.jpg",
      "enlaceExterno": "https://ejemplo.com/react-19",
      "dificultad": "intermedio",
      "tags": ["react", "javascript", "frontend"]
    }
  ],
  "categorias": [
    {
      "slug": "frameworks",
      "nombre": "Frameworks JavaScript",
      "descripcion": "Los mejores frameworks para desarrollo frontend",
      "icono": "⚛️"
    }
  ]
}
```

---

## 2. Configuración Base de Astro (`astro.config.mjs`)

```javascript
// astro.config.mjs
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

export default defineConfig({
  site: 'https://linksdefrontend.com', // 🔴 CAMBIA por tu dominio real
  trailingSlash: 'never',
  integrations: [
    sitemap({
      // Configuración optimizada para directorio de links
      filter: (page) => {
        // Excluir páginas administrativas o innecesarias
        return !page.includes('/admin/') && 
               !page.includes('/search/') &&
               !page.includes('pagefind');
      },
      changefreq: 'weekly',
      priority: 0.7,
      // Personalizar prioridad por tipo de página
      serialize: (item) => {
        if (item.url.includes('/categoria/')) {
          return { ...item, priority: 0.8, changefreq: 'weekly' };
        }
        if (item.url.includes('/link/')) {
          return { ...item, priority: 0.6, changefreq: 'monthly' };
        }
        return item;
      }
    })
  ]
});
```

**Instalación de dependencias:**
```bash
npm install @astrojs/sitemap
npm install pagefind @pagefind/default-ui
```

---

## 3. Componente SEO Avanzado (`SEO.astro`)

```astro
---
// src/components/SEO.astro

export interface Props {
  title: string;
  description: string;
  image?: string;
  url?: string;
  type?: 'website' | 'article' | 'collection';
  publishedTime?: string;
  author?: string;
  breadcrumbs?: Array<{ name: string; url: string }>;
  category?: string;
  tags?: string[];
  noindex?: boolean;
}

const {
  title,
  description,
  image,
  url,
  type = 'website',
  publishedTime,
  author,
  breadcrumbs = [],
  category,
  tags = [],
  noindex = false,
} = Astro.props;

const siteURL = import.meta.env.SITE || 'https://linksdefrontend.com';
const pageURL = url ? new URL(url, siteURL).href : Astro.url.href;
const imageURL = image ? new URL(image, siteURL).href : `${siteURL}/og-default.jpg`;

// Construir keywords para meta tags
const keywords = [category, ...tags].filter(Boolean).join(', ');
---

<title>{title}</title>
<meta name="description" content={description} />
<link rel="canonical" href={pageURL} />

{noindex && <meta name="robots" content="noindex, follow" />}

<!-- Open Graph -->
<meta property="og:title" content={title} />
<meta property="og:description" content={description} />
<meta property="og:image" content={imageURL} />
<meta property="og:url" content={pageURL} />
<meta property="og:type" content={type === 'article' ? 'article' : 'website'} />
<meta property="og:site_name" content="Links de Frontend" />

<!-- Twitter Card -->
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:title" content={title} />
<meta name="twitter:description" content={description} />
<meta name="twitter:image" content={imageURL} />

<!-- Meta adicionales para SEO -->
<meta name="keywords" content={keywords} />
<meta name="author" content={author || "Links de Frontend"} />

<!-- Breadcrumbs JSON-LD -->
{
  breadcrumbs.length > 0 && (
    <script type="application/ld+json" set:html={JSON.stringify({
      "@context": "https://schema.org",
      "@type": "BreadcrumbList",
      "itemListElement": breadcrumbs.map((item, index) => ({
        "@type": "ListItem",
        "position": index + 1,
        "name": item.name,
        "item": new URL(item.url, siteURL).href
      }))
    })} />
  )
}
```

---

## 4. Página Base con Marcado para Pagefind

Componente `BaseLayout.astro` con marcas para Pagefind:

```astro
---
// src/layouts/BaseLayout.astro
import SEO from '../components/SEO.astro';
import '../styles/global.css';

export interface Props {
  title: string;
  description: string;
  image?: string;
  type?: 'website' | 'article' | 'collection';
  breadcrumbs?: Array<{ name: string; url: string }>;
}

const { title, description, image, type, breadcrumbs } = Astro.props;
---

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <SEO {title} {description} {image} {type} {breadcrumbs} />
</head>
<body>
  <!-- Header - NO se indexa en Pagefind -->
  <header data-pagefind-ignore>
    <nav aria-label="Principal">
      <!-- contenido del nav -->
    </nav>
  </header>

  <!-- MAIN CONTENT - SÍ se indexa en Pagefind -->
  <main id="main-content" data-pagefind-body>
    <slot />
  </main>

  <!-- Footer - NO se indexa en Pagefind -->
  <footer data-pagefind-ignore>
    <!-- contenido del footer -->
  </footer>
</body>
</html>
```

---

## 5. Páginas Dinámicas con Datos desde JSON

### Página de Links (Detalle)
`src/pages/link/[slug].astro`

```astro
---
// src/pages/link/[slug].astro
import BaseLayout from '../../layouts/BaseLayout.astro';
import data from '../../data/frontend-links.json';

export async function getStaticPaths() {
  return data.links.map(link => ({
    params: { slug: link.slug },
    props: { link }
  }));
}

const { link } = Astro.props;

const breadcrumbs = [
  { name: "Inicio", url: "/" },
  { name: link.categoriaNombre, url: `/categoria/${link.categoria}` },
  { name: link.titulo, url: `#` }
];
---

<BaseLayout 
  title={`${link.titulo} | Links de Frontend`}
  description={link.descripcion}
  image={link.imagen}
  type="article"
  breadcrumbs={breadcrumbs}
>
  <article>
    <h1>{link.titulo}</h1>
    <p class="description">{link.descripcion}</p>
    
    <div class="metadata">
      <span class="category">📁 {link.categoriaNombre}</span>
      <span class="date">📅 {link.fecha}</span>
      <span class="difficulty">🎯 {link.dificultad}</span>
    </div>

    <!-- Enlace externo con nofollow -->
    <a 
      href={link.enlaceExterno} 
      target="_blank" 
      rel="noopener noreferrer nofollow"
      class="external-link"
    >
      Ver recurso original →
    </a>
  </article>
</BaseLayout>
```

### Página de Categoría
`src/pages/categoria/[slug].astro`

```astro
---
// src/pages/categoria/[slug].astro
import BaseLayout from '../../layouts/BaseLayout.astro';
import data from '../../data/frontend-links.json';

export async function getStaticPaths() {
  const categorias = [...new Map(
    data.links.map(link => [link.categoria, {
      slug: link.categoria,
      nombre: link.categoriaNombre,
    }])
  ).values()];

  return categorias.map(cat => ({
    params: { slug: cat.slug },
    props: { categoria: cat }
  }));
}

const { categoria } = Astro.props;
const linksCategoria = data.links.filter(link => link.categoria === categoria.slug);

const breadcrumbs = [
  { name: "Inicio", url: "/" },
  { name: categoria.nombre, url: "#" }
];
---

<BaseLayout
  title={`${categoria.nombre} | Links de Frontend`}
  description={`Los mejores recursos sobre ${categoria.nombre}. Tutoriales, herramientas y guías actualizadas.`}
  type="collection"
  breadcrumbs={breadcrumbs}
>
  <h1>{categoria.nombre}</h1>
  
  <div class="category-stats">
    {linksCategoria.length} recursos disponibles
  </div>

  <div class="links-grid">
    {linksCategoria.map(link => (
      <a href={`/link/${link.slug}`} class="link-card">
        <h3>{link.titulo}</h3>
        <p>{link.descripcion}</p>
        <small>{link.dificultad}</small>
      </a>
    ))}
  </div>
</BaseLayout>
```

---

## 6. Búsqueda con Pagefind

### Componente de Búsqueda
`src/components/Search/SearchForm.astro`

```astro
---
// src/components/Search/SearchForm.astro
// Importar estilos de Pagefind UI
import '@pagefind/default-ui/css/ui.css';
---

<div id="pagefind-search"></div>

<script>
  import { PagefindUI } from '@pagefind/default-ui';

  // Inicializar Pagefind UI
  new PagefindUI({
    element: '#pagefind-search',
    showImages: true,
    showSubResults: true,
    resetStyles: false,
    // Configuración para mejor experiencia
    processResult: function (result) {
      // Personalizar resultado si es necesario
      return result;
    }
  });
</script>

<style is:global>
  /* Ajustes de estilo opcionales */
  .pagefind-ui__result {
    margin-bottom: 1.5rem;
    padding-bottom: 1rem;
    border-bottom: 1px solid #eee;
  }
  
  .pagefind-ui__result-title {
    font-size: 1.2rem;
    font-weight: 600;
  }
</style>
```

### Página de Resultados de Búsqueda
`src/pages/buscar.astro`

```astro
---
// src/pages/buscar.astro
import BaseLayout from '../layouts/BaseLayout.astro';
import SearchForm from '../components/Search/SearchForm.astro';
---

<BaseLayout
  title="Buscar recursos | Links de Frontend"
  description="Encuentra los mejores recursos de frontend: frameworks, herramientas, tutoriales y más"
>
  <div class="search-page">
    <h1>🔍 Buscar recursos</h1>
    <p>Encuentra rápidamente el recurso que necesitas</p>
    
    <div class="search-container">
      <SearchForm />
    </div>
  </div>
</BaseLayout>
```

### Configuración de Build en `package.json`

```json
{
  "scripts": {
    "dev": "astro dev",
    "build": "astro build && pagefind --site dist --output-path dist/pagefind",
    "preview": "astro preview"
  }
}
```

---

## 7. Sitemap Index Config (Sitemap Jerárquico)

### Crear sitemap principal que referencia otros sitemaps
`src/pages/sitemap-index.xml.js`

```javascript
// src/pages/sitemap-index.xml.js (endpoint para sitemap index)
import data from '../data/frontend-links.json';

// URL base del sitio
const siteURL = 'https://linksdefrontend.com';

// Obtener categorías únicas
const categorias = [...new Set(data.links.map(link => link.categoria))];

export async function GET() {
  const sitemaps = [
    '<sitemap><loc>' + siteURL + '/sitemap-pages.xml</loc><lastmod>' + new Date().toISOString() + '</lastmod></sitemap>',
    '<sitemap><loc>' + siteURL + '/sitemap-categorias.xml</loc><lastmod>' + new Date().toISOString() + '</lastmod></sitemap>',
    '<sitemap><loc>' + siteURL + '/sitemap-links.xml</loc><lastmod>' + new Date().toISOString() + '</lastmod></sitemap>'
  ];

  const sitemapIndex = `<?xml version="1.0" encoding="UTF-8"?>
  <sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    ${sitemaps.join('')}
  </sitemapindex>`;

  return new Response(sitemapIndex, {
    headers: {
      'Content-Type': 'application/xml',
      'Cache-Control': 'max-age=3600'
    }
  });
}
```

### Sitemap de Páginas Estáticas
`src/pages/sitemap-pages.xml.js`

```javascript
// src/pages/sitemap-pages.xml.js
const siteURL = 'https://linksdefrontend.com';

const pages = [
  { url: '/', priority: '1.0', changefreq: 'daily' },
  { url: '/buscar', priority: '0.5', changefreq: 'monthly' },
  { url: '/categorias', priority: '0.8', changefreq: 'weekly' },
];

export async function GET() {
  const urls = pages.map(page => `
    <url>
      <loc>${siteURL}${page.url}</loc>
      <lastmod>${new Date().toISOString()}</lastmod>
      <changefreq>${page.changefreq}</changefreq>
      <priority>${page.priority}</priority>
    </url>
  `).join('');

  const sitemap = `<?xml version="1.0" encoding="UTF-8"?>
  <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    ${urls}
  </urlset>`;

  return new Response(sitemap, {
    headers: { 'Content-Type': 'application/xml' }
  });
}
```

### Sitemap de Links Dinámicos
`src/pages/sitemap-links.xml.js`

```javascript
// src/pages/sitemap-links.xml.js
import data from '../data/frontend-links.json';

const siteURL = 'https://linksdefrontend.com';

export async function GET() {
  const urls = data.links.map(link => `
    <url>
      <loc>${siteURL}/link/${link.slug}</loc>
      <lastmod>${link.fecha}</lastmod>
      <changefreq>monthly</changefreq>
      <priority>0.6</priority>
    </url>
  `).join('');

  const sitemap = `<?xml version="1.0" encoding="UTF-8"?>
  <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    ${urls}
  </urlset>`;

  return new Response(sitemap, {
    headers: { 'Content-Type': 'application/xml' }
  });
}
```

---

## 8. Archivos Estáticos Esenciales

### robots.txt
`public/robots.txt`

```text
User-agent: *
Allow: /
Disallow: /admin/
Disallow: /pagefind/

Sitemap: https://linksdefrontend.com/sitemap-index.xml
```

### llms.txt (para IA y Motores de Búsqueda)
`src/pages/llms.txt.js`

```javascript
// src/pages/llms.txt.js
import data from '../data/frontend-links.json';

export async function GET() {
  // Agrupar links por categoría
  const byCategory = data.links.reduce((acc, link) => {
    const cat = link.categoriaNombre;
    if (!acc[cat]) acc[cat] = [];
    acc[cat].push(`  - [${link.titulo}](https://linksdefrontend.com/link/${link.slug}): ${link.descripcion}`);
    return acc;
  }, {});

  const categoriasContent = Object.entries(byCategory)
    .map(([cat, links]) => `### ${cat}\n${links.join('\n')}`)
    .join('\n\n');

  const content = `# Links de Frontend
> Directorio curado de recursos para desarrollo frontend.

## 📊 Sobre este sitio
- **Descripción**: Recopilación de los mejores enlaces, tutoriales y herramientas para frontend
- **Categorías**: ${Object.keys(byCategory).join(', ')}
- **Total recursos**: ${data.links.length}
- **Última actualización**: ${new Date().toISOString().split('T')[0]}

## 📁 Contenido por Categoría

${categoriasContent}

## 🤖 Para Motores de IA
Este archivo está optimizado para Generative Engine Optimization (GEO).
`;

  return new Response(content, {
    headers: {
      'Content-Type': 'text/plain',
      'Cache-Control': 'max-age=3600',
    }
  });
}
```

---

## 9. Configuración Avanzada de Pagefind

### pagefind.toml (opcional, en la raíz)
```toml
# pagefind.toml - Configuración avanzada
[language]
language = "es"

[exclude_selectors]
selectors = [
    "nav",
    "footer",
    ".no-search",
    "header"
]

[highlight]
ignore_words = ["y", "el", "la", "los", "las", "de", "que", "en"]
```

### Mejores prácticas para Pagefind:

1. **Uso de `data-pagefind-body`**: Limita la indexación al contenido principal
```html
<main data-pagefind-body>
  <!-- SÓLO esto se indexará -->
</main>
```

2. **Metadatos para filtrado**: Añade metadatos a tus elementos
```html
<article data-pagefind-meta="categoria[frontend]" data-pagefind-meta="fecha[2025-03-15]">
```

3. **Indexación de JSON**: Para contenido dinámico desde archivos JSON, asegúrate de que se renderice como HTML durante el build

---

## 10. Checklist Final de SEO y Pagefind

### SEO General
- [ ] Títulos únicos (max 60 caracteres) en todas las páginas
- [ ] Meta descripciones (120-155 caracteres)
- [ ] Canonical URLs configuradas
- [ ] Open Graph tags para redes sociales
- [ ] JSON-LD implementado (BreadcrumbList, Article, Collection)
- [ ] `robots.txt` configurado
- [ ] Sitemap Index + submódulos configurados

### Pagefind
- [ ] Pagefind instalado (`npm install pagefind @pagefind/default-ui`)
- [ ] Build script modificado en `package.json`
- [ ] `data-pagefind-body` en el contenido principal
- [ ] `data-pagefind-ignore` en headers, footers y navegación
- [ ] Componente de búsqueda creado y estilizado
- [ ] Página `/buscar` configurada

### Archivos Generados Automáticamente
- [ ] `sitemap-index.xml`
- [ ] `sitemap-pages.xml`
- [ ] `sitemap-links.xml`
- [ ] `sitemap-categorias.xml`
- [ ] `llms.txt`
- [ ] `robots.txt`
- [ ] Archivos Pagefind en `dist/pagefind/`

### Verificación
```bash
npm run build  # Genera todo
npm run preview  # Prueba localmente
# Verificar sitemap: https://linksdefrontend.com/sitemap-index.xml
# Verificar llms.txt: https://linksdefrontend.com/llms.txt
```

---

Con esta configuración, "Links de Frontend" tendrá:
- ✅ SEO técnico profesional
- ✅ Búsqueda interna rápida con Pagefind (sin backend)
- ✅ Sitemap Index jerárquico para mejor crawling
- ✅ Optimización para Google y motores de IA
- ✅ Estructura modular y fácil de mantener