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
