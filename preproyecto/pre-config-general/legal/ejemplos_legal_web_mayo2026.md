Aquí tienes una estructura completa, con plantillas de texto base y componentes listos para **Astro, React y Next.js**. Se ha respetado el posicionamiento estándar (footer para enlaces, banner flotante para cookies, páginas dedicadas para textos completos) y se han excluido las condiciones de contratación como solicitaste.

⚠️ **Nota legal previa:** Estos textos son plantillas base. La AEPD exige personalización según tu actividad. Copiar plantillas genéricas sin adaptación puede agravar sanciones. Consulta siempre con un profesional especializado.

---
### 📍 Posicionamiento estándar recomendado
| Elemento | Ubicación | Comportamiento |
|----------|-----------|----------------|
| `Aviso Legal`, `Privacidad`, `Cookies` | `/aviso-legal`, `/privacidad`, `/cookies` | Páginas estáticas enlazadas desde el footer |
| `Banner de Cookies` | Flotante inferior (`position: fixed; bottom: 0`) | Aparece al 1er acceso. Botones: `Aceptar` `Rechazar` `Configurar` (misma prominencia) |
| `Declaración de Accesibilidad` | Footer | Enlace visible (obligatorio UE 2026) |
| `Formularios` | Cerca del botón de envío | Checkbox no premarcado + enlace a política + finalidad específica |

---
### 📝 Plantillas de Texto Base (Markdown/HTML)
*(Usa estos textos en tus páginas legales. Reemplaza los corchetes)*

#### 🔹 `aviso-legal.md`
```markdown
# Aviso Legal (LSSI-CE)

**Titular:** [Nombre completo o Razón Social]  
**NIF/CIF:** [Número]  
**Domicilio:** [Dirección física completa]  
**Email de contacto:** [correo@dominio.com]  
**Registro Mercantil/Profesional:** [Datos de inscripción, tomo, folio, hoja, nº inscripción]  
**IVA:** [Los precios mostrados incluyen/excluyen IVA. Se aplicará el tipo legal vigente según la normativa fiscal española.]  
**Propiedad Intelectual:** Todos los contenidos (textos, imágenes, logotipos, código) son propiedad de [Titular] o se usan bajo licencia. Queda prohibida su reproducción sin autorización expresa.  
**Jurisdicción:** Las relaciones se rigen por la legislación española. Para cualquier controversia, las partes se someten a los juzgados y tribunales de [Ciudad].
```

#### 🔹 `privacidad.md`
```markdown
# Política de Privacidad (GDPR + LOPDGDD)

**Responsable del tratamiento:** [Nombre/Razón Social], NIF [Número], email [correo@dominio.com].  
**Finalidad y base legal:** Gestión de consultas/suscripciones/registro. Base legal: consentimiento del interesado (Art. 6.1.a RGPD) y ejecución de servicios solicitados.  
**Destinatarios:** No se ceden datos a terceros salvo obligación legal o proveedores de hosting/CRM con acuerdos de encargo de tratamiento.  
**Plazo de conservación:** Se conservarán mientras sean necesarios para la finalidad o hasta que solicites su supresión.  
**Derechos ARSULIPO:** Acceso, Rectificación, Supresión, Limitación, Portabilidad y Oposición. Puedes ejercerlos enviando un email a [correo@dominio.com] con copia de tu DNI.  
**Autoridad de control:** Si consideras vulnerados tus derechos, puedes presentar una reclamación ante la [AEPD](https://www.aepd.es).
```

#### 🔹 `cookies.md`
```markdown
# Política de Cookies (Guía AEPD)

**¿Qué son?** Ficheros almacenados en tu dispositivo para recordar preferencias, analizar tráfico o mostrar publicidad.  
**Clasificación:** 
- `Técnicas/Necesarias`: Habilitan funciones básicas (sesión, seguridad, carga). No requieren consentimiento.
- `Analíticas`: Miden visitas y navegación (ej. Google Analytics).
- `Publicitarias/Seguimiento`: Perfilan intereses para anuncios personalizados.  
**Consentimiento:** Se solicita de forma previa, expresa e informada. Puedes aceptar, rechazar o configurar por categoría.  
**Gestión:** Puedes retirar el consentimiento o configurar tu navegador en cualquier momento.  
**Navegadores:** [Chrome](https://support.google.com/chrome/answer/95647) | [Firefox](https://support.mozilla.org/es/kb/habilitar-y-deshabilitar-cookies) | [Safari](https://support.apple.com/es-es/guide/safari/sfri11471) | [Edge](https://support.microsoft.com/es-es/microsoft-edge/eliminar-las-cookies-en-microsoft-edge-63947406-40ac-c3b8-57b9-2a946a29ae09)
```

