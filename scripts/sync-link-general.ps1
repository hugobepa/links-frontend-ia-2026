param(
    [string]$MarkdownPath = 'preproyecto/link-general.md',
    [string]$PreRoot = 'preproyecto/jsons-news-interficies',
    [string]$SrcRoot = 'src',
    [string]$RunDate = '2026-05-11'
)

$ErrorActionPreference = 'Stop'

function Convert-ToSlug {
    param([string]$Text)

    if ([string]::IsNullOrWhiteSpace($Text)) {
        return ''
    }

    $normalized = $Text.ToLowerInvariant().Normalize([Text.NormalizationForm]::FormD)
    $builder = New-Object System.Text.StringBuilder

    foreach ($char in $normalized.ToCharArray()) {
        $category = [Globalization.CharUnicodeInfo]::GetUnicodeCategory($char)
        if ($category -ne [Globalization.UnicodeCategory]::NonSpacingMark) {
            [void]$builder.Append($char)
        }
    }

    return (($builder.ToString() -replace '[^a-z0-9]+', '-') -replace '(^-|-$)', '')
}

function Normalize-CanonicalUrl {
    param([string]$Url)

    if ([string]::IsNullOrWhiteSpace($Url)) {
        return ''
    }

    try {
        $uri = [Uri]$Url
        $hostName = $uri.Host.ToLowerInvariant()
        if ($hostName.StartsWith('www.')) {
            $hostName = $hostName.Substring(4)
        }

        $path = $uri.AbsolutePath.TrimEnd('/')
        return ('https://{0}{1}' -f $hostName, $path)
    }
    catch {
        return $Url.ToLowerInvariant().TrimEnd('/')
    }
}

function Get-FirstNonEmptyValue {
    param([object[]]$Candidates, [string]$Fallback)

    foreach ($candidate in @($Candidates)) {
        if (-not [string]::IsNullOrWhiteSpace([string]$candidate)) {
            return [string]$candidate
        }
    }

    return $Fallback
}

function Normalize-Languages {
    param([object[]]$Languages)

    $items = @()
    foreach ($language in @($Languages)) {
        if ([string]::IsNullOrWhiteSpace([string]$language)) {
            continue
        }

        switch -Regex ($language.ToString().ToLowerInvariant()) {
            '^(es|esp|spanish|espanol|español)$' { $items += 'es'; continue }
            '^(en|eng|english)$' { $items += 'en'; continue }
            default { $items += (Convert-ToSlug $language) }
        }
    }

    $items = $items | Where-Object { $_ } | Select-Object -Unique
    if (@($items).Count -eq 0) {
        return @('es', 'en')
    }

    return @($items)
}

function Get-Color {
    param([string]$Value)

    $palette = @('#2563eb', '#059669', '#dc2626', '#d97706', '#7c3aed', '#0891b2', '#4f46e5', '#65a30d', '#db2777', '#ea580c')
    $sum = 0
    foreach ($char in $Value.ToCharArray()) {
        $sum += [int][char]$char
    }

    return $palette[$sum % $palette.Count]
}

function Get-TitleFromSlug {
    param([string]$Value)

    return (($Value -replace '-', ' ') -split ' ' | ForEach-Object {
        if ($_) { $_.Substring(0, 1).ToUpper() + $_.Substring(1) }
    }) -join ' '
}

function Clip-Description {
    param([string]$Text)

    $clean = [regex]::Replace((Get-FirstNonEmptyValue @($Text) ''), '\s+', ' ').Trim()
    if ([string]::IsNullOrWhiteSpace($clean)) {
        return 'Descripcion no disponible'
    }

    if ($clean.Length -le 40) {
        return $clean
    }

    return ($clean.Substring(0, 40)).TrimEnd()
}

