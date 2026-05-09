param(
    [string]$TargetRoot = 'C:\Users\User\Documents\programacion2025\IA\MCP\proyecto\pre_proyecto\jsons-news-interficies',
    [string]$SourceRoot = 'C:\Users\User\Documents\programacion2025\IA\MCP\proyecto\pre_proyecto\jsons',
    [string]$MarkdownFile = 'C:\Users\User\Documents\programacion2025\IA\MCP\proyecto\pre_proyecto\jsons\linkGeneral.md'
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

function Get-ReservedKeys {
    return @('notes', 'warnings', 'cleanups', 'changelog', 'phaseinfo', 'popularity')
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

function Get-ManualCuratedEntries {
    $manualCurationsPath = Join-Path $TargetRoot 'manual-curations.json'
    if (-not (Test-Path $manualCurationsPath)) {
        throw "No existe el archivo de curaciones manuales: $manualCurationsPath"
    }

    try {
        $entries = @(Get-Content $manualCurationsPath -Raw | ConvertFrom-Json)
    }
    catch {
        throw "Archivo de curaciones manuales invalido JSON: $manualCurationsPath"
    }

    if (@($entries).Count -eq 0) {
        throw "El archivo de curaciones manuales esta vacio: $manualCurationsPath"
    }

    $requiredFields = @('Dataset', 'Name', 'Description', 'Url', 'Tags', 'Pricing', 'Category', 'Subcategory')
    for ($index = 0; $index -lt $entries.Count; $index++) {
        $entry = $entries[$index]
        foreach ($field in $requiredFields) {
            if ($null -eq $entry.PSObject.Properties[$field]) {
                throw "Curacion manual invalida en indice $($index): falta campo '$field'"
            }
        }

        foreach ($scalarField in @('Dataset', 'Name', 'Description', 'Url', 'Pricing', 'Category', 'Subcategory')) {
            if ([string]::IsNullOrWhiteSpace([string]$entry.$scalarField)) {
                throw "Curacion manual invalida en indice $($index): campo '$scalarField' vacio"
            }
        }

        $tags = @($entry.Tags)
        if (@($tags).Count -eq 0) {
            throw "Curacion manual invalida en indice $($index): campo 'Tags' vacio"
        }

        $canonical = Normalize-CanonicalUrl ([string]$entry.Url)
        if ([string]::IsNullOrWhiteSpace($canonical)) {
            throw "Curacion manual invalida en indice $($index): URL no canonicalizable"
        }
    }

    return $entries
}

function Convert-ManualEntryToResource {
    param([pscustomobject]$Entry)

    $slug = Convert-ToSlug $Entry.Name
    $tags = @($Entry.Tags | ForEach-Object { Convert-ToSlug ([string]$_) } | Where-Object { $_ } | Select-Object -Unique)

    return [pscustomobject]@{
        id = $slug
        name = [string]$Entry.Name
        slug = $slug
        description = [string]$Entry.Description
        url = [string]$Entry.Url
        status = 'active'
        tags = @($tags)
        searchIndex = @([string]$Entry.Name, $slug, [string]$Entry.Description, [string]$Entry.Category, [string]$Entry.Subcategory) + @($tags) | Select-Object -Unique
        category = [string]$Entry.Category
        subcategory = [string]$Entry.Subcategory
        pricing = [string]$Entry.Pricing
        languages = @('es', 'en')
        limits = 'unknown'
        added = '2026-04-29'
        verified = $true
        noCreditCard = $false
    }
}

function Get-TitleFromSlug {
    param([string]$Value)

    return (($Value -replace '-', ' ') -split ' ' | ForEach-Object {
        if ($_) { $_.Substring(0, 1).ToUpper() + $_.Substring(1) }
    }) -join ' '
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

function Get-SourceResources {
    param([pscustomobject]$Json, [string]$SourceName)

    $items = @()

    if ($null -ne $Json.categories) {
        foreach ($category in @($Json.categories)) {
            foreach ($subcategory in @($category.subcategories)) {
                foreach ($resource in @($subcategory.resources)) {
                    $items += [pscustomobject]@{
                        SourceName = $SourceName
                        Resource = $resource
                        CategoryId = Get-FirstNonEmptyValue @($resource.category, $category.slug, $category.id, $Json.category) 'utilities-tools'
                        SubcategoryId = Get-FirstNonEmptyValue @($resource.subcategory, $subcategory.slug, $subcategory.id) 'various'
                    }
                }
            }
        }
        return @($items)
    }

    if ($null -ne $Json.resources) {
        foreach ($resource in @($Json.resources)) {
            $items += [pscustomobject]@{
                SourceName = $SourceName
                Resource = $resource
                CategoryId = Get-FirstNonEmptyValue @($resource.category, $Json.category) 'utilities-tools'
                SubcategoryId = Get-FirstNonEmptyValue @($resource.subcategory) 'various'
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
                    SourceName = $SourceName
                    Resource = $resource
                    CategoryId = Get-FirstNonEmptyValue @($resource.category, $Json.category) 'utilities-tools'
                    SubcategoryId = Get-FirstNonEmptyValue @($resource.subcategory, $subcategory.slug, $subcategory.id) 'various'
                }
            }
        }
    }

    return @($items)
}

function Convert-SourceItemToResource {
    param([pscustomobject]$Item)

    $resource = $Item.Resource
    if ([string]::IsNullOrWhiteSpace([string]$resource.name) -or [string]::IsNullOrWhiteSpace([string]$resource.url)) {
        return $null
    }

    $reserved = Get-ReservedKeys
    $categoryId = Convert-ToSlug (Get-FirstNonEmptyValue @($resource.category, $Item.CategoryId) 'utilities-tools')
    if ([string]::IsNullOrWhiteSpace($categoryId)) { $categoryId = 'utilities-tools' }
    $subcategoryId = Convert-ToSlug (Get-FirstNonEmptyValue @($resource.subcategory, $Item.SubcategoryId) 'various')
    if ([string]::IsNullOrWhiteSpace($subcategoryId)) { $subcategoryId = 'various' }
    $slug = Convert-ToSlug (Get-FirstNonEmptyValue @($resource.slug, $resource.name, $resource.id) $resource.id)
    $tags = @($resource.tags) | ForEach-Object { Convert-ToSlug ([string]$_) } | Where-Object { $_ -and $_ -notin $reserved } | Select-Object -Unique
    if (@($tags).Count -eq 0) {
        $tags = @($categoryId, $subcategoryId, 'various') | Select-Object -Unique
    }

    return [pscustomobject]@{
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

function Get-MarkdownLinks {
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

        $matches = [regex]::Matches($line, '\[(?<text>[^\]]+)\]\((?<url>https?://(?:[^()\s]|\([^)]*\))+?)\)')
        foreach ($match in $matches) {
            $order += 1
            $rows += [pscustomobject]@{
                Order = $order
                Line = $index + 1
                Section = $section
                Subsection = $subsection
                Text = $match.Groups['text'].Value
                Url = $match.Groups['url'].Value
                CanonicalUrl = Normalize-CanonicalUrl $match.Groups['url'].Value
            }
        }
    }

    return @($rows)
}

function Get-NormalizedDatasets {
    param([string]$Root)

    $datasets = @{}
    foreach ($file in Get-ChildItem $Root -Recurse -Filter '*-rec.json') {
        $datasetDir = Split-Path (Split-Path $file.FullName -Parent) -Parent
        $datasetName = Split-Path $datasetDir -Leaf
        $strucPath = Join-Path (Join-Path $datasetDir 'data') ($datasetName + '-struc.json')
        $recJson = Get-Content $file.FullName -Raw | ConvertFrom-Json
        $strucJson = if (Test-Path $strucPath) { Get-Content $strucPath -Raw | ConvertFrom-Json } else { $null }
        $datasets[$datasetName] = [ordered]@{
            Name = $datasetName
            Dir = $datasetDir
            RecPath = $file.FullName
            StrucPath = $strucPath
            NamesPath = Join-Path (Join-Path $datasetDir 'data') 'nombre-links.json'
            Resources = [System.Collections.ArrayList]::new()
            CategoryMeta = @{}
            SubcategoryMeta = @{}
            Ui = if ($strucJson -and $strucJson.ui) { $strucJson.ui } else { [ordered]@{ dataset = $datasetName; title = $datasetName; description = "Dataset $datasetName"; resourceCount = @($recJson.resources).Count } }
        }

        foreach ($category in @($recJson.categories)) {
            $datasets[$datasetName].CategoryMeta[$category.id] = $category
        }
        foreach ($subcategory in @($recJson.subcategories)) {
            $datasets[$datasetName].SubcategoryMeta[$subcategory.id] = $subcategory
        }
        foreach ($resource in @($recJson.resources)) {
            [void]$datasets[$datasetName].Resources.Add($resource)
        }
    }

    return $datasets
}

function Get-SourceIndex {
    param([string]$Root)

    $index = @{}
    foreach ($file in Get-ChildItem $Root -Filter *.json) {
        $json = Get-Content $file.FullName -Raw | ConvertFrom-Json
        $items = Get-SourceResources -Json $json -SourceName $file.BaseName
        foreach ($item in $items) {
            $canonicalUrl = Normalize-CanonicalUrl $item.Resource.url
            if ([string]::IsNullOrWhiteSpace($canonicalUrl)) {
                continue
            }
            if (-not $index.ContainsKey($canonicalUrl)) {
                $index[$canonicalUrl] = [System.Collections.ArrayList]::new()
            }
            [void]$index[$canonicalUrl].Add($item)
        }
    }

    return $index
}

function Rebuild-DatasetDataFiles {
    param([hashtable]$Dataset)

    $resources = @($Dataset.Resources | Sort-Object name)
    if (@($resources).Count -eq 0) {
        if (Test-Path $Dataset.Dir) {
            Remove-Item -Recurse -Force $Dataset.Dir
        }
        return $false
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

    $Dataset.Ui = $ui
    $Dataset.Resources = [System.Collections.ArrayList]::new()
    foreach ($resource in $resources) {
        [void]$Dataset.Resources.Add($resource)
    }

    return $true
}

function Add-ResourceToDataset {
    param([hashtable]$Dataset, [pscustomobject]$Resource, [object]$ManualMeta)

    $existing = @($Dataset.Resources | Where-Object { (Normalize-CanonicalUrl $_.url) -eq (Normalize-CanonicalUrl $Resource.url) })
    if (@($existing).Count -gt 0) {
        return $false
    }

    if (-not $Dataset.CategoryMeta.ContainsKey($Resource.category)) {
        $categoryName = if ($ManualMeta -and $ManualMeta.CategoryName) { [string]$ManualMeta.CategoryName } else { Get-TitleFromSlug $Resource.category }
        $Dataset.CategoryMeta[$Resource.category] = [ordered]@{ id = $Resource.category; name = $categoryName; slug = $Resource.category; status = 'active' }
    }
    if (-not $Dataset.SubcategoryMeta.ContainsKey($Resource.subcategory)) {
        $subcategoryName = if ($ManualMeta -and $ManualMeta.SubcategoryName) { [string]$ManualMeta.SubcategoryName } else { Get-TitleFromSlug $Resource.subcategory }
        $Dataset.SubcategoryMeta[$Resource.subcategory] = [ordered]@{ id = $Resource.subcategory; name = $subcategoryName; slug = $Resource.subcategory; category = $Resource.category; status = 'active' }
    }

    [void]$Dataset.Resources.Add($Resource)
    return $true
}

$markdownLinks = Get-MarkdownLinks -Path $MarkdownFile
$markdownOrder = @{}
foreach ($link in $markdownLinks) {
    if (-not $markdownOrder.ContainsKey($link.CanonicalUrl)) {
        $markdownOrder[$link.CanonicalUrl] = $link
    }
}

$datasets = Get-NormalizedDatasets -Root $TargetRoot
$sourceIndex = Get-SourceIndex -Root $SourceRoot

$allResources = foreach ($datasetName in $datasets.Keys) {
    foreach ($resource in @($datasets[$datasetName].Resources)) {
        [pscustomobject]@{
            DatasetName = $datasetName
            Resource = $resource
            CanonicalUrl = Normalize-CanonicalUrl $resource.url
            MarkdownOrder = if ($markdownOrder.ContainsKey((Normalize-CanonicalUrl $resource.url))) { $markdownOrder[(Normalize-CanonicalUrl $resource.url)].Order } else { [int]::MaxValue }
        }
    }
}

$duplicateGroups = $allResources | Group-Object CanonicalUrl | Where-Object { $_.Name -and $_.Count -gt 1 }
$removedDuplicates = [System.Collections.ArrayList]::new()
$changedDatasets = @{}

foreach ($group in $duplicateGroups) {
    $ordered = @($group.Group | Sort-Object MarkdownOrder, DatasetName, @{ Expression = { $_.Resource.name } })
    $keep = $ordered[0]
    for ($index = 1; $index -lt $ordered.Count; $index++) {
        $entry = $ordered[$index]
        $dataset = $datasets[$entry.DatasetName]
        $newList = [System.Collections.ArrayList]::new()
        foreach ($resource in @($dataset.Resources)) {
            if ((Normalize-CanonicalUrl $resource.url) -ne $group.Name -or $resource.id -ne $entry.Resource.id) {
                [void]$newList.Add($resource)
            }
        }
        $dataset.Resources = $newList
        $changedDatasets[$entry.DatasetName] = $true
        [void]$removedDuplicates.Add([pscustomobject]@{
            Url = $group.Name
            KeptDataset = $keep.DatasetName
            RemovedDataset = $entry.DatasetName
            RemovedName = $entry.Resource.name
        })
    }
}

$deletedDatasets = [System.Collections.ArrayList]::new()
foreach ($datasetName in @($changedDatasets.Keys)) {
    $alive = Rebuild-DatasetDataFiles -Dataset $datasets[$datasetName]
    if (-not $alive) {
        [void]$deletedDatasets.Add($datasetName)
        $datasets.Remove($datasetName)
    }
}

$currentCanonicalUrls = @{}
foreach ($datasetName in $datasets.Keys) {
    foreach ($resource in @($datasets[$datasetName].Resources)) {
        $currentCanonicalUrls[(Normalize-CanonicalUrl $resource.url)] = $true
    }
}

$insertedResources = [System.Collections.ArrayList]::new()
$ambiguousMissing = [System.Collections.ArrayList]::new()

$manualEntries = Get-ManualCuratedEntries
foreach ($entry in $manualEntries) {
    $canonical = Normalize-CanonicalUrl $entry.Url
    if ([string]::IsNullOrWhiteSpace($canonical) -or $currentCanonicalUrls.ContainsKey($canonical)) {
        continue
    }

    if (-not $datasets.ContainsKey($entry.Dataset)) {
        [void]$ambiguousMissing.Add([pscustomobject]@{ Url = $entry.Url; Reason = 'El dataset manual destino no existe'; Section = 'Curated'; Subsection = $entry.Dataset; Text = $entry.Name })
        continue
    }

    if ($null -ne $entry.PSObject.Properties['UrlStartsWith'] -and -not [string]::IsNullOrWhiteSpace([string]$entry.UrlStartsWith)) {
        $datasets[$entry.Dataset].Resources = [System.Collections.ArrayList]::new(@($datasets[$entry.Dataset].Resources | Where-Object { -not ([string]$_.url).StartsWith([string]$entry.UrlStartsWith) }))
    }

    $normalizedManual = Convert-ManualEntryToResource -Entry $entry
    $addedManual = Add-ResourceToDataset -Dataset $datasets[$entry.Dataset] -Resource $normalizedManual -ManualMeta $entry
    if ($addedManual) {
        $changedDatasets[$entry.Dataset] = $true
        $currentCanonicalUrls[$canonical] = $true
        [void]$insertedResources.Add([pscustomobject]@{ Url = $entry.Url; Dataset = $entry.Dataset; Name = $normalizedManual.name; Category = $normalizedManual.category; Subcategory = $normalizedManual.subcategory })
    }
}

foreach ($link in $markdownLinks) {
    if ([string]::IsNullOrWhiteSpace($link.CanonicalUrl) -or $currentCanonicalUrls.ContainsKey($link.CanonicalUrl)) {
        continue
    }

    if (-not $sourceIndex.ContainsKey($link.CanonicalUrl)) {
        [void]$ambiguousMissing.Add([pscustomobject]@{ Url = $link.Url; Reason = 'No aparece en los JSON origen'; Section = $link.Section; Subsection = $link.Subsection; Text = $link.Text })
        continue
    }

    $matches = @($sourceIndex[$link.CanonicalUrl])
    if (@($matches).Count -ne 1) {
        [void]$ambiguousMissing.Add([pscustomobject]@{ Url = $link.Url; Reason = 'Coincide con multiples recursos origen'; Section = $link.Section; Subsection = $link.Subsection; Text = $link.Text })
        continue
    }

    $match = $matches[0]
    $normalized = Convert-SourceItemToResource -Item $match
    if ($null -eq $normalized) {
        [void]$ambiguousMissing.Add([pscustomobject]@{ Url = $link.Url; Reason = 'El recurso origen no es normalizable'; Section = $link.Section; Subsection = $link.Subsection; Text = $link.Text })
        continue
    }

    if (-not $datasets.ContainsKey($match.SourceName)) {
        [void]$ambiguousMissing.Add([pscustomobject]@{ Url = $link.Url; Reason = 'El dataset destino no existe'; Section = $link.Section; Subsection = $link.Subsection; Text = $link.Text })
        continue
    }

    $added = Add-ResourceToDataset -Dataset $datasets[$match.SourceName] -Resource $normalized -ManualMeta $null
    if ($added) {
        $changedDatasets[$match.SourceName] = $true
        $currentCanonicalUrls[$link.CanonicalUrl] = $true
        [void]$insertedResources.Add([pscustomobject]@{ Url = $link.Url; Dataset = $match.SourceName; Name = $normalized.name; Category = $normalized.category; Subcategory = $normalized.subcategory })
    }
}

foreach ($datasetName in @($changedDatasets.Keys | Sort-Object -Unique)) {
    if ($datasets.ContainsKey($datasetName)) {
        $alive = Rebuild-DatasetDataFiles -Dataset $datasets[$datasetName]
        if (-not $alive) {
            [void]$deletedDatasets.Add($datasetName)
            $datasets.Remove($datasetName)
        }
    }
}

$finalResources = foreach ($datasetName in $datasets.Keys) {
    foreach ($resource in @($datasets[$datasetName].Resources)) {
        [pscustomobject]@{ Dataset = $datasetName; Name = $resource.name; Url = Normalize-CanonicalUrl $resource.url }
    }
}
$remainingDuplicates = @($finalResources | Group-Object Url | Where-Object { $_.Name -and $_.Count -gt 1 })

$summaryPath = Join-Path $TargetRoot 'resumen_datos.md'
$treeText = @(
    'jsons-news-interficies/',
    '|-- <dataset>/',
    '|   |-- data/',
    '|   |   |-- xxxx-rec.json',
    '|   |   |-- xxxx-struc.json',
    '|   |   `-- nombre-links.json',
    '|   `-- interficies/'
) -join "`n"

$duplicateTable = if (@($removedDuplicates).Count -gt 0) {
    ($removedDuplicates | ForEach-Object { "| {0} | {1} | {2} | {3} |" -f $_.RemovedName.Replace('|','/'), $_.Url.Replace('|','/'), $_.KeptDataset.Replace('|','/'), $_.RemovedDataset.Replace('|','/') }) -join "`n"
} else {
    '| Sin duplicados eliminados | - | - | - |'
}

$insertedTable = if (@($insertedResources).Count -gt 0) {
    ($insertedResources | ForEach-Object { "| {0} | {1} | {2} | {3} |" -f $_.Name.Replace('|','/'), $_.Url.Replace('|','/'), $_.Dataset.Replace('|','/'), (("{0}/{1}" -f $_.Category, $_.Subcategory).Replace('|','/')) }) -join "`n"
} else {
    '| Sin inserciones automaticas | - | - | - |'
}

$ambiguousTable = if (@($ambiguousMissing).Count -gt 0) {
    ($ambiguousMissing | Select-Object -First 30 | ForEach-Object { "| {0} | {1} | {2} | {3} |" -f $_.Text.Replace('|','/'), $_.Url.Replace('|','/'), $_.Section.Replace('|','/'), $_.Reason.Replace('|','/') }) -join "`n"
} else {
    '| Sin casos ambiguos pendientes | - | - | - |'
}

$exampleDataset = $datasets.Keys | Sort-Object | Select-Object -First 1
$exampleResource = if ($exampleDataset) { @($datasets[$exampleDataset].Resources | Select-Object -First 1) } else { @() }
$exampleJson = if (@($exampleResource).Count -gt 0) { ($exampleResource[0] | ConvertTo-Json -Depth 4) } else { '{}' }

$summary = @"
# Resumen Datos

## Estadisticas

| Metrica | Valor |
| --- | ---: |
| Datasets actuales | $(@($datasets.Keys).Count) |
| Links markdown parseados | $(@($markdownLinks).Count) |
| Duplicados eliminados | $(@($removedDuplicates).Count) |
| Inserciones automaticas | $(@($insertedResources).Count) |
| Casos ambiguos pendientes | $(@($ambiguousMissing).Count) |
| Duplicados globales restantes | $(@($remainingDuplicates).Count) |

## Reglas aplicadas

- Dedupe por URL canonica.
- Se conserva la primera aparicion en linkGeneral.md.
- Si cambia un dataset, se regeneran xxxx-rec.json, xxxx-struc.json y nombre-links.json.
- Si una carpeta queda sin recursos, se elimina completa.
- Solo se insertan faltantes con origen unico y categoria/subcategoria claras desde los JSON origen.

## Estructura

~~~text
$treeText
~~~

## Duplicados eliminados

| Recurso | URL canonica | Dataset conservado | Dataset eliminado |
| --- | --- | --- | --- |
$duplicateTable

## Inserciones automaticas

| Recurso | URL | Dataset destino | Categoria/Subcategoria |
| --- | --- | --- | --- |
$insertedTable

## Casos pendientes

| Recurso | URL | Seccion | Motivo |
| --- | --- | --- | --- |
$ambiguousTable

## Invariantes de datos

- xxxx-rec.json contiene categories, subcategories y resources.
- xxxx-struc.json contiene tags, searchIndex, filters y ui derivados de resources.
- nombre-links.json es la lista unica de nombres presentes en resources.
- La relacion entre los tres archivos se recalcula desde recursos vigentes, no por edicion parcial.

## Ejemplo minimo de resource

~~~json
$exampleJson
~~~
"@

Set-Content -Encoding utf8 $summaryPath $summary

Write-Output ("removedDuplicates={0}" -f @($removedDuplicates).Count)
Write-Output ("insertedResources={0}" -f @($insertedResources).Count)
Write-Output ("ambiguousMissing={0}" -f @($ambiguousMissing).Count)
Write-Output ("remainingDuplicates={0}" -f @($remainingDuplicates).Count)