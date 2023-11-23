<div class="container">
	<div class="content-wrap">
		{#each Array(2200) as _}
			<div class="sparkle" />
		{/each}
	</div>
</div>

<style>
	.container {
		position: absolute;
		border-top: 6px solid var(--hot-pink);
		padding-top: 6px;
		width: 100vw;
		height: 700px;
		overflow: hidden;
		z-index: -1;
	}
	.content-wrap {
		width: 100%;
		height: 100%;
		position: relative;
	}
	.content-wrap::after {
		content: '';
		position: absolute;
		bottom: 0;
		left: 0;
		right: 0;
		height: 200px;
		background: linear-gradient(transparent, var(--surface-1));
	}
	.sparkle {
		width: 3px;
		height: 3px;
		background-color: silver;
		float: left;
		transform: rotate(45deg);
	}
	.sparkle:nth-child(2n + 0) {
		animation: shine 1.2s linear infinite alternate;
		margin: 1.25em;
	}
	.sparkle:nth-child(2n + 1) {
		animation: shine 1.2s 0.6s linear infinite alternate;
	}
	@keyframes shine {
		50% {
			background-color: rebeccapurple;
		}
		100% {
			background-color: powderblue;
		}
	}
</style>