function Get-MapDecision {
    param([string]$Section, [string]$Subsection, [string]$Name)

    $s = ([string]$Section).ToLowerInvariant()
    $ss = ([string]$Subsection).ToLowerInvariant()
    $n = ([string]$Name).ToLowerInvariant()

    # Secciones del flujo actual de links-insertados.
    if ($s -match 'monetizacion|monetización|empleo|job') {
        return @{ dataset='pagos_game-dev_mobile'; category='payments'; subcategory='jobs'; confidence='high' }
    }

    if ($s -match 'cursos|aprendizaje|educacion|educación' -or $s -match 'canales youtube') {
        return @{ dataset='dns_seguridad_educacion'; category='education-learning'; subcategory='programming-courses'; confidence='high' }
    }

    if ($s -match 'recursos github') {
        if ($n -match 'seo|serp|search console|sitemap|crawl|index') {
            return @{ dataset='utilidades-2_cms'; category='utilities'; subcategory='seo-scraping'; confidence='high' }
        }

        return @{ dataset='utilidades-2_cms'; category='utilities'; subcategory='general-resources'; confidence='high' }
    }

    # Reglas por nombre cuando no hay subseccion explicita.
    if ($n -match 'youtube|playlist|cs221|cs229|cs224|cs231|deep learning|machine learning|rag') {
        return @{ dataset='dns_seguridad_educacion'; category='education-learning'; subcategory='programming-courses'; confidence='high' }
    }

    if ($n -match 'seo|serp|search console|sitemap|crawl|index') {
        return @{ dataset='utilidades-2_cms'; category='utilities'; subcategory='seo-scraping'; confidence='high' }
    }

    if ($s -match 'cloud|hosting|control de versiones|repositorios') {
        if ($ss -match 'learning|aprendizaje') { return @{ dataset='apis-data_databases'; category='version-control'; subcategory='learning'; confidence='high' } }
        if ($ss -match 'management|gestion') { return @{ dataset='apis-data_databases'; category='cloud'; subcategory='management'; confidence='high' } }
        if ($ss -match 'deploy|hosting') { return @{ dataset='apis-data_databases'; category='hosting'; subcategory='deploy'; confidence='high' } }
        if ($ss -match 'platform') { return @{ dataset='apis-data_databases'; category='version-control'; subcategory='platforms'; confidence='high' } }
        if ($ss -match 'provider|proveedor') { return @{ dataset='apis-data_databases'; category='cloud'; subcategory='providers'; confidence='high' } }
        return @{ dataset='apis-data_databases'; category='version-control'; subcategory='resources'; confidence='medium' }
    }

    if ($s -match 'apis|datos|bases de datos') {
        if ($ss -match 'ip') { return @{ dataset='apis-data_databases_managed-db-tools-datasets'; category='apis'; subcategory='ip-geolocation'; confidence='high' } }
        if ($ss -match 'public') { return @{ dataset='apis-data_databases_managed-db-tools-datasets'; category='apis'; subcategory='public'; confidence='high' } }
        if ($ss -match 'special') { return @{ dataset='apis-data_databases_managed-db-tools-datasets'; category='apis'; subcategory='specialized'; confidence='high' } }
        if ($ss -match 'tool|herramient') { return @{ dataset='apis-data_databases_managed-db-tools-datasets'; category='apis'; subcategory='tools'; confidence='high' } }
        if ($ss -match 'managed') { return @{ dataset='apis-data_databases_managed-db-tools-datasets'; category='databases'; subcategory='managed'; confidence='high' } }
        if ($ss -match 'dataset') { return @{ dataset='apis-data_databases_managed-db-tools-datasets'; category='databases'; subcategory='datasets'; confidence='high' } }
        return @{ dataset='apis-data_databases_managed-db-tools-datasets'; category='apis'; subcategory='tools'; confidence='medium' }
    }

    if ($s -match 'desarrollo|ide') {
        if ($ss -match 'extension') { return @{ dataset='diseno-ui-ux_desarrollo_ide'; category='development'; subcategory='extensions'; confidence='high' } }
        if ($ss -match 'framework') { return @{ dataset='diseno-ui-ux_desarrollo_ide'; category='development'; subcategory='frameworks'; confidence='high' } }
        if ($ss -match 'react') { return @{ dataset='diseno-ui-ux_desarrollo_ide'; category='development'; subcategory='react-stack'; confidence='high' } }
        if ($ss -match 'ide') { return @{ dataset='diseno-ui-ux_desarrollo_ide'; category='development'; subcategory='ide'; confidence='high' } }
        return @{ dataset='diseno-ui-ux_desarrollo_ide'; category='development'; subcategory='tools'; confidence='medium' }
    }

    if ($s -match 'diseño|diseno|ui|ux') {
        if ($ss -match 'icon') { return @{ dataset='diseno-ui-ux_desarrollo_ide'; category='design'; subcategory='icons'; confidence='high' } }
        if ($ss -match 'font|tipograf') { return @{ dataset='diseno-ui-ux_desarrollo_ide'; category='design'; subcategory='fonts'; confidence='high' } }
        if ($ss -match 'template') { return @{ dataset='diseno-ui-ux_desarrollo_ide'; category='design'; subcategory='templates'; confidence='high' } }
        if ($ss -match 'inspir') { return @{ dataset='diseno-ui-ux_desarrollo_ide'; category='design'; subcategory='inspiration'; confidence='high' } }
        if ($ss -match 'color') { return @{ dataset='diseno-ui-ux_desarrollo_ide'; category='design'; subcategory='color'; confidence='high' } }
        if ($ss -match 'component') { return @{ dataset='diseno-ui-ux_desarrollo_ide'; category='design'; subcategory='components'; confidence='high' } }
        return @{ dataset='diseno-ui-ux_desarrollo_ide'; category='design'; subcategory='ui-libraries'; confidence='medium' }
    }

    if ($s -match 'educacion|aprendizaje') {
        return @{ dataset='dns_seguridad_educacion'; category='education-learning'; subcategory='programming-courses'; confidence='high' }
    }

    if ($s -match 'seguridad|vpn') {
        if ($ss -match 'vpn') { return @{ dataset='dns_seguridad_educacion'; category='security-vpn'; subcategory='vpn-services'; confidence='high' } }
        if ($ss -match 'learn|curso|training') { return @{ dataset='dns_seguridad_educacion'; category='security-vpn'; subcategory='cybersecurity-learning'; confidence='high' } }
        return @{ dataset='dns_seguridad_educacion'; category='security-vpn'; subcategory='security-auth'; confidence='medium' }
    }

    if ($s -match 'dns|domain') {
        if ($ss -match 'registr') { return @{ dataset='dns_seguridad_educacion'; category='dns-domain'; subcategory='domain-registrars'; confidence='high' } }
        return @{ dataset='dns_seguridad_educacion'; category='dns-domain'; subcategory='dns-services'; confidence='high' }
    }

    if ($s -match 'image|video') {
        if ($ss -match 'video') { return @{ dataset='search_messaging_image_storage'; category='image-video'; subcategory='video-hosting'; confidence='high' } }
        return @{ dataset='search_messaging_image_storage'; category='image-video'; subcategory='cdn'; confidence='medium' }
    }

    if ($s -match 'email|comunicacion') {
        if ($ss -match 'chat') { return @{ dataset='analytics-monitoring_email-comunicacion'; category='email'; subcategory='chat-support'; confidence='high' } }
        return @{ dataset='analytics-monitoring_email-comunicacion'; category='email'; subcategory='notifications-messaging'; confidence='medium' }
    }

    if ($s -match 'testing|qa') {
        if ($ss -match 'load') { return @{ dataset='dev-ops_testing_translation'; category='testing'; subcategory='load-testing'; confidence='high' } }
        if ($ss -match 'platform') { return @{ dataset='dev-ops_testing_translation'; category='testing'; subcategory='platforms'; confidence='high' } }
        return @{ dataset='dev-ops_testing_translation'; category='testing'; subcategory='frameworks'; confidence='medium' }
    }

    if ($s -match 'devops|ci/cd|ci-cd') {
        if ($ss -match 'container|docker|k8s') { return @{ dataset='dev-ops_testing_translation'; category='devops'; subcategory='containers'; confidence='high' } }
        return @{ dataset='dev-ops_testing_translation'; category='devops'; subcategory='ci-cd'; confidence='medium' }
    }

    if ($s -match 'cms|content') {
        return @{ dataset='utilidades-2_cms'; category='cms'; subcategory='platforms'; confidence='high' }
    }

    if ($s -match 'utilidades|herramientas') {
        if ($ss -match 'seo|scrap') { return @{ dataset='utilidades-2_cms'; category='utilities'; subcategory='seo-scraping'; confidence='high' } }
        if ($ss -match 'dev|developer') { return @{ dataset='utilidades-2_cms'; category='utilities'; subcategory='dev-tools'; confidence='medium' } }
        return @{ dataset='utilidades_1'; category='utilities'; subcategory='productivity'; confidence='medium' }
    }

    if ($n -match 'api|sdk|graphql|rest') {
        return @{ dataset='apis-data_databases_managed-db-tools-datasets'; category='apis'; subcategory='tools'; confidence='low' }
    }

    return @{ dataset='utilidades_1'; category='utilities'; subcategory='productivity'; confidence='low' }
}

