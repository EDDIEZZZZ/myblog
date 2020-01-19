package com.Servlet;

import com.bean.Adminuser;
import com.bean.Dongtai;
import com.sql.ConnDB;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DongtaiListServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        Adminuser adminusersql=(Adminuser) request.getSession().getAttribute("adminuser");
        List<Dongtai> dongtailist=new ArrayList<Dongtai>();

        Connection conn = ConnDB.getConn();
        String sql = "select * from dongtai where d_author=? order by createtime";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, adminusersql.getId());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Dongtai dongtai = new Dongtai();
                dongtai.setId(rs.getInt("d_id"));
                dongtai.setTitle(rs.getString("d_title"));
                dongtai.setContent(rs.getString("d_content"));

                Adminuser adminuser = new Adminuser();
                adminuser.setId(rs.getInt("d_author"));
                dongtai.setAuthor(adminuser);

                dongtai.setCreatetime(rs.getTimestamp("createtime"));
                dongtai.setIs_used(rs.getBoolean("is_used"));

                dongtailist.add(dongtai);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        request.setAttribute("dongtailist", dongtailist);
        request.getRequestDispatcher("admin_index.jsp").forward(request, response);
    }
}
