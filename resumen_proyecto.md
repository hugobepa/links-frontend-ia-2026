# Resumen del Proyecto / Project Summary

**Versión**: 1.1.2  
**Creado**: 09/05/2026  
**Actualizado**: 10/05/2026  
**Rama activa**: 002-links-frontend-ia-phase-2  
**Tipo**: Documentación de estado actual (Fases 1-3) / Current state documentation (Phases 1-3)

---

## 📋 ES — Resumen Ejecutivo

**Links Frontend IA 2026** es un repositorio de Astro diseñado para crear una página web responsive que centraliza y categoriza enlaces de programación enfocados en **frontend, aplicaciones web y desarrollo moderno**.

### Propósito Actual

Documentar el estado actual del repositorio, tecnologías activas, configuración Speckit, disponibilidad de skills de Copilot y superficies de soporte (.specify, .github, .git) para mantener una línea base clara durante las fases 1-3.

### Stack Principal

- **Astro** 6.1.9 + **TypeScript** 5.x
- **React** 19.2.5 + **Tailwind CSS** 4.2.4
- **shadcn/ui** + componentes **Radix UI**
- **Starlight** para documentación integrada
- **Bun** como gestor de paquetes/dependencias

---

## 📋 EN — Executive Summary

**Links Frontend IA 2026** is an Astro repository designed to create a responsive web page that centralizes and categorizes programming links focused on **frontend, web applications, and modern development**.

### Current Purpose

Document the repository's current state, active technologies, Speckit configuration, Copilot skill availability, and support surfaces (.specify, .github, .git) to keep a clear baseline across phases 1-3.

### Primary Stack

- **Astro** 6.1.9 + **TypeScript** 5.x
- **React** 19.2.5 + **Tailwind CSS** 4.2.4
- **shadcn/ui** + **Radix UI** components
- **Starlight** for integrated documentation
- **Bun** as package/dependency manager

---

## 🌳 Estructura del Repositorio / Repository Structure

