import axios from 'axios'
import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import Startheader from './components/Ye-header.vue'
import Starth from './components/Ye2-header.vue'
import Erji from './components/erji.vue'
import Wei from './components/Wei.vue'
import Left from './views/left.vue'

Vue.prototype.axios = axios
Vue.config.productionTip = false

Vue.component('start',Startheader)
Vue.component('start-s',Starth)
Vue.component('erji',Erji)
Vue.component('wei',Wei)
Vue.component('left',Left)
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
