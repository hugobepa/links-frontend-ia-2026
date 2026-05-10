# GitHub Pages Adaptation Checklist

## ✅ Configuración correcta

- [x] `site` en astro.config configurado con SITE_URL
- [x] Workflow de GitHub Actions configurado

## ⚠️ Revisar después del deployment

### 1. Rutas y Links

- [ ] Header: links funcionan (`/`, `/categories`, `/buscador`)
- [ ] Footer: links funcionan
- [ ] CategoryNavigation: navegación entre categorías
- [ ] Links internos no tienen paths absolutos rotos

### 2. Recursos estáticos

- [ ] Favicon carga correctamente
- [ ] Imágenes en `/assets` cargan
- [ ] CSS/JS carga correctamente

### 3. Starlight Docs

- [ ] `/guides/example` funciona
- [ ] `/reference/example` funciona
- [ ] Sidebar de docs carga

### 4. SEO y Meta

- [ ] sitemap.xml genera correctamente
- [ ] robots.txt presente
- [ ] Meta tags correctas

### 5. i18n

- [ ] Versión española (`/`) funciona
- [ ] Versión inglesa (`/en/`) funciona

## 🔧 Si hay problemas - Posibles fixes

### Fix 1: Añadir base path si es necesario

```ts
// astro.config.ts
export default defineConfig({
  base: "/links-frontend-ia-2026/",
  // ...
});
```

### Fix 2: Actualizar SITE_URL en workflow

```yaml
env:
  SITE_URL: https://hugobepa.github.io/links-frontend-ia-2026
```

## URL objetivo

https://hugobepa.github.io/links-frontend-ia-2026/
