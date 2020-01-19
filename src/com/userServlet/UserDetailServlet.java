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

@WebServlet(name = "UserDetailServlet")
public class UserDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("loginuser");
        List<Sixin> sixinlist = new ArrayList<Sixin>();
        try {
            Connection conn = ConnDB.getConn();
            String sql = "select * from User where u_id=?";
            PreparedStatement pstmt =conn.prepareStatement(sql);
            pstmt.setInt(1,user.getId());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){

                user.setId(rs.getInt("u_id"));
                user.setName(rs.getString("u_name"));
                user.setPass(rs.getString("u_pass"));
                user.setCreatetime(rs.getTimestamp("createtime"));
                Sixin sixin = new Sixin();
                sixin.setId(rs.getInt("s_id"));
                sixin.setContent(rs.getString("content"));
                sixin.setCreatetime(rs.getTimestamp("createtime"));
                sixin.setIs_new_u(rs.getBoolean("is_used_u"));
                sixin.setIs_new_a(rs.getBoolean("is_used_a"));
                Adminuser adminuser = new Adminuser();
                adminuser.setId(rs.getInt("a_id"));
                adminuser.setNickname(rs.getString("nickname"));
                sixin.setAdminuser(adminuser);
                sixin.setUser(user);
                sixinlist.add(sixin);

            }

            sql = "select * from sixin where u_id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.executeUpdate();

            request.setAttribute("sixinlist", sixinlist);
            request.getRequestDispatcher("personalshow.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
