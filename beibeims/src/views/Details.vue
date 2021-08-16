<template>
  <div class="details">
    <div>
      <div class="pic">
        <div :style="maskStyle" @mousemove="move" @mouseout="toggle">
          <img :src="chu" />
        </div>
        <ul>
          <li @mousemove="gg(1)"><img :src="arr.p" /></li>
          <li @mousemove="gg(2)"><img :src="arr.php" /></li>
          <li @mousemove="gg(3)"><img :src="arr.photo" /></li>
        </ul>
      </div>
      <div class="xiangq">
        <h1>{{ arr.coname }}</h1>
        <ul>
          <li>
            <span>材料</span><span>{{ arr.mater }}</span>
          </li>
          <li>
            <span>包装</span><span>{{ arr.pack }}</span>
          </li>
          <li>
            <span>祝福</span><span>{{ arr.wish }}</span>
          </li>
          <li>
            <span>附送</span><span>{{ arr.presenter }}</span>
          </li>
          <li>
            <span>配送</span><span>{{ arr.distr }}</span>
          </li>
          <li class="jg">
            <span>本店价格</span><span>￥{{ arr.price }}</span
            ><span>{{ arr.sprice }}</span
            ><span>￥238</span>
          </li>
          <li class="ks">
            <span>款式</span
            ><span><input type="radio" name="ks" @click="xz(1)" />A款</span
            ><span><input type="radio" name="ks" @click="xz(2)" />B款</span
            ><span><input type="radio" name="ks" @click="xz(3)" />C款</span>
          </li>
          <li>
            <span>尺寸</span><input type="radio" name="cc" />8寸<input
              type="radio"
              name="cc"
            />12寸<input type="radio" name="cc" />16寸<input
              type="radio"
              name="cc"
            />20寸<input type="radio" name="cc" />24寸
          </li>
          <li class="sl">
            <span>数量</span
            ><button @click="minus" :disabled="pic == 0">-</button
            ><span class="coun">{{ pic }}</span
            ><button @click="add">+</button><span>产品编号:</span><span></span>
          </li>
          <li>
            <button>快速购买</button><button>会员购买</button
            ><button @click="gmai" :disabled="pic == 0">加入购物车</button
            ><button>手机购买</button>
          </li>
        </ul>
      </div>
    </div>
    <div
      class="fdj"
      :style="{
        'background-position': `-${parseInt(maskStyle.left) * 2}px -${
          parseInt(maskStyle.top) * 2
        }px`,
        'background-image': `url(${url})`,
      }"
      v-show="dis"
    ></div>
    <div class="you">
      <ul>
        <li>看了又看</li>
        <li>
          <router-link to="">
            <img src="/img/flower/1.jpg" /><span>￥598</span></router-link
          >
        </li>
        <li>
          <router-link to=""
            ><img src="/img/flower/2.jpg" /><span>￥598</span></router-link
          >
        </li>
        <li>
          <router-link to=""
            ><img src="/img/flower/3.jpg" /><span>￥598</span></router-link
          >
        </li>
      </ul>
    </div>
    <xiang />
  </div>
