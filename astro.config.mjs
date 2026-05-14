import tailwindcss from "@tailwindcss/vite";
import { defineConfig } from "astro/config";

import react from "@astrojs/react";

export default defineConfig({
  site: "https://hugobepa.github.io",
  base: "/links-frontend-ia-2026",
  output: "static",
  trailingSlash: "always",
  integrations: [react()],
  vite: { plugins: [tailwindcss()] },
});