---
### 💻 Implementación por Framework

#### 1. 🪐 Astro
**`src/components/Footer.astro`**
```astro
<footer class="footer">
  <nav>
    <a href="/aviso-legal">Aviso Legal</a>
    <a href="/privacidad">Política de Privacidad</a>
    <a href="/cookies">Política de Cookies</a>
    <a href="/accesibilidad">Declaración de Accesibilidad</a>
  </nav>
  <p>© {new Date().getFullYear()} [Tu Empresa]. Todos los derechos reservados.</p>
</footer>
```

**`src/components/CookieBanner.astro`**
```astro
<div id="cookie-banner" class="cookie-banner" hidden>
  <p>Utilizamos cookies propias y de terceros para mejorar la experiencia. <a href="/cookies">Más info</a></p>
  <div class="cookie-actions">
    <button id="btn-configure">Configurar</button>
    <button id="btn-reject">Rechazar</button>
    <button id="btn-accept">Aceptar</button>
  </div>
</div>

<style>
  .cookie-banner { position: fixed; bottom: 0; left: 0; right: 0; background: #fff; padding: 1rem; box-shadow: 0 -2px 10px rgba(0,0,0,0.1); z-index: 9999; display: flex; flex-wrap: wrap; gap: 1rem; align-items: center; justify-content: space-between; }
  .cookie-actions { display: flex; gap: 0.5rem; flex-wrap: wrap; }
  .cookie-actions button { flex: 1; padding: 0.5rem; cursor: pointer; border: 1px solid #ccc; background: #f5f5f5; }
</style>

<script>
  const banner = document.getElementById('cookie-banner');
  const consent = localStorage.getItem('cookie_consent');
  if (!consent) banner.hidden = false;

  const save = (prefs) => {
    localStorage.setItem('cookie_consent', JSON.stringify({ ...prefs, date: new Date().toISOString(), version: '1.0' }));
    // ⚠️ Aquí envía `prefs` + `ip` + `user_agent` a tu backend para registro auditado
    banner.hidden = true;
  };

  document.getElementById('btn-accept').onclick = () => save({ technical: true, analytics: true, ads: true });
  document.getElementById('btn-reject').onclick = () => save({ technical: true, analytics: false, ads: false });
  document.getElementById('btn-configure').onclick = () => { /* Abre modal de configuración granular */ };
</script>
```

**Páginas legales:** Crea `src/pages/aviso-legal.astro`, `src/pages/privacidad.astro`, `src/pages/cookies.astro` e importa el Markdown con `import content from '../content/...'` o usa `rehype`/`remark`.

---

#### 2. ⚛️ React
**`src/components/Footer.jsx`**
```jsx
export default function Footer() {
  return (
    <footer style={{ padding: '1rem', background: '#f9f9f9' }}>
      <nav style={{ display: 'flex', gap: '1rem', flexWrap: 'wrap' }}>
        <a href="/aviso-legal">Aviso Legal</a>
        <a href="/privacidad">Privacidad</a>
        <a href="/cookies">Cookies</a>
        <a href="/accesibilidad">Accesibilidad</a>
      </nav>
      <p>© {new Date().getFullYear()} [Tu Empresa].</p>
    </footer>
  );
}
```

**`src/components/CookieBanner.jsx`**
```jsx
import { useState, useEffect } from 'react';

export default function CookieBanner() {
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    if (!localStorage.getItem('cookie_consent')) setVisible(true);
  }, []);

  const saveConsent = (prefs) => {
    const record = { ...prefs, date: new Date().toISOString(), version: '1.0' };
    localStorage.setItem('cookie_consent', JSON.stringify(record));
    // 📡 Aquí haz fetch('/api/log-consent', { method: 'POST', body: JSON.stringify(record) })
    setVisible(false);
  };

  if (!visible) return null;

  return (
    <div style={{ position: 'fixed', bottom: 0, left: 0, right: 0, background: '#fff', padding: '1rem', boxShadow: '0 -2px 8px rgba(0,0,0,0.1)', display: 'flex', flexWrap: 'wrap', gap: '1rem', justifyContent: 'space-between', alignItems: 'center', zIndex: 9999 }}>
      <p style={{ margin: 0, flex: 1, minWidth: '200px' }}>
        Usamos cookies técnicas, analíticas y publicitarias. <a href="/cookies">Ver política</a>
      </p>
      <div style={{ display: 'flex', gap: '0.5rem', flexWrap: 'wrap' }}>
        <button onClick={() => {/* Abre modal configuración */}} style={{ flex: 1 }}>Configurar</button>
        <button onClick={() => saveConsent({ technical: true, analytics: false, ads: false })} style={{ flex: 1 }}>Rechazar</button>
        <button onClick={() => saveConsent({ technical: true, analytics: true, ads: true })} style={{ flex: 1 }}>Aceptar</button>
      </div>
    </div>
  );
}
```

