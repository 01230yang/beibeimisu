<template>
  <div class="gwc">
    <div>{{ $store.state.uname }}的购物车</div>
    <ul v-show="sum != 0">
      <li>
        <span>编号</span><span>商品名字</span><span>商品数量</span
        ><span>商品单价</span><span>商品小计</span><span>删除</span>
      </li>
      <li v-for="(i, j) of arr" :key="j">
        <span>0{{ j + 1 }}</span>
        <span><img :src="i.p" alt="">{{ i.sname }}</span>
        <span>0{{ i.scount }}</span>
        <span>￥{{ i.spic }}.00</span>
        <span>￥{{ i.scount * i.spic }}.00</span>
        <span
          ><button @click="delet(i.id)" :disabled="arr.length == 0">
            删除
          </button></span
        >
      </li>
    </ul>
    <div v-if="sum != 0">合计:￥{{ sum }}.00</div>
    <button
      @click="skpl"
      class="skpl"
      :disabled="arr.length == 0"
      v-if="sum != 0"
     >
      付款
    </button>
    <div v-show="sum == 0">
      购物车空空 快去看看 <router-link to="/">点击跳转,首页!</router-link>
    </div>
  </div>
</template>
 <script>
import { mapMutations,mapState } from "vuex";
export default {
  data() {
    return {
      arr: [],
      sum: 0,
      w: 0,
      sl: 0,
    };
  },
  computed:{
         ...mapState(['gwpic'])
  },
  methods: {
    ...mapMutations(["spgx"]),
    he() {
      if (this.arr.length >= 0) {
        this.sum = 0; //每次计算前先归零   否则会一直累加
        this.arr.forEach((a) => (this.sum += a.scount * a.spic));
        this.sl = 0; //每次计算前先归零   否则会一直累加
        this.arr.forEach((a) => (this.sl += parseInt(a.scount)));
      }
    },
    delet(i) {
      //删除商品
      if (this.arr.length >= 0) {
        this.w++;
        this.axios
          .get("/users/del", {
            params: {
              id: i,
              uname: this.$store.state.uname,
            },
          })
          .then((res) => {
            this.he(), //删除商品时 该方法更新购物车商品数量 出现计算总价
              this.spgx(this.sl);
          });
      }
    },
    gw() {
      //   跳转时调用该表 渲染购物车列表

      this.axios
        .get("/users/gm", {
          params: {
            uname: this.$store.state.uname,
          },
        })
        .then((res) => {
          this.arr = res.data;
          console.log(res.data);
          this.he();
          this.spgx(this.sl);
          //   this.arr =  this.arr.filter(a=>{
          //        return  a.scount !=0
          //    })
          console.log(res.data);
        });
    },
    skpl() {
      // 用户付款成功  删除该表
      this.axios
        .get("/users/de", {
          params: {
            uname: this.$store.state.uname,
          },
        })
        .then((res) => {
          console.log(res.data);
          (this.arr = 0), (this.w = 0);
          alert(`购买成功即将跳转回首页`);
          console.log(this.arr);
          this.$router.push("/"); //跳转回首页
        });
    },
  },
  watch: {
    w() {
      //监听  发生变化是自动调用
      this.gw(), this.he(), this.spgx(this.sl); 
    },
  },
  mounted() {
    this.gw();
    //    this.axios.get('/users/gm',{
    //        params:{
    //            uname:this.$store.state.uname
    //        }
    //    }).then(res=>{
    //        this.arr = res.data
    //       this.arr =  this.arr.filter(a=>{
    //            return  a.scount !=0
    //        })

    //           this.arr.forEach(a=>
    //                this.sum += a.scount * a.spic
    //         )
    //           console.log(res.data);
    //           })
  },
};
</script>
<style lang="scss" >
.gwc {
  position: relative;
  & > :last-child {
    text-align: center;
    margin: 0px auto;
    width: 600px;
    height: 300px;
    font-size: 32px;
    padding-top: 120px;
    box-sizing: border-box;
    a {
      text-decoration: none;
      color: #000;
    }
    a:hover {
      color: #4cc7cc;
    }
  }

  .skpl {
    width: 200px;
    height: 60px;
    outline: none;
    border: 0;
    position: relative;
    right: -800px;

  }
  .skpl:hover {
    background-color: rgb(163, 163, 130);
    color: white;
  }
  width: 1000px;
  margin-left: 200px;
  & > :first-child {
    text-align: center;
    color: rgb(133, 133, 51);
    font-size: 30px;
  }
  ul {
    width: 968px;
    li {
      border-radius: 5px;
      list-style: none;
      margin-bottom: 10px;
      border: 1px solid #999;
      text-align: center;
      img{
        width: 25px;
        vertical-align: middle;
      }
      & > :first-child {
        text-align: center;
      }
      & > :nth-child(2) {
        color: #666;
      }
      & > :nth-child(4) {
        text-align: center;
      }
      span {
        display: inline-block;
        width: 160px;
        height: 40px;
        line-height: 40px;
        border-left: 1px solid #999;

        button {
          width: 80px;
          margin: 0 auto;
          outline: none;
          color: #999;
          border: 0;
        }
        button:hover {
          background-color: red;
          color: white;
        }
      }
    }
    & > :first-child {
      span {
        text-align: center;
        color: #000;
      }
    }
  }
}
</style>