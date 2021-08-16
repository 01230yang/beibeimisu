<template>
  <div class="erji">
    <div>
      <ul>
        <li @mousemove="fi" @mouseleave="fr">
          <div class="dd">
            <span>三</span><router-link to="" class="spfl">商品分类</router-link
            ><span>{{ z }}</span>
          </div>
          <ul v-show="fir">
            <li @mousemove="xx" @mouseleave="cq">
              <div><span>❀</span>鲜奶蛋糕<span class="dw">></span></div>
              <ul class="sanji" v-show="h">
                <li>按用途</li>
                <li class="san-1">
                  <span>蛋糕</span>
                  <span>鲜奶蛋糕</span>
                  <span>鲜奶蛋糕</span>
                  <span>水果蛋糕</span>
                  <span>水果蛋糕</span>
                  <span>烧烤蛋糕</span>
                </li>
                <li>
                  <span>蛋糕</span>
                  <span>鲜奶蛋糕</span>
                  <span>水果蛋糕</span>
                  <span>水果蛋糕</span>
                  <span>烧烤蛋糕</span>
                  <span>烧烤蛋糕</span>
                </li>
                <li>
                  <span>蛋糕</span>
                  <span>鲜奶蛋糕</span>
                  <span>鲜奶蛋糕</span>
                  <span>水果蛋糕</span>
                  <span>烧烤蛋糕</span>
                  <span>烧烤蛋糕</span>
                </li>
              </ul>
            </li>
             <li @mousemove="xx" @mouseleave="cq">
              <div><span>❀</span>水果蛋糕<span class="dw">></span></div> </li>
             <li @mousemove="xx" @mouseleave="cq">
              <div><span>❀</span>祝福蛋糕<span class="dw">></span></div> </li>
             <li @mousemove="xx" @mouseleave="cq">
              <div><span>❀</span>祝寿蛋糕<span class="dw">></span></div> </li>
             <li @mousemove="xx" @mouseleave="cq">
              <div><span>❀</span>奶油蛋糕<span class="dw">></span></div> </li>
             <li @mousemove="xx" @mouseleave="cq">
              <div><span>❀</span>绿色植物<span class="dw">></span></div> </li>
             <li @mousemove="xx" @mouseleave="cq">
              <div><span>❀</span>毛绒玩具<span class="dw">></span></div> </li>
          </ul>
        </li>
        <li  class="sp">
          <router-link to="/"> 首页 </router-link>
        </li>
        <li  class="sp">
          <router-link to="/"> 蛋糕 </router-link>
        </li>
        <li  class="sp">
          <router-link to="/"> 鲜花 </router-link>
        </li>
        <li  class="sp">
          <router-link to="/"> 巧克力 </router-link>
        </li>
        <li  class="sp">
          <router-link to="/"> 毛绒玩具 </router-link>
        </li>
        <li  class="sp">
          <router-link to="/"> 公仔 </router-link>
        </li>
        <li  class="sp">
          <router-link to="/"> 绿色植物 </router-link>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      arr: ["首页", "蛋糕", "鲜花", "巧克力", "毛绒玩具", "公仔", "绿色植物"],
      str: [
        "蛋糕,鲜奶蛋糕,水果蛋糕",
        "爱情鲜花,红玫瑰",
        "开业花篮",
        "巧克力",
        "毛绒玩具",
        "公仔",
        "绿色植物",
        "月饼",
      ],
      tabone: [
        "生日蛋糕",
        "创意蛋糕",
        "怀旧经典",
        "情侣蛋糕",
        "儿童蛋糕",
        "祝寿蛋糕",
        "麻将蛋糕",
        "庆典蛋糕",
        "送家人",
        "送朋友",
      ],
      tabtwo: [
        "鲜奶蛋糕",
        "水果蛋糕",
        "巧克力蛋糕",
        "慕思蛋糕",
        "提拉米苏",
        "冰淇淋蛋糕",
        "芝士蛋糕",
        "抹茶蛋糕",
        "全麦蛋糕",
        "烤肉蛋糕",
        "蛋糕",
      ],
      tab2three: [
        "心形",
        "方形",
        "原形",
        "多层",
        "弧形",
        "生肖",
        "动物",
        "星座",
        "手办",
        "电脑",
        "试卷",
      ],
      t: false,
      fir: true,
      z: "↑",
      h:false
    };
  },
  methods: {
    xx() {   //显示
      this.h = true;
    },
    cq() {   //隐藏
    this.h = false
    },
    fi() {   //显示变更箭头
      this.fir = true;
      this.z = "↓";
    },
    fr() {   //隐藏 变更箭头
      this.fir = false;
      this.z = "↑";
    },
  },
};
</script>
<style lang="scss">
.erji {
  width: 100%;
     z-index: 100;
     position: relative;
  .sanji {
    position: absolute;
    z-index: 100;
    top:0px;
    right: -245px;
    width: 400px;
    height: 400px;
    background-color: white;
       li {
           border: 0;
           padding-left: 10px;
           text-align: center;

        span{
            display: inline-block;
            width: 60px;
            height: 40px;
            background-color: #4cc7cc;
            margin-right: 3px;
            border-radius: 5px;
            
        }
    }
  }
  & > :nth-child(1) {
    width: 1200px;
    height: 47px;
    line-height: 47px;
    margin-left: 200px;
    margin-top: 20px;
    
    ul {
      list-style: none;
      display: flex;
     
     
      li {
        margin-right: 35px;
         background-color: white;
         height: 47px;
          
      }
      & > :first-child {
        width: 230px;
        padding: 0 10px;
        box-sizing: border-box;
        .dd {
          background-color: #4cc7cc;
        }
        .spfl {
          margin: 0 35px;
          text-decoration: none;
          color: white;
        }
        ul {
          background-color: white;
          width: 210px;
        }
        ul {
          padding: 0;
          font-size: 12px;
          width: 245px;
          flex-wrap: wrap;
          li {
            width: 210px;
            position: relative;
            padding: 0;
            font-size: 13px;
            color: #666666;
            border-bottom: 1px dotted #4cc7cc;
            .dw {
              position: absolute;
              right: 0;
            }
          }
        }
      }
    }
  }
  .zf {
    width: 500px;
    position: absolute;
    left: 570px;
    top: 80px;
    a {
      font-size: 12px;
      width: 70px;
      border-radius: 5px;
      color: white;
    }
    & > :first-child {
      margin-left: 10px;
    }
    .bt {
      display: flex;
      font-size: 16px;
      position: relative;
      width: 500px;
      height: 30px;
      flex-wrap: wrap;
      text-align: center;
      line-height: 30px;
      a {
        text-decoration: none;
        margin: 10px;
        background-color: #4cc7cc;
      }
    }
    .zf-2 {
      position: relative;
      top: 80px;
      .bt-2 {
        padding: 5px;
        display: flex;

        position: relative;
        width: 500px;
        height: 30px;
        flex-wrap: wrap;
        text-align: center;
        line-height: 30px;
        border-radius: 15px;
        color: #666666;
      }
      a {
        margin: 10px;
        background-color: #4cc7cc;
        text-decoration: none;
      }
    }
  }
  .sp {
      margin-left: 20px;
    a {
      text-decoration: none;
      color: #666666;
    }
  }
}
</style>