```text
links-frontend-ia-2026/                    [raíz repo / repo root]
│
├── .agents/                               [Skills de Copilot / Copilot Skills]
│   ├── skills/
│   │   ├── astro/
│   │   ├── brainstorming/
│   │   ├── executing-plans/
│   │   ├── frontend-design/
│   │   ├── git-commit/
│   │   ├── github-actions-docs/
│   │   ├── interface-design/
│   │   ├── seo-audit/
│   │   ├── shadcn/
│   │   ├── tailwind-design-system/
│   │   ├── vercel-composition-patterns/
│   │   ├── vercel-react-best-practices/
│   │   ├── web-design-guidelines/
│   │   └── writing-plans/
│   └── ...
│
├── .astro/                                [caché Astro / Astro cache]
├── .git/                                  [historial de versiones / version control]
├── .github/                               [flujos CI/CD / CI/CD workflows]
│   ├── prompts/                           [prompts Speckit / Speckit prompts]
│   └── ...
│
├── .specify/                              [configuración Speckit]
│   ├── extensions/                        [extensiones Speckit]
│   ├── integrations/                      [integración Copilot]
│   ├── scripts/                           [scripts internos]
│   ├── memory/
│   │   └── constitution.md                [principios del proyecto / project principles]
│   ├── templates/
│   ├── extensions.yml                     [hooks Speckit]
│   ├── feature.json                       [feature activa]
│   ├── init-options.json                  [opciones iniciales]
│   └── integration.json                   [config de integración]
│
├── .vscode/                               [configuración editor / editor config]
├── dist/                                  [build salida / build output]
├── node_modules/                          [dependencias / dependencies]
├── package-lock.json                      [lock npm]
├── preproyecto/                           [datos base proyecto / base project data]
│   ├── 2.creacion_proyecto.md             [requisitos fase 1-9 / phase 1-9 requirements]
│   ├── proyecto_estructura.md             [bitácora cambios / change log]
│   ├── jsons-news-interficies/            [dataset categorizado / categorized data sets]
│   └── pre-config-general/                [guías de diseño, legal, SEO / design, legal, SEO guides]
│
├── public/                                [assets públicos / public assets]
│   └── favicon.svg
│
├── specs/                                 [especificaciones Speckit]
│   └── 001-links-frontend-ia-phase-1/
│       ├── spec.md                        [especificación / specification]
│       ├── plan.md                        [plan de implementación / implementation plan]
│       ├── research.md                    [decisiones técnicas / technical decisions]
│       ├── data-model.md                  [modelo de datos / data model]
│       ├── quickstart.md                  [guía rápida / quick start]
│       ├── tasks.md                       [lista de tareas / task checklist]
│       ├── analysis.md                    [reporte de análisis / analysis report]
│       └── checklists/
│           └── requirements.md
│   ├── 002-links-frontend-ia-phase-2/     [specs fase 2]
│   │   ├── spec.md
│   │   ├── plan.md
│   │   ├── research.md
│   │   ├── data-model.md
│   │   ├── quickstart.md
│   │   ├── tasks.md
│   │   ├── analysis.md
│   │   └── checklists/
│   └── 003-links-frontend-ia-phase-3/     [specs fase 3 en progreso]
│       ├── spec.md
│       ├── plan.md
│       ├── tasks.md
│       └── checklists/
│
├── src/                                   [código fuente / source code]
│   ├── data/                              [datos de trabajo / working data]
│   │   ├── dates/                         [JSON de recursos / resource JSON]
│   │   └── search/                        [JSON de estructura / structure JSON]
│   ├── assets/                            [media / media]
│   ├── components/
│   │   ├── BackToTop.tsx                  [volver arriba]
│   │   ├── Header.astro                   [header con menu mobile]
│   │   ├── Footer.astro                   [pie de página]
│   │   ├── CategoryNavigation.astro       [navegación categorías]
│   │   ├── CategorySearch.tsx             [buscador categorías]
│   │   ├── GlobalSearch.tsx               [buscador global]
│   │   └── ...
│   │   └── ui/                            [componentes reutilizables / reusable components]
│   ├── interfaces/                        [interfaces TS de datos / data TS interfaces]
│   │   ├── dates/                         [interfaces de recursos / resource interfaces]
│   │   └── search/                        [interfaces de búsqueda / search interfaces]
│   ├── content/
│   │   ├── docs/                          [documentación local / local documentation]
│   │   ├── guides/
│   │   └── reference/
│   ├── i18n/                              [traducciones ES/EN]
│   ├── lib/
│   │   ├── loaders.ts                     [carga principal de datos]
│   │   └── utils.ts                       [utilidades helpers / helper utilities]
│   ├── pages/
│   │   ├── index.astro                    [página principal / main page]
│   │   ├── buscador/index.astro           [búsqueda ES]
│   │   ├── categories/
│   │   │   ├── index.astro                [listado categorías ES]
│   │   │   └── [slug].astro               [detalle categoría ES]
│   │   └── en/
│   │       ├── index.astro                [home EN]
│   │       ├── buscador/index.astro       [search EN]
│   │       └── categories/
│   │           ├── index.astro            [categories EN]
│   │           └── [slug].astro           [category detail EN]
│   ├── styles/
│   │   └── global.css                     [estilos base / base styles]
│   └── content.config.ts
│
├── .gitignore                             [reglas de ignorado / ignore rules]
├── astro.config.ts                        [configuración Astro ACTIVA / ACTIVE config]
├── astro.config.mjs                       [configuración Astro LEGADO / LEGACY config]
├── bun.lock                               [lock de dependencias Bun]
├── components.json                        [configuración shadcn/ui]
├── package.json                           [scripts y dependencias / scripts & dependencies]
├── README.md                              [documentación principal / main documentation]
├── skills-lock.json                       [lock de skills / skills lock]
└── tsconfig.json                          [configuración TypeScript / TypeScript config]
```

---

## 📦 Tabla de Tecnologías y Versiones / Technologies & Versions Table

| Tecnología / Technology | Versión / Version | Categoría / Category | Propósito / Purpose                               |
| ----------------------- | ----------------- | -------------------- | ------------------------------------------------- |
| **Astro**               | 6.1.9             | Framework Web        | Generador SSG/SSR de sitios web                   |
| **TypeScript**          | 5.x               | Lenguaje / Language  | Type-safe JavaScript                              |
| **React**               | 19.2.5            | UI Framework         | Componentes interactivos / Interactive components |
| **Tailwind CSS**        | 4.2.4             | CSS Framework        | Estilos utilitarios / Utility-first styling       |
| **shadcn/ui**           | (dep. radix-ui)   | Component Library    | Componentes accesibles / Accessible components    |
| **Radix UI**            | 1.4.3             | Component Lib        | Primitivos UI accesibles / Accessible primitives  |
| **Starlight**           | 0.38.4            | Docs Framework       | Documentación integrada / Integrated docs         |
| **Lucide React**        | 1.14.0            | Icon Library         | Iconografía / Icon set                            |
| **Node/Bun**            | Latest            | Runtime              | Gestor paquetes / Package manager                 |
| **@astrojs/react**      | 5.0.4             | Integration          | Plugin React para Astro                           |
| **@astrojs/starlight**  | 0.38.4            | Integration          | Plugin docs para Astro                            |
| **sharp**               | 0.34.5            | Image Tool           | Procesamiento imágenes / Image processing         |

