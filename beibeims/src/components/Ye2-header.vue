<template>
    <div class="y2-head">
     <div>
      <ul class="y2-1">
          <li v-for="(i,j) of arr" :key="j"><router-link to="#">{{i}}</router-link></li>
          <li ><router-link to="/login" >会员登录</router-link></li>
          <li><router-link to="/register">会员注册</router-link></li>
          <li @mouseenter="j" @mouseleave="c"><router-link to="#">我的信息</router-link>
               <ul v-show="t">
                   <li><router-link to="" >已买到的宝贝</router-link></li>
                   <li><router-link to="">我的地址管理</router-link></li>
               </ul>
          </li>
          <li  class="gw"><router-link to="/gwc">购物车({{spsum}})</router-link>
                <!-- <ul v-show="g" style="background-color:red">
                    <li><router-link to="">123123</router-link></li>
                </ul> -->
          </li> 
      </ul>
     </div>
       <div style="display:flex; width:1200px; margin-left:40px" >
          <router-link to="#" >  <img src="../../public/img/bbms.jpeg" class="bbms"> </router-link>
          <div class="ss" style="display:flex; line-height:80px">
             <div >
                 <input type="text" v-model="sel" @blur="sq">
             </div>
             <div @click="shous"><img src="../../public/img/放大镜.png"></div>
            
          </div>
           <div class="sl"><router-link to="#" class="qa"><img src="../../public/img/mobile.png" style="width:20px">40008000</router-link></div>
         <div class="zxkf"><img src="../../public/img/kf.png" alt="">在线客服</div>
       </div>
      
       <ul v-show="sel!=0" class="cx" >
           <li v-for="(i,j) of mh" :key="j" @click="tiao(i.coid)">
               <router-link to="">{{i.coname}}</router-link>
           </li>
       </ul>
       <div class="zxzx">
          <router-link to=""><img src="/img/zxzx.png">
              <span>在线咨询</span>
          </router-link>
       </div>
        <div class="yh" v-show="$store.state.uname"><img :src="pic" alt=""><router-link to="/flower">{{('欢迎:'+$store.state.uname)}}</router-link></div>
    </div>
