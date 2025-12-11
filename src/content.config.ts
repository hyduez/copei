import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const articles = defineCollection({
  loader: glob({ base: './src/content/articles', pattern: '**/*.{md,mdx}' }),
  schema: ({ image }) =>
    z.object({
      title: z.string(),
      description: z.string(),
      category: z.string().optional(),
      pubDate: z.coerce.date(),
      updatedDate: z.coerce.date().optional(),
      image: image().optional(),
      time: z.string().optional(),
      servings: z.number().optional(),
      difficulty: z.string().optional(),
      calories: z.number().optional(),
      tags: z.array(z.string()).optional(),
    }),
});

export const collections = { articles };
