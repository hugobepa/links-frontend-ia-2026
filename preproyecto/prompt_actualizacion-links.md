<!-- markdownlint-disable MD033 MD041 -->

<rol>
Analista programador senior que busca la excelencia.
</rol>

<objetivo>
Actualizar y añadir links a la página `https://hugobepa.github.io/links-frontend-ia-2026/`.
</objetivo>

<contexto>

- **Sin duplicados**: verificar que el link no exista en `archivos_datos_link` antes de insertar.
- **Normalización URL semántica (obligatoria)**:
  - No eliminar querystrings funcionales al deduplicar (`?list=`, `?v=`, `?itemName=`, `?hl=`, etc.).
  - Sí eliminar solo parámetros de tracking (`utm_*`, `fbclid`, `gclid`, `si`) cuando no cambian el recurso.
  - En YouTube, tratar como válidos y distintos: `https://www.youtube.com/playlist?list=...` y `https://www.youtube.com/watch?v=...`.
  - Si aparece `playlist?lits=...`, corregirlo a `playlist?list=...` antes de validar e insertar.
- **Categorías, subcategorías, tags y types**: usar solo los existentes.
  - Consensuar la información con los términos más adecuados disponibles.
  - Prohibido crear nuevas categorías, subcategorías, tags o etiquetas.
- **Mismo recurso, distinta URL**: permitido si cumple las normas. Solo uno por tipo y tecnología:
  - Repo GitHub → `xxxx-gh`
  - Web → `xxxx-web`
  - Gestor de paquetes → `xxxx-pack`
  - Documentación oficial → `xxxx-doc`
  - Referencia oficial → `xxxx-ref`
- **Flujo de inserción**:
  1. Leer `link-insertados` (se crea antes de cada sesión); si no existe, usar `link-general`.
  2. Verificar duplicados contra todos los `archivos_datos_link`.
  3. Para cada link no duplicado:
     - Buscar información en web para determinar la categoría más apropiada según `categorias_subcategorias_tags_type`.
     - Asignar tags y types basándose en esa búsqueda.
     - `id`, `name`, `slug`: nombre del link.
     - `description`: español, máximo 40 caracteres (ver `estructura_json_datos`).
     - `limits`: máximo 20 caracteres si es `freemium`; `no-limits` si es free o premium.
     - `language`: mínimo `EN`; añadir `ES` si la web está en español.
     - `added`: fecha de inserción.
     - `verified`: estado de verificación.
  4. Actualizar términos de búsqueda en sus ficheros con los nuevos links (ver apartado `links`).

</contexto>

<pautas-ia>

- `xxxx` no es una categoría: representa el nombre real de cada bloque de datos por categoría.
- Usar agentes siempre que sea posible; los disponibles están en `.agents/`.
- Usar `-cli` y `mcp` instalados para trabajar más eficazmente; primero los `-cli` en `C:\Users\User\Documents\programacion2025\IA\MCP\proyecto`.
- Después de cada cambio, actualizar `resumen_datos.md` (raíz del proyecto):
  - Español e inglés (en la sección de estructura no repetir idioma).
  - Breve, conciso, técnico, claro y específico.
  - Usar explicaciones, listas, tablas, ejemplos y árboles ASCII.
  - Al final, tabla `LINKS`: **Nombre** (solo tecnología, negrita) | Descripción (máx. 40 car.) | Link.
  - Al final, tabla `VERSIONS`: _Versión_ (entero, cursiva) | **Fase** (negrita) | Descripción ES (máx. 40 car.) | Descripción EN (máx. 40 car.) | `HH:MM - DD/MM/YYYY` (hora Madrid).
- Antes de cada cambio, verificar la fase actual en la tabla `VERSIONS` de `resumen_datos.md` para evitar alucinaciones y saltos de fase.

</pautas-ia>

<fases>

### Fase 1 — Extracción y deduplicación

- **1.1** Leer `link-insertados` (o `link-general` si no existe) y extraer URLs candidatas.
- **1.2** Verificar duplicados contra todos los `archivos_datos_link` (`src/data/dates/<categoria>/<categoria>-rec.json`).
- **1.3** Generar lista de links no duplicados a insertar.

### Fase 2 — Análisis y categorización

- **2.1** Para cada link nuevo, buscar información en web.
- **2.2** Asignar categoría, subcategoría, tags y type usando `categorias_subcategorias_tags_type`.
- **2.3** Completar todos los campos: `id`, `name`, `slug`, `description`, `limits`, `language`, `added`, `verified`.

### Fase 3 — Inserción en datos y búsqueda

- **3.1** Insertar en `archivos_datos_link` (`src/data/dates/<categoria>/<categoria>-rec.json`).
- **3.2** Actualizar `archivos_busqueda` (`src/data/search/<categoria>/<categoria>-struc.json`).
- **3.3** Actualizar `nombre-slug_links` (`src/data/search/<categoria>/nombre-links.json`).

