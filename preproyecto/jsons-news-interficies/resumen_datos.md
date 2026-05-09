# Resumen Datos

## Estadisticas

| Metrica | Valor |
| --- | ---: |
| Datasets actuales | 12 |
| Links markdown parseados | 911 |
| Duplicados eliminados | 0 |
| Inserciones automaticas | 0 |
| Casos ambiguos pendientes | 0 |
| Duplicados globales restantes | 0 |

## Reglas aplicadas

- Dedupe por URL canonica.
- Se conserva la primera aparicion en linkGeneral.md.
- Si cambia un dataset, se regeneran xxxx-rec.json, xxxx-struc.json y nombre-links.json.
- Si una carpeta queda sin recursos, se elimina completa.
- Solo se insertan faltantes con origen unico y categoria/subcategoria claras desde los JSON origen.

## Estructura

~~~text
jsons-news-interficies/
|-- analytics-monitoring_email-comunicacion/
|   |-- data/
|   |   |-- analytics-monitoring_email-comunicacion-rec.json
|   |   |-- analytics-monitoring_email-comunicacion-struc.json
|   |   |-- nombre-links.json
|   |   |-- categorias/
|   |   |   |-- analytics (22 links)
|   |   |   |   |-- error-tracking (2 links)
|   |   |   |   |-- monitoring-uptime (4 links)
|   |   |   |   |-- performance-monitoring (4 links)
|   |   |   |   |-- seo-tools (8 links)
|   |   |   |   |-- web-analytics (4 links)
|   |   |   |-- email (26 links)
|   |   |   |   |-- chat-support (8 links)
|   |   |   |   |-- notifications-messaging (14 links)
|   |   |   |   |-- transactional-email (4 links)
|   |-- interficies/
|-- apis-data_databases/
|   |-- data/
|   |   |-- apis-data_databases-rec.json
|   |   |-- apis-data_databases-struc.json
|   |   |-- nombre-links.json
|   |   |-- categorias/
|   |   |   |-- cloud (12 links)
|   |   |   |   |-- management (5 links)
|   |   |   |   |-- providers (7 links)
|   |   |   |-- hosting (7 links)
|   |   |   |   |-- deploy (7 links)
|   |   |   |-- version-control (42 links)
|   |   |   |   |-- learning (5 links)
|   |   |   |   |-- platforms (10 links)
|   |   |   |   |-- resources (27 links)
|   |-- interficies/
|-- apis-data_databases_managed-db-tools-datasets/
|   |-- data/
|   |   |-- apis-data_databases_managed-db-tools-datasets-rec.json
|   |   |-- apis-data_databases_managed-db-tools-datasets-struc.json
|   |   |-- nombre-links.json
|   |   |-- categorias/
|   |   |   |-- apis (68 links)
|   |   |   |   |-- ip-geolocation (20 links)
|   |   |   |   |-- public (22 links)
|   |   |   |   |-- specialized (11 links)
|   |   |   |   |-- tools (15 links)
|   |   |   |-- databases (31 links)
|   |   |   |   |-- datasets (5 links)
|   |   |   |   |-- managed (12 links)
|   |-- interficies/
|-- dev-ops_testing_translation/
|   |-- data/
|   |   |-- dev-ops_testing_translation-rec.json
|   |   |-- dev-ops_testing_translation-struc.json
|   |   |-- nombre-links.json
|   |   |-- categorias/
|   |   |   |-- __sin_categoria__ (0 links)
|   |   |   |-- devops (11 links)
|   |   |   |   |-- __sin_subcategoria__ (0 links)
|   |   |   |   |-- ci-cd (4 links)
|   |   |   |   |-- containers (7 links)
|   |   |   |-- testing (14 links)
|   |   |   |   |-- frameworks (5 links)
|   |   |   |   |-- load-testing (4 links)
|   |   |   |   |-- platforms (5 links)
|   |   |   |-- translation (6 links)
|   |   |   |   |-- tools (2 links)
|   |-- interficies/
|-- diseno-ui-ux_desarrollo_ide/
|   |-- data/
|   |   |-- diseno-ui-ux_desarrollo_ide-rec.json
|   |   |-- diseno-ui-ux_desarrollo_ide-struc.json
|   |   |-- nombre-links.json
|   |   |-- categorias/
|   |   |   |-- design (91 links)
|   |   |   |   |-- color (10 links)
|   |   |   |   |-- components (8 links)
|   |   |   |   |-- fonts (7 links)
|   |   |   |   |-- icons (19 links)
|   |   |   |   |-- inspiration (11 links)
|   |   |   |   |-- templates (14 links)
|   |   |   |   |-- ui-libraries (22 links)
|   |   |   |-- development (68 links)
|   |   |   |   |-- extensions (6 links)
|   |   |   |   |-- frameworks (11 links)
|   |   |   |   |-- ide (8 links)
|   |   |   |   |-- react-stack (27 links)
|   |   |   |   |-- tools (16 links)
|   |-- interficies/
|-- dns_seguridad_educacion/
|   |-- data/
|   |   |-- dns_seguridad_educacion-rec.json
|   |   |-- dns_seguridad_educacion-struc.json
|   |   |-- nombre-links.json
|   |   |-- categorias/
|   |   |   |-- dns-domain (8 links)
|   |   |   |   |-- dns-services (4 links)
|   |   |   |   |-- domain-registrars (4 links)
|   |   |   |-- education-learning (119 links)
|   |   |   |   |-- programming-courses (119 links)
|   |   |   |-- security-vpn (15 links)
|   |   |   |   |-- cybersecurity-learning (6 links)
|   |   |   |   |-- security-auth (4 links)
|   |   |   |   |-- vpn-services (5 links)
|   |-- interficies/
|-- ia_asistentes-desarrollo-china-imagen_1/
|   |-- data/
|   |   |-- ia_asistentes-desarrollo-china-imagen_1-rec.json
|   |   |-- ia_asistentes-desarrollo-china-imagen_1-struc.json
|   |   |-- nombre-links.json
|   |   |-- categorias/
|   |   |   |-- ai (38 links)
|   |   |   |   |-- assistants (9 links)
|   |   |   |   |-- china (9 links)
|   |   |   |   |-- development (9 links)
|   |   |   |   |-- image-generation (11 links)
|   |-- interficies/
|-- ia_video-audio_agentes-automatizacion_ui_colecciones-prompts_cursos-aprendizaje_herramientas-especializadas_2/
|   |-- data/
|   |   |-- ia_video-audio_agentes-automatizacion_ui_colecciones-prompts_cursos-aprendizaje_herramientas-especializadas_2-rec.json
|   |   |-- ia_video-audio_agentes-automatizacion_ui_colecciones-prompts_cursos-aprendizaje_herramientas-especializadas_2-struc.json
|   |   |-- nombre-links.json
|   |   |-- categorias/
|   |   |   |-- ai (117 links)
|   |   |   |   |-- agents-automation (24 links)
|   |   |   |   |-- courses-learning (35 links)
|   |   |   |   |-- prompts-collections (9 links)
|   |   |   |   |-- specialized-tools (24 links)
|   |   |   |   |-- ui (10 links)
|   |   |   |   |-- video-audio (15 links)
|   |-- interficies/
|-- pagos_game-dev_mobile/
|   |-- data/
|   |   |-- pagos_game-dev_mobile-rec.json
|   |   |-- pagos_game-dev_mobile-struc.json
|   |   |-- nombre-links.json
|   |   |-- categorias/
|   |   |   |-- __sin_categoria__ (0 links)
|   |   |   |-- game-dev (8 links)
|   |   |   |   |-- engines (8 links)
|   |   |   |-- mobile (7 links)
|   |   |   |   |-- frameworks (7 links)
|   |   |   |-- payments (25 links)
|   |   |   |   |-- __sin_subcategoria__ (0 links)
|   |   |   |   |-- jobs (23 links)
|   |   |   |   |-- processors (2 links)
|   |-- interficies/
|-- search_messaging_image_storage/
|   |-- data/
|   |   |-- search_messaging_image_storage-rec.json
|   |   |-- search_messaging_image_storage-struc.json
|   |   |-- nombre-links.json
|   |   |-- categorias/
|   |   |   |-- file-storage (11 links)
|   |   |   |   |-- cloud-storage (7 links)
|   |   |   |   |-- file-transfer (4 links)
|   |   |   |-- image-video (10 links)
|   |   |   |   |-- cdn (8 links)
|   |   |   |   |-- video-hosting (2 links)
|   |   |   |-- messaging (2 links)
|   |   |   |   |-- realtime (1 links)
|   |   |   |   |-- services (1 links)
|   |   |   |-- search (5 links)
|   |   |   |   |-- engines (5 links)
|   |-- interficies/
|-- utilidades_1/
|   |-- data/
|   |   |-- utilidades_1-rec.json
|   |   |-- utilidades_1-struc.json
|   |   |-- nombre-links.json
|   |   |-- categorias/
|   |   |   |-- utilities (46 links)
|   |   |   |   |-- fake-data (15 links)
|   |   |   |   |-- images-placeholders (14 links)
|   |   |   |   |-- productivity (17 links)
|   |-- interficies/
|-- utilidades-2_cms/
|   |-- data/
|   |   |-- utilidades-2_cms-rec.json
|   |   |-- utilidades-2_cms-struc.json
|   |   |-- nombre-links.json
|   |   |-- categorias/
|   |   |   |-- cms (8 links)
|   |   |   |   |-- platforms (8 links)
|   |   |   |-- utilities (29 links)
|   |   |   |   |-- dev-tools (19 links)
|   |   |   |   |-- general-resources (8 links)
|   |   |   |   |-- seo-scraping (2 links)
|   |-- interficies/
~~~

