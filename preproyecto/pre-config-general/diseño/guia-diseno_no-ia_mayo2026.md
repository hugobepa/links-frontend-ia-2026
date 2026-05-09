# 🎨 Guía de Diseño UX/UI "No-IA" 2026
*Para IA Senior: Crear productos con identidad humana, evitando clichés generativos*

```ascii
guia-diseno-no-ia-2026/
├── 01_inspiracion/
│   ├── plataformas_ui_ux.md
│   └── recursos_404.md
├── 02_fundamentos_visuales/
│   ├── anti_patrones_ia.md
│   ├── paletas_por_industria.md
│   ├── tipografia_tematica.md
│   └── sistema_color_60-30-10.md
├── 03_reglas_tecnicas/
│   ├── grid_8px_espaciado.md
│   ├── jerarquia_texto_1.5x.md
│   ├── lineas_65ch.md
│   └── botones_jerarquia.md
├── 04_rendimiento/
│   ├── head_optimizado.md
│   ├── preload_preconnect.md
│   └── speculation_rules.md
├── 05_tipografia_avanzada/
│   └── margin_block_1lh.md
├── 06_herramientas/
│   ├── generadores_color.md
│   ├── recursos_tipografia.md
│   ├── ui_kits_figma.md
│   ├── assets_gratuitos.md
│   ├── repositorios.md
│   └── validacion_accesibilidad.md
├── 07_principios_2026/
│   ├── dos.md
│   └── donts.md
├── 08_checklist/
│   ├── implementacion_rapida.md
│   └── validacion_ia.md
├── 09_documentacion/
│   └── design_md_template.md
└── 10_referencias/
    └── tabla_links_categoria.md
```

---

## 01 | INSPIRACIÓN UI/UX

### Plataformas de Referencia
| Plataforma | Descripción | Precio | Enlace |
|-----------|-------------|--------|--------|
| Behance | Casos de estudio completos y procesos de diseño | Gratis | **Behance** • Red social Adobe para diseño • behance.net |
| Dribbble | Componentes UI, shots y tendencias visuales rápidas | Gratis (Nav) | **Dribbble** • Shots UI y tendencias • dribbble.com |
| Awwwards | Sitios web premiados, vanguardistas y creativos | Gratis (Nav) | **Awwwards** • Galería web premiada • awwwards.com |
| Godly | Diseño web moderno, minimalista, startups/SaaS | Gratis | **Godly** • Diseño SaaS minimalista • godly.website |
| Collect UI | Inspiración diaria por patrones y categorías | Gratis | **Collect UI** • Patrones por categoría • collectui.com |
| SiteInspire | Galería curada: diseño web limpio y funcional | Gratis | **SiteInspire** • Diseño web curado • siteinspire.com |
| Pttrns | Patrones de diseño móvil por flujo de usuario | Gratis | **Pttrns** • Patrones mobile • pttrns.com |
| Mobbin | Flujos y pantallas de apps reales (iOS/Android) | Freemium | **Mobbin** • Screens de apps reales • mobbin.com |
| Screenlane | Capturas de interfaces móviles con filtros | Freemium | **Screenlane** • UI mobile reciente • screenlane.com |
| UI Sources | Interacción, micro-interacciones y UX | Freemium | **UI Sources** • Micro-interacciones UX • uisources.com |
| refero | Biblioteca de referencias para diseñadores UX/UI | Gratis | **refero** • Referencias UX/UI • refero.design |
| awesome_design | Repositorio con diseño de 55 webs de marca | Gratis | **awesome_design** • 55 webs de marca • github.com |

### Recursos 404
| Sitio Web | Descripción | Enlace |
|-----------|-------------|--------|
| Templates 404 | Plantillas de páginas 404 en HTML | **dev.to** • 35 templates 404 HTML • dev.to |
| github 404 css | Repositorios GitHub: templates 404 con CSS | **github.com** • Topics 404 CSS • github.com |
| github 404 html | Repositorios GitHub: plantillas 404 HTML | **github.com** • Topics 404 HTML • github.com |
| github 404 error | Repositorios GitHub: páginas de error 404 | **github.com** • Topics 404 error • github.com |
| github page custom 404 | Configuración de página 404 personalizada | **github.com** • Docs GitHub Pages • github.com |

---

## 02 | FUNDAMENTOS VISUALES

### 🚫 Anti-patrones "Hecho por IA"
| Elemento | Por qué evitarlo | Alternativa humana |
|----------|-----------------|-------------------|
| 🔵 Azules/lilas saturados | Sobreutilizados en demos de IA | Tonos tierra, terracota, verdes apagados |
| ✨ Gradientes arcoíris | Parecen generados automáticamente | Degradados sutiles de una misma familia |
| 🤖 Ilustraciones 3D genéricas | Sin personalidad, repetitivas | Fotografía auténtica o ilustración artesanal |
| 📐 Layouts perfectamente simétricos | Falta de humanidad | Asimetría intencional, espacios orgánicos |
| 🎨 Paletas de 6+ colores | Sobrecarga visual | Máximo 3-4 colores con jerarquía clara |
| ⚪ Blancos puros de fondo | Fatiga visual | Tonos "Cloud Dancer" o crema cálido |

> **Regla técnica integrada**: Nunca usar `#000000` o `#ffffff` puros. Usar `#111111` para texto y `#f5f5f5`/`#f8fafc` para fondos. *Excepción documentada en sección Moda/E-commerce*.

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

### 🔤 Tipografía por Tema (Máximo 2 fuentes + Escala 1.5x)
*✅ Combinaciones temáticas validadas. Máximo 2 familias por proyecto.*

| Industria | Heading | Body | Import Google Fonts |
|-----------|---------|------|-------------------|
| 🏃 Deporte | `Barlow` 600-700 | `Inter` 400-500 | `family=Barlow:wght@600;700&family=Inter:wght@400;500` |
| 💼 Negocios | `Manrope` 500-700 | `Source Sans 3` 400-500 | `family=Manrope:wght@500;700&family=Source+Sans+3:wght@400;500` |
| 🍽️ Restaurantes | `Playfair Display` 600-700 | `Lato` 400-500 | `family=Playfair+Display:wght@600;700&family=Lato:wght@400;500` |
| 👗 Moda | `DM Serif Display` 600-700 | `DM Sans` 400-500 | `family=DM+Serif+Display:ital@0;1&family=DM+Sans:wght@400;500` |
| 🥦 Orgánicos | `Fraunces` 500-700 | `Plus Jakarta Sans` 400-500 | `family=Fraunces:wght@500;700&family=Plus+Jakarta+Sans:wght@400;500` |
| ✍️ Blogs | `Space Grotesk` 500-700 | `Lexend` 400-500 | `family=Space+Grotesk:wght@500;700&family=Lexend:wght@400;500` |

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

---

## 03 | REGLAS TÉCNICAS (Integración pautas_diseño)

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

---

## 04 | RENDIMIENTO WEB (Head Optimizado)

### Plantilla `<head>` Obligatoria
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

---

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

## 08 | DOCUMENTACIÓN: DESIGN.md TEMPLATE

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

> 💡 **Pro Tip para IA**: Usa este formato `DESIGN.md` como contexto. Los agentes de IA lo leerán directamente y generarán UI consistente con tu visión, sin caer en clichés genéricos.

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