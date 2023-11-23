<script lang="ts">
	import DocTitle from '$lib/components/DocTitle.svelte';
	import Nav from '$lib/components/Nav.svelte';
	import VerticalSpacer from '$lib/components/VerticalSpacer.svelte';
	import './typography.css';
	import './prism.css';
	import './prism-one-dark-theme.css';

	export let title;
	export let date;

	const formatDate = (dateString) =>
		new Date(dateString).toLocaleDateString('en-us', {
			year: 'numeric',
			month: 'short',
			day: 'numeric',
		});
</script>

<DocTitle pageTitle={title} />
<main>
	<div class="page-wrap">
		<VerticalSpacer size={7} />
		<Nav>
			<a href="/blog">Blog</a>
		</Nav>
		<VerticalSpacer size={10} />
		<p class="date">{formatDate(date)}</p>
		<h1 class="post-title">{title}</h1>
		<VerticalSpacer size={4} />
		<div class="prose">
			<slot />
		</div>
		<VerticalSpacer size={10} />
	</div>
</main>

<style>
	main {
		border-top: 6px solid var(--hot-pink);
		overflow-wrap: break-word;
	}
	.page-wrap {
		width: min(100% - 2rem, 40rem);
		margin-inline: auto;
	}
	.date {
		font-size: var(--font-size-1);
		font-weight: var(--font-weight-6);
		color: var(--gray-6);
	}
	.post-title {
		font-size: var(--font-size-5);
	}
	@media (min-width: 480px) {
		.post-title {
			font-size: var(--font-size-6);
		}
	}
	@media (min-width: 768px) {
		.post-title {
			font-size: var(--font-size-8);
		}
	}
	:global(pre[class*='language-']) {
		font-size: var(--font-size-1);
	}
	/* Make long inline code elements wrap to the next line */
	:global(:where(:not(pre) > code, kbd)) {
		white-space: normal !important;
	}
	/* Override border radius from Prism.js theme for code blocks */
	:global(pre[class*='language-']) {
		border-radius: var(--radius-3);
	}
	:global(pre[class*='language-']) {
		min-width: 100%;
	}
</style>
