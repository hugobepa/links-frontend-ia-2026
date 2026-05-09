# Implementación Cookie Consent en Astro

Astro no tiene estado reactivo por defecto en el servidor. La gestión de cookies requiere scripts en el cliente (`client:only`) y almacenamiento local (`localStorage`). La privacidad es prioritaria para cumplir normativas GDPR.

## Pasos de Implementación

1.  **Componente:** Crea `CookieBanner.astro` con estructura HTML semántica.
2.  **Estilos:** Usa Tailwind CSS para diseño responsivo y discreto.
3.  **Lógica:** Script en `client:only` para gestionar aceptación/rechazo.
4.  **Storage:** Guarda preferencias en `localStorage` para persistencia.
5.  **Layout:** Incluye el componente en `Layout.astro` globalmente.
6.  **Bloqueo:** Condiciona carga de scripts terceros según consentimiento.

## Estructura de Código Simplificada

```astro
---
// CookieBanner.astro
---
<div id="cookie-banner" class="hidden fixed bottom-0 w-full p-4 bg-white border">
  <p>Usamos cookies para mejorar tu experiencia.</p>
  <button id="accept-btn">Aceptar</button>
</div>

<script client:only>
  const banner = document.getElementById('cookie-banner')
  if (!localStorage.getItem('cookies_accepted')) {
    banner.classList.remove('hidden')
  }
  document.getElementById('accept-btn').addEventListener('click', () => {
    localStorage.setItem('cookies_accepted', 'true')
    banner.classList.add('hidden')
  })
</script>
```

## Herramientas del Ejemplo

| **Nombre** | Categoría | Descripción (Max 40 chars) | Link |
| :--- | :--- | :--- | :--- |
| **Astro** | Framework | Framework web contenido islas. | [Astro](https://astro.build) |
| **Tailwind** | Estilo | Utilidades CSS diseño responsivo. | [Tailwind](https://tailwindcss.com) |
| **LocalStorage** | API | Almacenamiento persistente navegador. | [MDN](https://developer.mozilla.org) |
| **Vanilla JS** | Lenguaje | Scripting cliente sin dependencias. | [JavaScript](https://javascript.info) |
| **GDPR** | Normativa | Regulación protección datos europea. | [GDPR](https://gdpr.eu) |
| **Vite** | Build | Empaquetado rápido desarrollo local. | [Vite](https://vitejs.dev) |
| **TypeScript** | Lenguaje | Tipado estático opcional seguro. | [TypeScript](https://typescriptlang.org) |
| **VS Code** | Editor | Entorno desarrollo extensiones Astro. | [VS Code](https://code.visualstudio.com) |
| **GitHub** | Repo | Alojamiento código versión abierto. | [GitHub](https://github.com) |
| **NPM** | Registry | Distribución paquetes node js. | [NPM](https://npmjs.com) |