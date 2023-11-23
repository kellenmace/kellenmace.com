import type { PageLoad } from './$types';

export const load: PageLoad = () => {
	const globData = import.meta.glob('./*/*.svx', { eager: true });
	const globDataEntries = Object.entries(globData);
	const posts = globDataEntries
		.map((globItem) => {
			return {
				slug: globItem[0].split('/')[1],
				metadata: globItem[1].metadata,
			};
		})
		.sort((a, b) => new Date(b.metadata.date) - new Date(a.metadata.date));

	return {
		posts,
	};
};
