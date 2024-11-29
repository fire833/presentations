<script lang="ts">
  import Slide from "../lib/components/Slide.svelte";
</script>

<Slide>
  <h2>Bingraph: Exploring system binary networks</h2>
  <h5>Kendall Tauser</h5>
</Slide>

<Slide>
  <h2>System binary networks</h2>

  <ul class="lists">
    <li>Systems have binaries, i.e. programs.</li>
    <li>
      Systems have libraries, which are depended upon by programs and other
      libraries.
    </li>
    <li>
      No good tool to view the relations between all system ELF objects. (all
      system programs and libraries)
    </li>
  </ul>
</Slide>

<Slide>
  <h2>Introducing Bingraph</h2>

  <ul class="lists">
    <li>
      Scans a system's binary and library "paths" (and defaults to scanning
      directories in the user's PATH)
    </li>
    <li>
      Generates a directed graph of the system's binaries, and libraries, along
      with computing various statistics.
    </li>
    <li>
      Outputs a JSON document for further downstream processing, as well as
      serializes to graphviz DOT language, for compiling cool graph
      visualizations.
    </li>
  </ul>
</Slide>

<Slide>
  <h2>Computed statistics</h2>

  <ul>
    <li>
      Decided knowing "most important" libraries is important, so focused on
      centralities.
    </li>
    <li>Compute Betweenness, Katz, Eigenvector, and Closeness centralities.</li>
    <li>
      Originally wanted to compute diameter, but this caused issues with really
      large graphs.
    </li>
    <li>Switched to visualizing degree distributions of the networks.</li>
  </ul>
</Slide>

<Slide>
  <h2>Demos</h2>
</Slide>

<Slide>
  <h2>Results</h2>
</Slide>

<Slide>
  <a href="https://static.tauser.us/bingraph/debian12real.svg"
    >Real world Debian system</a
  >
</Slide>

<Slide>
  <a href="https://static.tauser.us/bingraph/amazonlinux2023.svg"
    >Amazon Linux 2023 Container</a
  >
</Slide>

<Slide>
  <a href="https://static.tauser.us/bingraph/debianbookworm.svg"
    >Debian Bookworm Container</a
  >
</Slide>

<Slide>
  <a href="https://static.tauser.us/bingraph/ubuntu2410.svg"
    >Ubuntu 24.04 Container</a
  >
</Slide>

<style>
  .lists {
    font-size: 30px;
  }
</style>
