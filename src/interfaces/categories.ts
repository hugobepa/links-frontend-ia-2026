// Shared interfaces for the categorized links dataset

export interface Link {
  name: string;
  description: string;
  url: string;
  status: "active" | "inactive";
  pricing: "free" | "paid" | "freemium" | "custom" | "free-trial";
  languages: string[];
  tags: string[];
  searchIndex: string[];
  limits?: string;
  verified?: boolean;
  noCreditCard?: boolean;
}

export interface Subcategory {
  id: string;
  name: string;
  description?: string;
  links: Link[];
  order?: number;
}

export interface Category {
  id: string;
  name: string;
  description: string;
  slug: string;
  subcategories: Subcategory[];
  order?: number;
  icon?: string;
}

export interface SearchResult {
  link: Link;
  categoryId: string;
  subcategoryId: string;
  categoryName: string;
  subcategoryName: string;
  matchedField: "name" | "description";
}

export interface DataSource {
  categoryId: string;
  recordsFile: string;
  structureFile: string;
  lastUpdated?: string;
}

export type ViewportSize = "mobile" | "tablet" | "desktop";
export type PricingBadgeColor = "green" | "blue" | "orange" | "gray" | "purple";
