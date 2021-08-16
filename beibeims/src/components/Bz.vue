<template>
    <div class="zhongjian">
      <ul>
          <li v-for="(i,j) of arr" :key="j"><img :src="i.p"><router-link to=""><h4>{{i.title}}</h4><span>{{i.x}}</span></router-link></li>
      </ul>
    </div>
</template>
<script>
export default {
    data(){
        return {
            arr:[{p:"img/bz/1.png",title:"电商龙头",x:"销量领先"},
                 {p:'img/bz/2.png',title:"14年品质,真实口碑",x:"最近评价3276条"},
                 {p:'img/bz/3.png',title:"鲜花实拍秀展示",x:"敢展现送前实拍"},
                 {p:'img/bz/4.png',title:"3小时送花",x:"全国连锁"},
                 {p:'img/bz/5.png',title:"200%退赔承诺",x:"可靠售后"}
                ]
        }
    }

}
</script>
<style lang="scss">
  .zhongjian{
      ul{
      display: flex;
       width: 1200px;
       height: 40px;
       margin-left: 300px;
       list-style: none;
       li{   
            font-size: 14px;
           margin-right: 30px;
           width: 132px;
           padding: 3px;
          img{
              margin-top: 3px;
              
          }
           h4{
               margin: 0;
           }
           a{  
              position: relative;
              text-decoration: none;
              color: #4d4d4d;
               top: -24px;
               right: -20px;
           }
          span{
              font-size: 12px;
              color: #999999;
          }
      }
      }
      

  }

</style>