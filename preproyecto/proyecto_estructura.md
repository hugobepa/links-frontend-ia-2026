# PROYECTO ESTRUCTURA

Fecha: 2026-05-10
Scope: repo + preproyecto
Uso: base para trabajo IA

## Protocolo de actualizacion

- Actualizar tras cada cambio
- Registrar fase y subfase
- Anotar archivo tocado
- Resumen tecnico corto
- Mantener orden Speckit

### Control de cambios

| Fecha      | Fase   | Cambio                               | Archivos                                       |
| ---------- | ------ | ------------------------------------ | ---------------------------------------------- |
| 2026-05-09 | Setup  | Crear arbol y analisis               | proyecto_estructura.md                         |
| 2026-05-09 | Fase 1 | Inicio Speckit ordenado              | 2.creacion_proyecto.md                         |
| 2026-05-09 | Fase 1 | Constitution rellenado               | .specify/memory/constitution.md                |
| 2026-05-09 | Fase 1 | Spec y checklist creados             | specs/001-links-frontend-ia-phase-1            |
| 2026-05-09 | Fase 1 | Canon Astro definido                 | specs/001-links-frontend-ia-phase-1            |
| 2026-05-09 | Fase 1 | Plan creado                          | specs/001-links-frontend-ia-phase-1            |
| 2026-05-09 | Fase 1 | Research creado                      | specs/001-links-frontend-ia-phase-1            |
| 2026-05-09 | Fase 1 | Data model creado                    | specs/001-links-frontend-ia-phase-1            |
| 2026-05-09 | Fase 1 | Quickstart creado                    | specs/001-links-frontend-ia-phase-1            |
| 2026-05-09 | Fase 1 | Tasks creado                         | specs/001-links-frontend-ia-phase-1            |
| 2026-05-09 | Fase 1 | Analysis completado                  | specs/001-links-frontend-ia-phase-1            |
| 2026-05-09 | Fase 1 | Implement completado                 | resumen_proyecto.md                            |
| 2026-05-09 | Fase 1 | Fase 1 COMPLETADA                    | All specs + resumen_proyecto.md                |
| 2026-05-10 | Fase 2 | Header mobile hamburger              | src/components/Header.astro                    |
| 2026-05-10 | Fase 2 | Toggle idioma retirado               | src/components/Header.astro                    |
| 2026-05-10 | Fase 2 | Sync estructura + .specify           | resumen_proyecto.md, proyecto_estructura.md    |
| 2026-05-10 | Fase 3 | Review consistencia spec/plan/tasks  | resumen_proyecto.md, proyecto_estructura.md    |
| 2026-05-10 | Fase 2 | Scroll desktop en sidebar categorias | src/components/CategoryNavigation.astro        |
| 2026-05-10 | Fase 2 | Registro mision en .specify/memory   | .specify/memory/mision-fase2-sidebar-scroll.md |

## Arbol ASCII (repo)

```text
links-frontend-ia-2026/                    [raiz repo]
|-- .agents/                               [skills IA]
|-- .astro/                                [cache astro]
|-- .git/                                  [historial git]
|-- .github/                               [workflows]
|-- .specify/                              [spec kit]
|   |-- extensions/                        [extensiones speckit]
|   |-- integrations/                      [integracion copilot]
|   |-- memory/                            [constitution]
|   |-- templates/                         [plantillas]
|   |-- extensions.yml                     [hooks]
|   |-- feature.json                       [feature activa]
|   |-- init-options.json                  [config init]
|   `-- integration.json                   [config integracion]
|-- .vscode/                               [editor cfg]
|-- dist/                                  [build output]
|-- node_modules/                          [deps local]
|-- package-lock.json                      [lock npm]
|-- preproyecto/                           [datos base]
|-- public/                                [assets pub]
|   `-- favicon.svg                        [icono web]
|-- src/                                   [codigo app]
|   |-- assets/                            [media src]
|   |   `-- houston.webp                   [img demo]
|   |-- components/                        [ui comps]
|   |   |-- Header.astro                   [header responsive]
|   |   |-- BackToTop.tsx                  [boton top]
|   |   |-- CategoryNavigation.astro       [menu categorias]
|   |   `-- LanguageToggle.tsx             [no usado en header]
|   |   `-- ui/
|   |       `-- button.tsx                 [btn shadcn]
|   |-- content/                           [docs starl]
|   |   `-- docs/
|   |       |-- index.mdx                  [home docs]
|   |       |-- guides/
|   |       |   `-- example.md             [guia demo]
|   |       `-- reference/
|   |           `-- example.md             [ref demo]
|   |-- lib/
|   |   |-- loaders.ts                     [load data]
|   |   `-- utils.ts                       [helpers]
|   |-- pages/
|   |   |-- index.astro                    [home es]
|   |   |-- buscador/
|   |   |   `-- index.astro                [search es]
|   |   |-- categories/
|   |   |   |-- index.astro                [categories es]
|   |   |   `-- [slug].astro               [detalle es]
|   |   `-- en/
|   |       |-- index.astro                [home en]
|   |       |-- buscador/
|   |       |   `-- index.astro            [search en]
|   |       `-- categories/
|   |           |-- index.astro            [categories en]
|   |           `-- [slug].astro           [detalle en]
|   |-- styles/
|   |   `-- global.css                     [estilo base]
|   `-- content.config.ts                  [cfg content]
|-- .gitignore                             [reglas git]
|-- astro.config.mjs                       [cfg legacy]
|-- astro.config.ts                        [cfg astro]
|-- bun.lock                               [lock bun]
|-- components.json                        [cfg shadcn]
|-- package.json                           [scripts]
|-- README.md                              [doc repo]
|-- skills-lock.json                       [lock skills]
|-- specs/                                 [phase 1,2,3]
`-- tsconfig.json                          [cfg ts]
```

