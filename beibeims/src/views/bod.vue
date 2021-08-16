<template>
  <div class="bod">
    <div>
      <div>
        <span>1F</span>
        <span>儿童蛋糕</span>
        <router-link to="">精选儿童蛋糕</router-link>
        <router-link to="">更多…</router-link>
      </div>
    </div>
    <div>
      <div>
        <router-link to=""><img src="img/1l/1.jpg" alt="" /></router-link>
      </div>
      <div><span>儿童蛋糕专区</span></div>
      <div class="pic">
        <div v-for="(i, j) of arr" :key="j" class="picc">
          <div class="p1"><router-link :to="`/details/${i.bid}`"><img :src="i.photo" /></router-link></div>
          <router-link :to="`/details/${i.bid}`" class="p1-a">{{
            i.jie
          }}</router-link>
          <div>
            <span>{{ i.newprice }}</span
            ><i>￥{{ i.oldprice }}</i
            ><router-link to=""
              ><img src="/img/sh.png" class="sh"
            /></router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      arr: [],
    };
  },
  mounted() {
    this.axios.get("/users/bod").then((res) => {
      // 发送请求  获取商品数据渲染到页面
      this.arr = res.data;
    });
  },
};
</script>
<style lang="scss">
.bod {
  width: 1200px;
  margin-left: 300px;
  & > :first-child {
    line-height: 58px;
    height: 58px;
    color: white;
    border-radius: 5px;
    background-color: #4cc7cc;
    div {
      margin-left: 10px;
      & > :nth-child(2) {
        margin-left: 20px;
        margin-right: 850px;
      }
      & > :nth-child(3) {
        text-decoration: none;
        margin-right: 10px;
        font-size: 12px;
        color: white;
        padding: 5px;
        border: 0.5px solid white;
      }
      & > :nth-child(4) {
        text-decoration: none;
        margin-right: 10px;
        font-size: 12px;
        color: white;
        padding: 5px;
        border: 0.5px solid white;
      }
    }
  }
  & > :nth-child(2) {
    background-color: white;
    margin-top: 10px;
    width: 1200px;
    height: 610px;
    // display: flex;

    & > :first-child {
      width: 250px;
      height: 420px;
      overflow: hidden;
      border-radius: 5px;
      img {
        width: 250px;
        height: 420px;
        margin: 0 10px 0 0;
        transition: all 1s;
      }
      img:hover {
        width: 300px;
        height: 470px;
      }
    }
    & > :nth-child(2) {
      text-align: center;
      padding: 20px;
      background-color: #ecdea2;
      height: 83px;
      width: 210px;
      border-radius: 5px;
      //   position: relative;
      //   top: 430px;
      //   left: -260px;
      span {
        display: block;
        width: 250px;
      }
    }
  }
  .pic {
    margin: 0;
    position: relative;
    left: 255px;
    top: -542px;
    width: 1000px;
  }
  .picc {
    border-radius: 5px;
    margin-bottom: 10px;
    float: left;
    width: 185px;
    height: 260px;
    text-align: center;
    border: 0.5px solid #cccccc;
    padding-top: 5px;
    overflow: hidden;
    margin-right: 2px;
    img {
      width: 180px;
      height: 180px;
      transition: all 1s;
    }
    .p1 {
      width: 180px;
      height: 180px;
      overflow: hidden;
      box-sizing: border-box;
      margin: 0 2px 5px;
      img:hover {
        width: 200px;
        height: 200px;
      }
    }
    .p1-a {
      margin-bottom: 10px;
    }
    .p1-a:hover {
      color: #4cc7cc;
    }
    a {
      text-decoration: none;
      font-size: 12px;
      color: #363636;
    }
    span {
      margin-right: 10px;
      float: left;
      display: inline-block;
      margin-left: 15px;
      color: #d73858;
      font-size: 18px;
    }
    i {
      text-decoration: line-through;
      font-size: 12px;
    }
    .sh {
      width: 25px;
      height: 25px;
      position: absolute;
      line-height: 29px;
    }
  }
}
</style>