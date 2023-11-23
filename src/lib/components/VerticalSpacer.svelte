<script lang="ts">
	export let size;

	const sizeMappings = {
		1: '.25rem',
		2: '.5rem',
		3: '1rem',
		4: '1.25rem',
		5: '1.5rem',
		6: '1.75rem',
		7: '2rem',
		8: '3rem',
		9: '4rem',
		10: '5rem',
		11: '7.5rem',
		12: '10rem',
		13: '15rem',
		14: '20rem',
		15: '30rem',
	};
</script>

<div style={`padding-top: ${sizeMappings[size]}`} />

<!-- <div class="spacer-vertical" /> -->

<!-- <style>
.spacer-vertical {
  padding-top: var(--size-8);
}
</style> -->
