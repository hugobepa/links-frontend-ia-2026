// filepath: src/components/LanguageToggle.tsx
import { useStore } from "@nanostores/react";
import { useCallback, useEffect, useState } from "react";
import {
  $language,
  availableLanguages,
  setLanguage,
  type Language,
} from "../i18n";

interface LanguageToggleProps {
  variant?: "icon" | "text" | "full";
  className?: string;
}

export function LanguageToggle({
  variant = "icon",
  className = "",
}: LanguageToggleProps) {
  const currentLanguage = useStore($language);
  const [mounted, setMounted] = useState(false);

  // Avoid hydration mismatch by only rendering after mount
  useEffect(() => {
    setMounted(true);
  }, []);

  const handleToggle = useCallback(() => {
    const newLang: Language = currentLanguage === "es" ? "en" : "es";
    setLanguage(newLang);

    // Navigate to the other language version
    const currentPath = window.location.pathname;
    let newPath = currentPath;

    if (currentPath.startsWith("/en")) {
      newPath = currentPath.replace("/en", "") || "/";
    } else {
      newPath = "/en" + currentPath;
    }

    window.location.href = newPath;
  }, [currentLanguage]);

  const currentLangInfo = availableLanguages.find(
    (l) => l.code === currentLanguage,
  );
  const nextLangInfo = availableLanguages.find(
    (l) => l.code !== currentLanguage,
  );

  // Prevent hydration mismatch
  if (!mounted) {
    return null;
  }

  if (variant === "text") {
    return (
      <button
        onClick={handleToggle}
        className={`language-toggle language-toggle--text ${className}`}
        aria-label={`Cambiar a ${nextLangInfo?.name || "otro idioma"}`}
        title={`Cambiar a ${nextLangInfo?.name || "otro idioma"}`}
      >
        <span className="language-toggle__current">
          {currentLangInfo?.name}
        </span>
        <span className="language-toggle__separator">/</span>
        <span className="language-toggle__switch">{nextLangInfo?.name}</span>
      </button>
    );
  }

  if (variant === "full") {
    return (
      <div className={`language-toggle language-toggle--full ${className}`}>
        {availableLanguages.map((lang) => (
          <button
            key={lang.code}
            onClick={() => setLanguage(lang.code)}
            className={`language-toggle__option ${currentLanguage === lang.code ? "language-toggle__option--active" : ""}`}
            aria-label={`Cambiar a ${lang.name}`}
          >
            {lang.name}
          </button>
        ))}
      </div>
    );
  }

  // Default: icon variant
  return (
    <button
      onClick={handleToggle}
      className={`language-toggle language-toggle--icon ${className}`}
      aria-label="Cambiar idioma"
      title={
        currentLanguage === "es" ? "Switch to English" : "Cambiar a Español"
      }
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="20"
        height="20"
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        strokeWidth="2"
        strokeLinecap="round"
        strokeLinejoin="round"
        className="language-toggle__icon"
      >
        <circle cx="12" cy="12" r="10" />
        <path d="M2 12h20" />
        <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z" />
      </svg>
      <span className="language-toggle__code">
        {currentLanguage.toUpperCase()}
      </span>
    </button>
  );
}

export default LanguageToggle;
