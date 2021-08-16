const { resolveSoa } = require('dns');
const express = require('express');  //引入express框架
const r = express.Router();  //创建路由器
const pool =  require('../pool.js');//引入连接池

/**.............................. */
//配置multer中间件
const multer = require('multer')
const uuid = require('uuid')
obj = multer.diskStorage({
  destination : function(req, file, cb){ //指定目录
    cb(null, 'public/upload')
  },
  filename : function (req, file, cb){ // 指定文件名
    // console.log(uuid.v1())
    // console.log(uuid.v4())
    let name = file.originalname
    // name:  abcd.jpg    xxxdfdd.zip
    let ext = name.substr(name.lastIndexOf('.'))
    cb(null, uuid.v4() + ext)
  }
})
const uploadTools = multer({
  storage : obj
})
//接收请求
r.post('/upload',
  uploadTools.array('uploadFile'), (req, res)=>{
    res.send(req.files)
})
r.put('/xg',(req,res,next)=>{
    var uid = req.body.params.uid;
   
    var pic = req.body.params.pic;
   
    pool.query(`update user set pic= ? where uid= ?`,[pic,uid],(err,result)=>{
        console.log(111);
        if(err) {next(err); return}else{
            res.send({code:1, d:result})
            
        }
    }
)})
/**................................ */


// 头部广告
r.get('/yh',(req,res,next)=>{
   pool.query('select * from user ',(err,result) => {
    if(err)  {  next(err);return;}
    res.send(result)
})
})
//轮播
r.get('/lb',(req,res,next)=>{
    pool.query('select * from slideshow',(err,result)=>{ if(err)  {  next(err);return;}
    res.send(result)})
})
//获取页头
r.get('/yt',(req,res,next)=>{
    pool.query('select * from starthead',(err,result)=>{ if(err)  {  next(err);return;}
    res.send(result)})
})

r.get('/xq',(req,res,next)=>{
    let id = req.query.lid
    pool.query('select * from commodity where coid=?',[id],(err,result)=>{ if(err)  {  next(err);return;}
    res.send(result)})
})
r.get('/ss',(req,res,next)=>{
    let coname = req.query.coname
    console.log(coname);
    pool.query('select  * from commodity where coname like  ?',[`%${coname}%`],(err,result)=>{ if(err)  {  next(err);return;}
    res.send(result)
    console.log(result);
})
})
//根据id 获取商品信息
r.get('/sp',(req,res,next)=>{
    let id = req.query.id
    pool.query('select bid,photo,jie,oldprice,newprice from bod where bid=?',[id],(err,result)=>{
        if(err){
            next(err);
            return;
        }
     res.send(result)
    })
})



// 1f 商品
r.get('/bod',(req,res,next)=>{
    pool.query('select * from bod',(err,result)=>{if(err){next(err);return;} 
                       res.send(result)
})

})
//2F 商品
r.get('/twobob',(req,res,next)=>{
    pool.query('select * from twobob',(err,result)=>{
        if(err){
            next(err);
            return;
        }else{
            res.send(result)
        }
    })
})
// 3F商品
r.get('/threebob',(req,res,next)=>{
    pool.query('select * from threebob',(err,result)=>{
        if(err){
            next(err);
            return;
        }else{
            res.send(result)
        }
    })
})
r.get('/details',(req,res,next)=>{
    pool.query('select * from commodity',(err,result)=>{
        if(err){
            next(err);
            return;
        }else{
            res.send(result)
        }
    })
})

  // 登录
