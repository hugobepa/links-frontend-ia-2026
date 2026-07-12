# Resumen de Datos / Data Summary

**Objetivo**: documentar la estructura actual de trabajo para los datos de enlaces, búsquedas y interfaces TypeScript del proyecto.

---

## ES - Resumen Técnico

Los datos del proyecto se organizan en dos grupos principales:

- **Links**: datos base de recursos, subcategorías y metadatos de cada categoría.
- **Archivos de búsqueda / estructura**: índices derivados para navegación, filtros y búsqueda.

La etiqueta `xxxx` no representa una categoría funcional. Solo identifica el nombre real de cada bloque de datos por categoría, por ejemplo:

- `analytics-monitoring_email-comunicacion`
- `apis-data_databases`
- `utilidades_1`

### Estructura de trabajo

| Origen                                                        | Contenido                                               | Uso                                         |
| ------------------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------- |
| `preproyecto/jsons-news-interficies/<categoria>/data/`        | `xxxx-rec.json`, `xxxx-struc.json`, `nombre-links.json` | Fuente original de datos                    |
| `preproyecto/jsons-news-interficies/<categoria>/interficies/` | `xxxx-rec.ts`, `xxxx-data.ts`, `xxxx-busq.ts`           | Interfaces y helpers originales             |
| `src/data/dates/<categoria>/`                                 | `xxxx-rec.json`                                         | Copia de trabajo para lectura de categorías |
| `src/data/search/<categoria>/`                                | `xxxx-struc.json`, `nombre-links.json`                  | Copia de trabajo para búsqueda y estructura |
| `src/interfaces/dates/<categoria>/`                           | `xxxx-rec.ts`, `xxxx-data.ts`                           | Interfaces TS para datos                    |
| `src/interfaces/search/<categoria>/`                          | `xxxx-busq.ts`, `xxxx-data.ts`                          | Interfaces TS para búsqueda                 |

### Invariantes

- `xxxx-rec.json` contiene los recursos normalizados por categoría.
- `xxxx-struc.json` contiene la estructura derivada para filtros y búsqueda.
- `nombre-links.json` contiene la lista única de nombres de enlaces.
- Cada categoría mantiene la misma estructura de nombres en `data` e `interficies`.
- `src/lib/loaders.ts` consume los JSON desde `src/data`.
- Las rutas base `src/data` y `src/interfaces` son cortas; el control real de longitud está en el nombre de cada categoría.
- Si una carpeta de categoría se acerca al límite de GitHub, se conserva el prefijo común y se acorta solo el sufijo más descriptivo posible.

### Notas

- El árbol `src/data` y `src/interfaces` está organizado para soportar todas las categorías actuales del proyecto.
- Esta estructura permite separar datos de trabajo, tipos TypeScript y vistas del sitio sin depender directamente de `preproyecto/`.
- Los ajustes recientes de UX (por ejemplo, scroll interno del panel lateral en desktop, paginador del buscador con acción `Ir a web` y retiro del botón `De pago`) no modifican contratos JSON/TS ni la estructura de `src/data` o `src/interfaces`.

---

## EN - Technical Summary

The project data is organized into two main groups:

- **Links**: base resource data, subcategories, and category metadata.
- **Search / structure files**: derived indexes for navigation, filters, and search.

The `xxxx` label does not mean a functional category. It only represents the real category folder name, for example:

- `analytics-monitoring_email-comunicacion`
- `apis-data_databases`
- `utilidades_1`

### Working layout

| Source                                                       | Content                                                 | Use                                        |
| ------------------------------------------------------------ | ------------------------------------------------------- | ------------------------------------------ |
| `preproyecto/jsons-news-interficies/<category>/data/`        | `xxxx-rec.json`, `xxxx-struc.json`, `nombre-links.json` | Original data source                       |
| `preproyecto/jsons-news-interficies/<category>/interficies/` | `xxxx-rec.ts`, `xxxx-data.ts`, `xxxx-busq.ts`           | Original TypeScript interfaces/helpers     |
| `src/data/dates/<category>/`                                 | `xxxx-rec.json`                                         | Working copy for category data             |
| `src/data/search/<category>/`                                | `xxxx-struc.json`, `nombre-links.json`                  | Working copy for search and structure data |
| `src/interfaces/dates/<category>/`                           | `xxxx-rec.ts`, `xxxx-data.ts`                           | TypeScript interfaces for data             |
| `src/interfaces/search/<category>/`                          | `xxxx-busq.ts`, `xxxx-data.ts`                          | TypeScript interfaces for search           |

