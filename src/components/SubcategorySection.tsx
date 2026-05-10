import { getTranslation } from "@/i18n";
import type { Subcategory } from "@/interfaces/categories";
import { useState } from "react";
import LinkCard from "./LinkCard";
import LinkListItem from "./LinkListItem";
import SearchBar from "./SearchBar";

interface SubcategorySectionProps {
  subcategory: Subcategory;
  lang?: "es" | "en";
}

export default function SubcategorySection({
  subcategory,
  lang = "es",
}: SubcategorySectionProps) {
  const [filteredLinks, setFilteredLinks] = useState(subcategory.links);
  const noResultsText = getTranslation("search.noResults", { lang });

  return (
    <div id={subcategory.id} className="mb-8 scroll-mt-24">
      <h3 className="text-lg font-semibold text-gray-900 mb-4">
        {subcategory.name}
      </h3>

      {subcategory.description && (
        <p className="text-sm text-gray-600 mb-4">{subcategory.description}</p>
      )}

      <SearchBar
        links={subcategory.links}
        onResults={setFilteredLinks}
        lang={lang}
      />

      {filteredLinks.length === 0 ? (
        <p className="text-gray-500 text-center py-8">{noResultsText}</p>
      ) : (
        <>
          <div className="hidden lg:grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">
            {filteredLinks.map((link, idx) => (
              <LinkCard key={`${link.url}-${idx}`} link={link} lang={lang} />
            ))}
          </div>

          <div className="lg:hidden border border-gray-200 rounded-lg overflow-hidden">
            {filteredLinks.map((link, idx) => (
              <LinkListItem
                key={`${link.url}-${idx}`}
                link={link}
                lang={lang}
              />
            ))}
          </div>
        </>
      )}
    </div>
  );
}
