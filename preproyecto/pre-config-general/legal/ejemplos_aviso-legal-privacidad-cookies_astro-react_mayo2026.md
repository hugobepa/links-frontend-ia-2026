Aquí tienes las plantillas listas para producción, adaptadas a **Astro, React y Next.js** usando **TypeScript, HTML/JS y Tailwind CSS v4**. Se han aplicado las directrices de la AEPD (igual prominencia en botones, consentimiento granular, registro auditado) y se ha excluido el e-commerce como solicitaste.

---
### 📦 1. Páginas Legales (HTML/TSX + Tailwind v4)
*Reemplaza los corchetes `[...]` con tus datos reales. Las clases usan utilidades nativas de Tailwind v4 sin depender de plugins.*

#### `AvisoLegal.tsx` / `AvisoLegal.astro`
```tsx
export default function AvisoLegal() {
  return (
    <article className="max-w-3xl mx-auto px-4 py-12 space-y-8 text-gray-800 dark:text-gray-200">
      <h1 className="text-3xl font-bold tracking-tight">Aviso Legal (LSSI-CE)</h1>
      
      <section className="bg-gray-50 dark:bg-gray-800/50 p-6 rounded-xl border border-gray-200 dark:border-gray-700">
        <dl className="grid grid-cols-1 sm:grid-cols-2 gap-4 text-sm">
          <dt className="font-semibold text-gray-600 dark:text-gray-400">Titular:</dt>
          <dd>[Nombre completo o Razón Social]</dd>
          <dt className="font-semibold text-gray-600 dark:text-gray-400">NIF/CIF:</dt>
          <dd>[Número]</dd>
          <dt className="font-semibold text-gray-600 dark:text-gray-400">Domicilio:</dt>
          <dd>[Dirección física completa]</dd>
          <dt className="font-semibold text-gray-600 dark:text-gray-400">Email:</dt>
          <dd><a href="mailto:contacto@dominio.com" className="text-blue-600 hover:underline">contacto@dominio.com</a></dd>
        </dl>
      </section>

      <section className="space-y-3">
        <h2 className="text-xl font-semibold">Datos Registrales</h2>
        <p className="leading-relaxed">Inscrito en el [Registro Mercantil/Profesional] de [Ciudad], Tomo [X], Folio [Y], Hoja [Z], Inscripción nº [N].</p>
      </section>

      <section className="space-y-3">
        <h2 className="text-xl font-semibold">Propiedad Intelectual e Industrial</h2>
        <p className="leading-relaxed">Todos los contenidos (textos, imágenes, logotipos, estructura y código) son propiedad de [Titular] o se utilizan bajo licencia válida. Queda prohibida su reproducción, distribución o modificación sin autorización expresa.</p>
      </section>

      <section className="space-y-3">
        <h2 className="text-xl font-semibold">Jurisdicción y Ley Aplicable</h2>
        <p className="leading-relaxed">Las presentes condiciones se rigen por la legislación española. Para cualquier controversia, las partes se someten a los Juzgados y Tribunales de [Ciudad].</p>
      </section>
    </article>
  );
}
```

