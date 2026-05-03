import starlight from "@astrojs/starlight";
import tailwindcss from "@tailwindcss/vite";
import { defineConfig } from "astro/config";

import react from "@astrojs/react";

export default defineConfig({
  integrations: [starlight({ title: "links-frontend-ia-2026" }), react()],
  vite: { plugins: [tailwindcss()] },
});