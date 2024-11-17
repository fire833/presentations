<script lang="ts">
  import Image from "../lib/components/Image.svelte";
  import Slide from "../lib/components/Slide.svelte";
</script>

<Slide>
  <h2>An Introduction to Kubernetes</h2>
  <h6>Kendall Tauser</h6>
</Slide>

<Slide>
  <Image
    source="https://kubernetes.io/images/docs/kubernetes-cluster-architecture.svg"
    addFooter={false}
  ></Image>
  <h6>
    Control plane can be comprised of many nodes, where every control plane
    application runs in parallel, etcd uses Raft for its consensus.
  </h6>
</Slide>

<Slide>
  <h6>
    Each node runs a CRI-compliant runtime (which can be docker) to spin up
    namespaced applications provided by kubelet.
  </h6>
  <ul class="lists">
    <li>Mount namespacing (i.e. isolated filesystem for the application)</li>
    <li>
      User namespacing (i.e. user ids the process runs under do not apply on the
      host)
    </li>
    <li>
      Process namespacing (i.e. the container cannot see other processes on the
      host)
    </li>
    <li>
      Network namespacing (i.e. each container has its own routing table,
      network interfaces it sees, etc.)
    </li>
    <li>
      And a few more that are not as significant. man(5) namespaces for more.
    </li>
  </ul>
</Slide>

<Slide>
  <h5>Key takeaways</h5>

  <ul class="lists">
    <li>Allows you to decouple your application from your infrastructure</li>
    <li>No centralized point of failure for your underlying infrastructure</li>
    <li>
      High availability of both your infrastructure components as well as your
      applications
    </li>
  </ul>
</Slide>

<Slide>
  <h5>
    Ok, what do the APIs look like? Well, there are a few key resources to get
    started.
  </h5>

  <ul class="lists">
    <li>
      Pod - Contains definition for a set of containers that are logically
      grouped together (can share some namespaces)
    </li>
    <li>
      Deployment - Contains definition of a pod, and the number of replicas to
      maintain of that replica within the cluster.
    </li>
    <li>
      Secrets / ConfigMaps - Contain data that can be mounted into the
      filesystem of a running container
    </li>
    <li>
      Services - Allow you to load-balance traffic between multiple pods, either
      from within the cluster or external to the cluster.
    </li>
  </ul>
</Slide>

<Slide>
  Demo time (Resources can be downloaded to tinker with or use yourself)

  <ul class="lists">
    <li>
      <a href="https://static.tauser.us/k8s_demo/grafana_config.yaml"
        >https://static.tauser.us/k8s_demo/grafana_config.yaml</a
      >
    </li>
    <li>
      <a href="https://static.tauser.us/k8s_demo/grafana_service.yaml"
        >https://static.tauser.us/k8s_demo/grafana_service.yaml</a
      >
    </li>
    <li>
      <a href="https://static.tauser.us/k8s_demo/grafana_deploy.yaml"
        >https://static.tauser.us/k8s_demo/grafana_deploy.yaml</a
      >
    </li>
  </ul>
</Slide>

<style>
  .lists {
    font-size: 30px;
  }
</style>