</template>
<script>
import xiang from "./xiangqing.vue"; //   引入子组件
import { mapState, mapMutations } from "vuex"; //VUEX 保存的全局参数
export default {
  computed: {
    ...mapState(["uid", "spsum"]),
  },
  data() {
    return {
      pic: 0,
      arr: [],
      maskStyle: {
        left: "0",
        top: "0",
      },
      dis: false,
      chu: "",
      url: "",
      gm: 0,
      lid: -1,
      uname: 11,
      sname: "",
      arr2: [],
      ss: 0,
    };
  },
  components: {
    xiang, //注册子组件
  },
  methods: {
    ...mapMutations(["spgx",'gwp']), //VUEX
    zero() {
      this.ss = 0; //每次计算前先归零   否则会一直累加
      if (this.arr2.length >= 0) {
        this.arr2.forEach((a) => (this.ss += parseInt(a.scount)));
        this.spgx(this.ss);
      }
    },
    gmai() {
      if (this.$store.state.uname != null) {
        //  判断用户是否登录登录执行
        this.lid = this.$route.params.lid;
        this.uname = this.$store.state.uname;
        this.sname = this.arr.coname;
        //   this.count = this.pic
        this.axios
          .get(`/users/gwc`, {
            params: {
              sid: this.lid, //商品id
              sname: this.arr.coname, // 商品名字
              scount: this.pic, //数量
              uname: this.$store.state.uname, //用户名
              spic: this.arr.price,
              p:this.arr.p   //商品图片
            },
          })
          .then((res) => {
            //   跳转时调用该表 渲染购物车列表
            this.axios
              .get("/users/gm", {
                params: {
                  uname: this.$store.state.uname, //this.$store.state.可直接获取VUEX 中的state数据
                },
              })
              .then((res) => {
                (this.arr2 = res.data),
                  this.spgx(this.sl),
                  console.log(this.arr);
                //   this.arr =  this.arr.filter(a=>{
                //        return  a.scount !=0
                //    })
              });
          });
        if (this.arr2.length >= 0)
          //判断 数组是否为零 若小于等于零 则不执行
          this.ss = 0;
        this.arr2.forEach((a) => (this.ss += parseInt(a.scount)));
        this.spgx(this.ss);
      } else {
        //否则  弹出请登录
        alert(`请先登录`);
      }
    },
    mo() {
      // this.dis = false
    },
    move(e) {
      //放大镜
      this.dis = true;
      var left = e.offsetX - 120;
      var top = e.offsetY - 120;
      if (left < 0) left = 0;
      else if (left > 380) left = 380; //反方向移动 且不超出范围
      if (top < 0) top = 0;
      else if (top > 380) top = 380; //反方向移动 且不超出范围
      this.maskStyle = {
        left: left + "px",
        top: top + "px",
      };
    },
    toggle() {
        this.dis=false;
    },
    gg(j) {
      //切换图片
      if (j == 1) {
        this.chu = this.p;
        this.url = this.p;
      } else if (j == 2) {
        this.chu = this.php;
        this.url = this.php;
      } else {
        this.chu = this.photo;
        this.url = this.photo;
      }
    },
    minus() {
      if (this.pic > 0) {
        this.pic--;
      }
    },
    add() {
      this.pic++;
    },
    xz(j) {
      if (j == 1) {
        this.chu = this.p;
        this.url = this.p;
      } else if (j == 2) {
        this.chu = this.php;
        this.url = this.php;
      } else {
        this.chu = this.photo;
        this.url = this.photo;
      }
    },
  },
  watch: {
    arr2() {
      // 监听 arr2 发生改变调用该方法
      this.zero();
    },
  },
  mounted() {
    //生命周期函数 挂载      当页面挂载时 调用 获取商品详情 渲染至页面
    this.lid = this.$route.params.lid;
    this.axios
      .get("/users/xq", {
        params: {
          lid: this.lid,
        },
      })
      .then((res) => {
        this.arr = res.data[0];
        this.photo = this.arr.photo;
        this.php = this.arr.php;
        this.p = this.arr.p;
        this.chu = this.arr.p;
        this.url = this.arr.p;
        this.gwp(this.arr.p)
        sessionStorage.setItem('gwpic',this.arr.p)
      });
  },
};
</script>
<style lang="scss">
.details {
  .you {
    padding-top: 0px;
    width: 205px;
    height: 467px;
    background-color: #999;
    position: absolute;
    top: 0px;
    left: 982px;
    box-sizing: border-box;
    img {
      width: 120px;
      height: 120px;
    }
    li {
      margin-top: 4px;
      color: #666;
      list-style: none;
      a {
        color: #999;
      }
      span:hover {
        color: #4cc7cc;
      }
      span {
        position: relative;
        top: -30px;
        left: 0px;
        width: 120px;
        display: inline-block;
        background-color: #fff;
        opacity: 0.7;
      }
    }
  }
  position: relative;
  // display: flex;
  width: 1200px;
  margin: 20px auto;
  & > :first-child {
    //详情外层
    height: 540px;
    .pic {
      //pic div
      width: 410px;
      border: 1px solid #eee;

      & > :first-child {
        width: 380px;
        height: 380px;
        margin: 0 15px;
        & > :first-child {
          width: 380px;
          height: 380px;
        }
      }
      ul {
        display: flex;

        li {
          width: 50px;
          height: 50px;
          list-style: none;
          border: 0.5px solid #eee;
          margin-right: 5px;

          img {
            margin: 0 3px;
            width: 44px;
            height: 44px;
          }
        }
      }
    }
  }
  .xuanz {
    border: 0.5px solid red;
  }
  .xiangq {
    h1 {
      border-bottom: 1px solid #4cc7cc;
      padding-left: 15px;
    }
    width: 570px;
    height: 465px;
    border: 1px solid #eee;
    position: relative;
    right: -410px;
    top: -466px;
    ul {
      padding: 0 0 0 20px;

      .jg {
        span {
          margin-right: 10px;
        }
        & > :nth-child(2) {
          font-size: 16px;
          color: #4cc7cc;
        }
        & > :last-child {
          text-decoration: line-through;
        }
      }
      .ks {
        span {
          margin-right: 20px;
        }
        //  input{

        //  }
      }
      .sl {
        & > :first-child {
          margin-right: 20px;
        }
        button {
          width: 30px;
        }
        .coun {
          display: inline-block;
          width: 40px;
          text-align: center;
        }
        & > :nth-child(5) {
          margin-left: 20px;
        }
        & > :last-child {
          font-size: 14px;
        }
      }
      & > :last-child {
        button {
          width: 100px;
          height: 40px;
          margin-right: 10px;
          background-color: #4cc7cc;
          color: white;
          outline: none;
          border: 0;
        }
      }
    }

    li {
      margin-bottom: 10px;
      list-style: none;
      font-size: 12px;
      color: #999;
      height: 20px;
      & > :first-child {
        font-size: 14px;
        margin-right: 5px;
      }
    }
  }
  .fdj {
    width: 380px;
    height: 380px;
    overflow: hidden;
    border: 1px solid #eee;
    position: absolute;
    top: 10px;
    left: 430px;
    background-image: url("/img/xiangqing/sm1.jpg");
    background-repeat: no-repeat;
    background-color: white;
    background-size: 800px 800px;
  }
}
</style>