<script lang="ts">
  import { Route, Router } from "svelte-routing";
  import Demo from "./presentations/Demo.svelte";
  import Home from "./Home.svelte";
  import type { PresentationCardSchema } from "./lib/types.js";

  const presentations: Array<PresentationCardSchema> = new Array({
    title: "Demo",
    path: "demo",
    component: Demo,
  });
</script>

<Router>
  <Route path="/" let:params>
    <Home {presentations}></Home>
  </Route>
  {#each presentations as presentation}
    <Route
      path={`/presentations/${presentation.path}`}
      component={presentation.component}
    ></Route>
  {/each}
</Router>

<style>
</style>
