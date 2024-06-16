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
    <title>Arknights  - Forget</title>
    <link rel="icon" href="../img/favicon.ico">
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <style>
        body{
            /*backgrand-color:#f0f2f5;*/
            background-image: url("../img/background_forget.jpg");
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
        .forget{
            background-color: rgba(255,255,255,0.8);
            width:500px;
            height:450px;
            border-radius: 10px;
            margin: 200px auto;
            box-shadow: 0 2px 4px rgba(0,0,0,.12),0 0 6px rgba(0,0,0,.04);

        }
        h1{
            text-align: center;
            padding-top: 50px;
        }
        .register-form{
            padding-top: 5px;
            margin: 20px;
        }
        .retrieve-butoom{
            text-align: center;
            padding-top: 5px;
        }
        button{
            width: 100px;
            height: 40px;
            border-radius: 10px;
        }
        span{
            margin-left: 140px;
            font-size: 10px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div id="app">
    <div class="forget">
        <h1>Retrieve account</h1>
        <el-form label-width="100px" class="register-form">
            <el-form-item label="Username">
                <el-input v-model="registerInfo.username" placeholder="Please enter your username" style="width: 300px"></el-input>
            </el-form-item>
            <el-form-item label="Email">
                <el-input v-model="registerInfo.email" placeholder="Please enter your email" style="width: 300px"></el-input>
            </el-form-item>
            <el-form-item label="Verification">
                <el-input v-model="registerInfo.vcode" placeholder="Please enter the verification code" style="width: 300px"></el-input>
            </el-form-item>
            <el-form-item label="Password">
                <el-input v-model="registerInfo.password" placeholder="Please enter your new password" style="width: 300px"></el-input>
            </el-form-item>
        </el-form>
        <div class="retrieve-butoom">
            <button @click="forget">Retrieve</button>
        </div>
        <span>Remember the account number?<a href="../index.jsp">Click to login</a></span>
    </div>


</div>
</body>
<script src="../js/jquery-3.5.0.js"></script>
<script src="https://unpkg.com/vue@2/dist/vue.js"></script>
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script>
    new Vue({
        el: '#app',
        data() {
            return {
                registerInfo:{
                    username:'',
                    password:'',
                    email:'',
                    vcode:''
                },
            }
        },
        methods: {
            forget() {
                let _this = this
                console.log(this.registerInfo.username)
                console.log(this.registerInfo.email)
                console.log(this.registerInfo.vcode)
                console.log(this.registerInfo.password)

                // if (this.registerInfo.email){
                if (this.registerInfo.email && /\S+@\S+\.\S+/.test(this.registerInfo.email)){
                    // _this.$message.success("66")
                    // if(this.registerInfo.vcode){
                    if (this.registerInfo.vcode && this.registerInfo.vcode.length === 4) {
                        if(this.registerInfo.password){
                            $.ajax({
                                url: "http://localhost:8080/servlet/forget",
                                type: "post",
                                data: {
                                    //网页网络负载里面可任意看到
                                    name: this.registerInfo.username,
                                    pwd: this.registerInfo.password,
                                },
                                dataType:"JSON",    //返回的数据格式
                                success: function(data) {   //返回函数
                                    console.log(data)
                                    console.log(data.code)
                                    if(data.code === 200){
                                        setTimeout(function () {
                                            _this.$message.success(data.info)
                                        },500)
                                        setTimeout(function () {
                                            window.location.href = "../index.jsp"
                                        },3000)

                                    }else {
                                        setTimeout(function () {
                                            _this.$message.error(data.info)
                                        },500);
                                    }

                                }
                            })
                        }else {
                            _this.$message.error("Please enter the new password")
                        }

                    }else {
                        _this.$message.error("Please enter the correct verification code")
                    }
                }else {
                    _this.$message.error("Please enter the correct email address")
                }

            }
        }
    })
</script>
</html>
