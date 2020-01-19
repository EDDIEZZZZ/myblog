package com.userServlet;

import com.bean.Adminuser;
import com.bean.Sixin;
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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="SixinAdminlistServlet")
public class SixinAdminlistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("loginuser");
        if (user == null) {
            response.getWriter().print("<script>alert('你还没有登陆，请先登录');location.href='login.jsp'</script>");
        } else {
            //获取管理员LIST
            try {
                List<Adminuser> list = new ArrayList<Adminuser>();
                Connection conn = ConnDB.getConn();
                String sql = "select * from adminuser where is_used=true ";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery(sql);
                while (rs.next()) {
                    Adminuser adminuser = new Adminuser();
                    adminuser.setId(rs.getInt("a_id"));
                    adminuser.setName(rs.getString("a_name"));
                    adminuser.setNickname(rs.getString("a_nickname"));
                    list.add(adminuser);
                }
                request.setAttribute("list", list);

            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            //分页
            int pageSize = 5;
            int currentPage = 1;
            String sCurrentPage = request.getParameter("currentPage");
            if (sCurrentPage == null) {
                currentPage = 1;
            } else {
                currentPage = Integer.parseInt(sCurrentPage);
            }
            //获取私信LIST
            try {
                List<Sixin> sixinlist = new ArrayList<Sixin>();

                Connection conn = ConnDB.getConn();
                String sql1 = "select * from sixin limit ?,?";
                PreparedStatement pstmt1 = conn.prepareStatement(sql1);
                pstmt1.setInt(1, (currentPage - 1) * pageSize);
                pstmt1.setInt(2, pageSize);
                ResultSet rs = pstmt1.executeQuery();
                while (rs.next()) {
                    Sixin sixin = new Sixin();
                    sixin.setId(rs.getInt("s_id"));
                    sixin.setContent(rs.getString("content"));
                    sixin.setCreatetime(rs.getTimestamp("createtime"));
                    sixin.setReply(rs.getString("reply"));
                    sixinlist.add(sixin);
                }
                request.setAttribute("sixinlist", sixinlist);
                request.setAttribute("currentPage", currentPage);
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            //私信数量
            int count = -1;
            try {

                Connection conn = ConnDB.getConn();
                String sql1 = "select count(*) from sixin";
                PreparedStatement pstmt = conn.prepareStatement(sql1);
                ResultSet rs = pstmt.executeQuery(sql1);
                if (rs.next()) {

                    count = rs.getInt(1);

                }

            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            int maxPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;

            request.setAttribute("maxPage", maxPage);

            request.getRequestDispatcher("personalshow.jsp").forward(request, response);
        }
    }
}