## Duplicados eliminados

| Recurso | URL canonica | Dataset conservado | Dataset eliminado |
| --- | --- | --- | --- |
| Sin duplicados eliminados | - | - | - |

## Inserciones automaticas

| Recurso | URL | Dataset destino | Categoria/Subcategoria |
| --- | --- | --- | --- |
| Sin inserciones automaticas | - | - | - |

## Casos pendientes

| Recurso | URL | Seccion | Motivo |
| --- | --- | --- | --- |
| Sin casos ambiguos pendientes | - | - | - |

## Invariantes de datos

- xxxx-rec.json contiene categories, subcategories y resources.
- xxxx-struc.json contiene tags, searchIndex, filters y ui derivados de resources.
- nombre-links.json es la lista unica de nombres presentes en resources.
- La relacion entre los tres archivos se recalcula desde recursos vigentes, no por edicion parcial.

## Ejemplo minimo de resource

~~~json
{
  "id": "ably",
  "name": "Ably",
  "slug": "ably",
  "description": "Infraestructura tiempo real 6M msgs",
  "url": "https://ably.com",
  "status": "active",
  "tags": [
    "real-time",
    "messaging",
    "infrastructure",
    "pubsub"
  ],
  "searchIndex": [
    "Ably",
    "ably",
    "Infraestructura tiempo real 6M msgs",
    "email",
    "notifications-messaging",
    "real-time",
    "messaging",
    "infrastructure",
    "pubsub"
  ],
  "category": "email",
  "subcategory": "notifications-messaging",
  "pricing": "freemium",
  "languages": [
    "es",
    "en"
  ],
  "limits": "6M msgs/mes, 100 conexiones",
  "added": "2026-01-10",
  "verified": true,
  "noCreditCard": true
}
~~~