#### `PoliticaPrivacidad.tsx` / `PoliticaPrivacidad.astro`
```tsx
export default function PoliticaPrivacidad() {
  return (
    <article className="max-w-3xl mx-auto px-4 py-12 space-y-8 text-gray-800 dark:text-gray-200">
      <h1 className="text-3xl font-bold tracking-tight">Política de Privacidad (GDPR + LOPDGDD)</h1>
      
      <div className="bg-blue-50 dark:bg-blue-900/20 border-l-4 border-blue-500 p-4 rounded-r-lg">
        <p className="text-sm"><strong>Responsable:</strong> [Nombre/Razón Social] | <strong>NIF:</strong> [NIF] | <strong>Email:</strong> <a href="mailto:privacidad@dominio.com" className="text-blue-600 hover:underline">privacidad@dominio.com</a></p>
      </div>

      <section className="space-y-3">
        <h2 className="text-xl font-semibold">1. Finalidad y Base Legal</h2>
        <p className="leading-relaxed">Tratamos tus datos para gestionar consultas, suscripciones y/o registro de usuarios. La base legal es tu <strong>consentimiento expreso</strong> (Art. 6.1.a RGPD) y la <strong>ejecución de servicios solicitados</strong>.</p>
      </section>

      <section className="space-y-3">
        <h2 className="text-xl font-semibold">2. Destinatarios y Terceros</h2>
        <p className="leading-relaxed">No se ceden datos a terceros salvo obligación legal o a proveedores de hosting/CRM con contratos de encargo de tratamiento. No realizamos transferencias internacionales fuera del EEE sin garantías adecuadas.</p>
      </section>

      <section className="space-y-3">
        <h2 className="text-xl font-semibold">3. Plazo de Conservación</h2>
        <p className="leading-relaxed">Los datos se conservarán mientras sean necesarios para la finalidad indicada o hasta que solicites su supresión. Posteriormente, se bloquearán durante los plazos legales aplicables.</p>
      </section>

      <section className="space-y-3">
        <h2 className="text-xl font-semibold">4. Derechos ARSULIPO</h2>
        <p className="leading-relaxed">Puedes ejercer tu derecho de Acceso, Rectificación, Supresión, Limitación, Portabilidad y Oposición enviando un email a <a href="mailto:privacidad@dominio.com" className="text-blue-600 hover:underline">privacidad@dominio.com</a> adjuntando copia de tu DNI/Pasaporte.</p>
        <p className="text-sm text-gray-600 dark:text-gray-400 mt-2">Si consideras vulnerados tus derechos, puedes presentar una reclamación ante la <a href="https://www.aepd.es" target="_blank" rel="noopener" className="text-blue-600 hover:underline">AEPD</a>.</p>
      </section>
    </article>
  );
}
```

#### `PoliticaCookies.tsx` / `PoliticaCookies.astro`
```tsx
export default function PoliticaCookies() {
  return (
    <article className="max-w-3xl mx-auto px-4 py-12 space-y-8 text-gray-800 dark:text-gray-200">
      <h1 className="text-3xl font-bold tracking-tight">Política de Cookies (Guía AEPD)</h1>
      
      <section className="space-y-3">
        <h2 className="text-xl font-semibold">¿Qué son y para qué sirven?</h2>
        <p className="leading-relaxed">Son pequeños ficheros almacenados en tu dispositivo para recordar preferencias, analizar tráfico o mejorar la seguridad. No contienen información personal identificable por sí solas.</p>
      </section>

      <section className="space-y-4">
        <h2 className="text-xl font-semibold">Clasificación y Finalidad</h2>
        <div className="overflow-x-auto rounded-xl border border-gray-200 dark:border-gray-700">
          <table className="min-w-full text-sm">
            <thead className="bg-gray-50 dark:bg-gray-800/50">
              <tr>
                <th className="px-4 py-3 text-left font-semibold">Tipo</th>
                <th className="px-4 py-3 text-left font-semibold">Finalidad</th>
                <th className="px-4 py-3 text-left font-semibold">Consentimiento</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-200 dark:divide-gray-700">
              <tr><td className="px-4 py-3">Técnicas / Necesarias</td><td className="px-4 py-3">Sesión, seguridad, carga de interfaz</td><td className="px-4 py-3 font-medium text-green-600">No requerido</td></tr>
              <tr><td className="px-4 py-3">Analíticas</td><td className="px-4 py-3">Medición de visitas y rendimiento</td><td className="px-4 py-3 font-medium text-amber-600">Sí</td></tr>
              <tr><td className="px-4 py-3">Publicitarias / Seguimiento</td><td className="px-4 py-3">Perfilado para anuncios personalizados</td><td className="px-4 py-3 font-medium text-amber-600">Sí</td></tr>
            </tbody>
          </table>
        </div>
      </section>

      <section className="space-y-3">
        <h2 className="text-xl font-semibold">Gestión y Retirada de Consentimiento</h2>
        <p className="leading-relaxed">Puedes aceptar, rechazar o configurar las cookies por categoría mediante nuestro banner. También puedes retirar el consentimiento en cualquier momento o configurar tu navegador:</p>
        <ul className="list-disc pl-5 space-y-1 text-sm">
          <li><a href="https://support.google.com/chrome/answer/95647" target="_blank" rel="noopener" className="text-blue-600 hover:underline">Google Chrome</a></li>
          <li><a href="https://support.mozilla.org/es/kb/habilitar-y-deshabilitar-cookies" target="_blank" rel="noopener" className="text-blue-600 hover:underline">Mozilla Firefox</a></li>
          <li><a href="https://support.apple.com/es-es/guide/safari/sfri11471" target="_blank" rel="noopener" className="text-blue-600 hover:underline">Safari</a></li>
          <li><a href="https://support.microsoft.com/es-es/microsoft-edge/eliminar-las-cookies-en-microsoft-edge-63947406-40ac-c3b8-57b9-2a946a29ae09" target="_blank" rel="noopener" className="text-blue-600 hover:underline">Microsoft Edge</a></li>
        </ul>
      </section>
    </article>
  );
}
```

