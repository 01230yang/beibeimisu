<template>
    <div class="fzf">
       <h1>404 NOT FOUND 您要寻找的网页不存在即将在{{a}}秒后跳转首页</h1>       
    </div>
</template>
<script>
export default {
    data(){
        return{
            a:3,b:''
        }
    },
    methods:{
         c(){    this.b  = setInterval(() => {
            this.a --
        }, 1000);} 
    },
    mounted(){
        setTimeout(()=>{
            this.$router.push('/')
        },3000)
        this.c()
     
    },
    destroyed(){
          clearInterval(this.b)
    } 
}
</script>
<style lang="scss">
   .fzf{
       width: 1200px;
       height: 400px;
      position: relative;
     h1{
        position: absolute;
        top: 50%;
        left: 50%;
     }
   }
</style>

