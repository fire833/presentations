<script lang="ts">
  import PresentationCard from "./lib/PresentationCard.svelte";
  import type { PresentationCardSchema } from "./lib/types.js";

  export let presentations: Array<PresentationCardSchema> = Array();
</script>

<h1 class="title">Welcome to Kendall's Presentations</h1>

<div class="cards">
  {#each presentations as presentation}
    <PresentationCard schema={presentation} />
  {/each}
</div>

<style>
  .title {
    margin: 7.5vh;
  }

  .cards {
    display: flex;
    max-width: 70vw;
  }
</style>