---

#### 3. ▲ Next.js (App Router)
**`app/components/Footer.tsx`**
```tsx
export default function Footer() {
  return (
    <footer className="p-4 bg-gray-100 flex flex-wrap gap-4">
      <a href="/aviso-legal">Aviso Legal</a>
      <a href="/privacidad">Privacidad</a>
      <a href="/cookies">Cookies</a>
      <a href="/accesibilidad">Accesibilidad</a>
      <p className="w-full mt-2">© {new Date().getFullYear()} [Tu Empresa].</p>
    </footer>
  );
}
```

**`app/components/CookieBanner.tsx`** *(Debe ser Client Component)*
```tsx
"use client";
import { useState, useEffect } from "react";

export default function CookieBanner() {
  const [show, setShow] = useState(false);

  useEffect(() => {
    if (!localStorage.getItem("cookie_consent")) setShow(true);
  }, []);

  const handleConsent = (prefs: Record<string, boolean>) => {
    const log = { ...prefs, date: new Date().toISOString(), policyVersion: "1.0" };
    localStorage.setItem("cookie_consent", JSON.stringify(log));
    // 🔒 Envía a backend: POST /api/cookies/log
    setShow(false);
  };

  if (!show) return null;

  return (
    <div className="fixed bottom-0 left-0 right-0 bg-white p-4 shadow-lg z-50 flex flex-col md:flex-row items-center gap-4">
      <p className="flex-1 text-sm">
        Utilizamos cookies propias y de terceros para análisis y mejora del servicio. 
        <a href="/cookies" className="underline ml-1">Más información</a>
      </p>
      <div className="flex gap-2 w-full md:w-auto">
        <button onClick={() => handleConsent({ technical: true, analytics: false, ads: false })} className="flex-1 px-4 py-2 border rounded">
          Rechazar
        </button>
        <button onClick={() => {/* abrir modal granular */}} className="flex-1 px-4 py-2 border rounded bg-gray-200">
          Configurar
        </button>
        <button onClick={() => handleConsent({ technical: true, analytics: true, ads: true })} className="flex-1 px-4 py-2 border rounded bg-blue-600 text-white">
          Aceptar
        </button>
      </div>
    </div>
  );
}
```

**Páginas legales (App Router):**
```
app/aviso-legal/page.tsx
app/privacidad/page.tsx
app/cookies/page.tsx
```
*(Importa el markdown con `@mdx-js/loader` o `gray-matter` + `react-markdown`)*

---
### ✅ Requisitos Técnicos Críticos (Checklist 2026)
| Requisito | Implementación |
|-----------|----------------|
| 🔒 **SSL/TLS** | Certificado HTTPS obligatorio. Redirige `http→https` en el servidor/reverse proxy. |
| 📝 **Registro de consentimiento** | Guarda en BD: `user_hash/IP`, `fecha`, `versión_política`, `preferencias`, `user_agent`. |
| 📋 **Formularios** | `<input type="checkbox" required /> <label>He leído y acepto la <a href="/privacidad">Política de Privacidad</a> y autorizo el tratamiento para [finalidad específica].</label>` |
| ♿ **Accesibilidad** | Publica `/accesibilidad` con declaración de cumplimiento Directiva UE 2026 (EN 301 549). |
| 🔄 **Actualización** | Revisa anualmente o ante cambios normativos. Incrementa `version` en el banner y fuerza nueva aceptación si cambian categorías. |

¿Necesitas que adapte el modal de **configuración granular de cookies**, la lógica de **registro auditado en backend**, o los componentes con Tailwind/UI específica?