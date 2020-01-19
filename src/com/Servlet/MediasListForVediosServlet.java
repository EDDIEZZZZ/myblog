package com.Servlet;

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

@WebServlet(name = "MediasListForVediosServlet")
public class MediasListForVediosServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Adminuser adminusersql=(Adminuser) request.getSession().getAttribute("adminuser");
            Connection conn = ConnDB.getConn();
            String sql = "select * from medias where me_author=? and is_used=true ";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, adminusersql.getId());
            ResultSet rs = pstmt.executeQuery();

            List<Medias> list=new ArrayList<Medias>();

            while (rs.next()) {
                Medias medias = new Medias();
                medias.setId(rs.getInt("me_id"));
                medias.setName(rs.getString("me_name"));
                Adminuser adminuser = new Adminuser();
                adminuser.setId(rs.getInt("me_author"));
                medias.setAuthor(adminuser);
                medias.setCreatetime(rs.getTimestamp("createtime"));
                medias.setIs_used(rs.getBoolean("is_used"));

                list.add(medias);
            }
            request.setAttribute("mediaslist",list);

            request.getRequestDispatcher("admin_vediosadd.jsp").forward(request,response);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
