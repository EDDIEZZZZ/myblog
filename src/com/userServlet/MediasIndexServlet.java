package com.userServlet;

import com.bean.Adminuser;
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

@WebServlet(name = "MediasIndexServlet")
public class MediasIndexServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //分页
        int pageSize=8;
        int currentPage=1;
        String sCurrentPage=request.getParameter("currentPage");
        if(sCurrentPage==null){
            currentPage=1;
        }else {
            currentPage = Integer.parseInt(sCurrentPage);
        }

        request.setAttribute("currentPage",currentPage);


        try {

            Connection conn = ConnDB.getConn();
            String sql = "select * from medias where is_used=true limit ?,?";
            //where is_used=true order by createtime desc
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,(currentPage-1)*pageSize);
            pstmt.setInt(2,pageSize);
            ResultSet rs = pstmt.executeQuery();


            List<Medias> mediaslist=new ArrayList<Medias>();

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

            request.setAttribute("mediaslist",mediaslist);


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        int count=-1;
        try {

            Connection conn = ConnDB.getConn();
            String sql1 = "select count(*) from medias";
            PreparedStatement pstmt = conn.prepareStatement(sql1);
            ResultSet rs = pstmt.executeQuery(sql1);
            if (rs.next()) {

                count = rs.getInt(1);

            }

        }catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        int maxPage= count%pageSize==0?count/pageSize:count/pageSize+1 ;

        request.setAttribute("maxPage",maxPage);

        request.getRequestDispatcher("vloglist.jsp").forward(request,response);
    }
}
