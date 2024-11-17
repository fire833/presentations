<script lang="ts">
  export let source: string = "";
  export let description: string = "Unkknown";
  export let addFooter: boolean = true;
</script>

<img src={source} alt={description} />
{#if addFooter}
  <h6>{description}</h6>
{/if}
