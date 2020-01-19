package com.userServlet;

import com.bean.Adminuser;
import com.bean.Albums;
import com.bean.Dongtai;
import com.bean.Medias;
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

@WebServlet(name = "IndexServlet")
public class IndexServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //动态list
        List<Dongtai> dongtailist=new ArrayList<Dongtai>();

        try {

            //获取数据库连接
            Connection conn = ConnDB.getConn();
            //构建sql
            String sql = "select * from dongtai where is_used=true order by createtime desc limit 0,5";
            PreparedStatement pstmt = conn.prepareStatement(sql);

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
            for(Dongtai dt:dongtailist){
                String sql2 ="select * from adminuser where a_id=? ";
                pstmt = conn.prepareStatement(sql2);
                pstmt.setInt(1,dt.getAuthor().getId());
                ResultSet rs2 = pstmt.executeQuery();
                rs2.next();
                dt.getAuthor().setName(rs2.getString("a_name"));
                dt.getAuthor().setPass(rs2.getString("a_pass"));
                dt.getAuthor().setNickname(rs2.getString("a_nickname"));
                dt.getAuthor().setCreatetime(rs2.getTimestamp("createtime"));

            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        request.setAttribute("dongtailist", dongtailist);


        try {

            Connection conn = ConnDB.getConn();
            String sql = "select * from albums where is_used=true order by createtime desc limit 0,6";

            PreparedStatement pstmt = conn.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();

            List<Albums> albumsList=new ArrayList<Albums>();

            while (rs.next()) {
                Albums albums = new Albums();
                albums.setId(rs.getInt("al_id"));
                albums.setName(rs.getString("al_name"));
                Adminuser adminuser = new Adminuser();
                adminuser.setId(rs.getInt("al_author"));
                albums.setAuthor(adminuser);

                albums.setCreatetime(rs.getTimestamp("createtime"));
                albums.setIs_used(rs.getBoolean("is_used"));

                albumsList.add(albums);
            }
            //jQuery 前端异步通信技术 json 前端数据封装

            for(Albums al:albumsList){
                sql = "select count(*),p_url from photos where p_album=? ";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, al.getId());
                rs = pstmt.executeQuery();
                if (rs.next()){
                    al.setPhotocount(rs.getInt(1));
                    al.setPhotofirst(rs.getString(2));
                }
            }

            request.setAttribute("albumslist",albumsList);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        List<Medias> mediaslist=new ArrayList<Medias>();
        try {

            Connection conn = ConnDB.getConn();
            String sql = "select * from medias where is_used=true order by createtime desc limit 0,5";

            PreparedStatement pstmt = conn.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();



            while (rs.next()) {
                Medias medias = new Medias();
                medias.setId(rs.getInt("me_id"));
                medias.setName(rs.getString("me_name"));
                Adminuser adminuser = new Adminuser();
                adminuser.setId(rs.getInt("me_author"));
                medias.setAuthor(adminuser);

                medias.setCreatetime(rs.getTimestamp("createtime"));
                medias.setIs_used(rs.getBoolean("is_used"));

                mediaslist.add(medias);
            }
            //jQuery 前端异步通信技术 json 前端数据封装

            for(Medias me:mediaslist){
                sql ="select * from adminuser where a_id=? ";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, me.getId());
                ResultSet rs2 = pstmt.executeQuery();
                me.getAuthor().setName(rs2.getString("a_name"));
                me.getAuthor().setPass(rs2.getString("a_pass"));
                me.getAuthor().setNickname(rs2.getString("a_nickname"));
                me.getAuthor().setCreatetime(rs2.getTimestamp("createtime"));
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        request.setAttribute("mediaslist",mediaslist);


        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
