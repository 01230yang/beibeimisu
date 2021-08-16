import Vue from 'vue'
import VueRouter from 'vue-router'
// import { component } from 'vue/types/umd'
import zhu from '../views/zhu.vue'


Vue.use(VueRouter)

const routes = [
  {
    path:'/',
    component:zhu            //主页
  },{
     path:'/register',
     component:()=>import(/*  webpackChunkName: "register"*/ '../views/Register.vue') //跳转注册
  },
  {
    path:'/login', 
    component:()=>import(/*webpackChunkName:"login" */ '../views/Login.vue')  // 跳转登录
  },
  {
    path:'/loginp',
    component:()=>import( /* webpackChunkName:"register"*/'../views/Loginp.vue')  // 跳转手机登录
  },{
    path:'/details/:lid',
    component:()=>import(/* webpackChunkName:"details"*/'../views/Details.vue') //跳转商品详情路由
  },{
    path:'/xiangqing',
    component:()=>import( /* webpackChunkName:"xiangqing"*/ '../views/xiangqing.vue')  //跳转商品介绍
  },{
    path:'/gwc',
    component:()=>import( /* webpackChunkName:"gouwuche"*/ '../views/Gwc.vue')  // 跳转购物车 路由
  },{
    path:'/flower',
    component:()=>import('../views/flower.vue')
  },{
    path:'*',
    component:()=>import('../views/notfound.vue')
  },{
    path:'/timer',
    component:()=>import('../components/Timer.vue')
  }
]
const router = new VueRouter({
   mode:'hash',
   base:process.env.BASE_URL,
  routes

})

export default router
