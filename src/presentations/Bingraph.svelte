<script lang="ts">
  import Image from "../lib/components/Image.svelte";
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

  <ul class="lists">
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
  <video controls={true}>
    <track kind="captions" />
    <source src="https://static.tauser.us/bingraph/demo.mp4" type="video/mp4" />
    Your browser does not support the video tag
  </video>
</Slide>

<Slide>
  <h2>Results</h2>
</Slide>

<Slide>
  <Image
    source={"https://static.tauser.us/bingraph/debian12real.svg"}
    description={"The bingraph for a real-world Debian 12 system."}
  ></Image>

  <a href="https://static.tauser.us/bingraph/debian12real.svg">Link</a>
</Slide>

<Slide>
  <Image
    source={"https://static.tauser.us/bingraph/debian12.jpeg"}
    description={"Degree Distribution for Real-world Debian system"}
  ></Image>
</Slide>

<Slide>
  <Image
    source={"https://static.tauser.us/bingraph/amazonlinux2023.svg"}
    description={"The bingraph for an Amazon Linux 2023 Container Image."}
  ></Image>
  <a href="https://static.tauser.us/bingraph/amazonlinux2023.svg">Link</a>
</Slide>

<Slide>
  <Image
    source={"https://static.tauser.us/bingraph/amazonlinux2023.jpeg"}
    description={"Degree Distribution for Amazon Linux 2023 Image"}
  ></Image>
</Slide>

<Slide>
  <Image
    source={"https://static.tauser.us/bingraph/gpel.svg"}
    description={"The bingraph for a CS GPEL Machine (Ubuntu 24.04)."}
  ></Image>
  <a href="https://static.tauser.us/bingraph/gpel.svg">Link</a>
</Slide>

<Slide>
  <Image
    source={"https://static.tauser.us/bingraph/gpel.jpeg"}
    description={"Degree Distribution for CS GPEL Machine"}
  ></Image>
</Slide>

<Slide>
  <Image
    source={"https://static.tauser.us/bingraph/arch.svg"}
    description={"The bingraph for an Arch Linux Container Image."}
  ></Image>
  <a href="https://static.tauser.us/bingraph/arch.svg">Link</a>
</Slide>

<Slide>
  <Image
    source={"https://static.tauser.us/bingraph/arch.jpeg"}
    description={"Degree Distribution for Arch Container Image"}
  ></Image>
</Slide>

<Slide>
  <Image
    source={"https://static.tauser.us/bingraph/debianbookworm.svg"}
    description={"The bingraph for a Debian Bookworm (12) Container Image."}
  ></Image>
  <a href="https://static.tauser.us/bingraph/debianbookworm.svg">Link</a>
</Slide>

<Slide>
  <Image
    source={"https://static.tauser.us/bingraph/debianbookworm.jpeg"}
    description={"Degree Distribution for Debian Bookworm Image"}
  ></Image>
</Slide>

<!-- <Slide>
  <a href="https://static.tauser.us/bingraph/ubuntu2410.svg"
    >Ubuntu 24.04 Container</a
  >
</Slide> -->

<style>
  .lists {
    font-size: 30px;
  }
</style>
