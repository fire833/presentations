<script lang="ts">
  import Reveal from "reveal.js";
  import "reveal.js/dist/reveal.css";
  import { onMount, SvelteComponent, tick } from "svelte";
  import { defaultRevealOptions } from "./lib/revealConfig.js";
  import type { PresentationCardSchema } from "./lib/types.js";
  import { navigate } from "svelte-routing";

  export let name: string;
  export let presentations: Array<PresentationCardSchema>;

  let found: boolean = false;
  let component: typeof SvelteComponent;

  console.log(`searching for and loading presentation ${name}`);
  for (let p of presentations) {
    if (p.path === name) {
      found = true;
      component = p.component;
      break;
    }
  }

  if (!found) {
    navigate("/");
  }

  onMount(async () => {
    await tick();
    const deck = new Reveal(defaultRevealOptions);
    deck.initialize();
  });
</script>

<div class="reveal">
  <div class="slides">
    {component}
  </div>
</div>
