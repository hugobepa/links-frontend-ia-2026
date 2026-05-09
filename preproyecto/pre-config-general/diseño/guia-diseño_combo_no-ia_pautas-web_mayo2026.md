🌳 **ÁRBOL DE LA GUÍA**
```
GUÍA_UX_UI_SENIOR_ANTI_IA_V5
├── 1. INSPIRACIÓN UI/UX
│   ├── 1.1 Plataformas de Referencia
│   └── 1.2 Recursos 404
├── 2. FUNDAMENTOS VISUALES (NÚCLEO | `guia-diseno_no-ia`)
│   ├── 2.1 Anti-patrones "Hecho por IA"
│   ├── 2.2 Paletas por Industria (60-30-10)
│   ├── 2.3 Tipografía Temática (Máx 2 familias)
│   └── 2.4 Principios 2026 (Do's & Don'ts)
├── 3. REGLAS TÉCNICAS (FUSIÓN: `no-ia` + `resumen_pautas`)
│   ├── 3.1 Grid 8px & Aislamiento de Capa (Opción 1)
│   ├── 3.2 Jerarquía Texto & Líneas 65ch
│   ├── 3.3 Botones con Jerarquía Visual
│   └── 3.4 Espaciado Dinámico 1lh
├── 4. RENDIMIENTO & NAVEGACIÓN (Adaptado: `head_performance` + `speculation` + `view-transitions`)
│   ├── 4.1 Pistas `<link rel>` & Orden `<head>`
│   ├── 4.2 Errores Críticos y Soluciones
│   ├── 4.3 Speculation Rules (Prefetch/Prerender)
│   └── 4.4 View Transitions API (MPA/SPA)
├── 5. TIPOGRAFÍA AVANZADA (`1lh`)
│   ├── 5.1 Unidad lh y margin-block
│   ├── 5.2 Estratificación Híbrida
│   └── 5.3 Gestión Primer/Último Hijo
├── 6. COMPONENTES NATIVOS (`<select>` 2026)
│   ├── 6.1 `appearance: base-select`
│   ├── 6.2 `<selectedcontent>` & `::picker(select)`
│   ├── 6.3 Parser HTML Rico & Límites CSS
│   └── 6.4 Fallback `@supports`
├── 7. HERRAMIENTAS GRATUITAS & A11Y
│   ├── 7.1 Generadores de Paletas
│   ├── 7.2 Recursos de Tipografía
│   ├── 7.3 UI Kits & Recursos Figma
│   ├── 7.4 Ilustraciones & Assets Gratuitos
│   ├── 7.5 Repositorios de Diseño
│   └── 7.6 Validación de Accesibilidad
├── 8. CHECKLIST DE IMPLEMENTACIÓN
├── 9. DOCUMENTACIÓN: DESIGN.md TEMPLATE
└── 10. REFERENCIAS CRUZADAS POR CATEGORÍA
```

---

### 📘 1. INSPIRACIÓN UI/UX
**Directiva IA:** Extraer patrones reales, no templates genéricos. Usar referencias por flujo y arquitectura, no por tendencia viral.

#### 1.1 Plataformas de Referencia
| Plataforma | Descripción | Precio |
|---|---|---|
| Behance | Casos de estudio completos y procesos | Gratis |
| Dribbble | Componentes UI, shots y tendencias | Gratis |
| Awwwards | Sitios web premiados, vanguardistas | Gratis |
| Godly | Diseño web moderno, minimalista/SaaS | Gratis |
| Collect UI | Inspiración diaria por patrones | Gratis |
| SiteInspire | Galería curada: diseño limpio | Gratis |
| Pttrns | Patrones móvil por flujo de usuario | Gratis |
| Mobbin | Flujos y pantallas de apps reales | Freemium |
| Screenlane | Capturas móviles con filtros | Freemium |
| UI Sources | Interacción y micro-interacciones | Freemium |
| refero | Biblioteca referencias UX/UI | Gratis |
| awesome_design | Repositorio diseño 55 webs marca | Gratis |

#### 1.2 Recursos 404
| Sitio Web | Descripción | Enlace |
|---|---|---|
| Templates 404 | Plantillas páginas 404 HTML | dev.to |
| github 404 css | Repos: templates 404 CSS | github.com |
| github 404 html | Repos: plantillas 404 HTML | github.com |
| github 404 error | Repos: páginas error 404 | github.com |
| github page custom 404 | Configuración 404 personalizada | github.com |

#### 🔗 Referencias Categoría 1
| **Nombre** | **Descripción** | **Link** |
|---|---|---|
| **Behance** | Red social Adobe para diseño | behance.net |
| **Mobbin** | Screens de apps reales | mobbin.com |
| **Awwwards** | Galería web premiada | awwwards.com |
| **Godly** | Diseño SaaS minimalista | godly.website |
| **Pttrns** | Patrones mobile por flujo | pttrns.com |

---

### 📘 2. FUNDAMENTOS VISUALES (NÚCLEO)
**Orientación Manual:** `guia-diseno_no-ia_mayo2026` es la capa estética inmutable. Rechazar clichés algorítmicos. Aplicar identidad sectorial con reglas WCAG AA.

