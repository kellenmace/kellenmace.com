<script lang="ts">
	let { size } = $props();

	const sizeMappings: Record<number, string> = {
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
	} as const;
</script>

<div style={`height: ${sizeMappings[size]};`} />