---

## 🔧 Tabla de Agents (Copilot Skills) / AGENTS Table

| #   | Nombre / Name                   | Descripción / Description (≤40 chars)     | Categoría / Category |
| --- | ------------------------------- | ----------------------------------------- | -------------------- |
| 1   | **astro**                       | Construir con Astro, componentes SSR      | Framework            |
| 2   | **brainstorming**               | Explorar ideas y diseño antes de código   | Planning             |
| 3   | **executing-plans**             | Ejecutar planes multi-paso con revisiones | Execution            |
| 4   | **frontend-design**             | Crear UIs polidas y productivas           | Design               |
| 5   | **git-commit**                  | Commits semánticos con Conventional       | Git                  |
| 6   | **github-actions-docs**         | Workflows CI/CD con GitHub Actions        | DevOps               |
| 7   | **interface-design**            | Diseñar dashboards y paneles / UI         | Design               |
| 8   | **seo-audit**                   | Auditar y mejorar SEO técnico             | SEO                  |
| 9   | **shadcn**                      | Gestionar componentes shadcn/ui           | Components           |
| 10  | **tailwind-design-system**      | Sistemas de diseño Tailwind escalables    | Design               |
| 11  | **vercel-composition-patterns** | Patrones React composition avanzados      | React                |
| 12  | **vercel-react-best-practices** | Optimización rendimiento React/Next.js    | Performance          |
| 13  | **web-design-guidelines**       | Validar UI contra Web Guidelines          | Accessibility        |
| 14  | **writing-plans**               | Escribir especificaciones y planes        | Planning             |

---

## 📅 Tabla de Versiones y Cambios / Versions & Changes Table

| Versión / Version | Fecha / Date | Fase / Phase | Cambio ES / Change ES                     | Cambio EN / Change EN                | Completado / Completed |
| ----------------- | ------------ | ------------ | ----------------------------------------- | ------------------------------------ | ---------------------- |
| 1.0.0             | 09/05/2026   | Fase 1       | Análisis struct. repo                     | Analyzed repo struct.                | ✅ 17:45               |
| 1.0.0             | 09/05/2026   | Fase 1       | Documentado tech stack                    | Documented tech stack                | ✅ 17:45               |
| 1.0.0             | 09/05/2026   | Fase 1       | Catalogued 14 skills                      | Catalogued 14 skills                 | ✅ 17:45               |
| 1.0.0             | 09/05/2026   | Fase 1       | Created baseline summary                  | Created baseline summary             | ✅ 17:45               |
| 1.1.0             | 10/05/2026   | Fase 2-3     | Actualización estado real repo + .specify | Updated real repo + .specify status  | ✅ 20:26               |
| 1.1.1             | 10/05/2026   | Fase 2-3     | Revisión consistencia con spec fase 3     | Consistency review vs phase 3 spec   | ✅ 20:39               |
| 1.1.2             | 10/05/2026   | Fase 2       | Scroll interno sidebar solo desktop       | Desktop-only sidebar internal scroll | ✅ 20:52               |

---

## 🔌 Superficies de Soporte / Support Surfaces

### Speckit (.specify/)

