import { clsx, type ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

export function normalizeTerm(value: string): string {
  return value.trim().toLowerCase();
}

export function uniqueTerms(
  values: Array<string | undefined | null>,
): string[] {
  return [
    ...new Set(
      values.filter(Boolean).map((value) => normalizeTerm(String(value))),
    ),
  ];
}

export function toAbsoluteUrl(origin: string, pathname: string): string {
  const normalizedPath = pathname.startsWith("/") ? pathname : `/${pathname}`;
  return `${origin.replace(/\/$/, "")}${normalizedPath}`;
}
