<script lang="ts">
	import DocTitle from '$lib/components/DocTitle.svelte';
	import Sparkles from '$lib/components/Sparkles.svelte';
	import VerticalSpacer from '$lib/components/VerticalSpacer.svelte';
</script>

<DocTitle pageTitle="" />
<main>
	<Sparkles />
	<section class="hero">
		<h1 class="hero-heading">Kellen Mace</h1>
		<p class="tagline">Web dev, musician & indie hacker</p>
	</section>
	<VerticalSpacer size={8} />
	<section class="bio">
		<p>
			Hi! I'm Kellen, founder of <a href="https://videomentions.com/">VideoMentions</a>, Engineering
			Manager at <a href="https://wpengine.com/">WP Engine</a>, and musician.
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
	<VerticalSpacer size={8} />
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
		/* width: min-content; */
		/* inline-size: min-content; */
		/* animation: var(--animation-scale-up) forwards, var(--animation-fade-in-bloom) forwards; */
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
		max-width: 600px;
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
		font-size: var(--font-size-3);
		color: var(--gray-10);
		font-weight: var(--font-weight-7);
	}
	@media (min-width: 480px) {
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
		width: min(100% - 2rem, 40rem);
		margin-inline: auto;
	}
	@media (min-width: 480px) {
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
</style>