### Invariants

- `xxxx-rec.json` stores normalized resources per category.
- `xxxx-struc.json` stores derived structure for filters and search.
- `nombre-links.json` stores the unique list of link names.
- Each category keeps matching names across `data` and `interficies`.
- `src/lib/loaders.ts` reads JSON from `src/data`.
- `src/data` and `src/interfaces` stay short; the actual path-length risk comes from the category folder names.
- If a category path gets close to GitHub limits, keep the shared prefix and shorten only the final descriptive suffix.

### Notes

- `src/data` and `src/interfaces` are organized to support all current project categories.
- This layout separates working data, TypeScript types, and site views without relying directly on `preproyecto/`.
- Recent UX changes (for example, desktop-only internal scroll in the category sidebar, search pagination with `Visit web` action, and removal of the `Paid` filter button) do not change JSON/TS contracts or the `src/data` and `src/interfaces` structure.

---

## ES - Actualizacion v7 (14/05/2026)

- Fuente procesada: `preproyecto/links-insertados.md`.
- Candidatos: 35 URLs.
- Duplicados detectados y omitidos en insercion: 3 (`AI-Agents-Beginners`, `Hands-On-LLM`, `DeepSeek-TUI`).
- Altas nuevas en `src/data`: 32.
- Verificacion final: los 35 enlaces del lote existen en el dataset global (32 nuevos + 3 ya existentes).

### Cambios aplicados v8

| Dataset                                   | Antes | Nuevos | Total |
| ----------------------------------------- | ----- | ------ | ----- |
| `ia_asistentes-desarrollo-china-imagen_1` | 38    | +12    | 50    |
| `dns_seguridad_educacion`                 | 190   | +18    | 208   |
| `utilidades_1`                            | 53    | +1     | 54    |
| `diseno-ui-ux_desarrollo_ide`             | 423   | +1     | 424   |

### Cobertura tecnica v8

- Se actualizaron `*-rec.json` con recursos, `resourceCount`, `searchIndex` y metadatos.
- Se regeneraron `*-struc.json` con `tags`, `filters`, `searchIndex.resources` y `ui.resourceCount`.
- Se regeneraron `nombre-links.json` con nombres unicos ordenados.
- Total actual de recursos en `src/data/dates`: **1116**.

## EN - v7 Update (2026-05-14)

- Processed source: `preproyecto/links-insertados.md`.
- Candidates: 35 URLs.
- Detected duplicates skipped for insertion: 3 (`AI-Agents-Beginners`, `Hands-On-LLM`, `DeepSeek-TUI`).
- New inserts in `src/data`: 32.
- Final validation: all 35 links from this batch are present globally (32 newly inserted + 3 already existing).

### Technical coverage v8

- Updated `*-rec.json` with resources, counters, and metadata.
- Regenerated `*-struc.json` (`tags`, `filters`, `searchIndex.resources`, `ui.resourceCount`).
- Regenerated `nombre-links.json` with sorted unique names.
- Current total resources in `src/data/dates`: **1116**.

## ES - Actualizacion v8 (15/05/2026)

- Fuente procesada: `preproyecto/links-insertados.md`.
- Candidatos: 32 URLs.
- Duplicados detectados y omitidos en insercion: 0.
- Altas nuevas en `src/data`: 32.
- Verificacion final: los 32 enlaces del lote existen en el dataset global.

### Cambios aplicados

| Dataset                                         | Antes | Nuevos | Total |
| ----------------------------------------------- | ----- | ------ | ----- |
| `apis-data_databases_managed-db-tools-datasets` | 105   | +3     | 108   |
| `dev-ops_testing_translation`                   | 34    | +1     | 35    |
| `ia_asistentes-desarrollo-china-imagen_1`       | 50    | +11    | 61    |
| `dns_seguridad_educacion`                       | 208   | +16    | 224   |
| `utilidades-2_cms`                              | 50    | +1     | 51    |

### Cobertura tecnica

- Se actualizaron `*-rec.json` con recursos, `resourceCount`, `searchIndex` y metadatos.
- Se regeneraron `*-struc.json` con `tags`, `filters`, `searchIndex.entries` y `ui.resourceCount`.
- Se regeneraron `nombre-links.json` con nombres unicos ordenados.
- Total actual de recursos en `src/data/dates`: **1148**.

