<template>
  <div class="wei">
    <ul>
        <li v-for="(i,j) of arr" :key="j">
          <div><img :src="i.pic">
          <span>{{i.ti}}</span></div>
        </li>
    </ul>
    <div>
     <ul>
         <li>联系我们</li>
         <li>新手上路</li>
         <li>配送与支付</li>
         <li class="zu">服务保障</li>
         <li class="zui"><span>联系我们</span>
             <p>18328648966</p>
              <div>
                  <img src="/img/weixin.png" alt="">
                  <img src="/img/erwei.png" alt="">
              </div>
         </li>
     </ul></div>
      <p>版权所有：福州九号店电子商务有限公司 Copyright 2018 - 2021 www.88cake.com All Rights Reserved 闽ICP备11013528号-6</p>
  </div>
</template>
<script>
export default {
    data(){
        return {
            arr:[
                 {pic:'/img/foot/f-icon1.png',ti:'十年品牌'},
                 {pic:'/img/foot/f-icon1.png',ti:'销量领先'},
                 {pic:'/img/foot/f-icon1.png',ti:'时尚原创'},
                 {pic:'/img/foot/f-icon1.png',ti:'3小时配送'}
                ]
        }
    }
}
</script>
<style lang="scss">
   .wei{
       width: 100%;
       height: 98px;
       background-color: #4cc7cc;
       &>:first-child {
           margin-left: 100px;
           height: 98px;
           position: absolute;
           width: 80%;
           display: flex;
           flex-wrap: nowrap;  
            color:white;
            justify-content: center;
            vertical-align: middle;
       li{
          line-height: 98px;
           list-style: none;
           margin-right: 120px;
           span{
                 position: relative;
                 right: -10px;
                 top:-10px;          
           }
           img{
               width: 35px;
           }
}           
       }

       &>:nth-child(2){
        width: 100%;
        ul{
            margin-left: 280px;
             display: flex;
             position: relative;
             top: 100px;
            width: 1200px;
              justify-content: center;
            }
            li{
                height: 20px;
                color: #848484;
                list-style: none;
                text-align: center;
                margin-right: 15px;
                padding-right: 40px;
               border-right: 1px solid #848484;
               width: 120px;
            }
             .zu{
                 border-right: 0;
             }
           .zui{
               border-right: 0;
                   width: 200px;
                   height: 200px; border-left: 1px solid #848484;
               span{
                   display: block; 
               }
               &>:last-child{
                   margin-top: 20px;
                  &>:first-child{
                     margin-bottom: 25px;
                    width: 40px;
                  }
                   &>:last-child{
                       width: 80px;
                       margin-left: 10px;
                   }
               }
           }

              
       }
       &>:last-child{
           text-align: center;
           margin-top: 140px;
       }
   }
</style>