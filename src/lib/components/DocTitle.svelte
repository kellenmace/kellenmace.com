<script lang="ts">
	export let pageTitle;

	let docTitle = pageTitle ? `${pageTitle} | Kellen Mace` : 'Kellen Mace';
</script>

<svelte:head>
	<title>{docTitle}</title>
</svelte:head>