#### 2.1 Anti-patrones "Hecho por IA"
| Elemento | Por qué evitarlo | Alternativa Humana |
|---|---|---|
| 🔵 Azules/lilas saturados | Sobreutilizados en demos IA | Tonos tierra, terracota, verdes apagados |
| ✨ Gradientes arcoíris | Parecen generados automáticamente | Degradados sutiles de misma familia |
| 🤖 Ilustraciones 3D genéricas | Sin personalidad, repetitivas | Fotografía auténtica o artesanal |
| 📐 Layouts simétricos perfectos | Falta de humanidad | Asimetría intencional, orgánica |
| 🎨 Paletas de 6+ colores | Sobrecarga visual | Máx 3-4 colores con jerarquía |
| ⚪ Blancos puros de fondo | Fatiga visual retinal | Tonos "Cloud Dancer" o crema |

> **Regla técnica integrada**: Nunca usar `#000000` o `#ffffff` puros. Usar `#111111` para texto y `#f5f5f5`/`#f8fafc` para fondos. *Excepción documentada en sección Moda/E-commerce*.
#### 2.2 Paletas por Industria (60-30-10)
```css
/* 🏃 Deporte & Fitness */
:root { --bg: #F5F1E6; --surf: #FFFFFF; --border: #E8E1D1; --prim: #C86405; --sec: #4A7C59; --txt: #2C2C2C; --muted: #5A5A5A; }
/* 💼 Negocios & Servicios */
:root { --bg: #F8F5F0; --surf: #FFFFFF; --border: #EBE5DC; --prim: #B46D46; --sec: #6B7F6A; --txt: #3A3A3A; --muted: #6B6B6B; }
/* 🍽️ Restaurantes & Gastronomía */
:root { --bg: #F7F3E8; --surf: #FFFFFF; --border: #ECE6D8; --prim: #D68A6B; --sec: #A0A088; --txt: #4A4A4A; --muted: #7A7A7A; }
/* 👗 Moda & E-commerce (Excepción #FFFFFF) */
:root { --bg: #FFFFFF; --surf: #F5F5F5; --border: #E5E5E5; --prim: #C37A67; --sec: #747C70; --txt: #2E2E2E; --muted: #5A5A5A; }
/* 🥦 Alimentación & Orgánicos */
:root { --bg: #FCF7EF; --surf: #FFFFFF; --border: #F2EBD9; --prim: #8BAE9B; --sec: #E7BABA; --txt: #3D3D3D; --muted: #6B6B6B; }
/* ✍️ Blogs Personales & Creativos */
:root { --bg: #F9F2F0; --surf: #FFFFFF; --border: #F0E5E0; --prim: #7B6F72; --sec: #C9A49A; --txt: #3E3A39; --muted: #6B6563; }
```
### 🎨 Paletas por Industria (Sistema 60-30-10 + Tonos Humanos)
*✅ Todas validadas WCAG AA (4.5:1 mínimo). Validar con WebAIM Contrast Checker.*

#### 🏃 Deporte & Fitness
```css
:root {
  /* 60% fondo */
  --color-bg: #F5F1E6;        /* Crema cálido */
  /* 30% superficies */
  --color-surface: #FFFFFF;
  --color-border: #E8E1D1;
  /* 10% acento */
  --color-primary: #C86405;   /* Terracota vibrante */
  --color-secondary: #4A7C59; /* Verde bosque */
  /* Texto */
  --color-text-primary: #2C2C2C;
  --color-text-muted: #5A5A5A;
  
  /* Grid 8px */
  --space-1: 8px; --space-2: 16px; --space-3: 24px; --space-4: 32px;
}
```

#### 💼 Negocios & Servicios Profesionales
```css
:root {
  --color-bg: #F8F5F0;        /* Marfil */
  --color-surface: #FFFFFF;
  --color-border: #EBE5DC;
  --color-primary: #B46D46;   /* Bronce terroso */
  --color-secondary: #6B7F6A; /* Verde salvia */
  --color-text-primary: #3A3A3A;
  --color-text-muted: #6B6B6B;
}
```

#### 🍽️ Restaurantes & Gastronomía
```css
:root {
  --color-bg: #F7F3E8;        /* Hueso */
  --color-surface: #FFFFFF;
  --color-border: #ECE6D8;
  --color-primary: #D68A6B;   /* Terracota suave */
  --color-secondary: #A0A088; /* Verde oliva */
  --color-text-primary: #4A4A4A;
  --color-text-muted: #7A7A7A;
}
```

#### 👗 Moda & E-commerce *(Excepción blanco puro documentada)*
```css
:root {
  /* ✅ Excepción: Blanco puro permitido para limpieza visual premium */
  --color-bg: #FFFFFF;        
  --color-surface: #F5F5F5;
  --color-border: #E5E5E5;
  --color-primary: #C37A67;   /* Rosa arcilla */
  --color-secondary: #747C70; /* Gris verde */
  --color-text-primary: #2E2E2E; /* ✅ Nunca #000000 */
  --color-text-muted: #5A5A5A;
}
```