function Infer-Pricing {
    param([string]$Text)

    $t = ([string]$Text).ToLowerInvariant()
    if ($t -match 'premium|paid|pago|pro ') { return 'premium' }
    if ($t -match 'free|gratis|freemium|trial|open source|open-source|sin key|sin api key') { return 'freemium' }
    return 'free'
}

function Build-Options {
    param([hashtable]$Decision)

    $dataset = [string]$Decision.dataset
    $category = [string]$Decision.category
    $subcategory = [string]$Decision.subcategory

    $opt1 = "$dataset :: $category/$subcategory"

    if ($dataset -eq 'diseno-ui-ux_desarrollo_ide') {
        $opt2 = 'utilidades-2_cms :: utilities/dev-tools'
        $opt3 = 'apis-data_databases :: version-control/resources'
    }
    elseif ($dataset -eq 'apis-data_databases_managed-db-tools-datasets') {
        $opt2 = 'apis-data_databases :: version-control/resources'
        $opt3 = 'utilidades-2_cms :: utilities/dev-tools'
    }
    elseif ($dataset -eq 'utilidades_1') {
        $opt2 = 'utilidades-2_cms :: utilities/general-resources'
        $opt3 = 'diseno-ui-ux_desarrollo_ide :: development/tools'
    }
    else {
        $opt2 = 'utilidades_1 :: utilities/productivity'
        $opt3 = 'utilidades-2_cms :: utilities/general-resources'
    }

    return @($opt1, $opt2, $opt3)
}