## EN - v8 Update (2026-05-15)

- Processed source: `preproyecto/links-insertados.md`.
- Candidates: 32 URLs.
- Duplicates skipped for insertion: 0.
- New inserts in `src/data`: 32.
- Final validation: all 32 links from this batch are present globally.

### Technical coverage

- Updated `*-rec.json` with resources, counters, and metadata.
- Regenerated `*-struc.json` (`tags`, `filters`, `searchIndex.entries`, `ui.resourceCount`).
- Regenerated `nombre-links.json` with sorted unique names.
- Current total resources in `src/data/dates`: **1148**.

---

## ES - Actualizacion v9 (18/05/2026)

- Fuente procesada: lote validado de 44 enlaces.
- Candidatos: 44 URLs.
- Duplicados detectados y omitidos en insercion: 0.
- Altas nuevas en `src/data`: 44.
- Verificacion final: los 44 enlaces del lote existen en el dataset global.

### Cambios aplicados v9

| Dataset                                   | Antes | Nuevos | Total |
| ----------------------------------------- | ----- | ------ | ----- |
| `ia_asistentes-desarrollo-china-imagen_1` | 61    | +12    | 73    |
| `dns_seguridad_educacion`                 | 224   | +8     | 232   |
| `diseno-ui-ux_desarrollo_ide`             | 424   | +3     | 427   |
| `dev-ops_testing_translation`             | 35    | +8     | 43    |
| `utilidades_1`                            | 54    | +5     | 59    |
| `utilidades-2_cms`                        | 51    | +5     | 56    |
| `apis-data_databases`                     | 68    | +3     | 71    |

### Cobertura tecnica v9

- Se actualizaron `*-rec.json` con recursos, `resourceCount`, `searchIndex` y metadatos.
- Se regeneraron `*-struc.json` con `tags`, `filters`, `searchIndex.resources` y `ui.resourceCount`.
- Se regeneraron `nombre-links.json` con nombres unicos ordenados.
- Total actual de recursos en `src/data/dates`: **1192**.
- Tiempo: **18/05/2026 18:20 (Madrid)**.

## EN - v9 Update (2026-05-18)

- Processed source: validated batch of 44 links.
- Candidates: 44 URLs.
- Duplicates skipped for insertion: 0.
- New inserts in `src/data`: 44.
- Final validation: all 44 links from this batch are present globally.

### Technical coverage v9

- Updated `*-rec.json` with resources, counters, and metadata.
- Regenerated `*-struc.json` (`tags`, `filters`, `searchIndex.resources`, `ui.resourceCount`).
- Regenerated `nombre-links.json` with sorted unique names.
- Current total resources in `src/data/dates`: **1192**.

## ES - Actualizacion v10 (18/05/2026)

- Fuente procesada: `preproyecto/links-insertados.md`.
- Candidatos: 39 URLs.
- Duplicados detectados y omitidos en insercion: 0.
- Altas nuevas en `src/data`: 39.
- Verificacion final: los 39 enlaces del lote existen en el dataset global.

### Cambios aplicados v10

| Dataset                                   | Antes | Nuevos | Total |
| ----------------------------------------- | ----- | ------ | ----- |
| `analytics-monitoring_email-comunicacion` | 52    | +4     | 56    |
| `ia_asistentes-desarrollo-china-imagen_1` | 73    | +28    | 101   |
| `dns_seguridad_educacion`                 | 232   | +7     | 239   |

### Cobertura tecnica v10

- Se actualizaron `*-rec.json` con recursos, `resourceCount` y `searchIndex`.
- Se actualizaron `*-struc.json` con `tags`, `filters`, indice de busqueda y `ui.resourceCount`.
- Se actualizaron `nombre-links.json` con nombres unicos ordenados.
- Total actual de recursos en `src/data/dates`: **1231**.
- Tiempo: **19:09 - 18/05/2026 (Madrid)**.

## EN - v10 Update (2026-05-18)

- Processed source: `preproyecto/links-insertados.md`.
- Candidates: 39 URLs.
- Duplicates skipped for insertion: 0.
- New inserts in `src/data`: 39.
- Final validation: all 39 links from this batch are present globally.

### Technical coverage v10

