import { type Language } from "@/i18n";
import type { Link } from "@/interfaces/categories";
import { ExternalLink } from "lucide-react";

interface LinkListItemProps {
  link: Link;
  lang?: Language;
}

export default function LinkListItem({ link, lang = "es" }: LinkListItemProps) {
  const visitText = lang === "es" ? "Visitar" : "Visit";

  const pricingLabels = {
    free: lang === "es" ? "Gratis" : "Free",
    paid: lang === "es" ? "De pago" : "Paid",
    freemium: "Freemium",
    custom: "Custom",
    "free-trial": lang === "es" ? "Prueba gratis" : "Free trial",
  };

  return (
    <div className="p-3 border-b border-gray-200 hover:bg-gray-50">
      <div className="flex justify-between items-start mb-2">
        <h4 className="font-bold text-gray-900">{link.name}</h4>
      </div>

      <p className="text-sm text-gray-600 mb-2">{link.description}</p>

      <div className="flex flex-wrap gap-2 text-xs">
        <a
          href={link.url}
          className="text-blue-600 hover:text-blue-800 flex items-center gap-1"
        >
          {visitText}
          <ExternalLink className="w-3 h-3" />
        </a>
        <span className="text-gray-600">
          {pricingLabels[link.pricing] || link.pricing}
        </span>
        <div className="flex gap-1">
          {link.languages.map((lang) => (
            <span key={lang} className="font-bold text-gray-700">
              {lang.toUpperCase()}
            </span>
          ))}
        </div>
        {link.noCreditCard && <span className="text-gray-600">No CC</span>}
      </div>

      {link.tags && link.tags.length > 0 && (
        <div className="flex flex-wrap gap-1 mt-2">
          {link.tags.slice(0, 3).map((tag) => (
            <span
              key={tag}
              className="text-xs px-2 py-0.5 bg-gray-100 text-gray-600 rounded"
            >
              {tag}
            </span>
          ))}
          {link.tags.length > 3 && (
            <span className="text-xs text-gray-500">
              +{link.tags.length - 3}
            </span>
          )}
        </div>
      )}
    </div>
  );
}
