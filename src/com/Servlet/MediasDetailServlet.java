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

@WebServlet(name = "MediasDetailServlet")
public class MediasDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String d_id = request.getParameter("d_id");
        List<Videos> videoslist = new ArrayList<Videos>();
        if (d_id != null) {
            try {
                Connection conn = ConnDB.getConn();
                String sql = "select * from videos  where v_media=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,Integer.parseInt(d_id));
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    Videos videos = new Videos();
                    videos.setId(rs.getInt("v_id"));
                    videos.setTitle(rs.getString("v_title"));
                    videos.setUrl(rs.getString("v_url"));
                    videos.setCreatetime(rs.getTimestamp("createtime"));
                    videos.setIs_used(rs.getBoolean("is_used"));

                    Adminuser au = new Adminuser();
                    au.setId(rs.getInt("v_author"));
                    videos.setAuthor(au);
                    Medias md = new Medias();
                    md.setId(rs.getInt("v_media"));
                    videos.setMedias(md);
                    videoslist.add(videos);

                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        request.setAttribute("mediaslist",videoslist);
        request.getRequestDispatcher("admin_mediasdetail.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
