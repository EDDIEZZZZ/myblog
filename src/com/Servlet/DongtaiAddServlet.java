package com.Servlet;

import com.bean.Adminuser;
import com.bean.Dongtai;
import com.sql.ConnDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "DongtaiAddServlet")
public class DongtaiAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Dongtai dongtai=new Dongtai();
        dongtai.setTitle(request.getParameter("title"));
        dongtai.setContent(request.getParameter("content"));
        Adminuser adminusersql=(Adminuser) request.getSession().getAttribute("adminuser");

        try {
            Connection conn= ConnDB.getConn();
            String sql="insert into dongtai(d_title,d_content,d_author) value(?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,dongtai.getTitle());
            pstmt.setString(2,dongtai.getContent());
            pstmt.setInt(3, adminusersql.getId());
            pstmt.executeUpdate();
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print("<script>alert('发布成功');location.href='DongtaiListServlet'</script>");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
