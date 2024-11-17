<script lang="ts">
  import Image from "../lib/components/Image.svelte";
  import Slide from "../lib/components/Slide.svelte";

  function getLocalImage(name: string): string {
    return `/assets/ns_paper/${name}`;
  }
</script>

<Slide>
  <h2>Web Scale Graph Mining for Cyber Threat Intelligence</h2>
  <h5>arXiv:2411.06239v1</h5>
  <h5>Kendall Tauser</h5>
</Slide>

<Slide>
  <h3>Authors</h3>
  <ul class="lists">
    <li>Scott Freitas (Microsoft Security Research)</li>
    <li>Amir Gharib (Microsoft Security Research)</li>
  </ul>
</Slide>

<Slide>
  <h2>Key Terms</h2>

  <ul class="lists">
    <li>Alert - Potential security threat that was detected</li>
    <li>Detector - Security rule / ML model that generates alerts</li>
    <li>
      Entity - File, IP, URL, etc. that is evidence associated with an alert.
    </li>
    <li>Incident - Logical groupings of related alerts.</li>
    <li>
      Entity Reputation - Propability of an entity being benign or malicious
      (usually real-valued between 0 and 1).
    </li>
  </ul>
</Slide>

<Slide>
  <h2>What is TITAN?</h2>

  <ul class="lists">
    <li>Threat Intelligence Tracking via Adaptive Networks</li>
    <li>
      Models relationships between millions of different organizations,
      incidents, and entities.
    </li>
    <li>Automated pruning of outdated relationships/intel.</li>
    <li>
      Automated reputation propagation to find new threat actor infrastructure
      through a guilt-by-association framework.
    </li>
    <li>
      Initial reputation scores for graphs nodes bootstrapped via
      domain-specific security knowledge.
    </li>
  </ul>
</Slide>

<Slide>
  <Image
    source={getLocalImage("titan_arch.jpeg")}
    description={"Overview of TITAN architecture (from paper)"}
  ></Image>
</Slide>

<Slide>
  <h2>Edge weights and decay</h2>

  <ul class="lists">
    <li>
      Every edge represents a relationship in the graph, and has an associated
      weight representing it's strength.
    </li>
    <li>
      Like the real world, relationships decay over time as threat actors move
      on to new entities for conducting attacks
    </li>
    <li>
      Thus, edge weights decay given various time steps within the TITAN graph
      over time.
    </li>
    <li>Edges with very low significance weights (>0.01) are pruned.</li>
  </ul>
</Slide>

<Slide>
  <h2>What are the decay functions?</h2>

  <ul class="lists">
    <li>They are constant, linear, or exponential.</li>
    <li>
      Each edge depending on node types has a particular starting weight as
      well.
    </li>
    <li>
      Entities are supplied with weights that are tuned in production and are
      classified.
    </li>
  </ul>
</Slide>

<Slide>
  <Image
    source={getLocalImage("example_edges.jpeg")}
    description={"Examples of edges and their corresponding decay functions, and intial weights"}
  ></Image>
</Slide>

<Slide>
  <h2>Reputation bootstrapping</h2>
</Slide>

<Slide>
  <h2>Reputation propagation</h2>
</Slide>

<Slide>
  <Image
    source={getLocalImage("lp_algorithm.jpeg")}
    description={"Label Propagation Algorithm"}
  ></Image>
</Slide>

<style>
  .lists {
    font-size: 30px;
  }
</style>
