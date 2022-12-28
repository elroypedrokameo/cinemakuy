<template>
  <div class="container-main">
    <Navbar :searchMovie="searchMovie" />
    <div class="content">
      <Sidebar />
      <slot></slot>
    </div>
  </div>
</template>

<script>
import Navbar from "../Navbar.vue"
import Sidebar from "../Sidebar.vue"
export default {
  components: {
    Navbar,
    Sidebar
  },
  props: ["searchMovie"]
}
</script>

<style scoped>
.container-main {
  display: flex;
  flex-direction: column;
}
.content {
  display: flex;
}
</style>