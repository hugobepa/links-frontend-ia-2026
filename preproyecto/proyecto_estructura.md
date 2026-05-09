# PROYECTO ESTRUCTURA

Fecha: 2026-05-09
Scope: repo + preproyecto
Uso: base para trabajo IA

## Protocolo de actualizacion

- Actualizar tras cada cambio
- Registrar fase y subfase
- Anotar archivo tocado
- Resumen tecnico corto
- Mantener orden Speckit

### Control de cambios

| Fecha      | Fase   | Cambio                   | Archivos                            |
| ---------- | ------ | ------------------------ | ----------------------------------- |
| 2026-05-09 | Setup  | Crear arbol y analisis   | proyecto_estructura.md              |
| 2026-05-09 | Fase 1 | Inicio Speckit ordenado  | 2.creacion_proyecto.md              |
| 2026-05-09 | Fase 1 | Constitution rellenado   | .specify/memory/constitution.md     |
| 2026-05-09 | Fase 1 | Spec y checklist creados | specs/001-links-frontend-ia-phase-1 |
| 2026-05-09 | Fase 1 | Canon Astro definido     | specs/001-links-frontend-ia-phase-1 |
| 2026-05-09 | Fase 1 | Plan creado              | specs/001-links-frontend-ia-phase-1 |
| 2026-05-09 | Fase 1 | Research creado          | specs/001-links-frontend-ia-phase-1 |
| 2026-05-09 | Fase 1 | Data model creado        | specs/001-links-frontend-ia-phase-1 |
| 2026-05-09 | Fase 1 | Quickstart creado        | specs/001-links-frontend-ia-phase-1 |
| 2026-05-09 | Fase 1 | Tasks creado             | specs/001-links-frontend-ia-phase-1 |

## Arbol ASCII (repo)

```text
links-frontend-ia-2026/                    [raiz repo]
|-- .agents/                               [skills IA]
|-- .astro/                                [cache astro]
|-- .git/                                  [historial git]
|-- .github/                               [workflows]
|-- .specify/                              [spec kit]
|-- .vscode/                               [editor cfg]
|-- node_modules/                          [deps local]
|-- preproyecto/                           [datos base]
|-- public/                                [assets pub]
|   `-- favicon.svg                        [icono web]
|-- src/                                   [codigo app]
|   |-- assets/                            [media src]
|   |   `-- houston.webp                   [img demo]
|   |-- components/                        [ui comps]
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
|   |   `-- utils.ts                       [helpers]
|   |-- pages/
|   |   `-- index.astro                    [home page]
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
- Lista para speckit
