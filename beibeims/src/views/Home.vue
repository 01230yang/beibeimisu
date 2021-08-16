<template>
  <div class="banner">
    <div>
      <span @click="le">《 </span>
      <img :src="i" @mousemove="sto" @mouseleave="doit" />
      <span @click="ri"> 》</span>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return { 
      src: [], 
      i: "",
      n: 1,
      timer: null,
      z: false };
  },
  methods: {
    le() {
      if (this.n == 0) {
        this.n = 2;
        this.i = this.src[this.n].site;
      } else {
        this.n--;
        this.i = this.src[this.n].site;
      }
    },
    ri() {
      if (this.n == 2) {
        this.n = 0;
        this.i = this.src[this.n].site;
      } else {
        this.n++;
        this.i = this.src[this.n].site;
      }
    },
    sto() {
      clearInterval(this.timer);
    },
    doit() {
      this.timer = setInterval(() => {
        this.ri();
      }, 3000);
    },
    xuan(e, j) {
      if (j - 1 == this.n) {
        this.z = true;
      }
    },
  },
  mounted() {
    this.axios.get("/users/lb").then((result) => {
      this.src = result.data;
      this.i = result.data[0].site;
      console.log(this.src);
    }),
      (this.timer = setInterval(() => {
        this.ri();
      }, 3000));
  },
};
</script>
<style lang="scss">
.banner {
  width: 80%;
  div {
    // overflow: hidden;
    margin-left: 200px;
    
    img {
      width: 100%;
      opacity: 0.3;
       animation: move 3s  linear infinite ;
    }
    @keyframes move {
      0% {
        opacity: 0.3;
      }
      100% {
        opacity: 1;
      }
    }
    width: 100%;
    list-style: none;
    & > :first-child {
      position: relative;
      left: 20px;
      top: 150px;
      width: 30px;
      height: 40px;
      opacity: 0.5;
      font-size: 16px;
      display: block;
      line-height: 40px;
    }
    & > :first-child:hover {
      opacity: 1;
      background-color: #ccc;
    }
    & > :last-child:hover {
      opacity: 1;
      background-color: #ccc;
    }
    & > :last-child {
      width: 30px;
      height: 40px;
      opacity: 0.5;
      font-size: 16px;
      display: block;
      line-height: 40px;
      position: relative;
      right: -1400px;
      top: -200px;
      text-align: center;
    }
  }
  .quan {
    width: 20px;
    height: 20px;
    border-radius: 50%;
    background-color: #ccc;
    list-style: none;
    margin-right: 1px;
  }
  .fj {
    position: absolute;
    display: flex;
    top: 350px;
    left: 700px;
  }
  .xz {
    background-color: orangered;
  }
}
</style>