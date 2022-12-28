<template>
  <router-link :to="`/details/${idMovie}`" >
    <div @click="$emit('detail',id) " class="container">
      <img :src="poster" alt="poster" class="poster">
      <div :class="[isDetail === true ? 'detail' : '']" class="movie-detail">
        <p class="movie-title">{{ movieTitle }}</p>
        <p>(17+)</p>
        <!-- <p>{{ rated }}</p> -->
      </div>
    </div>
  </router-link>
</template>

<script>
// eslint-disable-next-line no-unused-vars
import { RouterLink } from "vue-router"
export default {
  props: {
    poster: {
      type: String,
      required: true,
    },
    movieTitle: {
      type: String,
      required: true,
    },
    rated: {
      type: String,
      required: false,
    },
    idMovie: {
      type: String,
      required: true,
    },
    isDetail: {
      type: Boolean,
      default: false,
    }
  },
  methods: {
    goToDetail() {
      this.$router.push(`/`)
    }
  }
}
</script>

<style scoped>
.container{
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 10px;
  padding: 10px;
  border-radius: 10px;
  color: white;
  cursor: pointer;
}
.poster {
  width: 287px;
  height: 404px;
  border-radius: 10px;
}
.movie-detail {
  display: flex;
  flex-direction: column;
  justify-items: center;
  align-items: center;
}
.detail {
  display: none;
}
</style>