package com.Servlet;

import com.bean.Adminuser;
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

@WebServlet(name = "SixinHuifuServlet")
public class SixinHuifuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sid = request.getParameter("id");
        String reply = request.getParameter("reply");
//        int id =Integer.parseInt(request.getParameter("id")) ;
        Integer sixinid = Integer.parseInt(sid);
        Adminuser adminuser = (Adminuser) request.getSession().getAttribute("adminuser");
        Connection conn = ConnDB.getConn();
        String sql = "update sixin set is_new_a = false,reply=? where s_id=?";

        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reply);
            pstmt.setInt(2, sixinid);
            pstmt.executeUpdate();
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print("<script>alert('反馈成功');location.href='SixinListServlet'</script>");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}