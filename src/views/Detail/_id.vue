<template>
  <div class="container-main" v-if="reRender">
    <Navbar v-model="title" @showSidebar="handleShowSidebar()" />
    <div class="content">
      <Sidebar :class="[isShowSidebar === true ? '' : 'sidebar']" />
      <Loading v-if="isLoading" />
      <div v-else class="container-movie-detail">
        <p class="movie-title">{{ dataMovie?.Title }}</p>
        <div class="movie-detail">
          <img class="detail-poster" :src="dataMovie?.Poster" alt="">
          <div class="movie-info">
            <div class="movie-info-detail">
              <p>Release Date: {{ dataMovie?.Released }}</p>
              <p>Language: {{ dataMovie?.Language }}</p>
              <p>Genre: {{ dataMovie?.Genre }}</p>
              <p class="cast-crew">Cast & Crew: {{ dataMovie?.Actors }}</p>
              <p>Director: {{ dataMovie?.Director }}</p>
              <p>Length: {{ dataMovie?.Runtime }}</p>
            </div>
            <div class="sinopsis">
              <p class="sinopsis-title">Sinopsis</p>
              <div class="sinopsis-detail">
                <p>{{ dataMovie?.Plot }}</p>
              </div>
            </div>
            <div class="buttons">
              <button class="btn">Buy Ticket</button>
              <button class="btn">Watch Trailer</button>
            </div>
          </div>
        </div>
        <p class="now-playing-title">Now Playing</p>
        <div class="now-playing-list">
          <Loading v-if="isLoading" />
          <MovieCard
            v-for="(item, key) in movies"
            v-else
            :key="key"
            :poster="item.Poster"
            :movieTitle="item.Title"
            :idMovie="item.imdbID"
            isDetail="true"
            @detail="goToDetail(item.imdbID)"
          />
        </div>
      </div>
    </div>
    <Footer />
  </div>
</template>

<script>
import Navbar from "../../components/Navbar.vue";
import Sidebar from "../../components/Sidebar.vue"
import Loading from "../../components/Loading.vue"
import MovieCard from "../../components/MovieCard.vue"
import Footer from "../../components/Footer.vue"
export default {
  components: {
    Navbar,
    Sidebar,
    Loading,
    MovieCard,
    Footer
  },
  data(){
    return {
      id: null,
      isLoading: false,
      dataMovie: null,
      movies: null,
      title: "avatar",
      debounce: null,
      reRender: true,
      isShowSidebar: false,
    }
  },

  watch: {
    title(){
      clearTimeout(this.debounce)
      this.debounce = setTimeout(() => {
        this.getMovies()
      }, 1000);
    },
    id(){
      this.getDetail()
      this.getMovies()
      window.scrollTo(0, 0)
    }
  },

  mounted(){
    this.id = this.$route.params.id
    this.getDetail()
    this.getMovies()
  },

  methods: {
    handleShowSidebar() {
      this.isShowSidebar = !this.isShowSidebar;
    },
    async getDetail() {
      this.isLoading = true;
      // eslint-disable-next-line no-unused-vars
      const res = await this.axios.get(`http://www.omdbapi.com/?i=${this.id}&apikey=271ab1b1`)
        .then((res) => {
          console.log(res.data)
          this.dataMovie = res.data
          this.isLoading = false;
        })
        .catch(() => {
          this.isLoading = false;
          console.log("error")
        })
    },

    async getMovies() {
      this.isLoading = true;
      // eslint-disable-next-line no-unused-vars
      const res = await this.axios.get(`http://www.omdbapi.com/?s=${this.title}&apikey=271ab1b1&`)
        .then((res) => {
          console.log(res.data.Search);
          this.movies = res.data.Search.filter((item) => item.imdbID !== this.id);
          this.isLoading = false;
        })
        .catch((error) => {
          console.log(error.response);
          this.isLoading = false;
        });
    },

    goToDetail(id){
      this.id = id
    }
  }
}
</script>

<style scoped>
@media screen and (max-width: 768px) {
  .sidebar {
    display: none;
  }
  .movie-detail {
    flex-direction: column;
    flex-wrap: wrap;
  }
  .movie-info {
    margin-left: 20px 0 0 16px;
  }
  .movie-info-detail {
    flex-direction: column;
    overflow-wrap: wrap;
    margin: 10px 0 0 -16px;
    inline-size: 100%;
    max-width: 100%;
  }
  .sinopsis{
    margin-left: -16px;
  }
  .sinopsis-detail {
    width: 100%;
  }
  .sinopsis-detail p {
    overflow-wrap: break-word;
  }
  .cast-crew {
    overflow-wrap: break-word;
  }
}

.container-main {
  display: flex;
  flex-direction: column;
}
.content {
  display: flex;
  min-height: 88vh;
  background-color: #222B31;
}
.container-movie-detail {
  width: 100%;
  color: white;
  padding: 20px;
  overflow-wrap: wrap;
}
.detail-poster {
  border-radius: 15px;
}
.movie-detail {
  display: flex;
}
.movie-title {
  font-weight: bold;
  margin: 10px 0;
}
.movie-info {
  margin-left: 20px;
  height: 100%;
}
.sinopsis-title {
  margin: 20px 0;
  font-weight: bold;
  font-size: 24px;
}
.sinopsis-detail {
  margin: 10px 0 40px 0;
  width: 500px;
  font-size: 16px;
}
.movie-info-detail {
  font-size: 16px;
}
.buttons {
  display: flex;
  gap: 10px;
  margin-top: 25px;
  font-size: 16px;
  font-weight: 700;
}
.btn {
  background-color: #C0222E;
  border-radius: 15px;
  padding: 10px 20px;
}
.now-playing-title {
  font-weight: 700;
  font-size: 24px;
  margin: 30px 0 20px 0;
}
.now-playing-list {
  display: flex;
  flex-wrap: wrap;
}
</style>