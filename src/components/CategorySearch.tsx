// CategorySearch component for filtering categories
import { useMemo, useState } from "react";

interface Category {
  name: string;
  slug: string;
  description: string;
  subcategories: {
    links: { name: string }[];
  }[];
}

interface CategorySearchProps {
  categories: Category[];
  lang: "es" | "en";
  baseUrl?: string;
  translations: {
    placeholder: string;
    noResults: string;
  };
}

export function CategorySearch({
  categories,
  lang,
  baseUrl = "",
  translations,
}: CategorySearchProps) {
  const [query, setQuery] = useState("");

  const filteredCategories = useMemo(() => {
    if (query.length < 2) return categories;

    const q = query.toLowerCase();
    return categories.filter(
      (cat) =>
        cat.name.toLowerCase().includes(q) ||
        cat.description.toLowerCase().includes(q) ||
        cat.slug.toLowerCase().includes(q),
    );
  }, [categories, query]);

  return (
    <div className="category-search">
      <div className="relative mb-8">
        <input
          type="text"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder={translations.placeholder}
          className="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <svg
          className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400"
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
            className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
          >
            ✕
          </button>
        )}
      </div>

      {filteredCategories.length === 0 ? (
        <p className="text-center text-gray-500 py-8">
          {translations.noResults}
        </p>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {filteredCategories.map((category) => {
            const linkCount = category.subcategories.reduce(
              (sum, sub) => sum + sub.links.length,
              0,
            );

            return (
              <a
                key={category.slug}
                href={`${baseUrl}/${lang === "en" ? "en/" : ""}categories/${category.slug}`}
                className="rounded-lg border border-gray-200 p-6 transition-all hover:border-gray-300 hover:shadow-lg"
              >
                <h2 className="text-lg font-bold mb-2">{category.name}</h2>
                <p className="text-sm text-gray-600 mb-4">
                  {category.description}
                </p>
                <div className="flex items-center justify-between text-xs">
                  <span className="text-gray-500">
                    {linkCount} {lang === "es" ? "recursos" : "resources"}
                  </span>
                  <span className="font-semibold text-blue-600">→</span>
                </div>
              </a>
            );
          })}
        </div>
      )}
    </div>
  );
}

export default CategorySearch;