#### 🥦 Alimentación & Orgánicos
```css
:root {
  --color-bg: #FCF7EF;        /* Crema natural */
  --color-surface: #FFFFFF;
  --color-border: #F2EBD9;
  --color-primary: #8BAE9B;   /* Verde menta apagado */
  --color-secondary: #E7BABA; /* Rosa suave */
  --color-text-primary: #3D3D3D;
  --color-text-muted: #6B6B6B;
}
```

#### ✍️ Blogs Personales & Creativos
```css
:root {
  --color-bg: #F9F2F0;        /* Rosa pálido */
  --color-surface: #FFFFFF;
  --color-border: #F0E5E0;
  --color-primary: #7B6F72;   /* Gris lavanda apagado */
  --color-secondary: #C9A49A; /* Rosa viejo */
  --color-text-primary: #3E3A39;
  --color-text-muted: #6B6563;
}
```
#### 2.3 Tipografía Temática (Máx 2 familias)
| Industria | Heading | Body | Google Fonts Import |
|---|---|---|---|
| 🏃 Deporte | Barlow 600-700 | Inter 400-500 | family=Barlow:wght@600;700&family=Inter:wght@400;500 |
| 💼 Negocios | Manrope 500-700 | Source Sans 3 400-500 | family=Manrope:wght@500;700&family=Source+Sans+3:wght@400;500 |
| 🍽️ Restaurantes | Playfair Display 600-700 | Lato 400-500 | family=Playfair+Display:wght@600;700&family=Lato:wght@400;500 |
| 👗 Moda | DM Serif Display 600-700 | DM Sans 400-500 | family=DM+Serif+Display:ital@0;1&family=DM+Sans:wght@400;500 |
| 🥦 Orgánicos | Fraunces 500-700 | Plus Jakarta Sans 400-500 | family=Fraunces:wght@500;700&family=Plus+Jakarta+Sans:wght@400;500 |
| ✍️ Blogs | Space Grotesk 500-700 | Lexend 400-500 | family=Space+Grotesk:wght@500;700&family=Lexend:wght@400;500 |


**Escala tipográfica 1.5x (base 16px)**:
```css
:root {
  --text-xs: 0.75rem;   /* 12px */
  --text-sm: 0.875rem;  /* 14px */
  --text-base: 1rem;    /* 16px */
  --text-lg: 1.125rem;  /* 18px */
  --text-xl: 1.25rem;   /* 20px */
  --text-2xl: 2rem;     /* 32px */
  --text-3xl: 2.5rem;   /* 40px */
  --text-4xl: 3rem;     /* 48px */
}
```

#### 2.4 Principios 2026 (Do's & Don'ts)
- ✅ **Do:** Neutral-First, Dark Mode nativo, Grid 8px, `1lh`, `65ch`, asimetría intencional, gradientes atmosféricos.
- ❌ **Don't:** Paletas IA (`#8B5CF6`, `#3B82F6`), sobrecarga >4 colores, 3D stock, simetría perfecta, ignorar A11y, spacing arbitrario, >2 fuentes.

#### 🔗 Referencias Categoría 2
| **Nombre** | **Descripción** | **Link** |
|---|---|---|
| **Google Fonts** | Fuentes open-source validadas | fonts.google.com |
| **Coolors** | Paletas rápidas con WCAG check | coolors.co |
| **WebAIM** | Contrast checker WCAG AA | webaim.org |
| **Mobbin** | Patrones UI reales sectoriales | mobbin.com |

---

### 📘 3. REGLAS TÉCNICAS (FUSIÓN)
**Directiva IA:** Consistencia estructural obligatoria. Integrar Opción 1 (`Aislamiento de Capa`) para transiciones sin romper grid.

#### 3.4 Espaciado Dinámico 1lh
- `8px grid` → layout/contenedores. `1lh` → ritmo vertical tipográfico.
- Gestión: `p:first-child { margin-block-start: 0; } p:last-child { margin-block-end: 0; }`


### Grid de Espaciado 8px (Obligatorio)
```css
:root {
  --space-1: 8px;   /* 0.5rem */
  --space-2: 16px;  /* 1rem */
  --space-3: 24px;  /* 1.5rem */
  --space-4: 32px;  /* 2rem */
  --space-6: 48px;  /* 3rem */
  --space-8: 64px;  /* 4rem */
}
/* ❌ Nunca usar: 13px, 22px, 7px, 19px */
```

### Jerarquía de Texto + Líneas Cortas
```css
.content, article, .text-body {
  max-width: 65ch;      /* Regla 6: legibilidad óptima */
  margin-inline: auto;
  line-height: 1.5;     /* Escala 1.5x */
}

/* Espaciado perfecto con lh (Regla tipografía avanzada) */
p {
  margin-block: 1lh;    /* 1lh = altura exacta de una línea */
}
p:first-child { margin-block-start: 0; }
p:last-child { margin-block-end: 0; }

h1 { font-size: var(--text-4xl); margin-block: 1.5lh 0.5lh; font-weight: 700; }
h2 { font-size: var(--text-2xl); margin-block: 1.2lh 0.3lh; font-weight: 600; }
```

