import react from "@astrojs/react";
import starlight from "@astrojs/starlight";
import tailwindcss from "@tailwindcss/vite";
import { defineConfig } from "astro/config";

export default defineConfig({
  site: "https://hugobepa.github.io",
  base: "/links-frontend-ia-2026",
  output: "static",
  trailingSlash: "always",
  integrations: [starlight({ title: "links-frontend-ia-2026" }), react()],
  vite: { plugins: [tailwindcss()] },
});