function Parse-MarkdownLinks {
    param([string]$Path)

    $rows = @()
    $section = ''
    $subsection = ''
    $order = 0
    $lines = Get-Content $Path

    for ($index = 0; $index -lt $lines.Count; $index++) {
        $line = $lines[$index]

        if ($line -match '^##\s+(.+)$') {
            $section = $matches[1].Trim()
            $subsection = ''
            continue
        }

        if ($line -match '^###\s+\*\*(.+?)\*\*') {
            $subsection = $matches[1].Trim()
            continue
        }

        $cells = @()
        if ($line -match '^\|') {
            $parts = $line -split '\|'
            if ($parts.Count -ge 4) {
                $cells = @($parts | ForEach-Object { ($_ -replace '\*\*', '').Trim() } | Where-Object { $_ })
            }
        }

        $linkMatches = [regex]::Matches($line, '\[(?<text>[^\]]+)\]\((?<url>https?://(?:[^()\s]|\([^)]*\))+?)\)')
        foreach ($match in $linkMatches) {
            $order += 1
            $nameFromCell = if ($cells.Count -ge 1) { $cells[0] } else { '' }
            $descFromCell = if ($cells.Count -ge 2) { $cells[1] } else { '' }

            $rawText = ($match.Groups['text'].Value -replace '\*\*', '').Trim()
            $name = Get-FirstNonEmptyValue @($nameFromCell, $rawText) $rawText
            $url = $match.Groups['url'].Value

            $rows += [pscustomobject]@{
                Order = $order
                Line = $index + 1
                Section = $section
                Subsection = $subsection
                Name = $name
                Description = Clip-Description $descFromCell
                Url = $url
                CanonicalUrl = Normalize-CanonicalUrl $url
            }
        }
    }

    return @($rows | Group-Object CanonicalUrl | ForEach-Object { $_.Group | Sort-Object Order | Select-Object -First 1 })
}

