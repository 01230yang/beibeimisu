  module.exports={
//         chainWebpack:config=>{
//           config.plugins.delete("prefetch")
//           //删除index.html开头的带有prefetch属性的link，不要异步下载暂时不需要的页面组件文件
//         },
        devServer:{  //以后都用这个跨域  cuors jsonp  三种跨域
          proxy:{  // 代理
            '/':{  // 暗号
              //  
              target:"http://127.0.0.1:3000",  // 公共基础路径
              changeOrigin:true  , // 是否跨域
           
            }
          }
        }
}
