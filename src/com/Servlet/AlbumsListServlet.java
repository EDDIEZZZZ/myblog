package com.Servlet;

import com.bean.Adminuser;
import com.bean.Albums;
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

@WebServlet(name = "AlbumsListServlet")
public class AlbumsListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Adminuser adminusersql=(Adminuser) request.getSession().getAttribute("adminuser");
            Connection conn = ConnDB.getConn();
            String sql = "select * from albums where al_author=? order by createtime";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, adminusersql.getId());
            ResultSet rs = pstmt.executeQuery();

            List<Albums> list=new ArrayList<Albums>();

            while (rs.next()) {
                Albums albums = new Albums();
                albums.setId(rs.getInt("al_id"));
                albums.setName(rs.getString("al_name"));
                Adminuser adminuser = new Adminuser();
                adminuser.setId(rs.getInt("al_author"));
                albums.setAuthor(adminuser);

                albums.setCreatetime(rs.getTimestamp("createtime"));
                albums.setIs_used(rs.getBoolean("is_used"));

                list.add(albums);
            }
                //jQuery 前端异步通信技术 json 前端数据封装

                for(Albums al:list){
                    sql = "select count(*) from photos where p_album=? ";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, al.getId());
                    rs = pstmt.executeQuery();
                    if (rs.next()){
                        al.setPhotocount(rs.getInt(1));
                    }
                }


                request.setAttribute("albumslist",list);

                request.getRequestDispatcher("admin_index_albums.jsp").forward(request,response);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
