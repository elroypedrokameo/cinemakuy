<template>
  <div class="container">
    <div class="navbar-brand">
      <RouterLink to="/">
        <img src="../assets/brand.svg" alt="logo">
      </RouterLink>
      <div class="container-search">
        <input
          :value="modelValue"
          @input="$emit('update:modelValue', $event.target.value)"
          placeholder="Search Title / Theatre Here"
          class="search"
          type="text"
        />
      </div>
    </div>
    <div class="brand-support">
      <img src="../assets/imax.svg" alt="">
      <img src="../assets/dolby.svg" alt="">
    </div>
  </div>
</template>

<script>
export default {
  props: ['modelValue'],
  emits: ['update:modelValue']
}
</script>

<style scoped>
.container {
  display: flex;
  justify-content: space-between;
  background-color:#C0222E;
  padding: 20px 20px 20px 50px;
}
.navbar-brand {
  display: flex;
  align-items: center;
}

.search {
  width: 350px;
  height: 30px;
  border-radius: 10px;
  border: none;
  padding: 20px 10px;
  margin: 0 0 0 100px;
  outline: none;
}
.brand-support {
  display: flex;
  align-items: center;
  gap: 10px;
}
</style>