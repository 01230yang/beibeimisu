<template>
    <div class="timer">
       <div>
           {{h}} ,{{m}} {{s}}
       </div>
    </div>
</template>
<script>
export default {
    data(){
          return {
        time:0,
        h :0, m:0,s:0,
        

          }
 },methods:{
        d(){
              
              this.h = Math.floor(this.c/(60*60*1000))%24   //小时
          this.m = Math.floor(this.c /(60*1000))%60  //分钟
           this.s = Math.floor((this.c /1000))%60   //秒
            
        }  
 },
 mounted(){
   //当前毫秒
           // 加一小时
     

    setInterval(() => { 
    this.d()
         
            console.log(this.c);
      }, 1000);
 }
}
</script>
<style lang="scss">
   .timer{
       margin: 0 auto;
  width: 80px;
  height: 60px;
   }
</style>