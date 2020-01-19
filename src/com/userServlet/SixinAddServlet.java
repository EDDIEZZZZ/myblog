package com.userServlet;

import com.bean.User;
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

@WebServlet(name = "SixinAddServlet")
public class SixinAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String sadminuserid = request.getParameter("adminuserid");
        String sadminuserid = request.getParameter("id");
        String content = request.getParameter("content");
//        int id =Integer.parseInt(request.getParameter("id")) ;
        Integer adminuserid = Integer.parseInt(sadminuserid);
        User user = (User) request.getSession().getAttribute("loginuser");
        Connection conn = ConnDB.getConn();
        String sql = "insert into sixin(u_id,a_id,content) values (?,?,?)";
        try{
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,user.getId());
            pstmt.setInt(2,adminuserid);
            pstmt.setString(3,content);
            pstmt.executeUpdate();
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print("<script>alert('反馈成功');location.href='SixinAdminlistServlet'</script>");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
