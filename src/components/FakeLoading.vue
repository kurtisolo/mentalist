<template>
  <progress :value="progressValue" max="100"></progress>
</template>

<script>
export default {
  data() {
    return {
      progressValue: 0,
    };
  },
  mounted() {
    this.fakeLoading(10, 200);
    this.fakeLoading(15, 600);
    this.fakeLoading(42, 1200);
    this.fakeLoading(55, 400);
    this.fakeLoading(86, 2000);
    this.fakeLoading(100, 100);
  },
  methods: {
    fakeLoading(percent, duration) {
      setTimeout(() => {
        this.progressValue = percent;
      }, duration);
    },
  },
};
</script>

<style>
  progress {
    display: inline-block;
    width: 80%;
    margin: 50px 10%;
  }
</style>
