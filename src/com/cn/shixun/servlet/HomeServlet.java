package com.cn.shixun.servlet;

import com.cn.shixun.pojo.Result;
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


@WebServlet("/home")
public class HomeServlet  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

//        int code = 500;
//
//        Connection conn = null;
//        PreparedStatement pst = null;
//        ResultSet rs = null;
//        try {
//            conn = JdbcUtil.getConnection();
//            String sql = "select * from role where user_id=?";
//            pst = conn.prepareStatement(sql);
//            pst.setInt(1,1);
//            rs = pst.executeQuery();
//
//            if (!rs.next()) {
//                code =200;
//                System.out.println("successful");
//
//            } else {
//                code =500;
//                System.out.println("failure");
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//
//        }
//
//        Result result= new Result(code,info,user);
//        ObjectMapper objectMapper = new ObjectMapper();
//        String s = objectMapper.writeValueAsString(result);
//        resp.getWriter().write(s);
    }
}
