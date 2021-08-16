<template>
  <div class="flower">
    <div class="gr">
      <div>
        <div class="im"><img :src="pic" /></div>
        <h4>用户名</h4>
      </div>
      <div class="dd">
        <li><router-link to="/gwc">购物车</router-link></li>
        <li @click="xs">修改头像</li>
      </div>
    </div>
    <div  class="ss" v-show="gai" > 
      <div>
         <img :src="src" alt="">
      </div> <input
      type="file"
      @change="sc($event)"
      name="file"
      id="file"
      multiple="multiple"
    /> <span class="xx" @click="xx">X</span> <button @click="aaa">确认修改</button></div>
       
  </div>
</template>
<script>
import { mapState, mapActions, mapMutations } from "vuex";
export default {
  data() {
    return {
      src: "",
      arr: "",
      gai:false
    };
  },
  computed: {
    ...mapState(["pic", "uid"]),
  },
  methods: {
    ...mapActions(["setuid"]),
    ...mapMutations(["setpic"]),
    sc(event) {
      let file = event.target.files[0];
      let fd = new FormData();
      fd.append("uploadFile", file);
      this.axios
        .post("/users/upload", fd, {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        })
        .then((res) => {
          this.arr = "/upload/" + res.data[0].filename;
          this.src ="/upload/" + res.data[0].filename;
          this.setpic(this.arr);       
        });
    },
    aaa() {

      if(this.src != ''){
      this.axios
        .put("/users/xg", {
          params: {
            uid: this.uid,
            pic: this.arr,
          },
        })
        .then((res) => {
          this.setpic(this.arr);
          console.log(this.arr, this.uid);
          if (res.data.code == 1) {
            alert(`修改成功`);
            this.gai = false;
          }
        });}else{
          alert(`请选择头像`)
        }

    },
    xs(){
      if(this.uid!=null){
         this.gai = true
      }else{
        alert(`您还未登录`)
      }
     
    },
    xx(){
      this.gai = false
    }
  },
  watch: {},
  mounted() {},
};
</script>
<style lang="scss">
.flower {
    position: relative;
  margin-top: 20px;
  background-image: url('/img/banner/banner1.jpg');
  .ss:hover{
    background-color: white;
  }
  .ss{
    position: absolute;
    width: 500px;
    height: 300px;
    z-index: 100;
   top: 50%;
    left: 50%;
    margin-top: -160px;
    margin-left: -250px;
    text-align: center;
    background-color: rgba($color: #9999, $alpha: 0.7);
     &>:first-child{
       margin: 0 auto;
       width: 200px;
       height: 200px;
       margin-bottom: 10px;
       margin-top: 10px;
       border-radius: 50%;
       overflow: hidden;
       img{
         width: 200px;
         height: 200px;
       }
     }
     &>:last-child{
       display: block;
        margin: 0 auto;
        margin-top: 20px;
        width: 80px;
        height: 30px;
        // outline: none;
        border: 0;         
     }
     &>:last-child:hover{
       background-color: #4cc7cc;
       color: white;
     }
     .xx{
       position: relative;
       left: 0100px;
       top: -200px;
     }
  }
  .dd {
  
    li {
      text-align: center;
      height: 55px;
      list-style: none;
      padding-left: 10px;
      a {
        text-decoration: none;
        color: orangered;
      }
    }
  }
  .gr:hover{
    background-color: white;
  }
  .gr {
      position: relative;
      background-color: rgba($color: #999, $alpha: 0.7);
    left: 600px;
    margin: 0 auto;
    width: 400px;
    height: 250px;
    border: 1px solid black;
    & > :first-child {
      padding-top: 10px;
      text-align: center;
      height: 100px;
      img {
        width: 60px;
        height: 60px;
      }
      h4 {
        padding: 0;
        margin: 0;
      }
    }
  }
}
</style>