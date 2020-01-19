package com.Servlet;

import com.bean.*;
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

@WebServlet(name = "AlbumsDetailServlet")
public class AlbumsDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String d_id = request.getParameter("d_id");
        List<Photos> photolist = new ArrayList<Photos>();
        if (d_id != null) {
            try {
                Connection conn = ConnDB.getConn();
                String sql = "select * from photos  where p_album=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,Integer.parseInt(d_id));
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    Photos photos = new Photos();
                    photos.setId(rs.getInt("p_id"));
                    photos.setTitle(rs.getString("p_title"));
                    photos.setUrl(rs.getString("p_url"));
                    photos.setCreatetime(rs.getTimestamp("createtime"));
                    photos.setIs_used(rs.getBoolean("is_used"));

                    Adminuser au = new Adminuser();
                    au.setId(rs.getInt("p_author"));
                    photos.setAuthor(au);
                    Albums al = new Albums();
                    al.setId(rs.getInt("p_album"));
                    photos.setAlbum(al);
                    photolist.add(photos);

                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
                request.setAttribute("albumslist",photolist);
                request.getRequestDispatcher("admin_albumsdetail.jsp").forward(request,response);

    }
            protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
