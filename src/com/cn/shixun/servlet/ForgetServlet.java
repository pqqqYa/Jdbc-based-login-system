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

@WebServlet("/forget")
public class ForgetServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        String name = req.getParameter("name");
        String pwd = req.getParameter("pwd");

        int code = 500;
        String info = null;

        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ResultSet rs2 = null;


        try{
            conn = JdbcUtil.getConnection();
            String sql = "select * from user where username=?";//检查数据库有没有这个用户
            pst = conn.prepareStatement(sql);
            pst.setString(1,name);
            rs = pst.executeQuery();

            if (rs.next()) {
                String sql2 = "UPDATE user SET password=? WHERE username=?;";
                pst = conn.prepareStatement(sql2);
                pst.setString(1, pwd);
                pst.setString(2, name);

                pst.executeUpdate();

                System.out.println("Retrieve password successful");
                code =200;
                info = "Retrieve password successful";

            } else {
                System.out.println("Retrieve password failure");
                code =500;
                info = "Retrieve password failed, please check username";
            }


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
        User user = new User(name);
        Result result= new Result(code,info,user);
        ObjectMapper objectMapper = new ObjectMapper();
        String s = objectMapper.writeValueAsString(result);
        resp.getWriter().write(s);
    }
}

