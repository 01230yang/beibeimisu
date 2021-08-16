<template>
    <div>
        <lunbo/>
        <bz/>
        <aaa/>
        <onebob/>
        <twobob />
        <threebob />
        <four  />
    </div>
</template>
<script>
 import lunbo from './Home.vue'
import Bz from '../components/Bz.vue'
import onebob from  './bod.vue'
import twobob from  './twoL.vue'
import threebob from  './threeL.vue'
import   four from  './four.vue'
import aaa from '../components/Daoh.vue'
import {mapMutations} from "vuex"
export default {
    data(){
        return{
            gunl:0,
        }
    },
    components:{
      lunbo,onebob,twobob,threebob,Bz,four,aaa
    },
    methods:{
    ...mapMutations(['ds'])
    }
    ,
     mounted(){
    setInterval(()=>{
this.gunl =  window.scrollY
    },50)    //700
    this.ds()
  }
}
</script>
