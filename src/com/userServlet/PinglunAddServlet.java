package com.userServlet;

import com.bean.Pinglun;
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

@WebServlet(name = "PinglunAddServlet")
public class PinglunAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("loginuser");

        if (user == null) {
            response.getWriter().print("<script>alert('你还没有登陆，请先登录');location.href='login.jsp'</script>");
        } else {

            response.setContentType("text/html;charset=UTF-8");
            Pinglun pinglun = new Pinglun();
            pinglun.setContent(request.getParameter("content"));

            Integer d_id = Integer.parseInt(request.getParameter("d_id"));

//            User user = (User) request.getSession().getAttribute("loginuser");

            Connection conn = ConnDB.getConn();

            String sql = "insert into pinglun(pl_content,pl_author,pl_dongtai) value (?,?,?)";

            try {
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, pinglun.getContent());
                pstmt.setInt(2, user.getId());
                pstmt.setInt(3, d_id);
                pstmt.executeUpdate();

                response.getWriter().print("<script>alert('评论成功');location.href='ShowDongtaiDetailServlet?d_id=" + d_id + "'</script>");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
