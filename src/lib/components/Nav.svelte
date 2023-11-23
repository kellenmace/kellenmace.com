<nav>
	<a href="/">Kellen Mace</a>
	<p>/</p>
	<slot />
</nav>

<style>
	nav {
		display: flex;
		gap: var(--size-2);
		background: var(--gray-8);
		padding: var(--size-3) var(--size-4);
		border-radius: var(--radius-3);
	}
	nav :global(a),
	nav :global(p) {
		font-size: var(--font-size-4);
		font-weight: var(--font-weight-6);
	}
	nav :global(p) {
		color: var(--gray-6);
	}
</style>
