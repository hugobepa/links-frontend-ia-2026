# Mision Fase 6 - SEO Local

- Fase objetivo: SEO local
- Orden actualizada en `preproyecto/2.creacion_proyecto.md`
- Feature activa movida a `specs/004-links-frontend-ia-phase-6-seo-local`
- Scope: metadata, canonical, hreflang, robots, llms, sitemap, deduplicacion de terms/tags
- Implementado baseline SEO local con helper `src/components/SEO.astro` y endpoints Astro propios
- `bun run build` pasa; solo queda el aviso de sitemap integration sin `site` configurado
- Mantener rutas actuales ES/EN y no romper `/`, `/buscador` ni `/categories/[slug]`
- Estado base ya revisado en `src/pages/index.astro`, `src/pages/buscador/index.astro`, `resumen_proyecto.md` y `preproyecto/proyecto_estructura.md`