function Load-Datasets {
    param([string]$Root)

    $datasets = @{}
    foreach ($dir in Get-ChildItem $Root -Directory) {
        $name = $dir.Name
        $dataDir = Join-Path $dir.FullName 'data'
        $recPath = Join-Path $dataDir ($name + '-rec.json')
        $strucPath = Join-Path $dataDir ($name + '-struc.json')
        $namesPath = Join-Path $dataDir 'nombre-links.json'

        if (-not (Test-Path $recPath)) {
            continue
        }

        $rec = Get-Content $recPath -Raw | ConvertFrom-Json
        $struc = if (Test-Path $strucPath) { Get-Content $strucPath -Raw | ConvertFrom-Json } else { $null }

        $datasets[$name] = [ordered]@{
            Name = $name
            Dir = $dir.FullName
            DataDir = $dataDir
            RecPath = $recPath
            StrucPath = $strucPath
            NamesPath = $namesPath
            Resources = [System.Collections.ArrayList]::new()
            CategoryMeta = @{}
            SubcategoryMeta = @{}
            Ui = if ($struc -and $struc.ui) { $struc.ui } else { [ordered]@{ dataset = $name; title = $name; description = "Dataset $name"; resourceCount = @($rec.resources).Count } }
        }

        foreach ($category in @($rec.categories)) {
            $datasets[$name].CategoryMeta[$category.id] = $category
        }

        foreach ($subcategory in @($rec.subcategories)) {
            $datasets[$name].SubcategoryMeta[$subcategory.id] = $subcategory
        }

        foreach ($resource in @($rec.resources)) {
            $resource.description = Clip-Description ([string]$resource.description)
            [void]$datasets[$name].Resources.Add($resource)
        }
    }

    return $datasets
}

function Rebuild-DatasetDataFiles {
    param([hashtable]$Dataset)

    $resources = @($Dataset.Resources | Sort-Object name)
    if (@($resources).Count -eq 0) {
        return
    }

    $categories = foreach ($group in ($resources | Group-Object category)) {
        $meta = if ($Dataset.CategoryMeta.ContainsKey($group.Name)) { $Dataset.CategoryMeta[$group.Name] } else { $null }
        [ordered]@{
            id = $group.Name
            name = Get-FirstNonEmptyValue @($meta.name) (Get-TitleFromSlug $group.Name)
            slug = Get-FirstNonEmptyValue @($meta.slug) $group.Name
            resourceCount = $group.Count
            status = Get-FirstNonEmptyValue @($meta.status) 'active'
        }
    }

    $subcategories = foreach ($group in ($resources | Group-Object subcategory)) {
        $meta = if ($Dataset.SubcategoryMeta.ContainsKey($group.Name)) { $Dataset.SubcategoryMeta[$group.Name] } else { $null }
        [ordered]@{
            id = $group.Name
            name = Get-FirstNonEmptyValue @($meta.name) (Get-TitleFromSlug $group.Name)
            slug = Get-FirstNonEmptyValue @($meta.slug) $group.Name
            category = ($group.Group | Select-Object -First 1).category
            resourceCount = $group.Count
            status = Get-FirstNonEmptyValue @($meta.status) 'active'
        }
    }

    $tagEntries = [ordered]@{}
    foreach ($tagGroup in ($resources | ForEach-Object { $_.tags } | Group-Object)) {
        $tagEntries[$tagGroup.Name] = [ordered]@{
            count = $tagGroup.Count
            color = Get-Color $tagGroup.Name
            description = "Etiqueta $($tagGroup.Name)"
        }
    }

    $searchEntries = foreach ($resource in $resources) {
        [ordered]@{
            id = $resource.id
            slug = $resource.slug
            terms = @($resource.searchIndex)
        }
    }

    $filters = [ordered]@{
        categories = @($categories.id | Sort-Object -Unique)
        subcategories = @($subcategories.id | Sort-Object -Unique)
        pricing = @($resources.pricing | Sort-Object -Unique)
        languages = @($resources.languages | Sort-Object -Unique)
        status = @($resources.status | Sort-Object -Unique)
        verified = @($resources.verified | Sort-Object -Unique)
        noCreditCard = @($resources.noCreditCard | Sort-Object -Unique)
    }

    $ui = [ordered]@{
        dataset = $Dataset.Name
        title = Get-FirstNonEmptyValue @($Dataset.Ui.title) $Dataset.Name
        description = Get-FirstNonEmptyValue @($Dataset.Ui.description) ("Dataset {0}" -f $Dataset.Name)
        resourceCount = @($resources).Count
    }

    $recObject = [ordered]@{
        categories = $categories
        subcategories = $subcategories
        resources = $resources
    }

    $strucObject = [ordered]@{
        tags = $tagEntries
        searchIndex = [ordered]@{
            fields = @(
                [ordered]@{ name = 'name'; weight = 3; encode = 'forward'; tokenize = 'forward' },
                [ordered]@{ name = 'description'; weight = 2; encode = 'forward'; tokenize = 'forward' },
                [ordered]@{ name = 'tags'; weight = 2; encode = 'forward'; tokenize = 'forward' },
                [ordered]@{ name = 'category'; weight = 1; encode = 'forward'; tokenize = 'forward' },
                [ordered]@{ name = 'subcategory'; weight = 1; encode = 'forward'; tokenize = 'forward' }
            )
            entries = $searchEntries
        }
        filters = $filters
        ui = $ui
    }

    $names = @($resources.name | Sort-Object -Unique)

    $recObject | ConvertTo-Json -Depth 8 | Set-Content -Encoding utf8 $Dataset.RecPath
    $strucObject | ConvertTo-Json -Depth 8 | Set-Content -Encoding utf8 $Dataset.StrucPath
    $names | ConvertTo-Json -Depth 4 | Set-Content -Encoding utf8 $Dataset.NamesPath
}

