const express = require('express'); //引入express 模块
const  bodyParser = require('body-parser'); //引入body.parser中间件 
const  userRouter = require('./router/users'); //引入用户路由器
//const pool = require('./pool.js')

const app = express();//创建web服务器
app.listen(3000,()=>console.log(`快跑`)); //设置端口
//使用body-parser 中间件 将post 请求的的数据解析为对象
app.use(bodyParser.urlencoded({
    extended:false
}))
app.use(bodyParser.json())
//
//http://127.0.0.1:3000/users/yh
app.use( express.static('./public') );
//挂载路由
app.use('/users',userRouter);

// app.get('/yh',(req,res,next)=>{
//    if(err)  {  next(err);return;}
//    console.log(111)
// })


// 





//添加错误处理的中间件，拦截所有产生的错误
app.use((err,req,res,next) => {
//err 拦截到的错误
console.log(err);
//一旦错误 响应500，服务器错误
res.send({code:500,msg:'服务器错误'});
});
