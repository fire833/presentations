<script lang="ts">
  import { navigate } from "svelte-routing";
  import type { PresentationCardSchema } from "./lib/types.js";

  export let schema: PresentationCardSchema;
</script>

<button
  class="card-head"
  style="background-image: none"
  on:click={(e) => navigate(`/p/${schema.path}`)}
>
  <h2>{schema.title}</h2>
</button>

<style>
  .card-head {
    width: 9rem;
    height: 9rem;
    margin: 0.3rem;
    font-size: small;
  }
</style>
