import { getTranslationForLang, type Language } from "@/i18n";
import type { Link } from "@/interfaces/categories";
import { CheckCircle, ExternalLink, XCircle } from "lucide-react";

interface LinkCardProps {
  link: Link;
  lang?: Language;
}

export default function LinkCard({ link, lang = "es" }: LinkCardProps) {
  const t = getTranslationForLang("linkCard", lang);
  const visitText = t.visit || (lang === "es" ? "Visitar" : "Visit");
  const verifiedText =
    t.verified || (lang === "es" ? "Verificado" : "Verified");

  const statusIcon =
    link.status === "active" ? (
      <CheckCircle className="w-4 h-4 text-green-600" />
    ) : (
      <XCircle className="w-4 h-4 text-red-600" />
    );

  const pricingColor = {
    free: "bg-green-100 text-green-800",
    paid: "bg-blue-100 text-blue-800",
    freemium: "bg-orange-100 text-orange-800",
    custom: "bg-gray-100 text-gray-800",
    "free-trial": "bg-purple-100 text-purple-800",
  };

  const pricingLabels = {
    free: lang === "es" ? "Gratis" : "Free",
    paid: lang === "es" ? "De pago" : "Paid",
    freemium: "Freemium",
    custom: "Custom",
    "free-trial": lang === "es" ? "Prueba gratis" : "Free trial",
  };

  return (
    <div className="p-4 border border-gray-200 rounded-lg hover:shadow-md transition-shadow">
      <div className="flex justify-between items-start mb-2">
        <h3 className="font-bold text-gray-900 flex-1">{link.name}</h3>
        <div className="flex gap-2">{statusIcon}</div>
      </div>

      <p className="text-sm text-gray-600 mb-3">{link.description}</p>

      <div className="flex flex-wrap gap-2 mb-3">
        <a
          href={link.url}
          target="_blank"
          rel="noopener noreferrer"
          className="text-blue-600 hover:text-blue-800 flex items-center gap-1 text-sm"
        >
          {visitText}
          <ExternalLink className="w-3 h-3" />
        </a>
        <span
          className={`text-xs px-2 py-1 rounded ${pricingColor[link.pricing]}`}
        >
          {pricingLabels[link.pricing] || link.pricing}
        </span>
      </div>

      <div className="flex flex-wrap gap-2 text-xs">
        <div className="flex gap-1">
          {link.languages.map((lang) => (
            <span key={lang} className="font-bold text-gray-700">
              {lang.toUpperCase()}
            </span>
          ))}
        </div>
        {link.limits && <span className="text-gray-600">{link.limits}</span>}
        {link.verified && (
          <span className="text-green-600 font-bold">✓ {verifiedText}</span>
        )}
        {link.noCreditCard && <span className="text-gray-600">No CC</span>}
      </div>
    </div>
  );
}