</template>
<script>
import {mapState,mapActions, mapMutations} from 'vuex'
export default {
     data(){
         return{
             arr:["新鲜制作","全国配送","质量保证","快至2小时送到"] , t:false , sel:'',yc:false,
         g:false, 
         mh:[]
         }
     },
     methods:{
         ...mapMutations(['dlzt']),   //VUEX  
         sq(){
             setTimeout(()=>{
                  this.sel = ''
             },200)
              
         },
         tiao(i){
             this.shous()    //模糊查询 出匹配商品 点击时 调用该方法跳转至详情  
         },
         j(){    //鼠标移入我的信息  显示
             this.t= true;
            
         }, 
         c(){   //鼠标移出 隐藏 
             this.t = false
         },
         shou(){            //封装方法  发送请求 模糊查询
                   this.axios.get(`/users/ss?coname=${this.sel}`).then(
             res=>{
                 this.lid=res.data[0].coid
                 this.mh = res.data    
             }
         ).catch(msg=>{
             setTimeout(()=>{
                  alert(`该物品不存在`);
             },200)
            
         })
         },
          shous(){    //判断是否为当前路由页面  是不操作 否则跳转
                 if(this.uid==''){
                     alert(`请登录`);
                     return;
                 }
                 if(this.sel!=''){
               if(this.$route.path!=`/details/${this.lid}`){
                 this.$router.push(`/details/${this.lid}`)}
     }}
     },
     computed:{       //计算属性
           ...mapState(['ddl','spsum','uid','pic']),  //VUEX 
        //    search(){     //静态模糊查询  
        //        if(this.sel ==''){
        //            return ''
        //        }
        //           return this.str.filter(x => {
        //               return x.includes(this.sel)
        //           })
        //      }
     },
     watch:{
         sel(){   // 双向绑定 用户搜索时 自动调用  防抖 定时器 判断当前是否有定时器有删除没有就执行
             setTimeout(()=>{
                 this.shou()
             },300)
         }
     },
     mounted(){
        
     }
}
</script>
<style lang="scss">
    
   .y2-head{
       position: relative;
       .gw{
        width: 90px;
       }
        .yh{
            position:relative;
            top: -122px;
            left: 450px;
 width: 300px;
            height: 40px;
            text-align: center;
            line-height: 40px;
            font-size: 20px;
            img{
                vertical-align: middle;
                width: 40px;
                height: 40px;
            }
            a{
                text-decoration: none;
            color: #000;
            }
        }
        .yh:hover{
            a{
                color: red;
            }
            background-color: yellow;
        }
         .zxzx{
             background-color: white;
             position: fixed;
             right: 20px;
              z-index: 100;
              top: 50%;
             border: 1px solid #999;
             text-align: center;
             width: 100px;
              height: 182px;
             img{
                 width: 80px;
                 height: 0150px;
             }
             a{
                  height: 182px;
                    width: 80px;
             }
             &>:last-child{
                 display:inline-block ;
                 font-size: 12px;
                 text-decoration: none;
                 color: white;
                 background-color: red;
                 width: 80px;
                line-height: 20px;
             }
         }
          padding-left: 200px;
           position: relative;
           width: 1200;
          ul{ display: flex;
           width: 1200px;
           li{
              
               width: 52px;
               font-size: 13px;
               text-align: center;
               a{
                    color: #666666;
                text-decoration: none;
               }
           } 
       }
       .y2-1{
           list-style: none;
            margin-left: 10px;
            height: 10px;
           li {
               margin-right: 20px;
           }
           &>:nth-child(4){
              width: 90px;
              margin-right: 500px;
           }
           &>:nth-child(7){
               width: 82px;
               margin-right: 10px;
               ul{
                   list-style: none;
                  width: 100px;
                   padding: 0;
                   margin: 0;
                   flex-wrap: wrap;
                   height: 42px;
                   background-color: #fff;
                   li{
                 width: 100%;
                  a{
                text-decoration: none;
                    position: relative;
                    z-index: 10;

               }
                   }
               }
           }
           &>:nth-child(8){
               margin-left: 10px;
               ul{
                   width: 200px;
                  list-style: none;
                  padding: 0;
                  margin: 0;
                  
                  li{
                          width: 200px;
                          height: 34px;
                           a{
                text-decoration: none;
                 color: #666666;
               }
                  }
               }

           }
       }
       .ss{
            
           width: 500px;
           height: 42px;
            input {
                  width: 414px;
                  height: 40px;
                  border: 0;    
                  outline: none;
                   border-radius: 25px  0 0 25px  ;
                   border: 3px solid #4cc7cc;
                   position: absolute;
                   top: 43px;
             }
             &>:nth-child(2){
                 width: 72px;
                 height: 48px;
                 background-color: #4cc7cc;
               margin-top: 18px;
               margin-left: -1px;
               line-height: 48px ;
                 border-radius: 0 25px 25px  0;
                box-sizing: border-box;
                position:absolute;
                left: 982px;
                top: 25px;
                 img{
                    width: 25px; 
                    margin: 11px 23px;
                 }
             }
       }
       .bbms{
           width: 320px;
           height: 80px;
       }
      .sl{
          width: 180px;
          height: 42px;
       position: relative;
       right:  -40px;
       border: 3px solid #4cc7cc;
       margin-top: 20px;
       line-height: 42px;
       text-align: center;
       border-radius: 25px;
       .qa{
          text-decoration: none;
           color: #4cc7cc;
           font-size: 16px;
       }
      }
      .zxkf{
          width: 120px; 
          height: 46px;
          background-color: #4cc7cc; 
          border-radius: 25px ;
          color: white;
          text-align: center;
          padding: 10px 0;
          box-sizing: border-box;
          margin-top: 22px;
          margin-left: 50px;
          img{
              width: 20px;
          }
      }
      .cx{
          position: absolute;
          display: flex;
         width: 418px;
          height: 210px;
          flex-wrap: wrap;
           left: 565px;
           top: 70px;
           overflow-y: auto;
           background-color: rgba($color: white, $alpha: 0.5);
           padding: 0;
          li{
              list-style: none;
            border-radius: 5px ;
              width: 100%;
              margin-bottom: 1px;
              height: 30px;  
              line-height: 30px;
          }
          li:hover{
              background-color: gray;
          }
      }
   }
</style>