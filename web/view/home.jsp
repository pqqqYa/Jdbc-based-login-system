<%--
  Created by IntelliJ IDEA.
  User: 18048
  Date: 2024/6/7
  Time: 下午1:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Arknights - Home</title>
    <link rel="icon" href="../img/favicon.ico">
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <style>
        body{
            background-image: url("../img/background_home.jpg");
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;

        }
        .el-menu-vertical-demo:not(.el-menu--collapse) {
            width: 200px;
            min-height: 400px;
        }
        .overlay {
            position: fixed;
            top: 0;
            right: 25%;
            left: 25%;
            bottom: 0;
            /*background-color: rgba(0, 0, 0, 0.5);*/
            z-index: 10;

            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }
    </style>
</head>
<body>

<div id="app">
    <div class="overlay" v-if="index === 1">
            <img src="../img/word.png" alt="logo" style="width: 80%"/>
    </div>

    <div class="overlay" v-if="index === 2">
            <img src="../img/logoglobal.png" alt="logo" style="width: 60%"/>
    </div>
    <el-radio-group v-model="isCollapse" style="margin-bottom: 20px;">
        <el-radio-button :label="false">Unfold</el-radio-button>
        <el-radio-button :label="true">Fold</el-radio-button>
    </el-radio-group>

    <el-menu default-active="1" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose" :collapse="isCollapse">
        <el-menu-item index="1" @click="home">
            <i class="el-icon-position"></i>
            <span slot="title">INDEX</span>
        </el-menu-item>
        <el-menu-item index="2" @click="operator">
            <i class="el-icon-user"></i>
            <span slot="title">OPERATOR</span>
        </el-menu-item>
        <el-menu-item index="3" disabled>
            <i class="el-icon-magic-stick"></i>
            <span slot="title">INFORMATION</span>
        </el-menu-item>
        <el-menu-item index="4" disabled>
            <i class="el-icon-message"></i>
            <span slot="title">MESSAGE</span>
        </el-menu-item>
        <el-menu-item index="5" disabled>
            <i class="el-icon-shopping-cart-full"></i>
            <span slot="title">SHOP</span>
        </el-menu-item>
        <el-menu-item index="6" disabled>
            <i class="el-icon-share"></i>
            <span slot="title">SHARE</span>
        </el-menu-item>
        <el-menu-item index="7" disabled>
            <i class="el-icon-more-outline"></i>
            <span slot="title">MORE</span>
        </el-menu-item>
    </el-menu>
</div>

</body>
<script src="https://unpkg.com/vue@2/dist/vue.js"></script>
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script>
    new Vue({
        el: '#app',
        data: function() {
            return {
                visible: false,
                isCollapse: true,
                index:1,
            }

        },
        methods: {
            handleOpen(key, keyPath) {
                console.log(key, keyPath);
            },
            handleClose(key, keyPath) {
                console.log(key, keyPath);
            },
            home(){
                this.index = 1

            },
            operator(){
                this.index = 2

            }
        }
    })
</script>
</html>