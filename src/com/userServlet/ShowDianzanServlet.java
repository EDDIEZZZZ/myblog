package com.userServlet;

import com.bean.User;
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

@WebServlet(name = "ShowDianzanServlet")
public class ShowDianzanServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user= (User) request.getSession().getAttribute("loginuser");
        String d_id = request.getParameter("d_id");
        if(user==null){
            response.getWriter().print("<script>alert('你还没有登陆，请先登录');location.href='login.jsp'</script>");
        }else {

            try {
                Connection conn = ConnDB.getConn();
                //查询相册信息
                String sql = "select * from dianzan where dz_user=? and dz_albums=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,user.getId());
                pstmt.setInt(2,Integer.parseInt(d_id));
                ResultSet rs = pstmt.executeQuery();
                if (rs.next()){
                    sql="update dianzan set is_used=?";
                    pstmt = conn.prepareStatement(sql);
                    if (rs.getBoolean("is_used")){
                        pstmt.setBoolean(1,false);
                    }else {
                        pstmt.setBoolean(1,true);
                    }

                    pstmt.executeUpdate();

                }else {
                    sql="insert into dianzan(dz_user,dz_albums) values (?,?)";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1,user.getId());
                    pstmt.setInt(2,Integer.parseInt(d_id));
                    pstmt.executeUpdate();
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
            response.sendRedirect("ShowAlbumsDetailServlet?d_id=" + d_id);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doPost(request, response);
    }
}
