<script lang="ts">
  import "reveal.js/dist/reveal.css";

  import { Route, Router } from "svelte-routing";
  import Home from "./Home.svelte";
  import type { PresentationCardSchema } from "./lib/types.js";
  import Presentation from "./Presentation.svelte";
  import Demo from "./presentations/Demo.svelte";
  import KubernetesIntro from "./presentations/KubernetesIntro.svelte";
  import Bingraph from "./presentations/Bingraph.svelte";
  import MastersThesis from "./presentations/MastersThesis.svelte";
  import WebScaleGraphMining from "./presentations/WebScaleGraphMining.svelte";

  const presentations: Array<PresentationCardSchema> = new Array(
    // {
    //   title: "Demo",
    //   path: "demo",
    //   component: Demo,
    // },
    {
      title: "Introduction to Kubernetes",
      path: "k8s_intro",
      component: KubernetesIntro,
    },
    {
      title: "Web Scale Graph Mining",
      path: "ns_paper",
      component: WebScaleGraphMining,
    },
    {
      title: "Bingraph: Exploring system binary networks",
      path: "bingraph",
      component: Bingraph,
    }
    // {
    //   title: "Master's Thesis",
    //   path: "thesis/masters",
    //   component: MastersThesis,
    // }
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
