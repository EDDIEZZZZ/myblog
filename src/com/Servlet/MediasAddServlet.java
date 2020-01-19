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
import java.sql.SQLException;

@WebServlet(name = "MediasAddServlet")
public class MediasAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Medias medias=new Medias();
        medias.setName(request.getParameter("name"));
        Adminuser adminusersql=(Adminuser) request.getSession().getAttribute("adminuser");

        try{
            Connection conn = ConnDB.getConn();
            String sql ="insert into medias(me_name,me_author) value (?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, medias.getName());
            pstmt.setInt(2, adminusersql.getId());
            pstmt.executeUpdate();
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print("<script>alert('视频媒体新建成功');location.href='AlbumsListServlet'</script>");

        }catch(SQLException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
