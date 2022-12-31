<template>
  <div class="container">
    <div class="navbar-brand">
      <RouterLink to="/">
        <img class="logo" src="../assets/brand.svg" alt="logo">
      </RouterLink>
      <img
        class="hamburger-menu"
        src="../assets/hamburger.png"
        alt=""
        @click="handleShowSidebar()"
      >
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
      <img class="imax" src="../assets/imax.svg" alt="">
      <img class="dolby" src="../assets/dolby.svg" alt="">
    </div>
  </div>
</template>

<script>
export default {
  props: ['modelValue'],
  emits: ['update:modelValue'],
  methods: {
    handleShowSidebar() {
      this.$emit('showSidebar');
    },
  },
}
</script>

<style scoped>
@media screen and (max-width: 768px) {
  .container {
    padding: 10px 0;
  }
  .brand-support {
    display: none;
  }
  .dolby, .imax{
    display: none;
  }
  .navbar-brand {
    display: flex;
    /* justify-content: space-around; */
    /* align-items: center; */
    width: 100%;
    margin: 0 10px;
  }
  .container-search{
    margin-right: 20px;
  }
  .search {
    margin-left: 0px;
    max-width: 200px;
    width: 100%;
  }
  .logo {
    display: none;
  }
  .hamburger-menu {
    width: 30px;
    margin-right: auto;
  }
}

@media screen and (min-width: 768px) {
  .search {
    max-width: 350px;
    width: 100%;
    height: 30px;
    border: none;
    padding: 20px 10px;
    margin: 0 0 0 100px;
    outline: none;
  }
  .container {
    padding: 20px 20px 20px 50px;
  }
  .hamburger-menu {
    display: none;
  }
  .container{
    display: flex;
    justify-content: space-between;
  }
}

.search {
  padding: 6px 4px;
  border-radius: 6px;
}

.container {
  width: 100%;
  background-color:#C0222E;
}

.navbar-brand {
  display: flex;
  align-items: center;
}


.brand-support {
  display: flex;
  align-items: center;
  gap: 10px;
}
</style>