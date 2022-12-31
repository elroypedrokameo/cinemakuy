<template>
  <div class="container">
    <div class="link-sidebar" v-for="(item, key) in sidebars" :key="key">
      <RouterLink :to="`${item.link}`">
        <p>{{ item.title }}</p>
      </RouterLink>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return {
      sidebars: [
        {
          id: 1,
          title: "Now Playing",
          link: "/"
        },
        {
          id: 2,
          title: "Comming Soon",
          link: "#/"
        },
        {
          id: 3,
          title: "Theatre",
          link: "#/"
        },
        {
          id: 4,
          title: "Promotion",
          link: "#/"
        },
        {
          id: 5,
          title: "Informations",
          link: "#/"
        },
      ]
    }
  }
}
</script>

<style scoped>
.container {
  display: flex;
  flex-direction: column;
  gap: 20px;
  background-color: #191C1F;
  padding: 20px 50px;
  width: 20rem;
  height: auto;
  color: white;
}
p {
  width: 100%;
  padding: 0 10px;
  border-radius: 10px;
}
p:hover {
  cursor: pointer;
}
.link-sidebar {
  padding: 10px;
  width: 100%;
}
.link-sidebar:hover {
  background-color: #2F3336;
}
</style>