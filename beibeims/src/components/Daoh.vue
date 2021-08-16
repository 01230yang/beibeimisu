<template>
    <div class="dao" v-show="gunl>600">
      <ul>
          <li @click="er(610)">儿童蛋糕</li>
          <li @click="er(1290)">祝福蛋糕</li>
          <li @click="er(1940)">祝寿蛋糕</li>
          <li @click="er(2650)">过生蛋糕</li>
          <li @click="er(50)"><router-link to="#">回到顶部</router-link></li>
      </ul>
    </div>
</template>
<script>

export default {
    props:['gunl'],
    data(){
       return{ dao:true,to:0,
          
       }
    },
    methods:{
        dsq(i){
               var c =setInterval(()=>{
         document.documentElement.scrollTop>i ? document.documentElement.scrollTop-=50: clearInterval(c);
    },15)
        },
        er(i){
         this.dsq(i)
        }
    },
    mounted(){
       console.log(this.gunl);

    }
}
</script>
<style lang="scss">
  .dao{
      position: fixed;
      left: 120px;
      top :0  ;
      width: 80px;
      z-index: 1000;
    ul{
        li{
            list-style: none;
            width: 80px;
            height: 30px;
            margin-bottom: 5px;
            background-color: #4cc7cc;
            text-align: center;
            line-height: 30px;
            font-size: 14px;
            color: white;
            a{
                text-decoration: none;
                color: white;
            }
        }
    }
  }
</style>