r.post('/login',(req,res,next)=>{
    var str = req.body
  pool.query('select * from user where uname=? and upwd=?',[str.uname,str.upwd],(err,result)=>{
      if(err){
          next(err); 
          return;  
      }
      if(result.length ===0){
          res.send({
              code:201,msg:'登录失败'
          })
      }else{
          res.send({
              code:200,msg:'登录成功',result:result
          })
      }
  })
})
// 注册
r.post('/reg',(req,res,next)=>{
    var str = req.body
    pool.query('select * from user where uname=?',[str.uname],(err,result)=>{
        if(err){next(err);return;}else{
            let l = result.length;
            if(l == 0){
                pool.query('insert into user set ?',[str],(err,result)=>{
                    if(err){next(err);return};
                res.send({code:200,
                          msg:'注册成功'
                         });
                })
            }else{
                res.send({code:201,msg:'用户名以存在'})
            }
        }
    })
})
// 购物车 
r.get('/gwc',(req,res,next)=>{
    console.log(111);
    console.log(req.query);
    var sid = req.query.sid;   //商品id
    var sname = req.query.sname;   //商品名字
    var scount = req.query.scount;  // 商品数量
    var spic = req.query.spic  ;  //  商品价格
    var  n = 'gwc' + req.query.uname;  //用户名
    // console.log(sid,sname,scount,spic,n);
    /* pool.query(`select * from user_tables where table_name ='${n}'`,(err,result)=>{
    //     if(err) {next(err) ; return ;}else{
    //          exist = res.send(result)}
    //          console.log(exist);
    // }
    // ) 
    // if( exist !='' )
    // {  //null,sid,sname,scount,spic
    //     pool.query(` insert into ${n} set ? `,[req.query],(err,result)=>{  if(err){
    //         next(err);
    //         return;
    //     }else{
    //         res.send(result)
    //         console.log(result);
    //     }
    // }) 
    // }
    //    else{
    //        console.log('没有');  */
     //根据用户id 建表 保存用户购物车数据
        pool.query(`CREATE TABLE ${n}(    
            id int AUTO_INCREMENT PRIMARY KEY,
            sid varchar(128),
            sname varchar(128),
            scount varchar(128)  default '0' ,
            uname varchar(128),
            spic varchar(128),
            p varchar(128)
        ); `)
        /* .....................................*/             
        //  pool.query(`select scount from ${n} where sid= ? `,[sid],(err,result)=>{
        //            if(result[0].scount==undefined){
        //             pool.query(`insert into ${n} set ? `,[req.query],(err,result)=>{  // 表里添加商品数据
        //                 if(err){
        //                     next(err);
        //                     return;
        //                 }else{
        //                     // res.send(result)
        //                     // console.log(result);
        //                 }
        //             })   
        //            }else{
        //             pool.query(`update ${n} set scount= ? where sid =?`,[result[0].scount+scount,sid])
        //                return ; 
        //            }
        // })
    // if( count =1  ){
    //     pool.query(``)
    // }
        /* .....................................*/
        pool.query(`insert into ${n} set ? `,[req.query],(err,result)=>{  // 表里添加商品数据
            if(err){
                next(err);
                return;
            }else{
                res.send(result)
                // console.log(result);
            }
        })
})

r.get('/gm',(req,res,next)=>{      // 跳转购物车表渲染页面上购物车内属性 
    var uname = req.query.uname;
    var  n = 'gwc' + req.query.uname; 
    pool.query(`select * from ${n} `,(err,result)=>{
        if(err){next(err); return; }else{
            res.send(result)
        } 
    }) 
})
r.get('/del',(req,res,next) =>{   // 用户删除不想要的 商品
    var  n = 'gwc' + req.query.uname; 
     pool.query(`delete from ${n} where id=?`,[req.query.id],(err,result)=>{
         if(err){next(err); return;}else{
             res.send(result)
         }
     })
})
r.get('/de',(req,res,next) =>{    // 当用户付款后删除此表 或者用户清空购物车时 删除此表 表示购物车没有东西
    var  n = 'gwc' + req.query.uname; 
     pool.query(`drop table ${n} `,(err,result)=>{
         if(err){next(err); return;}else{
             res.send(result)
         }
     })
})
//用户上传信息



module.exports = r;