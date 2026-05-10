import { loadSeoDiscoveryIndex } from "@/lib/loaders";

export async function GET({ request }) {
  const origin = new URL(request.url).origin;
  const discoveryIndex = await loadSeoDiscoveryIndex();

  const body = [
    "# Links Frontend IA",
    "",
    "Curated programming links focused on frontend, web applications, and modern development.",
    "",
    `Base URL: ${origin}`,
    "",
    "Primary routes:",
    "- /",
    "- /buscador",
    "- /categories",
    "- /en",
    "- /en/buscador",
    "- /en/categories",
    "",
    "Categories:",
    ...discoveryIndex.categories.map((name) => `- ${name}`),
    "",
    "Category slugs:",
    ...discoveryIndex.categorySlugs.map((slug) => `- ${slug}`),
    "",
    "Unique tags:",
    ...discoveryIndex.tags.map((tag) => `- ${tag}`),
    "",
    "Search index terms:",
    ...discoveryIndex.searchIndex.map((term) => `- ${term}`),
  ];

  return new Response(body.join("\n"), {
    headers: {
      "Content-Type": "text/plain; charset=utf-8",
    },
  });
}
