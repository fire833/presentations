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
    <li>Disruption - Threat mitigated</li>
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

  <ul class="lists">
    <li>Alert nodes assigned 0.5 to prevent aggressive labeling.</li>
    <li>Disrupted alerts given a score of 1 (known malicious)</li>
    <li>Incident nodes get highest score from associated alerts.</li>
    <li>Organization nodes start at 0.5.</li>
    <li>Entities are scored by experts (this is not elaborated upon)</li>
  </ul>
</Slide>

<Slide>
  <h2>Reputation propagation</h2>

  <ul class="lists">
    <li>
      It is desirable for nodes that are associated with known malicious nodes
      to also be regarded as more likely malicious.
    </li>
    <li>
      Use a simple reputation propagation algorithm where the reputation of a
      node is essentially the average of it's neighbors.
    </li>
    <li>Iterate to convergence.</li>
  </ul>
</Slide>

<Slide>
  <h2>Temperature scaling</h2>

  <ul class="lists">
    <li>
      Generated logits from reputation propagation algorithm can be imprecise.
    </li>
    <li>
      Thus, the decision was made to soften the logits with a temperature
      parameter $T$ to "adjust the shaprness of predicted probabilities".
    </li>
    <li>
      Optimal $T$ is found by minimizing the negative log likelihood with a
      validation dataset.
    </li>
    <li>
      Temperature range optimized on is $T_{"{"}min{"}"} = 0.1$ to $T_{"{"}max{"}"}
      = 10$
    </li>
  </ul>
</Slide>

<Slide>
  <Image
    source={getLocalImage("lp_algorithm.jpeg")}
    description={"Label Propagation Algorithm"}
  ></Image>
</Slide>

<Slide>
  <h2>Experimental Results</h2>
</Slide>

<Slide>
  <Image
    source={getLocalImage("reputation_score_distribution.jpeg")}
    description={"Reputation distribution scores for raw values, propagated values, and calibrated values using NLL minimization of T"}
  ></Image>
</Slide>

<Slide>
  <Image
    source={getLocalImage("entity_confusion_matrix.jpeg")}
    description={"Confusion Matrix Heatmap of various entity types (Region 1)"}
  ></Image>
</Slide>

<Slide>
  <Image
    source={getLocalImage("entity_level_recall_curves.jpeg")}
    description={"Recall curves of various entity types (Region 1)"}
  ></Image>
</Slide>

<Slide>
  <h2>Impacts</h2>

  <ul class="lists">
    <li>Deployed worldwide, serving thousands of orgs in the field.</li>
    <li>
      Identifies millions of high-risk entities on a weekly basis, resulting in
      a 6x increase in non-file threat intelligence.
    </li>
    <li>21% increase in USOP incident disruption rate.</li>
    <li>Reduction in time to disrupt by 1.9x.</li>
  </ul>
</Slide>

<style>
  .lists {
    font-size: 30px;
  }
</style>
