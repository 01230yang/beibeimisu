<template>
    <div class="loginp">
     <div>
        <div>
            <div>
            <ul class="dl">
                <li><span @click="phon">手机号+密码登录</span><span @click="phone">手机号+验证码登录</span></li>
                <li><input type="text" placeholder="手机号/邮箱" v-model="uname"></li>
                <li><input type="password" placeholder="请输入手机验证码" v-model="upwd"><span class="yzp" @click="yzp">{{yp}}</span></li>
                <li><input type="text" placeholder="请输入图片验证码" v-model="yz"><span class="yz" @click="yan">{{ma}}</span></li>
              <li> <span class="mm"><input type="checkbox" class="dx">一个月免密登录</span>
                <router-link to="" class="wj">忘记密码?</router-link></li> 
                <li><button @click="login">登录</button></li>
                <li><span>没有注册?</span>
                 <router-link to="/register">立即免费注册>>></router-link>
                </li>
            </ul>
               <div class="erweima">
                 <img src="/img/erweima/1.png" alt="">
                 <img src="/img/erweima/2.png" alt="" class="er-2">
             </div>
        </div>
        </div>            
      </div>  
      <!-- <input type="text" v-model="uname"><br>
      <input type="password" v-model="upwd"><br>
          <button @click="login">登录</button>
          <br>
          <br>
          <input type="text" v-model="name">
          <input type="text" v-model="pwd">
          <button @click="zc">注册</button> -->
    </div>
</template>
 <script>
export default {
    data(){
        return {
            uname:'',
            upwd:'',
            yz:'',
            ma:'获取验证码',
            yp:'获取验证码'
        }
    },
    methods:{
       login(){
           var reg = /^1[3-9]\d{9}$/;
           var regm = /^\w{6}$/;
           if(this.yz!=this.ma){
               alert(`验证码错误`)
               return;
           }
            if(reg.test(this.uname)&&regm.test(this.upwd)){
              this.axios.post('/users/login',`uname=${this.uname}&&upwd=${this.upwd}`).then(res=>{
       
            alert(`登录成功`);
            this.$router.push("/");
            
            })
            }else{
                alert(`用户名或密码错误`)
             }
            //  this.axios.post('/users/login',`uname=${this.uname}&&upwd=${this.upwd}`).then(res=>{
            //   console.log(res);
            //  })
       },
       zc(){
           this.axios.post("/users/reg",`uname=${this.name}&&upwd=${this.pwd}`).then(res=>{
               console.log(res);
           })
       },
       yan(){
            this.ma = parseInt(Math.random()*10000)
       },
       phon(){    
           if(this.$route.path!='/login'){
                this.$router.push('/login')
           }
       },
       phone(){
                   this.$router.push('/loginp')
       },
       yzp(){
              this.yp = '已发送'
       }
    },
    mounted(){
       
    }
}
 </script>
<style lang="scss">
  .loginp{
      width: 100%;
      height: 475px;
      background-image: url('/img/userlogin_bg.jpg');
      .erweima{
          width: 100px;
          border-left: 1px solid #eee;
          position: relative;
          left: 370px;
          top: -300px;
          img{
              width: 80px;
              margin-left: 5px;
              margin-bottom: 20px;
          }
      }
     &>:first-child{
         width: 1200px;
         height: 475px;
         margin: 0 315px;
         &>:first-child{
             padding: 10px 0 0 0 ;
             background-color: #fff;
             width: 500px;
             height: 352px;
            float: right;
            margin-top: 60px;
            margin-right: 20px;
             &>:first-child{
                 width: 350px;
                 height: 352px;
                 
             }
         }
     }
     .dl{
         box-sizing: border-box;
           list-style: none;
           padding:0;
            margin: 0 13px;
           &>:nth-child(2){
               background-image: url('/img/login/yonghu.png');
               background-size: 30px;
               background-repeat: no-repeat;
               background-position: 0px 0; 
           }
           &>:nth-child(3){
               background-image: url('/img/login/mima_1.png');
               background-size: 30px;
               background-repeat: no-repeat;
               background-position: 0px 0; 
           }
           &>:nth-child(4){
               background-image: url('/img/login/mima_1.png');
               background-size: 30px;
               background-repeat: no-repeat;
               background-position: 0px 0; 
           }
           &>:nth-child(7){
               margin-top: 20px;
                span{
                    color: #555;
                    font-size: 13px;
                }
                a{
                    margin-left: 10px;
                    color: red;
                }
           }
         li{
             width: 280px;
             height: 40px;
 margin: 0 35px;
          margin-bottom: 2px;
           input{
               outline: none;
               border:  1px solid #ddd;
               width: 239px;
               height: 30px;
               margin-left: 29px;
           }
          
     }
       &>:first-child{
             font-size: 13px;
             color: #555555;
             line-height: 35px;
             &>:last-child{
                 text-align: center;
                 display: inline-block;
                 width: 135px;
                 height: 35px;
                  background-color: #4cc7cc;
                  border-radius: 5px;
             }
           }
         .yz{
             position: relative;
             top: -28px;
             left: 190px;
             background-color: gray;
             font-size: 14px;
         }
         button{
             width: 280px;
             height: 40px;
             color: white;
             background-color: #4cc7cc;
             text-decoration: none;
             border: 0;
         }
          .dx{
         width: 16px;
         height: 16px;
         margin-left: 05px;
         margin-top: 0px;
          vertical-align: middle;
     }
     }
    a{
        text-decoration: none;
        font-size: 13px;
    }
    .mm{
        font-size: 13px;
        line-height: 35px;
       
    }
    .wj{
        margin-left: 100px;
        color: #555555;
    }
    .yzp{
        position: relative;
        right: -180px;
        top:-28px;
        background-color: gray;
    }
  }

</style>