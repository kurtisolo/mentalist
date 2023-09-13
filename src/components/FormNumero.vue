<template>
  <section class="section pt-4">
    <div class="has-text-centered mb-5 is-size-4 nice-font">
        <strong>The Mentalista AI</strong>
    </div>
    <div class="box max-container p-5">
      <div class="container">
        <div v-if="!messaggio && !loading" id="formContainer">

          <form @submit.prevent="inviaNumero">

            <div class="field">
                <p class="mb-2">
                    <strong>Ciao!</strong>
                </p>
                <p class="has-text is-size-6 mb-3">
                    Sono una AI programmata per indovinare qualsiasi numero tu stia pensando.
                </p>
              <label class="label" for="numero">Mettimi alla prova!</label>
              <div class="control">
                <input class="input mt-2 mb-4" type="number" id="numero" v-model="numero" min="1" max="1000" placeholder="Scegli un numero tra 1 e 999">
              </div>
            </div>

            <div class="has-text-centered">
                <button 
                class="button mb-3 is-warning is-light is-large is-outlined" 
                type="submit"
                :disabled="!numero || numero < 1 || numero > 999"
                >
                Invia
                </button>
            </div>

          </form>

        </div>

            <div v-else-if="loading" id="loading-screen">
                <div class="loading-container">
                    <p>{{ loadingMessage }}</p>
                    <FakeLoading />
                </div>
            </div>

            <div v-else id="risultato">
                <p>{{ messaggio.split(',')[0] }}</p>
                <p class="has-text-centered is-size-3 has-text-weight-bold">{{ messaggio.split(',')[1] }}</p>
                <p class="mt-2 mb-3 ">Pensi sia solo fortuna?</p>
                <div class="has-text-centered">
                    <button @click="reset" class="button mb-3 is-warning is-light is-large mt-3 is-outlined">Riprova!</button>
                </div>
            </div>

      </div>
    </div>
  </section>
</template>

<script>
import FakeLoading from './FakeLoading.vue';

export default {
  components: {
    FakeLoading,
  },

  data() {
    return {
      numero: null,
      messaggio: null,
      loading: false,
      loadingMessage: 'Inizializzazione...'
    };
  },

  methods: {
    inviaNumero() {
      this.loading = true;
      this.fakeLoading();
    },

    fakeLoading() {
      setTimeout(() => {
        this.loadingMessage = 'Elaborazione variabili...';
        setTimeout(() => {
          this.loadingMessage = 'Calcolo probabilità statistiche...';
          setTimeout(() => {
            this.messaggio = `Il numero a cui stavi pensando è il:, ${this.numero}`;
            this.loading = false;
          }, 2000);
        }, 2000);
      }, 2000);
    },

    reset() {
      this.numero = null;
      this.messaggio = null;
    }
  }
};
</script>


<style>
    .max-container {
        max-width: 350px;
        margin: auto;
        border: 1px solid #f0e336;
    }
    .nice-font {
        font-family: 'Urbanist', sans-serif;
    }
    .loading-container {
        width: 310px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

</style>
