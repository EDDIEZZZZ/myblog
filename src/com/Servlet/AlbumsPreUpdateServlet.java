package com.Servlet;

import com.bean.Adminuser;
import com.bean.Albums;
import com.bean.Dongtai;
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

@WebServlet(name = "AlbumsPreUpdateServlet")
public class AlbumsPreUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String d_id=request.getParameter("d_id");
        Albums albums=new Albums();
        if(d_id!=null){
            try {
                Integer id=Integer.parseInt(d_id);
                Connection conn = ConnDB.getConn();
                String sql = "select al_name from albums where d_id=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,id );
                ResultSet rs=pstmt.executeQuery();

                if(rs.next()){
                    albums.setId(rs.getInt("al_id"));
                    albums.setName(rs.getString("al_name"));
                    albums.setCreatetime(rs.getTimestamp("createtime"));
                    albums.setIs_used(rs.getBoolean("is_used"));
                    Adminuser au=new Adminuser();
                    au.setId(rs.getInt("d_author"));
                    au.setName(rs.getString("a_name"));
                    au.setPass(rs.getString("a_pass"));
                    au.setNickname(rs.getString("a_nickname"));
                    albums.setAuthor(au);
                }


            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }


        request.setAttribute("albumsdetail",albums);
        request.getRequestDispatcher("admin_albumspreupdate.jsp").forward(request, response);
    }
}