- Updated `*-rec.json` with resources, counters, and `searchIndex`.
- Updated `*-struc.json` with `tags`, `filters`, search index and `ui.resourceCount`.
- Updated `nombre-links.json` with sorted unique names.
- Current total resources in `src/data/dates`: **1231**.

---

## ES - Actualizacion v11 (25/05/2026)

- Fuente procesada: `preproyecto/links-insertados.md`.
- Candidatos: 289 URLs.
- Duplicados detectados y omitidos en insercion: 2.
- Altas nuevas en `src/data`: 287.
- Verificacion final: lote insertado sin ambiguedades (`ambiguous=0`).

### Cambios aplicados v11

| Dataset                   | Antes | Nuevos | Total |
| ------------------------- | ----- | ------ | ----- |
| `dns_seguridad_educacion` | 190   | +237   | 427   |
| `pagos_game-dev_mobile`   | 43    | +50    | 93    |

### Cobertura tecnica v11

- Se actualizaron `*-rec.json` con recursos, `resourceCount` y `searchIndex`.
- Se actualizaron `*-struc.json` con `tags`, `filters`, `searchIndex.entries` y `ui.resourceCount`.
- Se actualizaron `nombre-links.json` con nombres unicos ordenados.
- YouTube nuevo clasificado en `education-learning/programming-courses`.

## EN - v11 Update (2026-05-25)

- Processed source: `preproyecto/links-insertados.md`.
- Candidates: 289 URLs.
- Duplicates skipped for insertion: 2.
- New inserts in `src/data`: 287.
- Final validation: inserted batch completed with no ambiguities (`ambiguous=0`).

### Technical coverage v11

- Updated `*-rec.json` with resources, counters, and `searchIndex`.
- Updated `*-struc.json` with `tags`, `filters`, `searchIndex.entries`, and `ui.resourceCount`.
- Updated `nombre-links.json` with sorted unique names.
- New YouTube entries mapped to `education-learning/programming-courses`.

---

## ES - Actualizacion v12 (24/06/2026)

- Fuente procesada: `preproyecto/links-insertados.md`.
- Candidatos: 489 URLs.
- Duplicados detectados y omitidos en insercion: 1.
- Altas nuevas en `src/data`: 488.
- Verificacion final: los 488 enlaces del lote existen en el dataset global.

### Cambios aplicados v12

| Dataset                                   | Antes | Nuevos | Total |
| ----------------------------------------- | ----- | ------ | ----- |
| `dns_seguridad_educacion`                 | 500   | +209   | 709   |
| `ia_asistentes-desarrollo-china-imagen_1` | 38    | +196   | 234   |
| `pagos_game-dev_mobile`                   | 93    | +39    | 132   |
| `utilidades_1`                            | 57    | +14    | 71    |
| `diseno-ui-ux_desarrollo_ide`             | 515   | +12    | 527   |
| `search_messaging_image_storage`          | 28    | +10    | 38    |
| `utilidades-2_cms`                        | 57    | +4     | 61    |
| `apis-data_databases`                     | 99    | +3     | 102   |
| `dev-ops_testing_translation`             | 34    | +1     | 35    |

### Cobertura tecnica v12

- Se actualizaron `*-rec.json` con recursos, `resourceCount` y `searchIndex`.
- Se regeneraron `*-struc.json` con `tags`, `filters`, `searchIndex.entries` y `ui.resourceCount`.
- Se regeneraron `nombre-links.json` con nombres unicos ordenados.
- YouTube (83), arXiv/papers (10) y universidades (12) → `education-learning/programming-courses`.
- GitHub AI/agents/skills (174) y HuggingFace (13) → `ia_asistentes-desarrollo-china-imagen_1/development`.
- Total actual de recursos en `src/data/dates`: **2073**.

## EN - v12 Update (2026-06-24)

- Processed source: `preproyecto/links-insertados.md`.
- Candidates: 489 URLs.
- Duplicates skipped for insertion: 1.
- New inserts in `src/data`: 488.
- Final validation: all 488 links from this batch are present globally.

### Technical coverage v12

- Updated `*-rec.json` with resources, counters, and `searchIndex`.
- Regenerated `*-struc.json` with `tags`, `filters`, `searchIndex.entries`, and `ui.resourceCount`.
- Regenerated `nombre-links.json` with sorted unique names.
- YouTube (83), arXiv/papers (10), university resources (12) → `education-learning/programming-courses`.
- GitHub AI/agents/skills (174), HuggingFace (13) → `ia_asistentes-desarrollo-china-imagen_1/development`.
- Current total resources in `src/data/dates`: **2073**.

