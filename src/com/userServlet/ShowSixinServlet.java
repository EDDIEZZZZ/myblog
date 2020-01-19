package com.userServlet;

import com.bean.Sixin;
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

@WebServlet(name = "ShowSixinServlet")
public class ShowSixinServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            List<Sixin> sixinlist = new ArrayList<Sixin>();

            Connection conn = ConnDB.getConn();
            String sql = "select * from sixin";

            PreparedStatement pstmt = conn.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery(sql);

            while (rs.next()) {
                Sixin sixin = new Sixin();
                sixin.setId(rs.getInt("s_id"));
                sixin.setContent(rs.getString("content"));
                sixin.setCreatetime(rs.getTimestamp("createtime"));
                sixin.setIs_new_u(rs.getBoolean("is_used_u"));
                sixinlist.add(sixin);
            }
            request.setAttribute("sixinlist", sixinlist);

        }catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        request.getRequestDispatcher("personalshow.jsp").forward(request, response);
    }





}
