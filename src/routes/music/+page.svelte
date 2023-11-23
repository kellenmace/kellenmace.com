<script lang="ts">
	import DocTitle from '$lib/components/DocTitle.svelte';
	import Nav from '$lib/components/Nav.svelte';
	import VerticalSpacer from '$lib/components/VerticalSpacer.svelte';
</script>

<DocTitle pageTitle="Music" />
<main>
	<div class="page-wrap">
		<VerticalSpacer size={7} />
		<Nav>
			<p>Music</p>
		</Nav>
		<VerticalSpacer size={10} />
		<h1>Music</h1>
		<VerticalSpacer size={4} />
		<div class="songs">
			<div class="song">
				<h2 class="song-title">Harp Eternal</h2>
				<p>
					This track combines orchestral instruments and a hip hop drum loop. It was inspired by the
					nostalgic and evocative <a href="https://www.youtube.com/watch?v=dmkPQeKVR8U"
						>Phone Call</a
					>
					by Jon Brion, from the Eternal Sunshine of the Spotless Mind soundtrack– hence the name "Harp
					Eternal". All instruments were played by me on a MIDI keyboard, with the exception of the acoustic
					guitar, which I played live and mic'd. The bassline with lots of rests is inspired by some
					of Tim Commerford's playing, such as the basslines in the verses of Rage Against the Machine's
					<a href="https://www.youtube.com/watch?v=j_zyb-XXWz0">Testify</a>
					and <a href="https://www.youtube.com/watch?v=n6cBRx2Ie6A">Guerrilla Radio</a>. I wrote
					this song when I was in college, around the 2004-2007 time frame.
				</p>
				<audio controls src="/music/Kellen Mace - Harp Eternal.mp3" />
			</div>
			<div class="song">
				<h2 class="song-title">Streamline</h2>
				<p>
					I wrote this song when I was in high school. The high-gain synth lead lines are inspired
					by <a href="https://en.wikipedia.org/wiki/The_Prodigy">The Prodigy</a>, one of my favorite
					electronic music artists. The crash and trash splash cymbals in the track were recorded
					live, and all other instruments are MIDI-triggered. This song has several different drum
					beats throughout, which you could argue makes it inconsistent, but I think switching up
					the drum parts keeps things interesting.
				</p>
				<audio controls src="/music/Kellen Mace - Streamline.mp3" />
			</div>
			<div class="song">
				<h2 class="song-title">Classical Guitar</h2>
				<p>
					This song starts with me playing the intro to <a
						href="https://www.youtube.com/watch?v=9rDGc69FQcY">Solfeggio</a
					> by C.P.E Bach, then transitions to me playing a minor pentatonic solo over a Metallica chord
					progression, because why not? This song was recorded in my college dorm room with an acoustic
					guitar, a few takes, and a ton of digital reverb.
				</p>
				<audio controls src="/music/Kellen Mace - Classical Guitar.mp3" />
			</div>
			<div class="song">
				<h2 class="song-title">Imposter</h2>
				<p>
					This unfinished track was inspired by <a
						href="https://www.youtube.com/watch?v=ErQNRwH-Hmk">Testarossa Autodrive</a
					> by Kavinsky. Both tracks feature incessant, punch-in-the-face, four-on-the-floor kick drum
					hits. I really like some of the textures in this song, especially the line that sounds like
					a siren call. Maybe one day I'll dust this one off and finish it.
				</p>
				<audio controls src="/music/Kellen Mace - Imposter.m4a" />
			</div>
			<div class="song">
				<h2 class="song-title">Through the Air</h2>
				<p>
					This unfinished track was inspired by <a
						href="https://www.youtube.com/watch?v=1fv57ww-vJo">Moth's Wings</a
					> by Passion Pit. I wrote it around 2011/2012. It's a bit raw in its current form. The timing
					is off for the dreamlike descending lines played on the Fender Rhodes, but they sound so pretty,
					maybe you can excuse that :)
				</p>
				<audio controls src="/music/Kellen Mace - Through the Air.m4a" />
			</div>
		</div>
		<VerticalSpacer size={4} />
		<div class="copyright-notice">
			All songs © {new Date().getFullYear()} Kellen Mace
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
	.songs {
		display: grid;
		grid-gap: var(--size-6);
	}
	.song {
		display: flex;
		flex-direction: column;
		gap: var(--size-6);
		background: var(--gray-8);
		padding: var(--size-8);
		border-radius: var(--radius-3);
	}
	.song-title {
		/* font-family: 'lazer84'; */
		/* letter-spacing: 5px; */
		line-height: 3rem;
		font-size: var(--size-8);
		color: var(--hot-pink);
	}
	audio {
		width: 100%;
		box-shadow: var(--shadow-2);
		border-radius: var(--radius-round);
		box-shadow: 0px 0px 10px var(--hot-pink);
	}
	.copyright-notice {
		font-size: var(--font-size-1);
		text-align: center;
	}
</style>
