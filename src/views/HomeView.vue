<script>
// import MainLayout from "../src/components/MainLayout/Index.vue";
import MovieCard from "../components/MovieCard.vue";
import Navbar from "../components/Navbar.vue";
import Sidebar from "../components/Sidebar.vue";
import Footer from "../components/Footer.vue"
import Loading from "../components/Loading.vue"
import Empty from "../components/EmptyState.vue"

export default {
  components: {
    // MainLayout,
    MovieCard,
    Navbar,
    Sidebar,
    Footer,
    Loading,
    Empty,
  },
  data() {
    return {
      movies: null,
      movieTitle: "avatar",
      debounce: null,
      isLoading: false,
    };
  },

  mounted() {
    this.getMovies();
  },

  watch: {
    movieTitle(){
      clearTimeout(this.debounce)
      this.debounce = setTimeout(() => {
        this.getMovies();
      }, 1500);
    }
  },

  methods: {
    async getMovies() {
      this.isLoading = true;
      // eslint-disable-next-line no-unused-vars
      const res = await this.axios.get(`http://www.omdbapi.com/?s=${this.movieTitle}&apikey=271ab1b1&`)
      .then((res) => {
        console.log(res.data.Search);
        this.movies = res.data.Search;
        this.isLoading = false;
      }).catch((error) => {
        console.log(error.response);
        this.isLoading = false;
      })
    }
  }
}
</script>

<template>
  <div class="container-main">
    <Navbar v-model="movieTitle" />
    <div class="content">
      <Sidebar />
      <div class="container-movie-list">
        <div class="movie-list">
          <Loading v-if="isLoading" />
          <Empty v-else-if="movies === undefined" :movieTitle="movieTitle" />
          <MovieCard
            v-for="(item, key) in movies"
            v-else
            :key="key"
            :poster="item.Poster"
            :movieTitle="item.Title"
            :idMovie="item.imdbID"
            isDetail="false"
          />
        </div>
        <div class="pagination">
          <p>Sebelumnya</p>
          <p>Selanjutnya</p>
        </div>
      </div>
    </div>
    <Footer />
  </div>
</template>

<style scoped>
.container-main {
  display: flex;
  flex-direction: column;
}
.content {
  display: flex;
  min-height: 88vh;
}
.container-movie-list {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding-top: 10px;
  width: 100%;
  background-color: #222B31;
}
.movie-list {
  display: grid;
  grid-template-columns: auto auto auto;
}
.pagination {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 10px;
  padding: 10px;
  color:white;
}
</style>