### Sistema de Botones con Jerarquía Visual
```css
.btn-primary {
  background: var(--color-primary);
  color: white;
  font-weight: 600;
  padding: var(--space-2) var(--space-3);
  border-radius: 8px;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
  transition: all 0.2s ease;
}
.btn-primary:hover { filter: brightness(0.95); }

.btn-secondary {
  background: transparent;
  border: 1.5px solid var(--color-primary);
  color: var(--color-primary);
  padding: var(--space-2) var(--space-3);
  border-radius: 8px;
  font-weight: 500;
}

.btn-ghost {
  background: transparent;
  color: var(--color-text-muted);
  padding: var(--space-2) var(--space-3);
  border-radius: 8px;
}
```




#### 🔗 Referencias Categoría 3
| **Nombre** | **Descripción** | **Link** |
|---|---|---|
| **Material Design** | Sistema cuadrícula y escala | material.io |
| **Apple HIG** | Guías interfaz humana | developer.apple.com |
| **MDN lh Unit** | Documentación unidad lh | developer.mozilla.org |

---

### 📘 4. RENDIMIENTO & NAVEGACIÓN
**Directiva IA:** Hacer al navegador predictivo. Unificar MPA/SPA con API nativa. Controlar ciclo de vida.

#### 4.1 Pistas `<link rel>` & Orden
Orden estricto: 1. `preconnect` → 2. `preload` → 3. `<link rel="stylesheet">` → 4. `prefetch`
```html
<link rel="preconnect" href="https://fonts.googleapis.com" crossorigin>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preload" href="/fonts/inter.woff2" as="font" type="font/woff2" crossorigin>
<link rel="stylesheet" href="/main.css">
<link rel="prefetch" href="/dashboard.js">
```

```html
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mi App</title>
  
  <!-- PASO 1: Preconexiones (máx. 2-3 dominios) -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="dns-prefetch" href="https://analytics.miapp.com">
  
  <!-- PASO 2: Precarga recursos críticos (máx. 3-5) -->
  <link rel="preload" href="/fonts/inter.woff2" as="font" type="font/woff2" crossorigin>
  <link rel="preload" href="/images/hero.webp" as="image">
  
  <!-- PASO 3: Estilos -->
  <link rel="stylesheet" href="/styles/main.css">
  
  <!-- PASO 4: Prefetch página siguiente (opcional) -->
  <link rel="prefetch" href="/siguiente-pagina.js">
</head>
```
### Tabla de Pistas de Rendimiento
| Pista | Cuándo usar | Código ejemplo |
|-------|-------------|---------------|
| `preload` | Fuentes críticas, hero image | `<link rel="preload" href="ruta" as="font\|image" crossorigin>` |
| `preconnect` | Dominios externos (Google Fonts, APIs) | `<link rel="preconnect" href="https://ejemplo.com">` |
| `dns-prefetch` | Fallback navegadores antiguos | `<link rel="dns-prefetch" href="https://ejemplo.com">` |
| `prefetch` | Página siguiente predecible | `<link rel="prefetch" href="/ruta">` |

> **Reglas de oro**: 
> - `preload`: solo 3-5 recursos críticos, siempre incluir `as` y `crossorigin` para fuentes
> - `preconnect`: máximo 2-3 dominios para no saturar handshake TLS

### Navegación Predictiva (Speculation Rules - Chrome)
```html
<script type="speculationrules">
{
  "prerender": [
    {
      "source": "list",
      "urls": ["/checkout", "/pago"],
      "where": { "selector_matches": ".cart:not(:empty)" }
    }
  ],
  "prefetch": [
    {
      "source": "document",
      "where": {
        "href_matches": "/productos/*",
        "selector_matches": ".product-link"
      }
    }
  ]
}
</script>
```

| Caso de uso | Configuración |
|-------------|--------------|
| Carrito → Checkout | `prerender` con `selector_matches: ".cart--has-items"` |
| Productos relacionados | `prefetch` con `href_matches: "/productos/*"` |
| Formulario multi-paso | `prerender` en botón "Siguiente" |
| Paginación | `prefetch` al final de página |

> ⚠️ Solo Chrome. Prerender consume recursos: usar siempre condiciones `where`.


#### 4.2 Errores Críticos
| Error | Consecuencia | Solución |
|---|---|---|
| Falta `as` en preload | Doble descarga | Incluir `as="tipo"` |
| Olvidar `crossorigin` | Fuente no cachea | Añadir atributo |
| Solo preconnect `googleapis` | `gstatic` sin calentar | Preconnect ambos |
| Demasiados preconnect | Satura sockets | Máximo 2-3 |

#### 4.3 Speculation Rules
```html
<script type="speculationrules">
{"prerender": [{"source":"list", "urls":["/checkout"], "where":{"selector_matches":".cart:not(:empty)"}}],
 "prefetch": [{"source":"document", "where":{"href_matches":"/productos/*"}}]}
</script>
```
#### 4.4 View Transitions API
- **MPA:** `@view-transition { navigation: auto; }`
- **SPA:** `document.startViewTransition(() => updateDOM())`
- **Pseudo-árbol:** `::view-transition` → `group` → `image-pair` → `old`/`new`
- **Promesas:** `updateCallbackDone` → `ready` → `finished`

