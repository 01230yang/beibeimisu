<template>
  <div class="zuol">
            <div>
              <router-link to="/flower"><img :src="pic"></router-link>
            </div>
            <div><router-link to="/gwc"><img src="/img/left/gwc.png" alt="">购物车 {{spsum}}</router-link> </div>
            <div><router-link to=""><img src="/img/left/kf.png" alt=""></router-link> </div>
       </div>
</template>
 <script>
 import {mapState}  from 'vuex'
 export default {
     computed:{
       ...mapState(['spsum','pic'])    //VUEX 
     }
 }
 </script>
<style lang="scss">
  .zuol{
           width: 30px;
           height: 750px;
           background-color: #999;
           position: fixed;
           left: 0;
           top: 10%;
           z-index: 100;
          div{  width: 26px;
              height: 30px;
              text-align: center;
             margin-top: 20px;
            
           }
           &>:first-child{
             img{
               width: 30px;
               height: 30px;
             }
              line-height: 30px;
           }
           &>:nth-child(2){
             height: 110px;
             a{
             font-size: 14px;
                text-decoration: none;
                color: #666;
             }
            
            }
           div:hover{
               background-color: #4cc7cc;
               color: #4cc7cc;
            }
           &>:last-child{
             margin-top: 400px;
              line-height: 30px;
           }
       }
</style>