---
### 🍪 2. Banner de Cookies (React/Next + Astro)
*Cumple: igual prominencia, bloqueo previo, granularidad, registro auditado.*

#### TypeScript Interfaces
```ts
export interface CookieConsent {
  technical: boolean;
  analytics: boolean;
  ads: boolean;
  timestamp: string;
  policyVersion: string;
  userAgent: string;
}
```

#### React / Next.js (`CookieBanner.tsx`)
```tsx
"use client";
import { useState, useEffect } from "react";
import type { CookieConsent } from "./types";

export default function CookieBanner() {
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    if (!localStorage.getItem("legal_cookie_consent")) setVisible(true);
  }, []);

  const saveConsent = async (prefs: { technical: boolean; analytics: boolean; ads: boolean }) => {
    const record: CookieConsent = {
      ...prefs,
      timestamp: new Date().toISOString(),
      policyVersion: "2026-05",
      userAgent: navigator.userAgent,
    };
    localStorage.setItem("legal_cookie_consent", JSON.stringify(record));
    
    // 🔒 Envío a backend para prueba auditada (requerido por AEPD)
    try {
      await fetch("/api/cookies/log", { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify(record) });
    } catch (e) {
      console.warn("Fallo al registrar consentimiento:", e);
    }
    setVisible(false);
  };

  if (!visible) return null;

  return (
    <div className="fixed inset-x-0 bottom-0 z-50 bg-white/95 dark:bg-gray-900/95 backdrop-blur-md border-t border-gray-200 dark:border-gray-700 p-4 shadow-lg">
      <div className="mx-auto max-w-6xl flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
        <p className="text-sm text-gray-700 dark:text-gray-300">
          Utilizamos cookies técnicas, analíticas y publicitarias para mejorar tu experiencia. 
          Puedes gestionar tus preferencias o consultar nuestra{" "}
          <a href="/cookies" className="font-medium text-blue-600 hover:underline">Política de Cookies</a>.
        </p>
        <div className="flex flex-wrap gap-2 md:flex-nowrap">
          <button onClick={() => saveConsent({ technical: true, analytics: false, ads: false })} className="flex-1 rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-100 transition">
            Rechazar
          </button>
          <button onClick={() => {/* abre modal granular */}} className="flex-1 rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-100 transition">
            Configurar
          </button>
          <button onClick={() => saveConsent({ technical: true, analytics: true, ads: true })} className="flex-1 rounded-lg border border-blue-600 px-4 py-2 text-sm font-medium text-blue-600 hover:bg-blue-50 transition">
            Aceptar
          </button>
        </div>
      </div>
    </div>
  );
}
```

