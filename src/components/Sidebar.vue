<template>
  <div class="container">
    <p v-for="(item, key) in sidebars" :key="key">{{ item.title }}</p>
  </div>
</template>

<script>
export default {
  data(){
    return {
      sidebars: [
        {
          id: 1,
          title: "Now Playing"
        },
        {
          id: 2,
          title: "Comming Soon"
        },
        {
          id: 3,
          title: "Theatre"
        },
        {
          id: 4,
          title: "Promotion"
        },
        {
          id: 5,
          title: "Informations"
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
</style>