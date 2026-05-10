// filepath: src/i18n/index.ts
import { atom, computed } from "nanostores";
import enTranslations from "./en.json";
import esTranslations from "./es.json";

export type Language = "es" | "en";

export type Translations = typeof esTranslations;

// Available translations
const translations: Record<Language, Translations> = {
  es: esTranslations,
  en: enTranslations,
};

// Storage key for persistence
const STORAGE_KEY = "links-frontend-ia-language";

// Get initial language from localStorage or browser
function getInitialLanguage(): Language {
  if (typeof window === "undefined") return "es";

  try {
    const stored = localStorage.getItem(STORAGE_KEY);
    if (stored === "es" || stored === "en") {
      return stored;
    }

    // Check browser language
    const browserLang = navigator.language?.toLowerCase() || "";
    if (browserLang.startsWith("en")) {
      return "en";
    }
  } catch {
    // localStorage not available
  }

  return "es";
}

// Language store
export const $language = atom<Language>(getInitialLanguage());

// Computed translations based on current language
export const $t = computed($language, (lang) => translations[lang]);

// Helper function to get nested translation value (client-side, uses store)
export function getTranslation(
  path: string,
  params?: Record<string, string | number>,
): string {
  const lang = $language.get();
  return getTranslationForLang(path, lang, params);
}

// Helper function to get nested translation value for a specific language (SSR-friendly)
export function getTranslationForLang(
  path: string,
  lang: Language,
  params?: Record<string, string | number>,
): string {
  const keys = path.split(".");
  let value: unknown = translations[lang];

  for (const key of keys) {
    if (value && typeof value === "object" && key in value) {
      value = (value as Record<string, unknown>)[key];
    } else {
      return path; // Return path if translation not found
    }
  }

  if (typeof value !== "string") {
    return path;
  }

  // Replace parameters
  if (params) {
    return value.replace(/\{(\w+)\}/g, (_, key) =>
      String(params[key] ?? `{${key}}`),
    );
  }

  return value;
}

// Set language and persist
export function setLanguage(lang: Language): void {
  $language.set(lang);

  if (typeof window !== "undefined") {
    try {
      localStorage.setItem(STORAGE_KEY, lang);
    } catch {
      // localStorage not available
    }
  }
}

// Toggle between languages
export function toggleLanguage(): void {
  const current = $language.get();
  setLanguage(current === "es" ? "en" : "es");
}

// Get current language
export function getLanguage(): Language {
  return $language.get();
}

// Get translations for SSR
export function getTranslations(lang: Language): Translations {
  return translations[lang];
}

// Available languages
export const availableLanguages: { code: Language; name: string }[] = [
  { code: "es", name: "Español" },
  { code: "en", name: "English" },
];
