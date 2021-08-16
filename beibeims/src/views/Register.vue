<template>
  <div class="register"  @mouseleave="yc" :style="yang">
    <div>
      <ul >
        <li>
          <span>图片验证: </span
          ><input type="text" placeholder="请输入验证码" v-model="pic" /><span
            class="picy"
            @click="yan1"
            >{{ b }}</span
          >
        </li>
        <li>
          <span>手机号码: </span
          ><input type="text" placeholder="请输入手机号" v-model="phone" />
        </li>
        <li>
          <span>短信验证: </span
          ><input type="text" placeholder="请输入短信验证" v-model="dx" /><span
            class="dxy"
            @click="yan"
            >{{ a }}</span
          >
        </li>
        <li>
          <span>用户性名: </span
          ><input type="text" placeholder="请输入用户名" v-model="yh" />
        </li>
        <li>
          <span>登录密码: </span
          ><input
            type="text"
            name=""
            id=""
            placeholder="请输入登录密码"
            v-model="pwd"
          />
        </li>
        <li>
          <input type="checkbox" v-model="fan" /><span>我以阅读并同意</span
          ><router-link to="">《思麦仁用户注册协议》</router-link>
        </li>
        <li>
          <button :disabled="fan =='' ? true : false" @click="zc">注册</button>
        </li>
        <li>
          <span>已有账号</span><router-link to="/login">请登录</router-link>
        </li>
      </ul>
    </div>
  </div>
</template>
  <script>
export default {
  data() {
    return {
      pic: "",   //图片码
      phone: "",   //手机号
      dx: "",  //短信号
      yh: "",  //用户名
      pwd: "",   //密码
      fan: "",  
      a: "验证码",
      b: "验证码",
      yang:{
         opacity: 0.7 ,
         backgroundImage: '',
      },
      j:0,
      k:0,
      l:0,
      dsq:''
    };
  },
  watch:{
     pic(){
     
     }
  },
  methods: {
     xs(){
               this.yang.opacity = 1;
              setInterval(() => {                           
               this.j = parseInt(Math.random()*255);
               this.k = parseInt(Math.random()*255);
               this.l = parseInt(Math.random()*255); 
               var ss = 'linear-gradient(#'+this.j+',#'+this.k+',#'+this.l+')'
               this.yang.backgroundImage = ss
              },10000/10)
     },
     yc(){
              this.yang.opacity = 0.7;
              this.yang.backgroundImage = ``
              
     },
    yan() {
      this.a = parseInt(Math.random() * 10000);
    },
    yan1() {
      this.b = parseInt(Math.random() * 10000);
    },
    zc() {
      var reg = /^\w{4,15}$/; // 验证用户名
      var regp = /^1[3-9]\d{9}$/; // 验证手机号
      var regy = /^\w{6}$/; //验证密码
      if(this.yh == ''){   //验证用户名
           alert(`用户名不能为空`)
      }else if(!reg.test(this.yh)){
        alert(`用户名不合法`)
        return ;
      }else

      if(this.phone == ''){   //验证手机号
        alert(`手机号不能为空`)
      }else if(!regp.test(this.phone)){
        alert(`请输入正确的手机号`)
         return ;
      }else
// 
      if(this.pwd == ''){  //验证密码
           alert(`密码不能为空`)
      } else if(!regy.test(this.pwd)){
        alert(`密码不合法`)
         return ;
      }else

      if (this.pic != this.b) {  //验证图片
        alert("图片验证输入错误");
        return;
      } else {
        if (this.dx != this.a) {  //验证短信
          alert("短信验证错误");
          return;
        }
      }
      if (reg.test(this.yh) && regp.test(this.phone) && regy.test(this.pwd)) {   //都通过则发送注册请求
        this.axios
          .post("/users/reg", `uname=${this.yh}&&upwd=${this.pwd}`)
          .then((res) => {
            if(res.data.code==200){alert("注册成功");}else {   //已存在
        alert("注册失败,用户名已存在");
      }
      });
      } 
    },
  },
};
</script>
<style lang="scss">

.register {
  background-image: url('/img/res.jpg');
  margin-top: 30px;
  width: 1500px;
  height: 450px;
  background-size: cover;
  padding-left: 40px;
  // background-color: rgb(235, 226, 226);
  padding-top: 10px;
  box-sizing: border-box;
  & > :first-child {
    width: 450px;
ul {
    padding-top: 15px;
     
background-color: rgba($color: #fff, $alpha: 0.7);
      & > :nth-child(6) {
        margin-left: 68px;
        input {
          width: 16px;
          height: 16px;
          vertical-align: middle;
        }
        span {
          font-size: 14px;
        }
        a {
          text-decoration: none;
          color: blue;
        }
      }
      & > :nth-child(7) {
        margin-left: 75px;
        button {
          width: 310px;
          height: 40px;
          outline: none;
          text-decoration: none;
          border: 0;
          background-color: #4cc7cc;
          color: white;
          border-radius: 5px;
        }
      }
      & > :nth-child(8) {
        margin-top: 20px;
        margin-left: 150px;
        font-size: 12px;
        a {
          text-decoration: none;
          color: #666;
          margin-left: 30px;
        }
      }
    }
    li {
      list-style: none;
      margin-bottom: 20px;
      width: 400px;
      height: 30px;
      input {
        outline: none;
        width: 300px;
        height: 30px;
      }
      .picy {
        position: relative;
        right: -320px;
        display: inline-block;
        font-size: 14px;
        width: 50px;
        top: -28px;
        background-color: gray;
      }
      .dxy {
        position: relative;
        right: -320px;
        top: -28px;
        display: inline-block;
        font-size: 14px;
        width: 50px;
        background-color: gray;
      }
    }
  }
}
</style>