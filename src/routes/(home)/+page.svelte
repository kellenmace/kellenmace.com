<script lang="ts">
	import DocTitle from '$lib/components/DocTitle.svelte';
	import Sparkles from '$lib/components/Sparkles.svelte';
	import VerticalSpacer from '$lib/components/VerticalSpacer.svelte';
</script>

<DocTitle pageTitle="" />
<svelte:head>
	<meta
		name="description"
		content="Kellen Mace is a web developer, musician, and entrepreneur. Explore my projects, blog, and music."
	/>
	<meta
		property="og:description"
		content="Kellen Mace is a web developer, musician, and entrepreneur. Explore my projects, blog, and music."
	/>
</svelte:head>
<main>
	<Sparkles />
	<section class="hero">
		<h1 class="hero-heading">Kellen Mace</h1>
		<p class="tagline">Web developer & musician</p>
	</section>
	<VerticalSpacer size={8} />
	<section class="bio">
		<p>
			Hi! I'm Kellen, web developer, musician, and engineering manager at <a
				href="https://wpengine.com/">WP Engine</a
			>.
		</p>
		<picture>
			<source type="image/avif" srcset="/kellen-profile.avif" />
			<img src="/kellen-profile.webp" alt="kellen mace profile" height="219" width="219" />
		</picture>
	</section>
	<VerticalSpacer size={8} />
	<section class="link-cards">
		<div class="link-card">
			<p>Read the</p>
			<a href="/blog">Blog</a>
		</div>
		<div class="link-card">
			<p>Check out my</p>
			<a href="/music">Music</a>
		</div>
	</section>
	<VerticalSpacer size={12} />
	<footer>
		<a href="https://github.com/kellenmace" aria-label="GitHub">
			<svg viewBox="0 0 24 24" width="24" height="24" fill="currentColor">
				<path
					d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"
				/>
			</svg>
		</a>
		<a href="https://x.com/kellenmace" aria-label="X (Twitter)">
			<svg viewBox="0 0 24 24" width="24" height="24" fill="currentColor">
				<path
					d="M18.901 1.153h3.68l-8.04 9.19L24 22.846h-7.406l-5.8-7.584-6.638 7.584H.474l8.6-9.83L0 1.154h7.594l5.243 6.932ZM17.61 20.644h2.039L6.486 3.24H4.298Z"
				/>
			</svg>
		</a>
		<a href="https://www.linkedin.com/in/kellenmace/" aria-label="LinkedIn">
			<svg viewBox="0 0 24 24" width="24" height="24" fill="currentColor">
				<path
					d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"
				/>
			</svg>
		</a>
	</footer>
</main>

<style>
	.hero {
		display: grid;
		align-content: center;
		height: 700px;
	}
	.hero-heading {
		font-family: 'lazer84';
		text-align: center;
		font-size: var(--size-9);
		letter-spacing: 5px;
		animation-timing-function: var(--ease-elastic-in-out-3);
		animation-duration: 1s;
		max-inline-size: 100vw;
		background: -webkit-linear-gradient(var(--yellow-5), #ff4c7f, var(--hot-pink));
		background-clip: text;
		-webkit-background-clip: text;
		-webkit-text-fill-color: transparent;
	}
	@media (min-width: 768px) {
		.hero-heading {
			font-size: var(--size-11);
		}
	}
	.tagline {
		text-align: center;
		max-inline-size: 100vw;
		text-transform: uppercase;
		letter-spacing: 2px;
		font-weight: var(--font-weight-9);
		color: var(--hot-pink);
		font-style: italic;
		font-size: var(--font-size-1);
		width: min(100% - 2rem, 210px);
		margin-inline: auto;
	}
	@media (min-width: 490px) {
		.tagline {
			width: auto;
		}
	}
	@media (min-width: 768px) {
		.tagline {
			font-size: var(--font-size-4);
		}
	}
	.bio {
		background-image: none;
		position: relative;
		grid-column: 1 / -1;
		max-width: 700px;
		width: min(100% - 2rem, 40rem);
		margin-inline: auto;
		padding-inline: var(--size-fluid-4);
		padding-block: var(--size-8);
	}
	@media (min-width: 480px) {
		.bio {
			padding-block: var(--size-12);
		}
	}
	.bio:before {
		content: '';
		position: absolute;
		z-index: -1;
		inset-block: 1%;
		inset-inline: -15% 0;
		border-radius: var(--radius-blob-4);
		background-color: var(--hot-pink);
		margin-inline: auto;
	}
	.bio p,
	.bio a {
		font-size: var(--font-size-5);
		color: var(--gray-10);
		font-weight: var(--font-weight-7);
	}
	@media (min-width: 900px) {
		.bio p,
		.bio a {
			font-size: var(--font-size-6);
		}
	}
	.bio a {
		text-decoration: underline;
	}
	.bio img {
		position: absolute;
		border-radius: var(--radius-round);
		top: -36px;
		left: -4px;
		width: 80px;
	}
	@media (min-width: 480px) {
		.bio img {
			width: 140px;
		}
	}
	@media (min-width: 768px) {
		.bio img {
			top: 0;
			left: -50px;
		}
	}
	.link-cards {
		display: flex;
		flex-direction: column;
		gap: var(--size-6);
		padding-inline: var(--size-fluid-4);
		max-width: 700px;
		margin-inline: auto;
	}
	@media (min-width: 700px) {
		.link-cards {
			flex-direction: row;
		}
	}
	.link-card {
		flex: 1;
		border-radius: var(--radius-3);
		padding: var(--size-8);
		background: var(--surface-2);
		box-shadow: var(--shadow-2);
	}
	.link-card a {
		font-size: var(--font-size-7);
		font-weight: var(--font-weight-9);
	}
	footer {
		display: flex;
		justify-content: center;
		gap: var(--size-4);
		padding-bottom: var(--size-8);
	}
	footer a {
		color: var(--gray-6);
		transition: color 0.2s;
	}
	footer a:hover {
		color: var(--gray-7);
	}
</style>
