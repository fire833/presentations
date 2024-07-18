<script lang="ts">
  import Reveal from "reveal.js";
  import { defaultRevealOptions } from "../lib/revealConfig.js";

  console.log("loading demo presentation");
</script>

<div
  class="reveal"
  on:load={(e) =>
    Reveal.initialize(defaultRevealOptions).then((val) =>
      console.log("finished loading")
    )}
>
  <div class="slides">
    <section>
      <h1>Hello there</h1>
    </section>
    <section>Slide 2</section>
    <section>Slide 3</section>
    <section>Slide 4</section>
    <section>Slide 5</section>
  </div>
</div>
