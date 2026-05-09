# Implementación Cookie Consent en Next.js/React

En Next.js y React, la gestión de cookies requiere componentes cliente (`'use client'`) y hooks de estado. La privacidad es prioritaria para cumplir normativas GDPR. El almacenamiento se realiza en `localStorage` para persistencia entre sesiones.

## Pasos de Implementación

1.  **Componente:** Crea `CookieBanner.tsx` con directiva `'use client'`.
2.  **Estado:** Usa `useState` y `useEffect` para gestionar visibilidad.
3.  **Estilos:** Aplica Tailwind CSS para diseño responsivo y accesible.
4.  **Storage:** Guarda preferencias en `localStorage` del navegador.
5.  **Contexto:** Opcionalmente crea `CookieContext` para acceso global.
6.  **Bloqueo:** Condiciona carga de scripts terceros según consentimiento.
7.  **Layout:** Incluye el banner en `layout.tsx` o componente raíz.
8.  **Accesibilidad:** Asegura navegación por teclado y ARIA labels.
9.  **Expiración:** Opcionalmente añade fecha expiración al consentimiento.
10. **Analytics:** Integra Google Analytics solo tras aceptación explícita.

## Estructura de Código Simplificada

```tsx
// CookieBanner.tsx
'use client'
import { useState, useEffect } from 'react'
export default function CookieBanner() {
  const [show, setShow] = useState(false)
  useEffect(() => {
    if (!localStorage.getItem('cookies_accepted')) setShow(true)
  }, [])
  const accept = () => {
    localStorage.setItem('cookies_accepted', 'true')
    setShow(false)
  }
  if (!show) return null
  return (
    <div className="fixed bottom-0 w-full p-4 bg-white border">
      <p>Usamos cookies para mejorar tu experiencia.</p>
      <button onClick={accept}>Aceptar</button>
    </div>
  )
}

// layout.tsx
import CookieBanner from '@/components/CookieBanner'
export default function RootLayout({ children }) {
  return (
    <html>
      <body>{children}<CookieBanner /></body>
    </html>
  )
}
```

## Herramientas del Ejemplo

| **Nombre** | Categoría | Descripción (Max 40 chars) | Link |
| :--- | :--- | :--- | :--- |
| **Next.js** | Framework | Framework React servidor cliente. | [Next.js](https://nextjs.org) |
| **React** | Librería | Librería UI componentes interactivos. | [React](https://react.dev) |
| **Tailwind** | Estilo | Utilidades CSS diseño responsivo. | [Tailwind](https://tailwindcss.com) |
| **LocalStorage** | API | Almacenamiento persistente navegador. | [MDN](https://developer.mozilla.org) |
| **GDPR** | Normativa | Regulación protección datos europea. | [GDPR](https://gdpr.eu) |
| **TypeScript** | Lenguaje | Tipado estático opcional seguro. | [TypeScript](https://typescriptlang.org) |
| **Vite** | Build | Empaquetado rápido desarrollo local. | [Vite](https://vitejs.dev) |
| **VS Code** | Editor | Entorno desarrollo extensiones React. | [VS Code](https://code.visualstudio.com) |
| **GitHub** | Repo | Alojamiento código versión abierto. | [GitHub](https://github.com) |
| **NPM** | Registry | Distribución paquetes node js. | [NPM](https://npmjs.com) |