<script lang="ts">
  export let trim: boolean;
  export let noescape: boolean;
  export let lineNumbers: boolean;
  export let lineStartFrom: number;
</script>

<pre>
    <code
    data-trim={trim}
    data-noescape={noescape}
    data-line-numbers={lineNumbers}
    data-ln-start-from={lineStartFrom}>
        <slot />
    </code>
</pre>

<style>
</style>
