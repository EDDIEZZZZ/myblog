package com.Servlet;

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

@WebServlet(name = "DongtaiUnDeleteServlet")
public class DongtaiUnDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String d_id=request.getParameter("d_id");
        if(d_id!=null){
            try {
                Integer id=Integer.parseInt(d_id);
                Connection conn = ConnDB.getConn();
                String sql = "update dongtai set is_used=true where d_id=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,id );
                pstmt.executeUpdate();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        request.getRequestDispatcher("/admin/DongtaiListServlet").forward(request, response);
    }
}