## Arbol ASCII (preproyecto)

```text
preproyecto/                                                   [workbench]
|-- 2.creacion_proyecto.md                                    [prompt main]
|-- informe-coincidencias-sensibles.md                        [riesgos]
|-- link-general.md                                            [links ref]
|-- proyecto_estructura.md                                     [este doc]
|-- jsons-news-interficies/                                    [dataset hub]
|   |-- audit-links.ps1                                        [audit data]
|   |-- generate-normalized-jsons.ps1                         [normaliza]
|   |-- manual-curations.json                                 [ajustes]
|   |-- resumen_datos.md                                       [resumen]
|   |-- analytics-monitoring_email-comunicacion/              [cat data]
|   |   |-- data/                                              [json base]
|   |   `-- interficies/                                       [tipos ts]
|   |-- apis-data_databases/                                   [cat data]
|   |   |-- data/                                              [json base]
|   |   `-- interficies/                                       [tipos ts]
|   |-- apis-data_databases_managed-db-tools-datasets/        [cat data]
|   |   |-- data/                                              [json base]
|   |   `-- interficies/                                       [tipos ts]
|   |-- dev-ops_testing_translation/                           [cat data]
|   |   |-- data/                                              [json base]
|   |   `-- interficies/                                       [tipos ts]
|   |-- diseno-ui-ux_desarrollo_ide/                          [cat data]
|   |   |-- data/                                              [json base]
|   |   `-- interficies/                                       [tipos ts]
|   |-- dns_seguridad_educacion/                               [cat data]
|   |   |-- data/                                              [json base]
|   |   `-- interficies/                                       [tipos ts]
|   |-- ia_asistentes-desarrollo-china-imagen_1/              [cat data]
|   |   |-- data/                                              [json base]
|   |   `-- interficies/                                       [tipos ts]
|   |-- ia_video-agentes/                                      [cat data]
|   |   |-- data/                                              [json base]
|   |   `-- interficies/                                       [tipos ts]
|   |-- pagos_game-dev_mobile/                                 [cat data]
|   |   |-- data/                                              [json base]
|   |   `-- interficies/                                       [tipos ts]
|   |-- search_messaging_image_storage/                        [cat data]
|   |   |-- data/                                              [json base]
|   |   `-- interficies/                                       [tipos ts]
|   |-- utilidades-2_cms/                                      [cat data]
|   |   |-- data/                                              [json base]
|   |   `-- interficies/                                       [tipos ts]
|   `-- utilidades_1/                                          [cat data]
|       |-- data/                                              [json base]
|       `-- interficies/                                       [tipos ts]
`-- pre-config-general/                                        [guias base]
    |-- diseño/                                                [design rules]
    |-- legal/                                                 [legal docs]
    |   `-- Cookies consent/                                   [cookies refs]
    |-- plantillas-estructuras/                                [plantillas]
    |-- seo/                                                   [seo guias]
    `-- speckit/                                               [flujo spec]
```

## Analisis corto

- Base Astro ok
- Doble config astro
- Datos muy amplios
- Nombres muy largos
- Estructura util IA
- Buen split data/ts
- Speckit activo en fase 3
- Header mobile actualizado a hamburguesa
- Toggle idioma removido del header
- Spec fase 3 y estado real con desvios controlados
- Sidebar de categorias con scroll interno solo desktop
