<script lang="ts">
  import Reveal from "reveal.js";
  import { onMount, SvelteComponent, tick } from "svelte";
  import { defaultRevealOptions } from "./lib/revealConfig.js";
  import type { PresentationCardSchema } from "./lib/types.js";
  import { navigate } from "svelte-routing";

  export let name: string;
  export let presentations: Array<PresentationCardSchema>;

  let found: boolean = false;
  let title: string;
  let component: typeof SvelteComponent;

  console.log(`searching for and loading presentation ${name}`);
  for (let p of presentations) {
    if (p.path === name) {
      found = true;
      title = p.title;
      component = p.component;
      break;
    }
  }

  if (!found) {
    console.error(`presentation ${name} not found, redirect home`);
    navigate("/");
  }

  onMount(async () => {
    await tick();
    console.log(
      `loading in ${name} presentation, creating new reveal context.`
    );
    const rev = new Reveal(defaultRevealOptions);
    await rev.initialize();
    console.log(`presentation ${name} loaded`);
  });
</script>

<svelte:head>
  <title>{title}</title>
</svelte:head>

<div class="reveal">
  <div class="slides">
    <svelte:component this={component} />
  </div>
</div>

<style></style>
