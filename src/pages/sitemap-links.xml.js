import { loadSeoDiscoveryIndex } from "@/lib/loaders";

export async function GET({ request }) {
  const origin = new URL(request.url).origin;
  const discoveryIndex = await loadSeoDiscoveryIndex();

  const categoryRoutes = discoveryIndex.categorySlugs.flatMap((category) => [
    `/categories/${category}`,
    `/en/categories/${category}`,
  ]);

  const xml = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${categoryRoutes
  .map((route) => `  <url><loc>${origin}${route}</loc></url>`)
  .join("\n")}
</urlset>`;

  return new Response(xml, {
    headers: {
      "Content-Type": "application/xml; charset=utf-8",
    },
  });
}
