<template>
    <div class="ye-header" :style="{'height':a}">
       <div v-show="t"><img :src="arr[0].photo" ></div>
     <div>
       <span v-if="t" @click="blo">x</span>
       <span v-else @click="non">+</span>
       </div>
     </div> 
</template>
<script>
export default {
    data(){
        return { arr:[1] , t:true , a:70+'px'
        }
    },
    methods:{
      blo(){   //隐藏 位置清零
             this.t=false 
             this.a = ''
      },
      non(){     //显示   站位  
          this.t = true 
          this.a = 70 + 'px'
      }
    },
    mounted(){     //页头图片
         this.axios.get('/users/yt').then(res=>this.arr = res.data )
    }
}
</script>
<style lang="scss">
  .ye-header{
    position: relative;
    width: 1200px;    
    margin-left: 200px;
    height: 10px;
      color: #000;
      img{
        width: 100%;
        height: 70px;
      }
      div{

          span{
             position: absolute;
             top: 0px;
              font-size: 20px;
          }
      }
  }
</style>