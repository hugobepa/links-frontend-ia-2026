import type { CategoryKey, Pricing, Status, SubcategoryKey, TagKey } from './dns_seguridad_educacion-data';

export interface SearchableResourceRef {
  id: string;
  slug: string;
  name: string;
  category: CategoryKey;
  subcategory: SubcategoryKey;
  tags: TagKey[];
}

export interface SearchFilterState {
  query: string;
  categories: CategoryKey[];
  subcategories: SubcategoryKey[];
  tags: TagKey[];
  pricing: Pricing[];
  status: Status[];
  verified: boolean | null;
  noCreditCard: boolean | null;
}

export interface LinkNameEntry {
  name: string;
  slug: string;
}
