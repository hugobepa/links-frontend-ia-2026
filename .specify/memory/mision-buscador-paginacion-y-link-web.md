# Mision Buscador - Paginacion y Link Web

Fecha: 2026-05-10
Estado: implementado
Scope: pagina /buscador

## Requerimientos aplicados (estilo Speckit)

- Paginacion de 50 links por pagina.
- Ventana de paginador de 5 numeros por bloque.
- Pagina actual marcada.
- Flechas laterales para navegar entre paginas.
- Flecha izquierda deshabilitada en pagina 1.
- Flecha derecha deshabilitada en ultima pagina.
- Inicio en pagina 1.
- Si solo existe una pagina, paginador oculto.
- Si hay menos de 5 paginas, solo se muestran las existentes.
- En cada card del buscador: accion para ir a web externa.
  - Mobile: abre en la misma pestaña.
  - Desktop: abre en nueva pestaña.
- BackToTop se mantiene sin cambios.
- Ajuste posterior: boton/filtro `De pago` eliminado del grupo de filtros visibles.

## Implementacion tecnica

Archivo principal:

- src/components/GlobalSearch.tsx

Cambios clave:

- Estados de paginacion con `currentPage`.
- Calculo de `totalPages`, `visiblePages` y `paginatedResources`.
- Paginador con botones numericos y flechas disable segun estado.
- Boton `Ir a web` por card con deteccion de viewport (`matchMedia`).
- Se conserva navegacion a categoria por card/titulo.
- `pricingOptions` visible en UI: `Todos`, `Gratis`, `Freemium`, `Premium`.

## No cambios

- Sin cambios en loaders ni estructura de datos.
- Sin cambios en BackToTop.
- Sin cambios fuera del flujo del buscador.
