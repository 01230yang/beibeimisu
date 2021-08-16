<template>
  <div class="threebod" id="threebod">
    <div>
      <div>
        <span>3F</span>
        <span>祝寿蛋糕</span>
        <router-link to="">精选祝寿蛋糕</router-link>
        <router-link to="">更多…</router-link>
      </div>
    </div>
    <div>
      <div>
      <router-link to=""><img src="img/3l.jpg" alt="" /></router-link></div>
      <div><span>祝寿蛋糕专区</span></div>
       <div class="pic">
      <div v-for="(i, j) of arr" :key="j" class="picc">
        <div class="p1"><router-link :to="`/details/${i.bid}`"><img :src="i.photo"/></router-link></div>
        <router-link :to="`/details/${i.bid}`" class="p1-a">{{ i.jie }}</router-link>
        <div><span>{{i.newprice}}</span><i>￥{{i.oldprice}}</i><router-link to=""><img src="/img/sh.png" class="sh"></router-link></div>
      </div>
    </div></div>
  </div>
</template>
<script>
import {mapState,mapMutations} from 'vuex'
export default {
  data() {
    return {
      arr: [],a:0
    };
  },
  computed:{
    ...mapState(['tt'])
  } ,
  mounted() {
    this.axios.get("/users/threebob").then((res) => {   // 发送请求 获取数据渲染上页面
      this.arr = res.data;
    });
  },
  watch:{
    tt(){
         if( this.tt >= 700){
          // this.an = ' animation: move 2s infinite;'
        document.getElementById('threebod').style.animation="move 2s forwards linear"
        
      }else{
            document.getElementById('threebod').style.animation= ''
      }
      }
  }
};
</script>
<style lang="scss">
.threebod {

     opacity: 0;
  @keyframes move  {
    0%{
      opacity: 0.2;
    }
    100%{
      opacity: 1;
    }
    
  }
     position: relative;
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
      &>:nth-child(1){
        position: relative;
        left: -930px;
      }
      & > :nth-child(2) {
        margin-left: 20px;
        // margin-right: 850px;
        position: relative;
        left: -930px;

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
        position: relative;
        left: -945px;
      img {
        width: 250px;
        height: 420px;
        margin: 0 10px 0 0;
       transition:all 1s ;
      }
       img:hover{
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
  .pic{
   margin: 0;
  position: absolute;
  left: 260px;
  top: 69px;
  width: 1000px;
  }
  .picc{
     border-radius: 5px;
      margin-bottom: 10px ;
      float: left;
      width: 185px;
      height: 260px;
     text-align: center;
     border: 0.5px solid #cccccc;
     padding-top: 5px;
     overflow: hidden;
     margin-right: 2px;
      img{
          width: 180px;
          height: 180px;
       transition:all 1s ;
      }
      .p1{
           width: 180px;
          height: 180px;
          overflow: hidden;
          box-sizing: border-box;
          margin: 0 2px  5px;
         img:hover{
                width: 200px;
        height: 200px;
          }
     }
      .p1-a {
          margin-bottom: 10px;
      }
      .p1-a:hover{
          color: #4cc7cc;
      }
      a{
          text-decoration: none;
          font-size: 12px;
          color: #363636;

      }
      span{
          margin-right: 10px;
          float: left;
          display: inline-block;
          margin-left: 15px;
          color: #d73858;
          font-size: 18px;
      }
      i{
          text-decoration: line-through;
            font-size: 12px;
 }
      .sh{
          width: 25px;
          height: 25px;
          position: absolute;
       line-height: 29px;          
      }
  }
}
</style>