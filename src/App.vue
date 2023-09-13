<template>
  <div class="nice-font">
      <img alt="Vue logo" src="./assets/logo.png" class="logo"><strong>. xyz</strong>
  </div>
  <FormNumero/>
  <TheFooter />
</template>

<script>
import FormNumero from './components/FormNumero.vue'
import TheFooter from './components/TheFooter.vue'

export default {
  name: 'App',
  components: {
    FormNumero,
    TheFooter
  }
}
</script>

<style>
  #app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 60px;
  }
  .logo {
    width: 60px;
    height: auto;
  }
  .nice-font {
      font-family: 'Urbanist', sans-serif;
  }
</style>