---

## ES - Actualizacion v13 (12/07/2026)

- Fuente procesada: `preproyecto/links-insertados.md`.
- Candidatos: 78 URLs.
- Duplicados detectados y omitidos en insercion: 1.
- Altas nuevas en `src/data`: 77.
- Verificacion final: los 77 enlaces del lote existen en el dataset global.

### Cambios aplicados v13

| Dataset                                   | Antes | Nuevos | Total |
| ----------------------------------------- | ----- | ------ | ----- |
| `dns_seguridad_educacion`                 | 709   | +7     | 716   |
| `ia_asistentes-desarrollo-china-imagen_1` | 234   | +47    | 281   |
| `diseno-ui-ux_desarrollo_ide`             | 527   | +20    | 547   |
| `utilidades_1`                            | 71    | +2     | 73    |
| `pagos_game-dev_mobile`                   | 132   | +1     | 133   |

### Cobertura tecnica v13

- Se actualizaron `*-rec.json` con recursos, `resourceCount` y `searchIndex`.
- Se regeneraron `*-struc.json` con `tags`, `filters`, `searchIndex.entries` y `ui.resourceCount`.
- Se regeneraron `nombre-links.json` con nombres unicos ordenados.
- YouTube (3), arXiv/papers (3), universidades (3) → `education-learning/programming-courses`.
- GitHub AI/agents/skills (33), HuggingFace (2), otros AI (11) → `ia_asistentes-desarrollo-china-imagen_1/development`.
- Dev tools (20) → `diseno-ui-ux_desarrollo_ide`.
- Security (3) → `dns_seguridad_educacion/security-vpn/security-auth`.
- Empleo (1) → `pagos_game-dev_mobile/payments/jobs`.
- Total actual de recursos en `src/data/dates`: **2150**.

## EN - v13 Update (2026-07-12)

- Processed source: `preproyecto/links-insertados.md`.
- Candidates: 78 URLs.
- Duplicates skipped for insertion: 1.
- New inserts in `src/data`: 77.
- Final validation: all 77 links from this batch are present globally.

### Technical coverage v13

- Updated `*-rec.json` with resources, counters, and `searchIndex`.
- Regenerated `*-struc.json` with `tags`, `filters`, `searchIndex.entries`, and `ui.resourceCount`.
- Regenerated `nombre-links.json` with sorted unique names.
- YouTube (3), arXiv/papers (3), university resources (3) → `education-learning/programming-courses`.
- GitHub AI/agents/skills (33), HuggingFace (2), other AI (11) → `ia_asistentes-desarrollo-china-imagen_1/development`.
- Dev tools (20) → `diseno-ui-ux_desarrollo_ide`.
- Security (3) → `dns_seguridad_educacion/security-vpn/security-auth`.
- Employment (1) → `pagos_game-dev_mobile/payments/jobs`.
- Current total resources in `src/data/dates`: **2150**.

---

## LINKS

<!-- markdownlint-disable MD060 -->

