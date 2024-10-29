<script lang="ts">
  export let trim: boolean = false;
  export let noescape: boolean = false;
  export let lineNumbers: boolean = true;
  export let lineStartFrom: number = 1;
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
