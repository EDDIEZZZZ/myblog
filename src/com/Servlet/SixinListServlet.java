package com.Servlet;

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

@WebServlet(name = "SixinListServlet")
public class SixinListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Adminuser adminusersql=(Adminuser) request.getSession().getAttribute("adminuser");
        List<Sixin> sixinilist=new ArrayList<Sixin>();

        Connection conn = ConnDB.getConn();
        String sql = "select * from sixin order by createtime";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
//            pstmt.setInt(1, adminusersql.getId());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Sixin sixin = new Sixin();
                sixin.setId(rs.getInt("s_id"));
                sixin.setContent(rs.getString("content"));
                sixin.setIs_new_a(rs.getBoolean("is_new_a"));
                Adminuser adminuser = new Adminuser();
                adminuser.setId(rs.getInt("a_id"));;
                User user = new User();
                user.setId(rs.getInt("u_id"));
                sixin.setCreatetime(rs.getTimestamp("createtime"));
                sixinilist.add(sixin);

            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        request.setAttribute("sixinilist", sixinilist);
        request.getRequestDispatcher("admin_sixin.jsp").forward(request, response);
    }
}
