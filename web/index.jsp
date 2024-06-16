<%--
  Created by IntelliJ IDEA.
  User: 18048
  Date: 2024/6/6
  Time: 下午3:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <title>Arknights</title>
    <meta name="referrer" content="no-referrer">
    <link rel="icon" href="./img/favicon.ico">
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <style>
        body{
            /*backgrand-color:#f0f2f5;*/
            background-image: url("./img/background_login.jpg");
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;

        }

        .login{
            background-color: rgba(255,255,255,0.8);
            width:500px;
            height:450px;
            border-radius: 10px;
            margin: 200px auto;
        }
        h1{
            text-align: center;
            padding-top: 50px;
        }
        .login-form{
            padding-top: 30px;
            margin: 40px;
        }
        .l-butoom{
            text-align: center;
            padding-top: 50px;
        }
        button{
            width: 100px;
            height: 40px;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .span1{
            margin-left: 50px;
            margin-right: 70px;
            font-size: 10px;
        }
        .span2{

            font-size: 10px;
        }
    </style>
</head>
<body>
<div id="app">
    <div class="login">
        <h1> Welcome back</h1>
        <el-form label-width="100px" class="login-form">
            <el-form-item label="Username">
                <el-input v-model="userInfo.username" placeholder="Please enter your username" style="width: 300px"></el-input>
            </el-form-item>
            <el-form-item label="Password">
                <el-input v-model="userInfo.password" placeholder="Please enter your password" style="width: 300px" show-password></el-input>
            </el-form-item>
        </el-form>
        <div class="l-butoom">
            <button @click="login">Login</button>
        </div>
        <span class="span1">Forgot your password?<a href="view/forget.jsp">Click to retrieve</a></span>
        <span class="span2">No account?<a href="view/register.jsp">Click to register</a></span>
    </div>


</div>
</body>
    <script src="./js/jquery-3.5.0.js"></script>
    <script src="https://unpkg.com/vue@2/dist/vue.js"></script>
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script>
        new Vue({
            el: '#app',
            data() {
                return {
                    userInfo:{
                        username:'',
                        password:''
                    },
                }
            },
            methods: {
                login() {
                    let _this = this
                    console.log(this.userInfo.username)
                    console.log(this.userInfo.password)
                    $.ajax({
                        url: "http://localhost:8080/servlet/login",
                        type: "post",
                        data: {
                            //网页网络负载里面可任意看到
                            name: this.userInfo.username,
                            pwd: this.userInfo.password,
                        },
                        dataType:"JSON",    //返回的数据格式
                        success: function(data) {   //返回函数
                            console.log(data)
                            console.log(data.code)
                            if(data.code === 200){
                                _this.$message.success(data.info)
                                setTimeout(function () {
                                    window.location.href = "view/home.jsp"
                                },1000)

                            }else {
                                setTimeout(function () {
                                    _this.$message.error(data.info)
                                },1000);
                            }

                        }
                    })
                }
            }
        })
    </script>

</html>
