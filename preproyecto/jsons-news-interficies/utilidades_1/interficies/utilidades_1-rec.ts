import type { CategoryKey, Language, Pricing, SearchFieldKey, Status, SubcategoryKey, TagKey } from './utilidades_1-data';

export interface ResourceItem {
  id: string;
  name: string;
  slug: string;
  description: string;
  url: string;
  status: Status;
  tags: TagKey[];
  searchIndex: string[];
  category: CategoryKey;
  subcategory: SubcategoryKey;
  pricing: Pricing;
  languages: Language[];
  limits: string;
  added: string;
  verified: boolean;
  noCreditCard: boolean;
}

export interface CategoryItem {
  id: CategoryKey;
  name: string;
  slug: string;
  resourceCount: number;
  status: Status;
}

export interface SubcategoryItem {
  id: SubcategoryKey;
  name: string;
  slug: string;
  category: CategoryKey;
  resourceCount: number;
  status: Status;
}

export interface TagMeta {
  count: number;
  color: string;
  description: string;
}

export interface SearchIndexField {
  name: SearchFieldKey;
  weight: number;
  encode: 'forward';
  tokenize: 'forward';
}

export interface SearchIndexConfig {
  fields: SearchIndexField[];
  entries: Array<{ id: string; slug: string; terms: string[] }>;
}
