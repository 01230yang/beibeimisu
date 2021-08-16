<template>
  <div class="login">
    <div>
      <div>
        <div>
          <ul class="dl">
            <li>
              <span @click="phon">手机号+密码登录</span
              ><span @click="phone">手机号+验证码登录</span>
            </li>
            <li><input type="text" placeholder="手机号" v-model="uname" /></li>
            <li><input type="password" placeholder="密码" v-model="upwd" /></li>
            <li>
              <input
                type="text"
                placeholder="请输入图片验证码"
                v-model="yz"
              /><span class="yz" @click="yan">{{ ma }}</span>
            </li>
            <li>
              <span class="mm"
                ><input type="checkbox" class="dx" />一个月免密登录</span
              >
              <router-link to="" class="wj">忘记密码?</router-link>
            </li>
            <li><button @click="login">登录</button></li>
            <li>
              <span>没有注册?</span>
              <router-link to="/register">立即免费注册>>></router-link>
            </li>
          </ul>
          <div class="erweima">
            <img src="/img/erweima/1.png" alt="" />
            <img src="/img/erweima/2.png" alt="" class="er-2" />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
 <script>
import { mapActions, mapMutations } from "vuex";
export default {
  data() {
    return {
      uname: "",
      upwd: "",
      yz: "",
      ma: "获取验证码",
      ll: false,
    };
  },
  methods: {
    ...mapActions(["vlogin"]),

    login() {
      var reg = /^\w{4,15}$/;
      var regm = /^\w{6}$/;
      if (this.uname == "") {
        alert(`用户名不能为空`);
        return;
      } else if (this.upwd == "") {
        alert(`密码不能为空`);
        return;
      } else if (this.yz != this.ma) {
        alert(`验证码错误`);
        return;
      } else if (reg.test(this.uname) && regm.test(this.upwd)) {
        this.vlogin({
          uname: this.uname,
          upwd: this.upwd,
        })
          .then(() => {
            sessionStorage.setItem("islogin", true);
            sessionStorage.setItem("uname", this.uname);
            alert(`登录成功`);
            this.$router.push("/");
          })
          .catch((msg) => {
            console.log(`失败·`, msg);
            // alert(`登录失败${msg}`)
          });
        //   this.axios.post('/users/login',`uname=${this.uname}&&upwd=${this.upwd}`).then(res=>{
        //   console.log(res.data);
        //   console.log(res.data.result[0].uid);

        //  })
      } else {
        alert("用户名或密码错误");
      }
      //  this.axios.post('/users/login',`uname=${this.uname}&&upwd=${this.upwd}`).then(res=>{
      //   console.log(res);
      //  })
    },
    zc() {
      this.axios
        .post("/users/reg", `uname=${this.name}&&upwd=${this.pwd}`)
        .then((res) => {
          console.log(res);
        });
    },
    yan() {
      this.ma = parseInt(Math.random() * 10000);
    },
    phon() {
      if (this.$route.path != "/login") {
        this.$router.push("/login");
      }
    },
    phone() {
      this.$router.push("/loginp");
    },
  },
  mounted() {},
};
</script>
<style lang="scss">
.login {
  width: 100%;
  height: 475px;
  background-image: url("/img/userlogin_bg.jpg");
  .erweima {
    width: 100px;
    border-left: 1px solid #eee;
    position: relative;
    left: 370px;
    top: -300px;
    img {
      width: 80px;
      margin-left: 5px;
      margin-bottom: 20px;
    }
  }
  & > :first-child {
    width: 1200px;
    height: 475px;
    margin: 0 315px;
    & > :first-child {
      padding: 10px 0 0 0;
      background-color: #fff;
      width: 500px;
      height: 352px;
      float: right;
      margin-top: 60px;
      margin-right: 20px;
      & > :first-child {
        width: 350px;
        height: 352px;
      }
    }
  }
  .dl {
    box-sizing: border-box;
    list-style: none;
    padding: 0;
    margin: 0 13px;
    & > :nth-child(2) {
      background-image: url("/img/login/yonghu.png");
      background-size: 30px;
      background-repeat: no-repeat;
      background-position: 0px 0;
    }
    & > :nth-child(3) {
      background-image: url("/img/login/mima_1.png");
      background-size: 30px;
      background-repeat: no-repeat;
      background-position: 0px 0;
    }
    & > :nth-child(4) {
      background-image: url("/img/login/mima_1.png");
      background-size: 30px;
      background-repeat: no-repeat;
      background-position: 0px 0;
    }
    & > :nth-child(7) {
      margin-top: 20px;
      span {
        color: #555;
        font-size: 13px;
      }
      a {
        margin-left: 10px;
        color: red;
      }
    }
    li {
      width: 280px;
      height: 40px;
      margin: 0 35px;
      margin-bottom: 2px;
      input {
        outline: none;
        border: 1px solid #ddd;
        width: 239px;
        height: 30px;
        margin-left: 29px;
      }
    }
    & > :first-child {
      font-size: 13px;
      color: #555555;
      line-height: 35px;
      & > :first-child {
        text-align: center;
        display: inline-block;
        width: 135px;
        height: 35px;
        background-color: #4cc7cc;
        border-radius: 5px;
      }
    }
    .yz {
      position: relative;
      top: -28px;
      left: 190px;
      background-color: gray;
      font-size: 14px;
    }
    button {
      width: 280px;
      height: 40px;
      color: white;
      background-color: #4cc7cc;
      text-decoration: none;
      border: 0;
    }
    .dx {
      width: 16px;
      height: 16px;
      margin-left: 05px;
      margin-top: 0px;
      vertical-align: middle;
    }
  }
  a {
    text-decoration: none;
    font-size: 13px;
  }
  .mm {
    font-size: 13px;
    line-height: 35px;
  }
  .wj {
    margin-left: 100px;
    color: #555555;
  }
}
</style>