function Sync-DataToSrc {
    param([string]$PreRoot, [string]$SrcRoot)

    $datesRoot = Join-Path $SrcRoot 'data/dates'
    $searchRoot = Join-Path $SrcRoot 'data/search'

    foreach ($dir in Get-ChildItem $PreRoot -Directory) {
        $name = $dir.Name
        $dataDir = Join-Path $dir.FullName 'data'
        $recPath = Join-Path $dataDir ($name + '-rec.json')
        $strucPath = Join-Path $dataDir ($name + '-struc.json')
        $namesPath = Join-Path $dataDir 'nombre-links.json'

        if (-not (Test-Path $recPath) -or -not (Test-Path $strucPath) -or -not (Test-Path $namesPath)) {
            continue
        }

        $dstDatesDir = Join-Path $datesRoot $name
        $dstSearchDir = Join-Path $searchRoot $name
        New-Item -ItemType Directory -Force -Path $dstDatesDir | Out-Null
        New-Item -ItemType Directory -Force -Path $dstSearchDir | Out-Null

        Copy-Item $recPath (Join-Path $dstDatesDir ($name + '-rec.json')) -Force
        Copy-Item $strucPath (Join-Path $dstSearchDir ($name + '-struc.json')) -Force
        Copy-Item $namesPath (Join-Path $dstSearchDir 'nombre-links.json') -Force
    }
}