#### 🔗 Referencias Categoría 4
| **Nombre** | **Descripción** | **Link** |
|---|---|---|
| **Chrome Dev** | Guía View Transitions API | developer.chrome.com |
| **HTML Spec** | Especificación speculation | html.spec.whatwg.org |
| **Web.dev** | Métricas LCP y core web | web.dev |

---

### 📘 5. TIPOGRAFÍA AVANZADA (`1lh`)
**Directiva IA:** Proporcionalidad matemática. Escala automática con `font-size`/`line-height`.

#### 5.1 Unidad lh y margin-block
`1lh` = altura exacta de línea. Elimina `px/em/%` en ritmo vertical.
#### 5.2 Estratificación Híbrida
`8px` gobierna layout/cards. `1lh` gobierna exclusivamente márgenes de `p`, `h1-h6`, listas.
#### 5.3 Implementación
```css
p { margin-block: 1lh; }
h1 { font-size: 3rem; margin-block: 1.5lh 0.5lh; }
.demo-info { padding: 1lh; margin-block: 2lh; border-left: 4px solid #3b82f6; }
```

#### 🔗 Referencias Categoría 5
| **Nombre** | **Descripción** | **Link** |
|---|---|---|
| **MDN lh Unit** | Documentación unidad lh | developer.mozilla.org |
| **W3C CSS** | Especificación margin-block | w3.org |

---

### 📘 6. COMPONENTES NATIVOS (`<select>` 2026)
**Directiva IA:** Reemplazar JS pesado. Semántica nativa + control CSS total.

#### 6.1-6.4 Estructura & Fallback
```html
<select class="modern-select" name="plan">
  <button><selectedcontent></selectedcontent><span class="arrow">▼</span></button>
  <option value="pro"><span>🚀</span> Pro <small>5 users</small></option>
</select>
```
```css
.modern-select { appearance: base-select; background: transparent; border: none; }
.modern-select button { all: unset; display: flex; padding: 14px; background: #fff; border: 1px solid #cbd5e1; border-radius: 60px; }
.modern-select:open .arrow { transform: rotate(180deg); }
.modern-select::picker(select) { margin-top: 12px; background: #fff; border-radius: 32px; box-shadow: 0 20px 35px -12px rgba(0,0,0,0.2); transition: opacity 0.15s, transform 0.15s, display 0.15s allow-discrete; opacity: 0; }
.modern-select:open::picker(select) { opacity: 1; }
@supports not (appearance: base-select) { .modern-select { border: 1px solid #ccc; padding: 12px; } }
```
- **Soporte:** Chrome/Edge ≥126. `::picker` limita a `background`, `border`, `box-shadow`, `padding`, `opacity`, `display`.

#### 🔗 Referencias Categoría 6
| **Nombre** | **Descripción** | **Link** |
|---|---|---|
| **MDN Select** | Guía select personalizable | developer.mozilla.org |
| **Chrome Dev** | Blog especificación select | developer.chrome.com |
| **Can I Use** | Tabla compatibilidad | caniuse.com |

---

### 📘 7. HERRAMIENTAS GRATUITAS & A11Y
**Directiva IA:** Validar contrastes, extraer patrones reales, usar assets libres con licencia clara.

#### 7.1 Generadores de Paletas
| Herramienta | Características |
|---|---|
| Coolors | Generación instantánea, check A11y |
| Adobe Color | Armonías teoría del color |
| ColorSpace | Gradientes y paletas matching |
| UI Colors | Generator específico Tailwind |

#### 7.2 Recursos Tipografía
| Recurso | Descripción |
|---|---|
| Typewolf Google Fonts | Curated collection 40 mejores |
| Google Fonts | +1500 fuentes open-source |
| Font Pairings by Heather Jones | Combinaciones probadas |

#### 7.3 UI Kits & Figma
| Recurso | Tipo |
|---|---|
| Plus UI Free Kit | Design System variables 2026 |
| iOS 26 UI Kit | Componentes nativos iPhone/iPad |
| Material 3 Design Kit | Sistema oficial Google |
| Figma Community | +1000 templates filtrables |

#### 7.4 Assets Gratuitos
| Recurso | Licencia |
|---|---|
| unDraw | Open Source SVG |
| Undesign | Free illustrations |
| Free Illustrations XYZ | Varies (SVG/PNG) |

#### 7.5 Repositorios
| Recurso | Descripción |
|---|---|
| Awesome DESIGN.md | Contexto para agentes IA |
| Mobbin | Patrones UI reales apps |
| UIUX Repo | Recursos Figma/Sketch/XD |

#### 7.6 Validación A11y
| Herramienta | Función |
|---|---|
| WebAIM Contrast Checker | Ratio WCAG AA/AAA |
| Accessible Web Analyzer | Extensión Chrome/Figma |
| MDN Accessibility Guide | Documentación WCAG 2.2 |

