import { getTranslationForLang, type Language } from "@/i18n";
import type { Link } from "@/interfaces/categories";
import { Search, X } from "lucide-react";
import { useEffect, useMemo, useState } from "react";

interface SearchBarProps {
  links: Link[];
  onResults: (results: Link[]) => void;
  lang?: Language;
}

export default function SearchBar({
  links,
  onResults,
  lang = "es",
}: SearchBarProps) {
  const [query, setQuery] = useState("");
  const [selectedTags, setSelectedTags] = useState<string[]>([]);
  const [error, setError] = useState("");

  const placeholder = getTranslationForLang("search.placeholder", lang);
  const errorInvalidChars =
    lang === "es"
      ? "Error, solo letras y caracteres válidos"
      : "Error, only letters and valid characters";
  const errorNoResults = getTranslationForLang("search.noResults", lang);
  const errorMaxTags =
    lang === "es" ? "Error: máximo 5 tags" : "Error: maximum 5 tags";

  const availableTags = useMemo(() => {
    const uniqueTags = new Set<string>();

    links.forEach((link) => {
      (link.tags ?? []).forEach((tag) => uniqueTags.add(tag));
    });

    return Array.from(uniqueTags).sort((left, right) =>
      left.localeCompare(right),
    );
  }, [links]);

  useEffect(() => {
    const timeout = window.setTimeout(() => {
      const normalizedQuery = query.trim().toLowerCase();

      if (normalizedQuery && /[^\p{L}\s-]/u.test(normalizedQuery)) {
        setError(errorInvalidChars);
        onResults([]);
        return;
      }

      const tagFiltered = selectedTags.length
        ? links.filter((link) =>
            selectedTags.every((tag) => (link.tags ?? []).includes(tag)),
          )
        : links;

      if (normalizedQuery.length < 3) {
        setError("");
        onResults(tagFiltered);
        return;
      }

      const filtered = tagFiltered.filter((link) => {
        const haystacks = [
          link.name,
          link.description,
          ...(link.tags ?? []),
          ...(link.searchIndex ?? []),
        ].map((value) => value.toLowerCase());

        return haystacks.some((value) => value.includes(normalizedQuery));
      });

      if (filtered.length === 0) {
        setError(errorNoResults);
        onResults([]);
        return;
      }

      setError("");
      onResults(filtered);
    }, 550);

    return () => window.clearTimeout(timeout);
  }, [
    links,
    onResults,
    query,
    selectedTags,
    errorInvalidChars,
    errorNoResults,
  ]);

  const toggleTag = (tag: string) => {
    setError("");

    setSelectedTags((current) => {
      if (current.includes(tag)) {
        return current.filter((item) => item !== tag);
      }

      if (current.length >= 5) {
        setError(errorMaxTags);
        return current;
      }

      return [...current, tag];
    });
  };

  const handleSearch = (value: string) => {
    setQuery(value);
  };

  const handleClear = () => {
    setQuery("");
    setSelectedTags([]);
    setError("");
    onResults(links);
  };

  return (
    <div className="relative mb-6 space-y-3">
      <div className="flex items-center gap-2">
        <Search className="w-5 h-5 text-gray-400 absolute left-3" />
        <input
          type="text"
          placeholder="Search by name, description, tags or index..."
          value={query}
          onChange={(e) => handleSearch(e.target.value)}
          className="w-full pl-10 pr-10 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        {query || selectedTags.length > 0 ? (
          <button
            onClick={handleClear}
            className="absolute right-3 p-1 hover:bg-gray-100 rounded"
            title="Clear search"
            aria-label="Clear search"
          >
            <X className="w-4 h-4 text-gray-400" />
          </button>
        ) : null}
      </div>

      <div className="hidden lg:block">
        <div className="flex flex-wrap gap-2">
          {availableTags.slice(0, 5).map((tag) => {
            const active = selectedTags.includes(tag);

            return (
              <button
                key={tag}
                type="button"
                onClick={() => toggleTag(tag)}
                className={`rounded-full border px-3 py-1 text-xs font-medium transition-colors ${
                  active
                    ? "border-blue-600 bg-blue-600 text-white"
                    : "border-gray-300 bg-white text-gray-700 hover:border-blue-400"
                }`}
              >
                {tag}
              </button>
            );
          })}
        </div>

        {availableTags.length > 5 ? (
          <details className="mt-2">
            <summary className="cursor-pointer text-xs font-medium text-gray-600">
              More tags
            </summary>
            <div className="mt-2 flex flex-wrap gap-2">
              {availableTags.slice(5).map((tag) => {
                const active = selectedTags.includes(tag);

                return (
                  <button
                    key={tag}
                    type="button"
                    onClick={() => toggleTag(tag)}
                    className={`rounded-full border px-3 py-1 text-xs font-medium transition-colors ${
                      active
                        ? "border-blue-600 bg-blue-600 text-white"
                        : "border-gray-300 bg-white text-gray-700 hover:border-blue-400"
                    }`}
                  >
                    {tag}
                  </button>
                );
              })}
            </div>
          </details>
        ) : null}
      </div>

      <div className="text-xs text-gray-500 flex flex-wrap gap-2">
        {selectedTags.length > 0 ? (
          <span>Tags: {selectedTags.join(", ")}</span>
        ) : null}
        {query.length >= 3 && !error ? (
          <span className="font-medium text-blue-600">
            {links.length !==
            (selectedTags.length > 0
              ? links.filter((l) =>
                  selectedTags.every((t) => (l.tags ?? []).includes(t)),
                ).length
              : links.length)
              ? `${links.length} resultados`
              : ""}
          </span>
        ) : null}
        <span>Min 3 chars.</span>
        <span>Max 5 tags.</span>
      </div>

      {error ? (
        <p className="text-sm font-semibold text-red-600">{error}</p>
      ) : null}
    </div>
  );
}
