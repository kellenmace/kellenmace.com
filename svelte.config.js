import adapter from '@sveltejs/adapter-auto';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';
import { code_highlighter, mdsvex } from 'mdsvex';

const highlightCode = async (code, lang) => {
	const highlighted = await code_highlighter(code, lang);

	return highlighted.replace(/\\/g, '\\\\');
};

/** @type {import('@sveltejs/kit').Config} */
const config = {
	preprocess: [
		mdsvex({
			extensions: ['.md', '.svx'],
			layout: './src/routes/blog/Layout.svelte',
			highlight: { highlighter: highlightCode },
		}),
		vitePreprocess(),
	],
	extensions: ['.svelte', '.md', '.svx'],
	kit: {
		adapter: adapter(),
	},
};

export default config;
