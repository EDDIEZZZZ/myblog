package com.userServlet;

import com.bean.Adminuser;
import com.bean.Medias;
import com.bean.Videos;
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

@WebServlet(name = "ShowMediasDetailServlet")
public class ShowMediasDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String d_id = request.getParameter("d_id");
        Medias medias = new Medias();
        List<Videos> videolist = new ArrayList<Videos>();
        if (d_id != null) {
            try {
                Connection conn = ConnDB.getConn();
                //查询相册信息
                String sql = "select * from medias where me_id=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,Integer.parseInt(d_id));
                ResultSet rs = pstmt.executeQuery();
                if (rs.next()){
                    medias.setId(rs.getInt("me_id"));
                    medias.setName(rs.getString("me_name"));
                    Adminuser adminuser = new Adminuser();
                    adminuser.setId(rs.getInt("me_author"));
                    medias.setAuthor(adminuser);

                    medias.setCreatetime(rs.getTimestamp("createtime"));
                    medias.setIs_used(rs.getBoolean("is_used"));
                }
                //查询相册中照片信息
                sql = "select * from videos  where v_media=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,Integer.parseInt(d_id));
                rs = pstmt.executeQuery();

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
                    Medias me = new Medias();
                    me.setId(rs.getInt("v_media"));
                    videos.setMedias(me);
                    videolist.add(videos);

                }
                //查询相册点赞数


            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        request.setAttribute("medias",medias);
        request.setAttribute("mediaslist",videolist);
        request.getRequestDispatcher("vlogdetail.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