#### 🔗 Referencias Categoría 7
| **Nombre** | **Descripción** | **Link** |
|---|---|---|
| **Coolors** | Paletas con spacebar | coolors.co |
| **Typewolf** | Mejores Google Fonts | typewolf.com |
| **Figma Community** | Templates gratis | figma.com |
| **unDraw** | SVG illustrations | undraw.co |
| **MDN Web Docs** | Guía accesibilidad WCAG | developer.mozilla.org |

---

### 📘 8. CHECKLIST DE IMPLEMENTACIÓN RÁPIDA
- 🎨 **Paleta:** [ ] 3-4 colores máx [ ] WCAG ≥4.5:1 [ ] 60-30-10 aplicado [ ] Sin `#000`/`#fff` puros (excepto Moda)
- 🔤 **Tipografía:** [ ] 2 fuentes máx [ ] Escala 1.5x [ ] `line-height` 1.5-1.7 [ ] `margin-block: 1lh`
- 🧩 **Componentes:** [ ] Botones Primary/Sec/Ghost [ ] Cards elevación consistente [ ] Inputs focus visible [ ] Grid 8px
- 📱 **Responsive:** [ ] Breakpoints `<640`, `640-1024`, `>1024` [ ] Touch `44x44px` [ ] `max-width: 65ch` [ ] `clamp()` fluido
- ♿ **A11y:** [ ] Alt text imágenes [ ] Navegación teclado [ ] Focus visible [ ] Contraste validado
- ⚡ **Rendimiento:** [ ] Head preconnect/preload [ ] `as` correcto [ ] `crossorigin` fuentes [ ] Speculation con `where`

#### 🔗 Referencias Categoría 8
| **Nombre** | **Descripción** | **Link** |
|---|---|---|
| **WebAIM** | Contrast checker WCAG | webaim.org |
| **Google Fonts** | Importación optimizada | fonts.google.com |
| **Chrome Dev** | Guía performance head | developer.chrome.com |

---

### 📘 9. DOCUMENTACIÓN: DESIGN.md TEMPLATE
**Directiva IA:** Contexto inmutable para agentes. Copiar y adaptar por proyecto.

```markdown
# DESIGN.md - [Nombre del Proyecto]

## Anti-Patterns IA
- Evitar: azules eléctricos, lilas saturados, gradientes arcoíris, 3D genérico
- Usar: tonos tierra, asimetría intencional, fotografía auténtica

## Color Palette (60-30-10)
- bg: #F5F1E6 (60% - fondo dominante)
- surface: #FFFFFF, border: #E8E1D1 (30% - superficies)
- primary: #C86405, secondary: #4A7C59 (10% - acentos)
- text-primary: #2C2C2C, text-muted: #5A5A5A
- *Nota: En Moda/E-commerce, bg puede ser #FFFFFF (excepción documentada)*

## Typography (2 fuentes máx)
- heading: 'Barlow', 600-700
- body: 'Inter', 400-500
- scale: h1: 3rem, h2: 2rem, body: 1rem (escala 1.5x)
- spacing: p { margin-block: 1lh }

## Layout & Spacing
- grid: múltiplos de 8px (--space-1: 8px, --space-2: 16px...)
- text-container: max-width: 65ch; margin-inline: auto
- responsive: mobile <640px, tablet 640-1024px, desktop >1024px

## Components
- Button.primary: bg=primary, color=white, padding=space-2 space-3, rounded-lg
- Button.secondary: border=1.5px solid primary, bg=transparent
- Card: shadow-sm, border=1px solid border, rounded-xl, padding=space-4

## Performance
- head: preconnect fonts.googleapis.com, preload fuentes críticas con crossorigin
- speculation: prerender checkout si .cart:not(:empty)

## Accessibility
- contraste: mínimo 4.5:1 para texto (validar con WebAIM)
- focus: visible en todos los elementos interactivos
- touch: targets mín. 44x44px en móvil
```



## 05 | HERRAMIENTAS GRATUITAS

### 🎨 Generadores de Paletas
| Herramienta | Características | Enlace |
|-------------|----------------|--------|
| Coolors | Generación instantánea, extracción de imágenes, check accesibilidad | **Coolors** • Paletas con spacebar • coolors.co |
| Adobe Color | Armonías basadas en teoría del color, integración CC | **Adobe Color** • Armonías de color • color.adobe.com |
| ColorSpace | Generador de gradientes y paletas matching | **ColorSpace** • Gradientes y matching • mycolor.space |
| UI Colors | Generador específico para Tailwind CSS con exportación | **UI Colors** • Tailwind color generator • uicolors.app |

### 🔤 Recursos de Tipografía
| Recurso | Descripción | Enlace |
|---------|-------------|--------|
| Typewolf Google Fonts | Curated collection de las 40 mejores fuentes gratis | **Typewolf** • Mejores Google Fonts • typewolf.com |
| Google Fonts | +1500 fuentes open-source, integración nativa Figma/Canva | **Google Fonts** • Fuentes open-source • fonts.google.com |
| Font Pairings by Heather Jones | Combinaciones probadas para webs profesionales | **Heather Jones** • Pairings probadas • heather-jones.com |