### Fase 4 — Cierre y documentación

- **4.1** Actualizar `resumen_datos.md` con los cambios producidos.
- **4.2** Actualizar tabla `VERSIONS` con versión, fase, descripción y hora (Madrid).
- **4.3** Verificar que no haya alucinaciones ni pasos omitidos.

</fases>

<formato>

- Dividir el trabajo en fases y subfases (máx. 3 tareas por subfase, 1 prompt por tarea).
- No presupongas nada, no obvies nada y no te saltes ningún paso.
- Comprimir contexto y resumir lo esencial en cada paso.
- Comprobar cada 5 pasos si hay alucinaciones o se ha saltado algún paso.
- En caso de duda, presentar 3 opciones (la 1.ª recomendada con pros/contras) + opción 4 libre.
- Breve, conciso, claro y técnico.
- Usar explicaciones, listas, tablas, árboles ASCII, ejemplos y links de referencia.
- **Tabla web** — columnas: `name` | `description` | `url` | `status` | `pricing` | `languages` | `limits` | `verified` | `noCreditCard`
  - `name`: solo tecnología o último segmento del repo GitHub, en **negrita**.
  - `url`: link con descripción, se abre en pestaña nueva.
  - `status`: ✅ o ❌.
  - `languages`: **ES** / **EN** en negrita.
  - `limits`: texto o `no-limits`.
  - `verified`: ✅ o ❌.
  - `noCreditCard`: icono tarjeta o `sin tarjeta`.
- **Lista móvil** — campos: `name` | `description` | `url` | `pricing` | `languages` | `noCreditCard`
  - `url`: se abre en la misma pestaña.
- Sin términos duplicados en listas o tablas.

</formato>

<restricciones>

- No crear categorías, subcategorías, tags ni etiquetas nuevas.
- No duplicar links existentes.
- Máximo 1 link por tipo de recurso (`-gh`, `-web`, `-pack`, `-doc`, `-ref`) por tecnología.
- No modificar archivos fuera de `src/data/`, `src/interfaces/` y `resumen_datos.md` salvo indicación explícita.
- No modificar interfaces TypeScript existentes salvo que sea necesario para soportar un campo nuevo.
- Verificar siempre la fase actual antes de ejecutar cualquier cambio.

</restricciones>

<links>

- [link-general](preproyecto/link-general.md)
- [link-insertados](preproyecto/links-insertados.md) ← se crea antes de cada sesión; si no existe, usar `link-general`
- [estructura_datos](resumen_datos.md)
- [archivos_datos_link](src/data/dates/<categoria>/<categoria>-rec.json)
- [archivos_busqueda](src/data/search/<categoria>/<categoria>-struc.json)
- [nombre-slug_links](src/data/search/<categoria>/nombre-links.json)
- [categorias_subcategorias_tags_type](src/interfaces/dates/<categoria>/<categoria>-data.ts)
- [estructura_json_datos](src/interfaces/dates/<categoria>/<categoria>-rec.ts)
- [estructura_json_busqueda](src/interfaces/search/<categoria>/<categoria>-busq.ts)
- [datos_json_busqueda](src/interfaces/search/<categoria>/<categoria>.ts)
- [estructura_categorias](src/interfaces/categories.ts)

</links>

<tecnologia>

Tecnología del proyecto (siempre última versión):

| **Nombre**       | Descripción                  | Links                                                                                                      |
| ---------------- | ---------------------------- | ---------------------------------------------------------------------------------------------------------- |
| **Bun**          | Runtime y gestor de paquetes | [docs](https://bun.sh/docs) · [guides](https://bun.sh/docs/guides) · [manual](https://context7.com/?q=bun) |
| **Astro**        | Framework web                | [docs](https://docs.astro.build/en/getting-started/) · [manual](https://context7.com/?q=astro)             |
| **Tailwind CSS** | CSS utility-first            | [docs](https://tailwindcss.com/docs/installation/using-vite)                                               |
| **shadcn/ui**    | Componentes UI               | [docs](https://ui.shadcn.com/docs/installation) · [manual](https://context7.com/?q=shadcn)                 |
| **Starlight**    | Plantilla Astro              | [github](https://github.com/withastro/starlight) · [manual](https://context7.com/?q=starlight)             |
| **Pagefind**     | Búsqueda estática            | [docs](https://pagefind.app/docs/) · [manual](https://context7.com/?q=pagefind)                            |
| **GitHub Pages** | Despliegue                   | [docs](https://docs.github.com/es/pages) · [manual](https://context7.com/?q=github)                        |
| **Speckit**      | Gestión de specs             | [github](https://github.com/github/spec-kit/blob/main/README.md)                                           |

Soporte IA del proyecto (rutas relativas a la raíz del proyecto):

- Speckit: `.specify/`
- Agentes IA: `.agents/`
- GitHub config: `.github/`

</tecnologia>
