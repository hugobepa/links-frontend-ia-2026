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

### Cambios aplicados

| Dataset                                   | Antes | Nuevos | Total |
| ----------------------------------------- | ----- | ------ | ----- |
| `ia_asistentes-desarrollo-china-imagen_1` | 38    | +12    | 50    |
| `dns_seguridad_educacion`                 | 190   | +18    | 208   |
| `utilidades_1`                            | 53    | +1     | 54    |
| `diseno-ui-ux_desarrollo_ide`             | 423   | +1     | 424   |

### Cobertura tecnica

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

### Technical coverage

- Updated `*-rec.json` with resources, counters, and metadata.
- Regenerated `*-struc.json` (`tags`, `filters`, `searchIndex.resources`, `ui.resourceCount`).
- Regenerated `nombre-links.json` with sorted unique names.
- Current total resources in `src/data/dates`: **1116**.

---

## LINKS

| **Nombre**                    | Descripcion                      | Link                                                                                                                                                 |
| ----------------------------- | -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| **PaddlePaddle**              | Framework ML open source         | [github.com/paddlepaddle](https://github.com/paddlepaddle)                                                                                           |
| **Surya**                     | OCR multimodal para documentos   | [github.com/datalab-to/surya](https://github.com/datalab-to/surya)                                                                                   |
| **Kronos**                    | ML para series temporales        | [github.com/shiyu-coder/Kronos.git](https://github.com/shiyu-coder/Kronos.git)                                                                       |
| **Chandra**                   | Framework IA para analisis       | [github.com/datalab-to/chandra](https://github.com/datalab-to/chandra)                                                                               |
| **Kaggle-Whitepaper-Agent**   | Agente Kaggle para papers        | [kaggle.com/whitepaper-agent](https://www.kaggle.com/whitepaper-agent)                                                                               |
| **Prompt-Engineering-Guide**  | Guia de prompt engineering       | [github.com/dair-ai/Prompt-Engineering-Guide](https://github.com/dair-ai/Prompt-Engineering-Guide)                                                   |
| **Made-With-ML**              | Plataforma ML en produccion      | [madewithml.com](https://madewithml.com)                                                                                                             |
| **LLM-Course**                | Curso completo de LLM            | [github.com/mlabonne/llm-course](https://github.com/mlabonne/llm-course)                                                                             |
| **Anthropic-Agents-Guide**    | Guia oficial de agentes          | [anthropic.com/engineering/building-effective-agents](https://www.anthropic.com/engineering/building-effective-agents)                               |
| **OpenAI-Agents-Docs**        | Docs oficiales agentes OpenAI    | [platform.openai.com/docs/guides/agents](https://platform.openai.com/docs/guides/agents)                                                             |
| **HuggingFace-Agents-Course** | Curso agentes de Hugging Face    | [huggingface.co/learn/agents-course](https://huggingface.co/learn/agents-course)                                                                     |
| **Anthropic-Engineering**     | Publicaciones engineering IA     | [anthropic.com/engineering](https://www.anthropic.com/engineering)                                                                                   |
| **Palo-Alto-Cybersec**        | Curso gratis de ciberseguridad   | [paloaltonetworks.es/cyberpedia/free-cybersecurity-education-course](https://www.paloaltonetworks.es/cyberpedia/free-cybersecurity-education-course) |
| **ML-Interview**              | Preparacion entrevistas ML       | [github.com/khangich/machine-learning-interview](https://github.com/khangich/machine-learning-interview)                                             |
| **Build-LLM-From-Scratch**    | Libro para construir LLM         | [manning.com/books/build-a-large-language-model-from-scratch](https://www.manning.com/books/build-a-large-language-model-from-scratch)               |
| **O-Reilly-LLM-Engineering**  | Libro de LLM engineering         | [oreilly.com/library/view/llm-engineering/9781098167298/](https://www.oreilly.com/library/view/llm-engineering/9781098167298/)                       |
| **O-Reilly-AI-Engineering**   | Libro de AI engineering          | [oreilly.com/library/view/ai-engineering/9781098166291/](https://www.oreilly.com/library/view/ai-engineering/9781098166291/)                         |
| **ArXiv-2210.03629**          | Paper de investigacion IA        | [arxiv.org/abs/2210.03629](https://arxiv.org/abs/2210.03629)                                                                                         |
| **ArXiv-2302.04761**          | Paper tecnico de modelos IA      | [arxiv.org/abs/2302.04761](https://arxiv.org/abs/2302.04761)                                                                                         |
| **ArXiv-2304.03442**          | Paper avanzado de IA             | [arxiv.org/abs/2304.03442](https://arxiv.org/abs/2304.03442)                                                                                         |
| **System-Design-Notes**       | Notas de system design           | [github.com/liquidslr/system-design-notes](https://github.com/liquidslr/system-design-notes)                                                         |
| **YouTube Video 1**           | Video tecnico recomendado        | [youtube.com/watch?v=zjkBMFhNj_g](https://www.youtube.com/watch?v=zjkBMFhNj_g)                                                                       |
| **YouTube Video 2**           | Video tecnico recomendado        | [youtube.com/watch?v=9vM4p9NN0Ts](https://www.youtube.com/watch?v=9vM4p9NN0Ts)                                                                       |
| **YouTube Video 3**           | Video tecnico recomendado        | [youtube.com/watch?v=kJLiOGIe3Lw](https://www.youtube.com/watch?v=kJLiOGIe3Lw)                                                                       |
| **YouTube Video 4**           | Video tecnico recomendado        | [youtube.com/watch?v=d5ElIXhbcfA](https://www.youtube.com/watch?v=d5ElIXhbcfA)                                                                       |
| **YouTube Video 5**           | Video tecnico recomendado        | [youtube.com/watch?v=D7_ipDqhtwk](https://www.youtube.com/watch?v=D7_ipDqhtwk)                                                                       |
| **YouTube Video 6**           | Video tecnico recomendado        | [youtube.com/watch?v=kQmXtrmQ5Zg](https://www.youtube.com/watch?v=kQmXtrmQ5Zg)                                                                       |
| **TruffleHog**                | Scanner de secretos Git          | [github.com/trufflesecurity/trufflehog.git](https://github.com/trufflesecurity/trufflehog.git)                                                       |
| **Teleport**                  | Acceso SSH zero-trust            | [github.com/gravitational/teleport.git](https://github.com/gravitational/teleport.git)                                                               |
| **KeyHacks**                  | Validacion de API keys           | [github.com/streaak/keyhacks.git](https://github.com/streaak/keyhacks.git)                                                                           |
| **JsonCrack**                 | Visualizador de estructuras JSON | [github.com/AykutSarac/jsoncrack.com](https://github.com/AykutSarac/jsoncrack.com)                                                                   |
| **Gstack**                    | Stack fullstack moderna          | [github.com/garrytan/gstack](https://github.com/garrytan/gstack)                                                                                     |

## VERSIONS

| _Version_ | **Fase**   | Descripcion ES                 | Descripcion EN               | Hora Madrid        |
| --------- | ---------- | ------------------------------ | ---------------------------- | ------------------ |
| _7_       | **Fase 4** | Insercion y sync de 35 enlaces | Inserted and synced 35 links | 23:07 - 14/05/2026 |
