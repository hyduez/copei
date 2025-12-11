// @ts-check

import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';
import icon from 'astro-icon';
import tailwindcss from '@tailwindcss/vite';
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  site: 'https://copei-edu.vercel.app',
  integrations: [mdx(), sitemap(), icon()],
  vite: {
    // @ts-expect-error
    plugins: [tailwindcss()],
  },
});
