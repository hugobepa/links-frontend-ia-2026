# Informe de Coincidencias de Términos Sensibles

Este informe detalla las coincidencias encontradas en los archivos de la carpeta `preproyecto` con términos como `password`, `apikey`, `api-key`, `clave`, `contrasenya`, `token`, y `secret`. Es importante revisar manualmente estas líneas para garantizar que no contienen información sensible antes de subir el repositorio a GitHub.

## Coincidencias Encontradas

### Archivo: `preproyecto/jsons-news-interficies/generate-normalized-jsons.ps1`

- Línea 312: `[ordered]@{ name = 'name'; weight = 3; encode = 'forward'; tokenize = 'forward' },`
- Línea 313: `[ordered]@{ name = 'description'; weight = 2; encode = 'forward'; tokenize = 'forward' },`
- Línea 314: `[ordered]@{ name = 'tags'; weight = 2; encode = 'forward'; tokenize = 'forward' },`
- Línea 315: `[ordered]@{ name = 'category'; weight = 1; encode = 'forward'; tokenize = 'forward' },`
- Línea 316: `[ordered]@{ name = 'subcategory'; weight = 1; encode = 'forward'; tokenize = 'forward' }`
- Línea 405: `tokenize: 'forward';`

### Archivo: `preproyecto/jsons-news-interficies/audit-links.ps1`

- Línea 467: `[ordered]@{ name = 'name'; weight = 3; encode = 'forward'; tokenize = 'forward' },`
- Línea 468: `[ordered]@{ name = 'description'; weight = 2; encode = 'forward'; tokenize = 'forward' },`
- Línea 469: `[ordered]@{ name = 'tags'; weight = 2; encode = 'forward'; tokenize = 'forward' },`
- Línea 470: `[ordered]@{ name = 'category'; weight = 1; encode = 'forward'; tokenize = 'forward' },`
- Línea 471: `[ordered]@{ name = 'subcategory'; weight = 1; encode = 'forward'; tokenize = 'forward' }`

### Archivo: `preproyecto/jsons-news-interficies/dev-ops_testing_translation/data/dev-ops_testing_translation-struc.json`

- Línea 455: `"tokenize": "forward"`
- Línea 461: `"tokenize": "forward"`
- Línea 467: `"tokenize": "forward"`
- Línea 473: `"tokenize": "forward"`
- Línea 479: `"tokenize": "forward"`

### Archivo: `preproyecto/jsons-news-interficies/manual-curations.json`

- Línea 719: `"Description": "Conceptos clave de JavaScript",`

### Archivo: `preproyecto/jsons-news-interficies/ia_video-audio_agentes-automatizacion_ui_colecciones-prompts_cursos-aprendizaje_herramientas-especializadas_2/interficies/ia_video-audio_agentes-automatizacion_ui_colecciones-prompts_cursos-aprendizaje_herramientas-especializadas_2-data.ts`

- Línea 3: `...journey","mobile","model","models","motion","multi-agent","multipurpose","music","nlp","no-code","one-click","online","open-source","openai","pdf","personal","planning","platform","plugin","prediction","productivity","programming","project","prompts","prototyping","qwen","rankings","removal","resources","responsive","rust","self-hosted","services","shadcn","skills","social","software","spanish","specification","steps","summary","support","swarm","tasks","templates","testing","text","thumbnail","tokens","tool","tools","tts","typography","ui","ui-ux","vercel","video","visual","voice","web","web-app","web-builder","workflow","workspace","youtube"] as const;`
- Línea 10: `... 'nlp' | 'no-code' | 'one-click' | 'online' | 'open-source' | 'openai' | 'pdf' | 'personal' | 'planning' | 'platform' | 'plugin' | 'prediction' | 'productivity' | 'programming' | 'project' | 'prompts' | 'prototyping' | 'qwen' | 'rankings' | 'removal' | 'resources' | 'responsive' | 'rust' | 'self-hosted' | 'services' | 'shadcn' | 'skills' | 'social' | 'software' | 'spanish' | 'specification' | 'steps' | 'summary' | 'support' | 'swarm' | 'tasks' | 'templates' | 'testing' | 'text' | 'thumbnail' | 'tokens' | 'tool' | 'tools' | 'tts' | 'typography' | 'ui' | 'ui-ux' | 'vercel' | 'video' | 'visual' | 'voice' | 'web' | 'web-app' | 'web-builder' | 'workflow' | 'workspace' | 'youtube';`

### Archivo: `preproyecto/jsons-news-interficies/apis-data_databases/data/apis-data_databases-struc.json`

- Línea 745: `"tokenize": "forward"`

---

**Nota:** Algunas coincidencias pueden no ser datos sensibles, pero es importante revisarlas para asegurarse de que no contienen información confidencial.
