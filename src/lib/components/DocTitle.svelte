<script lang="ts">
	let { pageTitle } = $props();

	let docTitle = $derived(pageTitle ? `${pageTitle} | Kellen Mace` : 'Kellen Mace');
</script>

<svelte:head>
	<title>{docTitle}</title>
	<meta property="og:title" content={docTitle} />
</svelte:head>
