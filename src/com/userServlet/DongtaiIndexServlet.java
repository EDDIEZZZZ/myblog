package com.userServlet;

import com.bean.Adminuser;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DongtaiIndexServlet")
public class DongtaiIndexServlet extends HttpServlet {
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
            String sql = "select * from dongtai where is_used=true limit ?,?";
            //where is_used=true order by createtime desc
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,(currentPage-1)*pageSize);
            pstmt.setInt(2,pageSize);
            ResultSet rs = pstmt.executeQuery();

            List<Dongtai> dongtailist=new ArrayList<Dongtai>();

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

            request.setAttribute("dongtailist",dongtailist);


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        int count=-1;
        try {

            Connection conn = ConnDB.getConn();
            String sql1 = "select count(*) from dongtai";
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

        request.getRequestDispatcher("dongtailist.jsp").forward(request,response);
    }
}
