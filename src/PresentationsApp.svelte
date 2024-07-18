<script lang="ts">
  import { Route, Router } from "svelte-routing";
  import Demo from "./presentations/Demo.svelte";
  import Home from "./Home.svelte";
  import type { PresentationCardSchema } from "./lib/types.js";
  import Presentation from "./Presentation.svelte";

  const presentations: Array<PresentationCardSchema> = new Array(
    {
      title: "Demo",
      path: "demo",
      component: Demo,
    },
    {
      title: "Demo2",
      path: "demo2",
      component: Demo,
    }
  );
</script>

<Router>
  <Route path="/*">
    <Home {presentations}></Home>
  </Route>
  <Route path="/p/:name" let:params>
    <Presentation name={params.name} {presentations} />
  </Route>
</Router>

<style>
</style>
