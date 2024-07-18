<script lang="ts">
  import "reveal.js/dist/reveal.css";

  import { Route, Router } from "svelte-routing";
  import Home from "./Home.svelte";
  import type { PresentationCardSchema } from "./lib/types.js";
  import Presentation from "./Presentation.svelte";
  import Demo from "./presentations/Demo.svelte";

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