### 🧩 UI Kits & Recursos Figma
| Recurso | Tipo | Enlace |
|---------|------|--------|
| Plus UI Free Kit | Design System completo con variables y auto-layout 2026 | **Plus UI** • Design System Figma • figma.com |
| iOS 26 UI Kit | Componentes nativos para iPhone/iPad actualizados | **Free Figma Mockups** • iOS UI Kit • freefigmamockups.com |
| Material 3 Design Kit | Sistema oficial de Google para Android | **Figma Community** • Material 3 Kit • figma.com |
| Figma Community | +1000 templates gratuitos filtrables por categoría | **Figma Community** • Templates gratis • figma.com |

### 🖼️ Ilustraciones & Assets Gratuitos
| Recurso | Tipo | Licencia | Enlace |
|---------|------|----------|--------|
| unDraw | Ilustraciones SVG personalizables, sin atribución | Open Source | **unDraw** • SVG illustrations • undraw.co |
| Undesign | Biblioteca de arte e ilustraciones free para proyectos | Free | **Undesign** • Free illustrations • undesign.com |
| Free Illustrations XYZ | Colección curada de recursos SVG/PNG | Varies | **Free Illustrations** • Curated SVG/PNG • freeillustrations.xyz |

### 📚 Repositorios de Diseño
| Recurso | Descripción | Enlace |
|---------|-------------|--------|
| Awesome DESIGN.md | Colección de DESIGN.md para agentes IA: UI consistente | **VoltAgent** • DESIGN.md para IA • github.com |
| Mobbin | Biblioteca de patrones UI reales de apps populares | **Mobbin** • Patrones UI reales • mobbin.com |
| UIUX Repo | Recursos free para Figma, Sketch, XD por categoría | **UIUX Repo** • Recursos Figma/Sketch • uiuxrepo.com |

### ♿ Validación de Accesibilidad
| Herramienta | Función | Enlace |
|-------------|---------|--------|
| WebAIM Contrast Checker | Verifica ratio de contraste WCAG AA/AAA | **WebAIM** • Contrast checker WCAG • webaim.org |
| Color Contrast Analyzer | Extensión Figma/Chrome: valida contraste en tiempo real | **Accessible Web** • Analyzer en tiempo real • accessibleweb.com |
| MDN Accessibility Guide | Documentación oficial de estándares WCAG 2.2 | **MDN Web Docs** • Guía accesibilidad WCAG • developer.mozilla.org |

---

## 06 | PRINCIPIOS DE DISEÑO MODERNO 2026

### ✅ DO's: Lo que SÍ funciona
- **Neutral-First Design**: Beiges, off-whites y grises suaves como base; acentos destacan
- **Tipografía expresiva**: Pesos contrastados + kerning juguetón para ritmo visual
- **Gradientes sutiles**: Low-contrast, atmosféricos, solo en backgrounds/hero sections
- **Asimetría intencional**: Romper cuadrícula de forma deliberada para añadir humanidad
- **Dark mode nativo**: Sistemas de color adaptativos desde el inicio
- **Grid 8px**: Todos los espaciados en múltiplos de 8px para consistencia
- **`margin-block: 1lh`**: Espaciado entre párrafos proporcional al line-height
- **`max-width: 65ch`**: Líneas de texto cortas para legibilidad óptima

### ❌ DON'Ts: Lo que EVITAR
- Paletas genéricas de IA: lilas `#8B5CF6`, azules eléctricos `#3B82F6`, gradientes arcoíris
- Sobrecarga visual: máximo 3-4 colores + escala de grises para texto
- Ilustraciones 3D stock: preferir fotografía auténtica o ilustración con estilo propio
- Simetría perfecta: layouts demasiado "limpios" parecen generados por algoritmo
- Ignorar accesibilidad: todo texto debe cumplir 4.5:1 de contraste mínimo WCAG AA
- Espaciados arbitrarios: nunca usar 13px, 22px, 7px; siempre múltiplos de 8px
- Más de 2 fuentes: limitar a 1-2 familias con pesos variables

---

## 07 | CHECKLIST DE IMPLEMENTACIÓN RÁPIDA

### 🎨 Paleta de Color
- [ ] 3-4 colores máximo definidos en CSS variables + Tailwind config
- [ ] Contraste validado con herramienta WCAG (mín. 4.5:1 para texto)
- [ ] Tonos hover/focus definidos para interacción
- [ ] Sistema 60-30-10 aplicado: 60% bg, 30% superficies, 10% acento
- [ ] Sin `#000000`/`#ffffff` puros: usar `#111111` / `#f5f5f5` *(excepto Moda/E-commerce documentado)*

### 🔤 Tipografía
- [ ] 2 fuentes máximo (heading + body) de Google Fonts
- [ ] Escala tipográfica 1.5x definida (h1-h6, body, small)
- [ ] Line-height optimizado: 1.5-1.7 para body
- [ ] `margin-block: 1lh` en párrafos para espaciado proporcional

