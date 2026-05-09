param(
    [string]$SourceRoot = 'C:\Users\User\Documents\programacion2025\IA\MCP\proyecto\pre_proyecto\jsons',
    [string]$TargetRoot = 'C:\Users\User\Documents\programacion2025\IA\MCP\proyecto\pre_proyecto\jsons-news-interficies',
    [string]$DatasetFilter = '*'
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

function Normalize-Languages {
    param([object[]]$Languages)

    $items = @()

    foreach ($language in @($Languages)) {
        if ([string]::IsNullOrWhiteSpace([string]$language)) {
            continue
        }

        switch -Regex ($language.ToString().ToLowerInvariant()) {
            '^(es|esp|spanish|espanol|espanol|español)$' { $items += 'es'; continue }
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

function Infer-Pricing {
    param([pscustomobject]$Resource)

    $existing = [string]$Resource.pricing
    if ($existing -in @('free', 'freemium', 'premium')) {
        return $existing
    }

    $text = (([string]$Resource.limits) + ' ' + ([string]$Resource.description) + ' ' + ((@($Resource.tags) -join ' '))).ToLowerInvariant()

    if ($text -match 'premium|paid|pago') {
        return 'premium'
    }

    if ($text -match 'trial|credito|credit|desde \$|from \$|/mes|mes gratis|free tier|gratis|free|open source|open-source|self-hosted') {
        return 'freemium'
    }

    return 'free'
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

function Get-FirstNonEmptyValue {
    param([object[]]$Candidates, [string]$Fallback)

    foreach ($candidate in @($Candidates)) {
        if (-not [string]::IsNullOrWhiteSpace([string]$candidate)) {
            return [string]$candidate
        }
    }

    return $Fallback
}

function Get-SafeIdentifier {
    param([string]$Text)

    $value = Convert-ToSlug $Text
    $value = $value -replace '-', '_'
    if ([string]::IsNullOrWhiteSpace($value)) {
        return 'dataset'
    }

    return $value
}

function Get-ReservedKeys {
    return @('notes', 'warnings', 'cleanups', 'changelog', 'phaseinfo', 'popularity')
}

function Get-SourceResources {
    param([pscustomobject]$Json)

    $items = @()

    if ($null -ne $Json.categories) {
        foreach ($category in @($Json.categories)) {
            foreach ($subcategory in @($category.subcategories)) {
                foreach ($resource in @($subcategory.resources)) {
                    $items += [pscustomobject]@{
                        Resource = $resource
                        CategoryId = Get-FirstNonEmptyValue @($resource.category, $category.slug, $category.id, $Json.category) 'utilities-tools'
                        CategoryName = Get-FirstNonEmptyValue @($category.name, $resource.category, $category.id, $Json.category) 'Utilities Tools'
                        SubcategoryId = Get-FirstNonEmptyValue @($resource.subcategory, $subcategory.slug, $subcategory.id) 'various'
                        SubcategoryName = Get-FirstNonEmptyValue @($subcategory.name, $resource.subcategory, $subcategory.id) 'Various'
                    }
                }
            }
        }

        return @($items)
    }

    if ($null -ne $Json.resources) {
        foreach ($resource in @($Json.resources)) {
            $items += [pscustomobject]@{
                Resource = $resource
                CategoryId = Get-FirstNonEmptyValue @($resource.category, $Json.category) 'utilities-tools'
                CategoryName = Get-FirstNonEmptyValue @($Json.category, $resource.category) 'Utilities Tools'
                SubcategoryId = Get-FirstNonEmptyValue @($resource.subcategory) 'various'
                SubcategoryName = Get-FirstNonEmptyValue @($resource.subcategory) 'Various'
            }
        }

        if (@($items).Count -gt 0) {
            return @($items)
        }
    }

    if ($null -ne $Json.subcategories) {
        foreach ($subcategory in @($Json.subcategories)) {
            foreach ($resource in @($subcategory.resources)) {
                $items += [pscustomobject]@{
                    Resource = $resource
                    CategoryId = Get-FirstNonEmptyValue @($resource.category, $Json.category) 'utilities-tools'
                    CategoryName = Get-FirstNonEmptyValue @($Json.category, $resource.category) 'Utilities Tools'
                    SubcategoryId = Get-FirstNonEmptyValue @($resource.subcategory, $subcategory.slug, $subcategory.id) 'various'
                    SubcategoryName = Get-FirstNonEmptyValue @($subcategory.name, $resource.subcategory, $subcategory.id) 'Various'
                }
            }
        }
    }

    return @($items)
}

function Build-NormalizedDataset {
    param([string]$SourceFilePath)

    $json = Get-Content $SourceFilePath -Raw | ConvertFrom-Json
    $sourceItems = Get-SourceResources -Json $json
    $resources = @()

    foreach ($item in $sourceItems) {
        $resource = $item.Resource
        if ([string]::IsNullOrWhiteSpace([string]$resource.name) -or [string]::IsNullOrWhiteSpace([string]$resource.url)) {
            continue
        }

        $categoryId = Convert-ToSlug (Get-FirstNonEmptyValue @($resource.category, $item.CategoryId) 'utilities-tools')
        if ([string]::IsNullOrWhiteSpace($categoryId)) {
            $categoryId = 'utilities-tools'
        }

        $subcategoryId = Convert-ToSlug (Get-FirstNonEmptyValue @($resource.subcategory, $item.SubcategoryId) 'various')
        if ([string]::IsNullOrWhiteSpace($subcategoryId)) {
            $subcategoryId = 'various'
        }

        $slug = Convert-ToSlug (Get-FirstNonEmptyValue @($resource.slug, $resource.name, $resource.id) $resource.id)
        $reservedKeys = Get-ReservedKeys
        $tags = @($resource.tags) | ForEach-Object { Convert-ToSlug ([string]$_) } | Where-Object { $_ -and $_ -notin $reservedKeys } | Select-Object -Unique
        if (@($tags).Count -eq 0) {
            $tags = @($categoryId, $subcategoryId, 'various') | Select-Object -Unique
        }

        $resources += [pscustomobject]@{
            id = Convert-ToSlug (Get-FirstNonEmptyValue @($resource.id, $slug) $slug)
            name = [string]$resource.name
            slug = $slug
            description = Get-FirstNonEmptyValue @($resource.description) 'Descripcion no disponible'
            url = [string]$resource.url
            status = if ([string]$resource.status -in @('active', 'warning', 'deprecated')) { [string]$resource.status } else { 'active' }
            tags = @($tags)
            searchIndex = @([string]$resource.name, $slug, [string]$resource.description, $categoryId, $subcategoryId) + @($tags) | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } | Select-Object -Unique
            category = $categoryId
            subcategory = $subcategoryId
            pricing = Infer-Pricing -Resource $resource
            languages = Normalize-Languages -Languages $resource.languages
            limits = Get-FirstNonEmptyValue @($resource.limits) 'unknown'
            added = Get-FirstNonEmptyValue @($resource.added) '2026-01-01'
            verified = [bool]$resource.verified
            noCreditCard = [bool]$resource.noCreditCard
        }
    }

    $categoryGroups = $resources | Group-Object category
    $categories = foreach ($group in $categoryGroups) {
        [pscustomobject]@{
            id = $group.Name
            name = (($group.Name -replace '-', ' ') -split ' ' | ForEach-Object { if ($_) { $_.Substring(0,1).ToUpper() + $_.Substring(1) } }) -join ' '
            slug = $group.Name
            resourceCount = $group.Count
            status = 'active'
        }
    }

    $subcategoryGroups = $resources | Group-Object subcategory
    $subcategories = foreach ($group in $subcategoryGroups) {
        [pscustomobject]@{
            id = $group.Name
            name = (($group.Name -replace '-', ' ') -split ' ' | ForEach-Object { if ($_) { $_.Substring(0,1).ToUpper() + $_.Substring(1) } }) -join ' '
            slug = $group.Name
            category = ($group.Group | Select-Object -First 1).category
            resourceCount = $group.Count
            status = 'active'
        }
    }

    $tagEntries = [ordered]@{}
    foreach ($tagGroup in ($resources | ForEach-Object { $_.tags } | Group-Object)) {
        $tagEntries[$tagGroup.Name] = [ordered]@{
            count = $tagGroup.Count
            color = Get-Color -Value $tagGroup.Name
            description = "Etiqueta $($tagGroup.Name)"
        }
    }

    $searchEntries = foreach ($resource in $resources) {
        [pscustomobject]@{
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

    $datasetName = [IO.Path]::GetFileNameWithoutExtension($SourceFilePath)
    $ui = [ordered]@{
        dataset = $datasetName
        title = Get-FirstNonEmptyValue @($json.metadata.title, $json.category) $datasetName
        description = Get-FirstNonEmptyValue @($json.metadata.description, $json.summary) "Dataset $datasetName"
        resourceCount = @($resources).Count
    }

    return [pscustomobject]@{
        Name = $datasetName
        Resources = @($resources | Sort-Object name)
        Categories = @($categories | Sort-Object id)
        Subcategories = @($subcategories | Sort-Object id)
        Tags = $tagEntries
        SearchEntries = @($searchEntries)
        Filters = $filters
        Ui = $ui
    }
}

function Write-DatasetFiles {
    param([pscustomobject]$Dataset, [string]$TargetBasePath)

    $datasetDir = Join-Path $TargetBasePath $Dataset.Name
    $dataDir = Join-Path $datasetDir 'data'
    $interfacesDir = Join-Path $datasetDir 'interficies'
    $safeIdentifier = Get-SafeIdentifier $Dataset.Name
    New-Item -ItemType Directory -Force -Path $dataDir | Out-Null
    New-Item -ItemType Directory -Force -Path $interfacesDir | Out-Null

    $recObject = [ordered]@{
        categories = $Dataset.Categories
        subcategories = $Dataset.Subcategories
        resources = $Dataset.Resources
    }

    $strucObject = [ordered]@{
        tags = $Dataset.Tags
        searchIndex = [ordered]@{
            fields = @(
                [ordered]@{ name = 'name'; weight = 3; encode = 'forward'; tokenize = 'forward' },
                [ordered]@{ name = 'description'; weight = 2; encode = 'forward'; tokenize = 'forward' },
                [ordered]@{ name = 'tags'; weight = 2; encode = 'forward'; tokenize = 'forward' },
                [ordered]@{ name = 'category'; weight = 1; encode = 'forward'; tokenize = 'forward' },
                [ordered]@{ name = 'subcategory'; weight = 1; encode = 'forward'; tokenize = 'forward' }
            )
            entries = $Dataset.SearchEntries
        }
        filters = $Dataset.Filters
        ui = $Dataset.Ui
    }

    $linkNames = @($Dataset.Resources | ForEach-Object { $_.name } | Sort-Object -Unique)

    $categoryList = @($Dataset.Categories.id | Sort-Object -Unique)
    $subcategoryList = @($Dataset.Subcategories.id | Sort-Object -Unique)
    $tagList = @($Dataset.Tags.Keys | Sort-Object)
    $languageList = @($Dataset.Resources.languages | Sort-Object -Unique)
    if (@($languageList).Count -eq 0) {
        $languageList = @('es', 'en')
    }

    $categoryLiterals = ($categoryList | ForEach-Object { "'$_'" }) -join ' | '
    $subcategoryLiterals = ($subcategoryList | ForEach-Object { "'$_'" }) -join ' | '
    $tagLiterals = ($tagList | ForEach-Object { "'$_'" }) -join ' | '
    $languageLiterals = ($languageList | ForEach-Object { "'$_'" }) -join ' | '

    $dataTs = @"
export const ${safeIdentifier}_categories = $(($categoryList | ConvertTo-Json -Compress)) as const;
export const ${safeIdentifier}_subcategories = $(($subcategoryList | ConvertTo-Json -Compress)) as const;
export const ${safeIdentifier}_tags = $(($tagList | ConvertTo-Json -Compress)) as const;
export const ${safeIdentifier}_pricing = ['free', 'freemium', 'premium'] as const;
export const ${safeIdentifier}_status = ['active', 'warning', 'deprecated'] as const;
export const ${safeIdentifier}_languages = $(($languageList | ConvertTo-Json -Compress)) as const;

export type CategoryKey = $categoryLiterals;
export type SubcategoryKey = $subcategoryLiterals;
export type TagKey = $tagLiterals;
export type Pricing = 'free' | 'freemium' | 'premium';
export type Status = 'active' | 'warning' | 'deprecated';
export type Language = $languageLiterals;
export type SearchFieldKey = 'name' | 'description' | 'tags' | 'category' | 'subcategory';
"@

    $recTs = @"
import type { CategoryKey, Language, Pricing, SearchFieldKey, Status, SubcategoryKey, TagKey } from './$($Dataset.Name)-data';

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
import type { CategoryKey, Pricing, Status, SubcategoryKey, TagKey } from './$($Dataset.Name)-data';

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

    $recObject | ConvertTo-Json -Depth 8 | Set-Content -Encoding utf8 (Join-Path $dataDir "$($Dataset.Name)-rec.json")
    $strucObject | ConvertTo-Json -Depth 8 | Set-Content -Encoding utf8 (Join-Path $dataDir "$($Dataset.Name)-struc.json")
    $linkNames | ConvertTo-Json -Depth 4 | Set-Content -Encoding utf8 (Join-Path $dataDir 'nombre-links.json')
    Set-Content -Encoding utf8 (Join-Path $interfacesDir "$($Dataset.Name)-data.ts") $dataTs
    Set-Content -Encoding utf8 (Join-Path $interfacesDir "$($Dataset.Name)-rec.ts") $recTs
    Set-Content -Encoding utf8 (Join-Path $interfacesDir "$($Dataset.Name)-busq.ts") $busqTs
}

$sourceFiles = Get-ChildItem $SourceRoot -Filter *.json | Where-Object { $_.BaseName -like $DatasetFilter }
foreach ($sourceFile in $sourceFiles) {
    $dataset = Build-NormalizedDataset -SourceFilePath $sourceFile.FullName
    Write-DatasetFiles -Dataset $dataset -TargetBasePath $TargetRoot
    Write-Output ("Generated {0} resources for {1}" -f @($dataset.Resources).Count, $dataset.Name)
}