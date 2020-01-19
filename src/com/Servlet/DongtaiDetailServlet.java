package com.Servlet;

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


@WebServlet(name = "DongtaiDetailServlet")
public class DongtaiDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String d_id=request.getParameter("d_id");
        Dongtai dongtai=new Dongtai();

        if(d_id!=null){
            try {
                Integer id=Integer.parseInt(d_id);
                Connection conn = ConnDB.getConn();
                String sql = "select * from dongtai as d left join adminuser a on d.d_author=a.a_id  where d_id=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,id );
                ResultSet rs=pstmt.executeQuery();

                if(rs.next()){
                    dongtai.setId(rs.getInt("d_id"));
                    dongtai.setTitle(rs.getString("d_title"));
                    dongtai.setContent(rs.getString("d_content"));
                    dongtai.setCreatetime(rs.getTimestamp("createtime"));
                    dongtai.setIs_used(rs.getBoolean("is_used"));
                    Adminuser au=new Adminuser();
                    au.setId(rs.getInt("d_author"));
                    au.setName(rs.getString("a_name"));
                    au.setPass(rs.getString("a_pass"));
                    au.setNickname(rs.getString("a_nickname"));
                    dongtai.setAuthor(au);
                }


            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        request.setAttribute("dongtaidetail",dongtai);
        request.getRequestDispatcher("admin_dongtaidetail.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doPost(request, response);

    }

}
