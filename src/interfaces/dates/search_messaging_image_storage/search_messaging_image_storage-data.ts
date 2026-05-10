export const search_messaging_image_storage_categories = ["file-storage","image-video","messaging","search"] as const;
export const search_messaging_image_storage_subcategories = ["cdn","cloud-storage","engines","file-transfer","realtime","services","video-hosting"] as const;
export const search_messaging_image_storage_tags = ["ai","aws","backup","blockchain","cdn","cli","cloud","communication","compatible","decentralized","elastic","elasticsearch","encrypted","events","fast","file","firebase","freemium","global","google","hosted","hosting","image","infrastructure","instant","ipfs","managed","media","messaging","mobile","no-egress","nodejs","notifications","omnichannel","open-source","optimization","p2p","performance","privacy","processing","pubsub","push","queue","rabbitmq","realtime","resumable","rust","s3","saas","search","secure","self-hosted","sharing","sms","storage","streaming","temporary","terminal","transfer","transformation","ui","upload","verification","video","video-hosting","voice","websockets","whatsapp"] as const;
export const search_messaging_image_storage_pricing = ['free', 'freemium', 'premium'] as const;
export const search_messaging_image_storage_status = ['active', 'warning', 'deprecated'] as const;
export const search_messaging_image_storage_languages = ["en","es"] as const;

export type CategoryKey = 'file-storage' | 'image-video' | 'messaging' | 'search';
export type SubcategoryKey = 'cdn' | 'cloud-storage' | 'engines' | 'file-transfer' | 'realtime' | 'services' | 'video-hosting';
export type TagKey = 'ai' | 'aws' | 'backup' | 'blockchain' | 'cdn' | 'cli' | 'cloud' | 'communication' | 'compatible' | 'decentralized' | 'elastic' | 'elasticsearch' | 'encrypted' | 'events' | 'fast' | 'file' | 'firebase' | 'freemium' | 'global' | 'google' | 'hosted' | 'hosting' | 'image' | 'infrastructure' | 'instant' | 'ipfs' | 'managed' | 'media' | 'messaging' | 'mobile' | 'no-egress' | 'nodejs' | 'notifications' | 'omnichannel' | 'open-source' | 'optimization' | 'p2p' | 'performance' | 'privacy' | 'processing' | 'pubsub' | 'push' | 'queue' | 'rabbitmq' | 'realtime' | 'resumable' | 'rust' | 's3' | 'saas' | 'search' | 'secure' | 'self-hosted' | 'sharing' | 'sms' | 'storage' | 'streaming' | 'temporary' | 'terminal' | 'transfer' | 'transformation' | 'ui' | 'upload' | 'verification' | 'video' | 'video-hosting' | 'voice' | 'websockets' | 'whatsapp';
export type Pricing = 'free' | 'freemium' | 'premium';
export type Status = 'active' | 'warning' | 'deprecated';
export type Language = 'en' | 'es';
export type SearchFieldKey = 'name' | 'description' | 'tags' | 'category' | 'subcategory';
