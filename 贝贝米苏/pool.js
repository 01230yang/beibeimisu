const mysql = require('mysql');//引入MySQL模块
const pool  = mysql.createPool({
  host:'127.0.0.1',
  port:'3306',
  user:'root',
  password:'',
  database:'bbms',
  connectionLimit:30
  });
  module.exports =pool;
