package com.cn.shixun.servlet;

import com.cn.shixun.pojo.Result;
import com.cn.shixun.pojo.User;
import com.cn.shixun.util.JdbcUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    //按住ctrl+o，选doGet和doPost
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        //业务
        //1、请求是否成功
        //2、拿交互数据

//        （1）拿前端数据
        String name = req.getParameter("name");
        String pwd = req.getParameter("pwd");

        int code = 500;
        String info = null;

//        System.out.println("userdata:"+name+"and"+pwd);

//        （2）使用JDBC
//        System.out.println("welcome login");



        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try{
            conn = JdbcUtil.getConnection();
            String sql = "select * from user where username=? and password=?";
            pst = conn.prepareStatement(sql);
            pst.setString(1,name);
            pst.setString(2,pwd);
            rs = pst.executeQuery();
            if (rs.next()) {
                System.out.println("Login successful");
                code =200;
                info = "Login successful";
            } else {
                System.out.println("Login failure");
                code =500;
                info = "Login failed, please check username and password";
            }

//            System.out.println("Connect Success");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                JdbcUtil.closeAll(conn,null,null);
                System.out.println("closeAll");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }




//        (3)响应
//        resp.getWriter().write("Successful response!");
        //假设登录200  500
        User user = new User(name);
        Result result= new Result(code,info,user);
        ObjectMapper objectMapper = new ObjectMapper();
        String s = objectMapper.writeValueAsString(result);

        resp.getWriter().write(s);
        System.out.println(s);
//        resp.getWriter().println(result);



    }
}
