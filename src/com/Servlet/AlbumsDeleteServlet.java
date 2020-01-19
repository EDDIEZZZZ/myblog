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

@WebServlet(name = "AlbumsDeleteServlet")
public class AlbumsDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String d_id=request.getParameter("d_id");
        if(d_id!=null){
            try {
                Integer id=Integer.parseInt(d_id);
                Connection conn = ConnDB.getConn();
                String sql = "update albums set is_used=false where al_id=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,id );
                pstmt.executeUpdate();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        request.getRequestDispatcher("AlbumsListServlet").forward(request, response);
    }
}
