package com.userServlet;

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

@WebServlet(name = "ShowAlbumsDetailServlet")
public class ShowAlbumsDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String d_id = request.getParameter("d_id");
        Albums albums = new Albums();
        Dianzan dianzan = new Dianzan();
        List<Photos> photolist = new ArrayList<Photos>();
        if (d_id != null) {
            try {
                Connection conn = ConnDB.getConn();
                //查询相册信息
                String sql = "select * from albums where al_id=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,Integer.parseInt(d_id));
                ResultSet rs = pstmt.executeQuery();
                if (rs.next()){
                    albums.setId(rs.getInt("al_id"));
                    albums.setName(rs.getString("al_name"));
                    Adminuser adminuser = new Adminuser();
                    adminuser.setId(rs.getInt("al_author"));
                    albums.setAuthor(adminuser);

                    albums.setCreatetime(rs.getTimestamp("createtime"));
                    albums.setIs_used(rs.getBoolean("is_used"));
                }
                //查询相册中照片信息
                sql = "select * from photos  where p_album=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,Integer.parseInt(d_id));
                rs = pstmt.executeQuery();

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
                //查询相册点赞数
                User user= (User) request.getSession().getAttribute("loginuser");

                if (user==null){

                }else {
                    sql = "select * from dianzan  where dz_user=? and dz_albums=?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1,user.getId());
                    pstmt.setInt(2,Integer.parseInt(d_id));
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        dianzan.setId(rs.getInt("dz_id"));
                        User u = new User();
                        u.setId(rs.getInt("dz_user"));
                        dianzan.setUser(u);
                        Albums al = new Albums();
                        al.setId(rs.getInt("dz_albums"));
                        dianzan.setAlbums(al);
                        dianzan.setCreatetime(rs.getTimestamp("createtime"));
                        dianzan.setIs_used(rs.getBoolean("is_used"));
                        request.setAttribute("dianzan",dianzan);

                    }

                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        request.setAttribute("albums",albums);
        request.setAttribute("albumslist",photolist);
        request.getRequestDispatcher("albumsdetail.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
