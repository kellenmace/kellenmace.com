<script lang="ts">
	import 'open-props/style';
	import 'open-props/normalize.dark.min.css';
	import 'open-props/buttons';
</script>

<slot />

<style>
	:root {
		--hot-pink: #ff269e;
		--brand: var(--hot-pink);
		--link: var(--hot-pink);
		--link-visited: var(--hot-pink);
		--size-header-1: none;
		--size-header-2: none;
		--size-header-3: none;
	}
	:global(p) {
		max-inline-size: none;
	}
	:global(a) {
		text-decoration: underline;
	}
	:global(a[href]) {
		text-decoration-color: var(--hot-pink);
	}
	@font-face {
		font-family: 'lazer84';
		src: url('/fonts/lazer84.woff2') format('woff2'), url('/fonts/lazer84.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
</style>
