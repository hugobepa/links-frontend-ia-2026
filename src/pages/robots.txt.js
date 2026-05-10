import { loadAllCategories } from "@/lib/loaders";

export async function GET({ request }) {
  const origin = new URL(request.url).origin;
  const categories = await loadAllCategories();

  const lines = [
    "User-agent: *",
    "Allow: /",
    `Sitemap: ${origin}/sitemap-index.xml`,
    "",
    `# Categories: ${categories.length}`,
  ];

  return new Response(lines.join("\n"), {
    headers: {
      "Content-Type": "text/plain; charset=utf-8",
    },
  });
}
