<script lang="ts">
  import { navigate } from "svelte-routing";
  import { PresentationCardSchema } from "./types.js";

  export let schema: PresentationCardSchema;
</script>

<button class="card-head" on:click={(e) => navigate(schema.path)}>
  <h2>{schema.title}</h2>
</button>

<style>
</style>