| **Nombre**                                                 | Descripcion                          | Link                                                                                                                                                 |
| ---------------------------------------------------------- | ------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| **PaddlePaddle**                                           | Framework ML open source             | [github.com/paddlepaddle](https://github.com/paddlepaddle)                                                                                           |
| **Surya**                                                  | OCR multimodal para documentos       | [github.com/datalab-to/surya](https://github.com/datalab-to/surya)                                                                                   |
| **Kronos**                                                 | ML para series temporales            | [github.com/shiyu-coder/Kronos.git](https://github.com/shiyu-coder/Kronos.git)                                                                       |
| **Chandra**                                                | Framework IA para analisis           | [github.com/datalab-to/chandra](https://github.com/datalab-to/chandra)                                                                               |
| **Kaggle-Whitepaper-Agent**                                | Agente Kaggle para papers            | [kaggle.com/whitepaper-agent](https://www.kaggle.com/whitepaper-agent)                                                                               |
| **Prompt-Engineering-Guide**                               | Guia de prompt engineering           | [github.com/dair-ai/Prompt-Engineering-Guide](https://github.com/dair-ai/Prompt-Engineering-Guide)                                                   |
| **Made-With-ML**                                           | Plataforma ML en produccion          | [madewithml.com](https://madewithml.com)                                                                                                             |
| **LLM-Course**                                             | Curso completo de LLM                | [github.com/mlabonne/llm-course](https://github.com/mlabonne/llm-course)                                                                             |
| **Anthropic-Agents-Guide**                                 | Guia oficial de agentes              | [anthropic.com/engineering/building-effective-agents](https://www.anthropic.com/engineering/building-effective-agents)                               |
| **OpenAI-Agents-Docs**                                     | Docs oficiales agentes OpenAI        | [platform.openai.com/docs/guides/agents](https://platform.openai.com/docs/guides/agents)                                                             |
| **HuggingFace-Agents-Course**                              | Curso agentes de Hugging Face        | [huggingface.co/learn/agents-course](https://huggingface.co/learn/agents-course)                                                                     |
| **Anthropic-Engineering**                                  | Publicaciones engineering IA         | [anthropic.com/engineering](https://www.anthropic.com/engineering)                                                                                   |
| **Palo-Alto-Cybersec**                                     | Curso gratis de ciberseguridad       | [paloaltonetworks.es/cyberpedia/free-cybersecurity-education-course](https://www.paloaltonetworks.es/cyberpedia/free-cybersecurity-education-course) |
| **ML-Interview**                                           | Preparacion entrevistas ML           | [github.com/khangich/machine-learning-interview](https://github.com/khangich/machine-learning-interview)                                             |
| **Build-LLM-From-Scratch**                                 | Libro para construir LLM             | [manning.com/books/build-a-large-language-model-from-scratch](https://www.manning.com/books/build-a-large-language-model-from-scratch)               |
| **O-Reilly-LLM-Engineering**                               | Libro de LLM engineering             | [oreilly.com/library/view/llm-engineering/9781098167298/](https://www.oreilly.com/library/view/llm-engineering/9781098167298/)                       |
| **O-Reilly-AI-Engineering**                                | Libro de AI engineering              | [oreilly.com/library/view/ai-engineering/9781098166291/](https://www.oreilly.com/library/view/ai-engineering/9781098166291/)                         |
| **ArXiv-2210.03629**                                       | Paper de investigacion IA            | [arxiv.org/abs/2210.03629](https://arxiv.org/abs/2210.03629)                                                                                         |
| **ArXiv-2302.04761**                                       | Paper tecnico de modelos IA          | [arxiv.org/abs/2302.04761](https://arxiv.org/abs/2302.04761)                                                                                         |
| **ArXiv-2304.03442**                                       | Paper avanzado de IA                 | [arxiv.org/abs/2304.03442](https://arxiv.org/abs/2304.03442)                                                                                         |
| **System-Design-Notes**                                    | Notas de system design               | [github.com/liquidslr/system-design-notes](https://github.com/liquidslr/system-design-notes)                                                         |
| **YouTube Video 1**                                        | Video tecnico recomendado            | [youtube.com/watch?v=zjkBMFhNj_g](https://www.youtube.com/watch?v=zjkBMFhNj_g)                                                                       |
| **YouTube Video 2**                                        | Video tecnico recomendado            | [youtube.com/watch?v=9vM4p9NN0Ts](https://www.youtube.com/watch?v=9vM4p9NN0Ts)                                                                       |
| **YouTube Video 3**                                        | Video tecnico recomendado            | [youtube.com/watch?v=kJLiOGIe3Lw](https://www.youtube.com/watch?v=kJLiOGIe3Lw)                                                                       |
| **YouTube Video 4**                                        | Video tecnico recomendado            | [youtube.com/watch?v=d5ElIXhbcfA](https://www.youtube.com/watch?v=d5ElIXhbcfA)                                                                       |
| **YouTube Video 5**                                        | Video tecnico recomendado            | [youtube.com/watch?v=D7_ipDqhtwk](https://www.youtube.com/watch?v=D7_ipDqhtwk)                                                                       |
| **YouTube Video 6**                                        | Video tecnico recomendado            | [youtube.com/watch?v=kQmXtrmQ5Zg](https://www.youtube.com/watch?v=kQmXtrmQ5Zg)                                                                       |
| **TruffleHog**                                             | Scanner de secretos Git              | [github.com/trufflesecurity/trufflehog.git](https://github.com/trufflesecurity/trufflehog.git)                                                       |
| **Teleport**                                               | Acceso SSH zero-trust                | [github.com/gravitational/teleport.git](https://github.com/gravitational/teleport.git)                                                               |
| **KeyHacks**                                               | Validacion de API keys               | [github.com/streaak/keyhacks.git](https://github.com/streaak/keyhacks.git)                                                                           |
| **JsonCrack**                                              | Visualizador de estructuras JSON     | [github.com/AykutSarac/jsoncrack.com](https://github.com/AykutSarac/jsoncrack.com)                                                                   |
| **Gstack**                                                 | Stack fullstack moderna              | [github.com/garrytan/gstack](https://github.com/garrytan/gstack)                                                                                     |
| **surf**                                                   | Cliente HTTP y toolkit API           | [github.com/enetx/surf](https://github.com/enetx/surf)                                                                                               |
| **fingerprint-suite**                                      | Fingerprinting anti-fraude bots      | [github.com/apify/fingerprint-suite](https://github.com/apify/fingerprint-suite)                                                                     |
| **smallpond**                                              | Framework ETL ligero DuckDB          | [github.com/deepseek-ai/smallpond](https://github.com/deepseek-ai/smallpond)                                                                         |
| **winpodx**                                                | Contenedores Linux en Windows        | [github.com/kernalix7/winpodx](https://github.com/kernalix7/winpodx)                                                                                 |
| **CatVTON**                                                | Try-on virtual por difusion          | [github.com/Zheng-Chong/CatVTON](https://github.com/Zheng-Chong/CatVTON)                                                                             |
| **Youtube-clipper-skill**                                  | Clips YouTube con subtitulos IA      | [github.com/op7418/Youtube-clipper-skill](https://github.com/op7418/Youtube-clipper-skill)                                                           |
| **ANUS**                                                   | Framework agentico open source       | [github.com/anus-dev/ANUS](https://github.com/anus-dev/ANUS)                                                                                         |
| **Fusion**                                                 | Plataforma multiagente para IA       | [github.com/Runfusion/Fusion](https://github.com/Runfusion/Fusion)                                                                                   |
| **claude-code-agent-farm**                                 | Orquesta agentes Claude paralelo     | [github.com/Dicklesworthstone/claude_code_agent_farm](https://github.com/Dicklesworthstone/claude_code_agent_farm)                                   |
| **AutoTTS**                                                | Descubrimiento agentico LLM          | [github.com/zhengkid/AutoTTS](https://github.com/zhengkid/AutoTTS)                                                                                   |
| **Interaction-Models**                                     | Colaboracion humano-IA escalable     | [thinkingmachines.ai/blog/interaction-models](https://thinkingmachines.ai/blog/interaction-models)                                                   |
| **llm-engineer-toolkit**                                   | Coleccion curada de librerias LLM    | [github.com/KalyanKS-NLP/llm-engineer-toolkit](https://github.com/KalyanKS-NLP/llm-engineer-toolkit)                                                 |
| **Dolphin**                                                | Parser visual docs y tablas          | [github.com/bytedance/Dolphin](https://github.com/bytedance/Dolphin)                                                                                 |
| **Hyper-Extract**                                          | Extraccion inteligente documentos    | [github.com/yifanfeng97/Hyper-Extract](https://github.com/yifanfeng97/Hyper-Extract)                                                                 |
| **tracer**                                                 | Reduce coste LLM clasificacion       | [github.com/adrida/tracer](https://github.com/adrida/tracer)                                                                                         |
| **stanford-cs-229-machine-learning**                       | Apuntes y recursos Stanford CS229    | [github.com/afshinea/stanford-cs-229-machine-learning](https://github.com/afshinea/stanford-cs-229-machine-learning)                                 |
| **Anthropic-Fellows-Program**                              | Fellowship investigacion aplicada IA | [job-boards.greenhouse.io/anthropic/jobs/5023394008](https://job-boards.greenhouse.io/anthropic/jobs/5023394008)                                     |
| **pangolin**                                               | Red privada self-hosted segura       | [github.com/fosrl/pangolin](https://github.com/fosrl/pangolin)                                                                                       |
| **dsvpn**                                                  | VPN minima y rapida en C             | [github.com/jedisct1/dsvpn](https://github.com/jedisct1/dsvpn)                                                                                       |
| **tpotce**                                                 | Honeypot telco para ciberdefensa     | [github.com/telekom-security/tpotce](https://github.com/telekom-security/tpotce)                                                                     |
| **pentest-ai-agents**                                      | Agentes IA para pentesting           | [github.com/0xSteph/pentest-ai-agents](https://github.com/0xSteph/pentest-ai-agents)                                                                 |
| **portmaster**                                             | Firewall y privacidad local          | [github.com/safing/portmaster](https://github.com/safing/portmaster)                                                                                 |
| **diagrams**                                               | Diagramas cientificos fisica y ML    | [github.com/janosh/diagrams](https://github.com/janosh/diagrams)                                                                                     |
| **HLA**                                                    | Atencion lineal de orden superior    | [github.com/yifanzhang-pro/HLA](https://github.com/yifanzhang-pro/HLA)                                                                               |
| **Learning-Theory**                                        | Libro Cambridge de learning theory   | [cambridge.org/learning-theory](https://www.cambridge.org/core/books/learning-theory/B39A58737BCA537565FDBC07014AE2B4)                               |
| **Statistics-IB**                                          | Notas de estadistica Cambridge       | [statslab.cam.ac.uk/Sa4.pdf](https://www.statslab.cam.ac.uk/~rrw1/stats/Sa4.pdf)                                                                     |
| **The-recessionary-pressures-of-generative-AI**            | Riesgos socioeconomicos de IA        | [arxiv.org/abs/2403.17405](https://arxiv.org/abs/2403.17405)                                                                                         |
| **The-Impact-of-Artificial-Intelligence-on-Human-Thought** | Impacto IA en pensamiento humano     | [arxiv.org/abs/2508.16628](https://arxiv.org/abs/2508.16628)                                                                                         |
| **The-Deepfakes-We-Missed**                                | Amenazas y deteccion deepfakes       | [arxiv.org/abs/2605.12075](https://arxiv.org/abs/2605.12075)                                                                                         |
| **Geodesics-in-Quantum-Gravity**                           | Geodesicas cuanticas en gravedad     | [arxiv.org/pdf/2510.0117](https://arxiv.org/pdf/2510.0117)                                                                                           |
| **bioRxiv-preprint**                                       | Preprint cientifico en bioRxiv       | [biorxiv.org/content/10.110](https://www.biorxiv.org/content/10.110)                                                                                 |
| **crawl4ai**                                               | Crawl y extraccion web para LLM      | [github.com/unclecode/crawl4ai](https://github.com/unclecode/crawl4ai)                                                                               |
| **youtube-video**                                          | Video educativo IA                   | [youtube.com/@BettaTech](https://www.youtube.com/@BettaTech)                                                                                         |
| **youtube-video-2**                                        | LangChain Official videos 2025       | [youtube.com/results?q=LangChain+2025](https://www.youtube.com/results?search_query=LangChain+2025+tutorial)                                         |
| **jobspy-2**                                               | Busqueda de empleo tecnico           | [github.com/jobspy/jobspy](https://github.com/jobspy/jobspy)                                                                                         |

<!-- markdownlint-enable MD060 -->

## VERSIONS

| _Version_ | **Fase**   | Descripcion ES                  | Descripcion EN                | Hora Madrid        |
| --------- | ---------- | ------------------------------- | ----------------------------- | ------------------ |
| _7_       | **Fase 4** | Insercion y sync de 35 enlaces  | Inserted and synced 35 links  | 23:07 - 14/05/2026 |
| _8_       | **Fase 4** | Insercion y sync de 32 enlaces  | Inserted and synced 32 links  | 11:50 - 15/05/2026 |
| _9_       | **Fase 4** | Insercion y sync de 44 enlaces  | Inserted and synced 44 links  | 18:20 - 18/05/2026 |
| _10_      | **Fase 4** | Insercion y sync de 39 enlaces  | Inserted and synced 39 links  | 19:09 - 18/05/2026 |
| _11_      | **Fase 4** | Insercion y sync de 287 enlaces | Inserted and synced 287 links | 17:52 - 25/05/2026 |
| _12_      | **Fase 4** | Insercion y sync de 488 enlaces | Inserted and synced 488 links | 18:35 - 24/06/2026 |
| _13_      | **Fase 4** | Insercion y sync de 77 enlaces  | Inserted and synced 77 links  | 14:00 - 12/07/2026 |
