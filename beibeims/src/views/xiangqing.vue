<template>
  <div class="xiangqing">
    <div>
      <ul class="tou">
        <li @click="spx(1)"><router-link to="">商品详情</router-link></li>
        <li @click="spx(2)"><router-link to="">常用祝福语</router-link></li>
        <li @click="spx(3)"><router-link to="">评价详情</router-link></li>
      </ul>
    </div>
    <div v-if="t == 1">
      <div class="title">
        <span>商品详情</span>
      </div>
      <img :src="arr.evaluate" />
    </div>
    <div class="cyzf" v-else-if="t == 2">
      <div class="title">
        <span>常用祝福语</span>
      </div>
      <ul>
        <li v-for="(i, j) of arr11" :key="j">
          <img src="/img/1.gif" alt="" /><router-link to="">{{
            i
          }}</router-link>
        </li>
      </ul>
    </div>
    <div class="sppj" v-else-if="t == 3">
      <div class="title"><span>商品评价</span></div>
      <div>
        <ul>
          <li style="width: 930px">
            <img src="/img/face.png" /><span class="yh"
              ><span>用户评价:</span><span style="color: red">❤❤❤❤❤</span></span
            ><span class="pj">味道不错</span>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      arr11: [
        "七夕节祝福语",
        "11.11光棍节祝语",
        "520网络情人节",
        "3.8妇女节祝福语",
        "长辈生日祝福语",
        "父亲节祝福语",
        "教师节祝福语",
        "母亲节祝福语",
        "情人节祝福语",
        "生子祝福语",
        "圣诞祝福语",
        "新婚祝福语",
        "中秋祝福语",
        "开业祝福语",
        "道歉祝福语",
        "恋人祝福语",
        "生日祝福语",
        "朋友祝福语",
      ],
      t: 1,
      arr: [],
      sid: "",
    };
  },
  methods: {
    spx(i) {
      this.t = i; // 根据用户点击  分别显示不同 商品介绍
    },
  },
  mounted() {
    this.sid = this.$route.params.lid; //路由传参 $route 当前触发的路由   params表示路由携带的参数
    this.axios
      .get("/users/xq", {
        //根据路由ID 发送请求 获取商品介绍信息
        params: {
          lid: this.sid,
        },
      })
      .then((res) => {
        this.arr = res.data[0];
      });
  },
};
</script>
<style  lang="scss">
.xiangqing {
  margin-left: 100px !important;
  .sppj {
    width: 930px;
    ul {
      li {
        border-bottom: 1px solid #999;
        margin-bottom: 10px;
        height: 80px;

        .pj {
          font-size: 13px;
          color: #333;
          display: inline-block;
          position: relative;
          width: 830px;
          height: 40px;
          left: 50px;
          top: -50px;
          margin-left: 20px;
        }
        position: relative;
        .yh {
          position: relative;
          top: -50px;
          left: 50px;
          display: inline-block;
          width: 830px;
          height: 20px;
          font-size: 12px;
          color: #666;
          border-bottom: 1px dashed #666;
          & > :last-child {
            float: right;
          }
        }
        width: 830px;
        list-style: none;
        & > :first-child {
          width: 50px;
          height: 50px;
          margin-left: -10px;
        }
      }
    }
  }
  .cyzf {
    width: 930px;
    ul {
      height: 200px;
      li {
        font-size: 12px;
        float: left;
        color: #666;
        list-style: none;
        width: 150px;
        height: 20px;
        line-height: 20px;
        img {
          vertical-align: middle;
        }
        a {
          text-decoration: none;
          color: #333;
        }
      }
    }
  }
  .title {
    width: 930px;
    height: 36px;
    border-bottom: 1px solid #d37b77;
    text-align: center;
    box-sizing: border-box;
    margin-bottom: 40px;
    span {
      display: inline-block;
      margin-top: 15px;
      font-size: 24px;
      color: #d37b77;
      width: 200px;
      background-color: white;
    }
  }
  margin-left: 200px;
  .tou {
    padding: 0;
    border-top: 1px solid #eee;
    border-right: 1px solid #eee;
    border-left: 1px solid #eee;
    border-bottom: 1px solid #eee;
    width: 980px;
    height: 44px;
    background-color: #f5f5f5;
    box-sizing: border-box;
    li {
      float: left;
      list-style: none;
      box-sizing: border-box;
      background-color: white;

      border-top: 1px solid #eee;
      border-right: 1px solid #eee;
      border-left: 1px solid #eee;
      border-bottom: 1px solid #eee;
      a {
        text-align: center;
        width: 100px;
        display: inline-block;
        line-height: 44px;
        text-decoration: none;
        color: #666;
      }
      a:hover {
        color: #4cc7cc;
      }
    }
  }
}
</style>
