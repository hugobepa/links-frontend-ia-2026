// GlobalSearch component for searching all resources
import { useMemo, useState } from "react";

interface Resource {
  id: string;
  name: string;
  description: string;
  url: string;
  tags: string[];
  category: string;
  subcategory: string;
  pricing: "free" | "freemium" | "premium" | "paid";
  languages: string[];
}

interface GlobalSearchProps {
  resources: Resource[];
  lang: "es" | "en";
  translations: {
    placeholder: string;
    noResults: string;
    all: string;
    free: string;
    freemium: string;
    premium: string;
    paid: string;
    results: string;
  };
}

export function GlobalSearch({
  resources,
  lang,
  translations,
}: GlobalSearchProps) {
  const [query, setQuery] = useState("");
  const [pricingFilter, setPricingFilter] = useState<string>("all");

  const filteredResources = useMemo(() => {
    let result = resources;

    // Filter by pricing
    if (pricingFilter !== "all") {
      result = result.filter((r) => r.pricing === pricingFilter);
    }

    // Filter by search query
    if (query.length >= 2) {
      const q = query.toLowerCase();
      result = result.filter(
        (r) =>
          r.name.toLowerCase().includes(q) ||
          r.description.toLowerCase().includes(q) ||
          r.tags.some((tag) => tag.toLowerCase().includes(q)) ||
          r.category.toLowerCase().includes(q) ||
          r.subcategory.toLowerCase().includes(q),
      );
    }

    return result;
  }, [resources, query, pricingFilter]);

  const pricingOptions = [
    { value: "all", label: translations.all },
    { value: "free", label: translations.free },
    { value: "freemium", label: translations.freemium },
    { value: "premium", label: translations.premium },
  ];

  const getPricingBadge = (pricing: string) => {
    const badges: Record<string, { bg: string; text: string }> = {
      free: { bg: "bg-green-100", text: "text-green-800" },
      freemium: { bg: "bg-blue-100", text: "text-blue-800" },
      premium: { bg: "bg-purple-100", text: "text-purple-800" },
    };
    const badge = badges[pricing] || badges.free;
    return (
      <span
        className={`px-2 py-1 rounded-full text-xs font-medium ${badge.bg} ${badge.text}`}
      >
        {pricing}
      </span>
    );
  };

  return (
    <div className="global-search">
      {/* Search Input */}
      <div className="relative mb-6">
        <input
          type="text"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder={translations.placeholder}
          className="w-full pl-12 pr-4 py-4 border border-gray-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500 text-lg"
        />
        <svg
          className="absolute left-4 top-1/2 -translate-y-1/2 w-6 h-6 text-gray-400"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth={2}
            d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
          />
        </svg>
        {query && (
          <button
            onClick={() => setQuery("")}
            className="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
          >
            ✕
          </button>
        )}
      </div>

      {/* Pricing Filter Toggle */}
      <div className="flex flex-wrap gap-2 mb-6">
        {pricingOptions.map((option) => (
          <button
            key={option.value}
            onClick={() => setPricingFilter(option.value)}
            className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
              pricingFilter === option.value
                ? "bg-blue-600 text-white shadow-md"
                : "bg-gray-100 text-gray-700 hover:bg-gray-200"
            }`}
          >
            {option.label}
          </button>
        ))}
      </div>

      {/* Results Count */}
      <p className="text-sm text-gray-500 mb-4">
        {filteredResources.length} {translations.results}
      </p>

      {/* Results Grid */}
      {filteredResources.length === 0 ? (
        <p className="text-center text-gray-500 py-12 text-lg">
          {translations.noResults}
        </p>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          {filteredResources.map((resource) => (
            <a
              key={resource.id}
              href={`/${lang === "en" ? "en/" : ""}categories/${resource.category}`}
              className="block p-5 rounded-xl border border-gray-200 bg-white hover:border-blue-300 hover:shadow-lg transition-all"
            >
              <div className="flex items-start justify-between gap-2 mb-2">
                <h3 className="font-bold text-gray-900 line-clamp-1">
                  {resource.name}
                </h3>
                {getPricingBadge(resource.pricing)}
              </div>
              <p className="text-sm text-gray-600 line-clamp-2 mb-3">
                {resource.description}
              </p>
              <div className="flex flex-wrap gap-1 mb-2">
                {resource.tags.slice(0, 4).map((tag) => (
                  <span
                    key={tag}
                    className="px-2 py-0.5 bg-gray-100 text-gray-600 rounded text-xs"
                  >
                    {tag}
                  </span>
                ))}
              </div>
              <p className="text-xs text-gray-400">
                {resource.category} › {resource.subcategory}
              </p>
            </a>
          ))}
        </div>
      )}
    </div>
  );
}

export default GlobalSearch;
