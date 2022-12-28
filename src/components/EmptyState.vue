<template>
  <div class="container">
    <p>Film {{ movieTitle }} tidak ditemukan. Silahkan cari film seru lainnya</p>
  </div>
</template>

<script>
export default {
  props: {
    movieTitle: {
      type: String,
      default: "",
    }
  }
}
</script>

<style scoped>
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 287px;
  height: 404px;
  border-radius: 10px;
  border: 1px solid #C0222E;
  color: white;
  padding: 10px;
}
</style>