function Regenerate-InterfacesFromSrcData {
    param([string]$SrcRoot)

    $datesRoot = Join-Path $SrcRoot 'data/dates'
    $searchRoot = Join-Path $SrcRoot 'data/search'
    $interfacesDatesRoot = Join-Path $SrcRoot 'interfaces/dates'
    $interfacesSearchRoot = Join-Path $SrcRoot 'interfaces/search'

    foreach ($dir in Get-ChildItem $datesRoot -Directory) {
        $dataset = $dir.Name
        $recPath = Join-Path $dir.FullName ($dataset + '-rec.json')
        $strucPath = Join-Path (Join-Path $searchRoot $dataset) ($dataset + '-struc.json')

        if (-not (Test-Path $recPath) -or -not (Test-Path $strucPath)) {
            continue
        }

        $rec = Get-Content $recPath -Raw | ConvertFrom-Json
        $struc = Get-Content $strucPath -Raw | ConvertFrom-Json

        $categories = @($rec.categories.id | Sort-Object -Unique)
        $subcategories = @($rec.subcategories.id | Sort-Object -Unique)
        $tags = @($struc.tags.PSObject.Properties.Name | Sort-Object -Unique)
        $languages = @($rec.resources.languages | Sort-Object -Unique)
        if (@($languages).Count -eq 0) { $languages = @('es', 'en') }

        $safe = (Convert-ToSlug $dataset) -replace '-', '_'
        if ([string]::IsNullOrWhiteSpace($safe)) { $safe = 'dataset' }

        $categoryLiterals = ($categories | ForEach-Object { "'$_'" }) -join ' | '
        $subcategoryLiterals = ($subcategories | ForEach-Object { "'$_'" }) -join ' | '
        $tagLiterals = ($tags | ForEach-Object { "'$_'" }) -join ' | '
        $languageLiterals = ($languages | ForEach-Object { "'$_'" }) -join ' | '

        $dataTs = @"
export const ${safe}_categories = $(($categories | ConvertTo-Json -Compress)) as const;
export const ${safe}_subcategories = $(($subcategories | ConvertTo-Json -Compress)) as const;
export const ${safe}_tags = $(($tags | ConvertTo-Json -Compress)) as const;
export const ${safe}_pricing = ['free', 'freemium', 'premium'] as const;
export const ${safe}_status = ['active', 'warning', 'deprecated'] as const;
export const ${safe}_languages = $(($languages | ConvertTo-Json -Compress)) as const;

export type CategoryKey = $categoryLiterals;
export type SubcategoryKey = $subcategoryLiterals;
export type TagKey = $tagLiterals;
export type Pricing = 'free' | 'freemium' | 'premium';
export type Status = 'active' | 'warning' | 'deprecated';
export type Language = $languageLiterals;
export type SearchFieldKey = 'name' | 'description' | 'tags' | 'category' | 'subcategory';
"@

        $recTs = @"
import type { CategoryKey, Language, Pricing, SearchFieldKey, Status, SubcategoryKey, TagKey } from './$dataset-data';

export interface ResourceItem {
  id: string;
  name: string;
  slug: string;
  description: string;
  url: string;
  status: Status;
  tags: TagKey[];
  searchIndex: string[];
  category: CategoryKey;
  subcategory: SubcategoryKey;
  pricing: Pricing;
  languages: Language[];
  limits: string;
  added: string;
  verified: boolean;
  noCreditCard: boolean;
}

export interface CategoryItem {
  id: CategoryKey;
  name: string;
  slug: string;
  resourceCount: number;
  status: Status;
}

export interface SubcategoryItem {
  id: SubcategoryKey;
  name: string;
  slug: string;
  category: CategoryKey;
  resourceCount: number;
  status: Status;
}

export interface TagMeta {
  count: number;
  color: string;
  description: string;
}

export interface SearchIndexField {
  name: SearchFieldKey;
  weight: number;
  encode: 'forward';
  tokenize: 'forward';
}

export interface SearchIndexConfig {
  fields: SearchIndexField[];
  entries: Array<{ id: string; slug: string; terms: string[] }>;
}
"@

        $busqTs = @"
import type { CategoryKey, Pricing, Status, SubcategoryKey, TagKey } from './$dataset-data';

export interface SearchableResourceRef {
  id: string;
  slug: string;
  name: string;
  category: CategoryKey;
  subcategory: SubcategoryKey;
  tags: TagKey[];
}

export interface SearchFilterState {
  query: string;
  categories: CategoryKey[];
  subcategories: SubcategoryKey[];
  tags: TagKey[];
  pricing: Pricing[];
  status: Status[];
  verified: boolean | null;
  noCreditCard: boolean | null;
}

export interface LinkNameEntry {
  name: string;
  slug: string;
}
"@

        $dstDatesDir = Join-Path $interfacesDatesRoot $dataset
        $dstSearchDir = Join-Path $interfacesSearchRoot $dataset
        New-Item -ItemType Directory -Force -Path $dstDatesDir | Out-Null
        New-Item -ItemType Directory -Force -Path $dstSearchDir | Out-Null

        Set-Content -Encoding utf8 (Join-Path $dstDatesDir "$dataset-data.ts") $dataTs
        Set-Content -Encoding utf8 (Join-Path $dstDatesDir "$dataset-rec.ts") $recTs
        Set-Content -Encoding utf8 (Join-Path $dstSearchDir "$dataset-data.ts") $dataTs
        Set-Content -Encoding utf8 (Join-Path $dstSearchDir "$dataset-busq.ts") $busqTs
    }
}

$datasets = Load-Datasets -Root $PreRoot
$markdownRows = Parse-MarkdownLinks -Path $MarkdownPath

$currentCanonical = @{}
foreach ($name in $datasets.Keys) {
    foreach ($resource in @($datasets[$name].Resources)) {
        $currentCanonical[(Normalize-CanonicalUrl $resource.url)] = $true
    }
}

$inserted = [System.Collections.ArrayList]::new()
$ambiguous = [System.Collections.ArrayList]::new()
$changed = @{}