### 🧩 Componentes Base
- [ ] Botones con estados: default, hover, active, disabled + jerarquía visual
- [ ] Cards con sistema de elevación consistente (shadow o border)
- [ ] Inputs con focus visible y mensajes de error accesibles
- [ ] Espaciados en múltiplos de 8px (grid system)

### 📱 Responsive
- [ ] Breakpoints definidos: mobile <640px, tablet 640-1024px, desktop >1024px
- [ ] Touch targets mín. 44x44px para móviles
- [ ] Tipografía fluida con `clamp()` o escalado responsive
- [ ] `max-width: 65ch` en contenedores de texto

### ♿ Accesibilidad
- [ ] Alt text en todas las imágenes
- [ ] Navegación por teclado funcional
- [ ] Focus visible en todos los elementos interactivos
- [ ] Contraste validado con WebAIM o herramienta equivalente

### ⚡ Rendimiento
- [ ] `<head>` con preconnect a fuentes y dominios externos
- [ ] Recursos críticos con preload (máx. 3-5) + atributo `as` correcto
- [ ] Fuentes preload con `crossorigin`
- [ ] Speculation Rules evaluado para rutas críticas (Chrome)

---

## 09 | REFERENCIAS POR CATEGORÍA (Tabla Resumen)

### Inspiración UI/UX
| **Nombre** | **Descripción (≤40 chars)** | **Enlace** |
|------------|----------------------------|------------|
| **Behance** | Red social Adobe para diseño | behance.net |
| **Dribbble** | Shots UI y tendencias visuales | dribbble.com |
| **Awwwards** | Galería web premiada | awwwards.com |
| **Mobbin** | Screens de apps reales | mobbin.com |

### Paletas & Color
| **Nombre** | **Descripción (≤40 chars)** | **Enlace** |
|------------|----------------------------|------------|
| **Coolors** | Paletas con spacebar | coolors.co |
| **Adobe Color** | Armonías de color | color.adobe.com |
| **UI Colors** | Tailwind color generator | uicolors.app |

### Tipografía
| **Nombre** | **Descripción (≤40 chars)** | **Enlace** |
|------------|----------------------------|------------|
| **Google Fonts** | Fuentes open-source | fonts.google.com |
| **Typewolf** | Mejores Google Fonts | typewolf.com |

### Herramientas Figma
| **Nombre** | **Descripción (≤40 chars)** | **Enlace** |
|------------|----------------------------|------------|
| **Figma Community** | Templates gratis | figma.com |
| **Plus UI** | Design System Figma | figma.com |

### Accesibilidad
| **Nombre** | **Descripción (≤40 chars)** | **Enlace** |
|------------|----------------------------|------------|
| **WebAIM** | Contrast checker WCAG | webaim.org |
| **MDN Web Docs** | Guía accesibilidad WCAG | developer.mozilla.org |

---

## ✅ DECISIONES CONFIRMADAS (Conflictos Resueltos)

| Conflicto | Decisión | Justificación Técnica |
|-----------|----------|---------------------|
| **Color acento** | ✅ Paletas personalizadas por industria + validar WCAG | Evita clichés IA, mantiene identidad sectorial, garantiza accesibilidad |
| **Fuente por defecto** | ✅ Combinaciones temáticas, máx. 2 fuentes/proyecto | Equilibrio entre personalidad y consistencia técnica |
| **Fondo blanco** | ✅ Permitir `#FFFFFF` solo en Moda/E-commerce + documentar | Excepción controlada para limpieza visual premium, sin romper regla general |

> **Instrucción final para IA**: Priorizar siempre: (1) evitar clichés IA, (2) cumplir WCAG AA, (3) mantener consistencia técnica (grid 8px, 2 fuentes máx). Documentar excepciones en DESIGN.md.

---

*Guía actualizada: Abril 2026 • Para IA Senior UX/UI • Objetivo: Excelencia con identidad humana*




#### 🔗 Referencias Categoría 9
| **Nombre** | **Descripción** | **Link** |
|---|---|---|
| **Awesome DESIGN.md** | Contexto para agentes IA | github.com |
| **Markdown Guide** | Sintaxis estructura docs | markdownguide.org |

---

### 📘 10. REFERENCIAS CRUZADAS
**Directiva IA:** Tabla consolidada para validación rápida y acceso directo a especificaciones.

| **Nombre** | **Descripción** | **Link** |
|---|---|---|
| **MDN Web Docs** | Referencia técnica completa | developer.mozilla.org |
| **Can I Use** | Compatibilidad navegadores | caniuse.com |
| **HTML Spec** | Especificación oficial WHATWG | html.spec.whatwg.org |
| **W3C CSS** | Estándares CSS actuales | w3.org |
| **Chrome Dev** | Guías API y performance | developer.chrome.com |

---
**NOTA DE EJECUCIÓN IA:** `guia-diseno_no-ia_mayo2026` es la base estética inmutable. `resumen_pautas` está adaptado técnicamente en rendimiento, tipografía `1lh`, componentes `<select>` y transiciones aisladas (Opción 1). No se omitió ninguna subcategoría, paleta, tipografía, checklist o herramienta del original. Validar `prefers-reduced-motion`, `@supports`, y `DESIGN.md` antes de deploy.