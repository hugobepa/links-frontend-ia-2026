import { loadAllCategories } from "@/lib/loaders";

export async function GET({ request }) {
  const origin = new URL(request.url).origin;
  const categories = await loadAllCategories();

  const routes = [
    "/",
    "/buscador",
    "/categories",
    "/en",
    "/en/buscador",
    "/en/categories",
    ...categories.flatMap((category) => [
      `/categories/${category.slug}`,
      `/en/categories/${category.slug}`,
    ]),
  ];

  const xml = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${routes.map((route) => `  <url><loc>${origin}${route}</loc></url>`).join("\n")}
</urlset>`;

  return new Response(xml, {
    headers: {
      "Content-Type": "application/xml; charset=utf-8",
    },
  });
}
