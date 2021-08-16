import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    uid: sessionStorage.getItem('uid'),
    uname: sessionStorage.getItem('uname'),   //放入浏览器 零时缓存 不会因为刷新而重置 当页面关闭时清除
    islogin: sessionStorage.getItem('islogin'),
    search: [],
    spsum: 0,
    pic :sessionStorage.getItem('pic'),
    gwpic:sessionStorage.getItem('gwpic'),
     tt :0
  },
  mutations: {
    setuid(state, uid) {    //修改 VUEX.state 只能通过  mutations 方法 不能直接修改
      state.uid = uid
    },
    setuname(state, uname) {    //修改登录名
      state.uname = uname
      state.islogin = true
    },
     setpic(state,pic){
       state.pic = pic
     },
    spgx(state, i) {
      state.spsum = i
    },
    gwp(state,i){
       state.gwpic = i
    },
    ds(state){
      setInterval(()=>{
        state.tt = document.documentElement.scrollTop
      },50)
    }
  },
  actions: {
      grxx(){
           this.axios.get('/user/')
      },
    tuic() {
      sessionStorage.removeItem('uname')
    },
    vlogin(context, all) {   //异步请求 callback 或者 promise 
      return new Promise(
        function (resolve, reject) {
          axios.post(
            "/users/login",
            `uname=${all.uname}&upwd=${all.upwd}`
          ).then(result => {
            if (result.data.code == 200) {
              context.commit(   //在VUEX 中只能使用 content.commit 调用其中的方法
                "setuid", result.data.result[0].uid
              );
              context.commit(
                "setuname", result.data.result[0].uname
              );
              context.commit('setpic',result.data.result[0].pic)
              sessionStorage.setItem('pic',result.data.result[0].pic)
              sessionStorage.setItem('uid',result.data.result[0].uid)
                console.log(    sessionStorage.setItem('pic',result.data.result[0].pic));
              resolve();
            } else {
              reject(result.data.msg);
            }
          })
        }
      )
    }
  },
  modules: {
  }
})