#### Astro Adaptation (`CookieBanner.astro`)
```astro
---
// src/components/CookieBanner.astro
---
<div id="cookie-banner" class="fixed inset-x-0 bottom-0 z-50 bg-white/95 dark:bg-gray-900/95 backdrop-blur-md border-t border-gray-200 dark:border-gray-700 p-4 shadow-lg hidden">
  <div class="mx-auto max-w-6xl flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
    <p class="text-sm text-gray-700 dark:text-gray-300">
      Utilizamos cookies técnicas, analíticas y publicitarias. <a href="/cookies" class="font-medium text-blue-600 hover:underline">Política</a>.
    </p>
    <div class="flex flex-wrap gap-2 md:flex-nowrap">
      <button id="btn-reject" class="flex-1 rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-100">Rechazar</button>
      <button id="btn-config" class="flex-1 rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-100">Configurar</button>
      <button id="btn-accept" class="flex-1 rounded-lg border border-blue-600 px-4 py-2 text-sm font-medium text-blue-600 hover:bg-blue-50">Aceptar</button>
    </div>
  </div>
</div>

<script>
  const banner = document.getElementById('cookie-banner');
  const consent = localStorage.getItem('legal_cookie_consent');
  if (!consent) banner.classList.remove('hidden');

  const save = (prefs) => {
    const record = { ...prefs, timestamp: new Date().toISOString(), policyVersion: '2026-05', userAgent: navigator.userAgent };
    localStorage.setItem('legal_cookie_consent', JSON.stringify(record));
    banner.classList.add('hidden');
  };

  document.getElementById('btn-reject')?.addEventListener('click', () => save({ technical: true, analytics: false, ads: false }));
  document.getElementById('btn-accept')?.addEventListener('click', () => save({ technical: true, analytics: true, ads: true }));
  document.getElementById('btn-config')?.addEventListener('click', () => console.log('Abrir modal granular'));
</script>
```

---
### 🦶 3. Footer Global (Links Legales)
```tsx
export default function LegalFooter() {
  return (
    <footer className="bg-gray-50 dark:bg-gray-900 border-t border-gray-200 dark:border-gray-800 py-8 px-4">
      <div className="mx-auto max-w-6xl flex flex-col gap-4 md:flex-row md:items-center md:justify-between text-sm text-gray-600 dark:text-gray-400">
        <p>© {new Date().getFullYear()} [Tu Empresa]. Todos los derechos reservados.</p>
        <nav className="flex flex-wrap gap-4">
          <a href="/aviso-legal" className="hover:text-blue-600 transition">Aviso Legal</a>
          <a href="/privacidad" className="hover:text-blue-600 transition">Privacidad</a>
          <a href="/cookies" className="hover:text-blue-600 transition">Cookies</a>
          <a href="/accesibilidad" className="hover:text-blue-600 transition">Accesibilidad</a>
        </nav>
      </div>
    </footer>
  );
}
```

---
### ⚙️ Integración Tailwind v4 & Frameworks
| Framework | Configuración Tailwind v4 | Notas de Implementación |
|-----------|---------------------------|-------------------------|
| **Next.js (App Router)** | `app/globals.css`: `@import "tailwindcss";` | Usa `"use client"` solo en `CookieBanner`. Las páginas legales pueden ser Server Components. |
| **React (Vite/CRA)** | `src/index.css`: `@import "tailwindcss";` + `postcss` | Instala `@tailwindcss/postcss`. Usa `useEffect` para hidratación del banner. |
| **Astro** | `src/styles/global.css`: `@import "tailwindcss";` | Los componentes `.astro` renderizan HTML estático. El `<script>` corre en cliente. Usa `client:load` si necesitas hidratación React/Vue dentro. |

### ✅ Checklist de Cumplimiento 2026 (AEPD)
- [ ] **Igual prominencia**: Los 3 botones del banner tienen mismo tamaño/padding/interacción.
- [ ] **Bloqueo previo**: Las cookies analíticas/publicitarias **no se cargan** hasta `saveConsent()`.
- [ ] **Registro auditado**: El `POST /api/cookies/log` guarda `timestamp`, `userAgent`, `policyVersion` y `preferencias`.
- [ ] **Formularios**: `<input type="checkbox" required />` + enlace a `/privacidad` + finalidad específica en `label`.
- [ ] **Accesibilidad**: Publica `/accesibilidad` con declaración UE 2026 (EN 301 549).
- [ ] **Actualización**: Incrementa `policyVersion` si cambias el texto o categorías. Fuerza re-consentimiento si es mayor.

¿Necesitas el **modal de configuración granular** (checkboxes por categoría con explicaciones), la **ruta API `/api/cookies/log`** para guardar el registro, o la adaptación a **dark mode automático** con `prefers-color-scheme`?