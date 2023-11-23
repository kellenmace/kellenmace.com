<script lang="ts">
	import DocTitle from '$lib/components/DocTitle.svelte';
	import Nav from '$lib/components/Nav.svelte';
	import VerticalSpacer from '$lib/components/VerticalSpacer.svelte';
	import type { PageData } from './$types';

	export let data: PageData;

	const formatDate = (dateString) =>
		new Date(dateString).toLocaleDateString('en-us', {
			year: 'numeric',
			month: 'short',
			day: 'numeric',
		});
</script>

<DocTitle pageTitle="Blog" />
<main>
	<div class="page-wrap">
		<VerticalSpacer size={7} />
		<Nav>
			<p>Blog</p>
		</Nav>
		<VerticalSpacer size={10} />
		<h1>Blog</h1>
		<VerticalSpacer size={4} />
		<div class="posts-list-container">
			{#each data.posts as post}
				<div class="posts-list-item">
					<a href={`/blog/${post.slug}`}>{post.metadata.title}</a>
					<p>{formatDate(post.metadata.date)}</p>
				</div>
			{/each}
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
	.posts-list-container {
		display: grid;
		grid-gap: var(--size-7);
	}
	.posts-list-item a {
		text-decoration: none;
		font-size: 1.75rem;
		font-weight: var(--font-weight-5);
	}
	.posts-list-item p {
		font-size: var(--font-size-1);
		font-weight: var(--font-weight-6);
		color: var(--gray-6);
	}
</style>