- **memory/constitution.md**: Principios del proyecto (fases, local-first, integridad datos)
- **feature.json**: Puntero a feature actual (`specs/003-links-frontend-ia-phase-3`)
- **extensions.yml**: Hooks de automatización Speckit (auto execute + git hooks before/after comandos)
- **init-options.json**: Config Speckit (`integration: copilot`, `branch_numbering: sequential`, `script: ps`)
- **integration.json**: Config de integración Copilot (`update-context.ps1`)
- **integrations/**: Integración activa de Copilot + manifests
- **extensions/**: Registro de extensiones Speckit (incluye `git/`)
- **templates/**: Plantillas de spec, plan, tasks, checklist, constitution

### GitHub Support (.github/)

- **prompts/**: Prompts para `/speckit.*` commands (specify, clarify, plan, tasks, analyze, implement)
- **workflows/**: (extensible para CI/CD futuro)

### Git (.git/)

- **Rama principal**: master
- **Rama activa**: 002-links-frontend-ia-phase-2
- **Ramas de trabajo**: fases 001, 002 y 003 presentes en `specs/`
- **Commits**: historial de setup Speckit + iteraciones de contenido/UI
- **Histórico**: Commits convencionales (`chore(speckit): ...`)

### Especificación Local (preproyecto/)

- **2.creacion_proyecto.md**: Requisitos fases 1-9, estructuras de datos, categorías
- **proyecto_estructura.md**: Bitácora de cambios y control de versiones
- **jsons-news-interficies/**: Dataset categorizado (14 categorías de links)
- **pre-config-general/**: Guías de diseño, legal, SEO, plantillas

### Nueva Estructura de Datos (src/)

- **resumen_datos.md**: resumen técnico actual de la estructura de datos de trabajo
- **src/data/dates/**: JSON de recursos por categoría (`xxxx-rec.json`)
- **src/data/search/**: JSON de estructura/búsqueda por categoría (`xxxx-struc.json`, `nombre-links.json`)
- **src/interfaces/dates/**: interfaces TypeScript de recursos (`xxxx-rec.ts`, `xxxx-data.ts`)
- **src/interfaces/search/**: interfaces TypeScript de búsqueda (`xxxx-busq.ts`, `xxxx-data.ts`)
- **src/lib/loaders.ts**: lectura principal desde `src/data` para Astro y React

---

## ✅ Validación Contra Especificación / Specification Validation

### Estado de Consistencia con Fase 3 / Phase 3 Consistency Status

- ✅ `feature.json` apunta a `specs/003-links-frontend-ia-phase-3`.
- ✅ Existen `spec.md`, `plan.md` y `tasks.md` en fase 3.
- ⚠️ Desviación funcional actual: el header ya no muestra `LanguageToggle`; usa menú hamburguesa en móvil.
- ⚠️ Desviación de proceso: la rama activa real es `002-links-frontend-ia-phase-2` mientras la feature activa de Speckit es fase 3.

### User Stories Cumplidas / User Stories Met

- ✅ **US1 - Repository Baseline Summary**: Resumen raíz bilíngüe creado
- ✅ **US2 - Tooling Inventory**: 14 skills catalogados en tabla AGENTS
- ✅ **US3 - Phase Control Record**: Tabla VERSIONS con timestamps Madrid

### Requisitos Funcionales Cumplidos / Functional Requirements Met

- ✅ **FR-001**: resumen_proyecto.md en raíz
- ✅ **FR-002**: Árbol ASCII describiendo estructura
- ✅ **FR-003**: Tabla de tecnologías con versiones
- ✅ **FR-004**: Tabla AGENTS con skills Copilot
- ✅ **FR-005**: Tabla VERSION con cambios bilingües + timestamp Madrid
- ✅ **FR-006**: .specify, .agents, .github, .git documentados
- ✅ **FR-007**: Solo documentación, sin código funcional
- ✅ **FR-008**: Técnico, conciso, apto para futuras fases

### Success Criteria Cumplidos / Success Criteria Met

- ✅ **SC-001**: Documento único, localizables estructura+tools+agents en <1 min
- ✅ **SC-002**: Cubre repo sin inspeccionar código
- ✅ **SC-003**: Bilíngüe (ES/EN), secciones claramente separadas
- ✅ **SC-004**: Tabla VERSIONS append-only, extensible

---

## 📝 Notas Fase 1 / Phase 1 Notes

1. **Configuración Astro**: `astro.config.ts` es activa; `astro.config.mjs` se mantiene como legado.
2. **Speckit activo**: `feature.json` apunta a fase 3 y hay specs completas de fase 1 y fase 2.
3. **Navegación UI**: toggle de idioma retirado del header; menú hamburguesa usado para mobile.
4. **Bilingual Standard**: ES/EN mantenido en rutas y contenido de interfaz.
5. **Local-First Until Phase 9**: Se mantiene el enfoque local-first según constitution.
6. **Sidebar categorías (desktop)**: el panel lateral sticky usa scroll interno en web responsive (`max-h` + `overflow-y-auto`) para evitar desbordes de altura.

---

**Estado actual**: Fase 2 operativa + Fase 3 documentada (en ajuste de implementación) ✅  
**Próxima**: Alinear implementación real con criterios FR/SC de fase 3 o actualizar spec fase 3 para reflejar decisiones UX actuales.

---

_Documento generado por Speckit Phase 1 Implementation | Generated by Speckit Phase 1 Implementation_  
_Rama / Branch: 002-links-frontend-ia-phase-2_  
_Commit: (ver git log para historial)_
