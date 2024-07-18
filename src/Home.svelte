<script lang="ts">
  import PresentationCard from "./PresentationCard.svelte";
  import type { PresentationCardSchema } from "./lib/types.js";

  export let presentations: Array<PresentationCardSchema> = Array();
</script>

<div class="outer">
  <h1 class="title">Welcome to Kendall's Presentations</h1>

  <div class="cards">
    {#each presentations as presentation}
      <PresentationCard schema={presentation} />
    {/each}
  </div>
</div>

<style>
  .outer {
    display: block;
  }

  .title {
    margin: 7.5vh;
  }

  .cards {
    display: flex;
    max-width: 70vw;
    flex-wrap: wrap;
  }
</style>