foreach ($row in $markdownRows) {
    if ([string]::IsNullOrWhiteSpace($row.CanonicalUrl) -or $currentCanonical.ContainsKey($row.CanonicalUrl)) {
        continue
    }

    $decision = Get-MapDecision -Section $row.Section -Subsection $row.Subsection -Name $row.Name
    if (-not $datasets.ContainsKey($decision.dataset)) {
        [void]$ambiguous.Add([pscustomobject]@{
            name = $row.Name
            url = $row.Url
            section = $row.Section
            subsection = $row.Subsection
            options = (Build-Options -Decision $decision)
            reason = 'dataset no existe'
        })
        continue
    }

    $options = Build-Options -Decision $decision

    if ($decision.confidence -eq 'low') {
        [void]$ambiguous.Add([pscustomobject]@{
            name = $row.Name
            url = $row.Url
            section = $row.Section
            subsection = $row.Subsection
            options = $options
            reason = 'clasificacion de baja confianza'
        })
        continue
    }

    $dataset = $datasets[$decision.dataset]
    if (-not $dataset.CategoryMeta.ContainsKey($decision.category)) {
        $dataset.CategoryMeta[$decision.category] = [ordered]@{ id = $decision.category; name = Get-TitleFromSlug $decision.category; slug = $decision.category; status = 'active' }
    }
    if (-not $dataset.SubcategoryMeta.ContainsKey($decision.subcategory)) {
        $dataset.SubcategoryMeta[$decision.subcategory] = [ordered]@{ id = $decision.subcategory; name = Get-TitleFromSlug $decision.subcategory; slug = $decision.subcategory; category = $decision.category; status = 'active' }
    }

    $name = Get-FirstNonEmptyValue @($row.Name) ([Uri]$row.Url).Host
    $slug = Convert-ToSlug $name
    if ([string]::IsNullOrWhiteSpace($slug)) {
        $slug = Convert-ToSlug ([Uri]$row.Url).Host
    }

    $description = Clip-Description $row.Description
    $textForPricing = "$name $description $($row.Section) $($row.Subsection)"
    $tags = @($decision.category, $decision.subcategory)
    $tags += @((Convert-ToSlug $row.Section), (Convert-ToSlug $row.Subsection), (Convert-ToSlug $name))
    $tags = @($tags | Where-Object { $_ } | Select-Object -Unique)

    $resource = [pscustomobject]@{
        id = $slug
        name = $name
        slug = $slug
        description = $description
        url = $row.Url
        status = 'active'
        tags = $tags
        searchIndex = @($name, $slug, $description, $decision.category, $decision.subcategory) + @($tags) | Select-Object -Unique
        category = $decision.category
        subcategory = $decision.subcategory
        pricing = Infer-Pricing $textForPricing
        languages = @('es', 'en')
        limits = 'unknown'
        added = $RunDate
        verified = $true
        noCreditCard = $false
    }

    [void]$dataset.Resources.Add($resource)
    $currentCanonical[$row.CanonicalUrl] = $true
    $changed[$decision.dataset] = $true
    [void]$inserted.Add([pscustomobject]@{ dataset = $decision.dataset; category = $decision.category; subcategory = $decision.subcategory; name = $name; url = $row.Url; confidence = $decision.confidence })
}

foreach ($datasetName in $datasets.Keys) {
    Rebuild-DatasetDataFiles -Dataset $datasets[$datasetName]
}

Sync-DataToSrc -PreRoot $PreRoot -SrcRoot $SrcRoot
Regenerate-InterfacesFromSrcData -SrcRoot $SrcRoot

$summary = [ordered]@{
    date = $RunDate
    markdownUniqueLinks = @($markdownRows).Count
    inserted = @($inserted).Count
    ambiguous = @($ambiguous).Count
    changedDatasets = @($changed.Keys | Sort-Object)
}

$ambiguousPath = Join-Path $PreRoot 'ambiguous-links.json'
$insertedPath = Join-Path $PreRoot 'inserted-links.json'
$summaryPath = Join-Path $PreRoot 'sync-link-general-summary.json'

$ambiguous | ConvertTo-Json -Depth 8 | Set-Content -Encoding utf8 $ambiguousPath
$inserted | ConvertTo-Json -Depth 8 | Set-Content -Encoding utf8 $insertedPath
$summary | ConvertTo-Json -Depth 6 | Set-Content -Encoding utf8 $summaryPath

Write-Output ("inserted={0}" -f @($inserted).Count)
Write-Output ("ambiguous={0}" -f @($ambiguous).Count)
Write-Output ("changedDatasets={0}" -f (@($changed.Keys | Sort-Object) -join ','))
Write-Output ("summaryPath={0}" -f $summaryPath)
Write-Output ("ambiguousPath={0}" -f $ambiguousPath)
