package com.Servlet;

import com.bean.Adminuser;
import com.bean.Sixin;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SixindetailServlet")
public class SixindetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String s_id=request.getParameter("s_id");
        Sixin sixin=new Sixin();
        List<Sixin> sixinlist = new ArrayList<Sixin>();
        if(s_id!=null){
            try {
                Integer id = Integer.parseInt(s_id);
                Connection conn = ConnDB.getConn();
                String sql = "select * from sixin where s_id=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, id);
                ResultSet rs=pstmt.executeQuery();
                while (rs.next()){
                    User user = new User();
                    user.setId(rs.getInt("u_id"));
//                    user.setName(rs.getString("u_name"));
                    user.setCreatetime(rs.getTimestamp("createtime"));
                    sixin.setId(rs.getInt("s_id"));
                    sixin.setContent(rs.getString("content"));
                    sixin.setCreatetime(rs.getTimestamp("createtime"));
                    sixin.setIs_new_a(rs.getBoolean("is_new_a"));
                    sixin.setUser(user);
                    sixinlist.add(sixin);
                }
                request.setAttribute("sixinlist", sixinlist);
                request.getRequestDispatcher("admin_sixindetail.jsp").forward(request, response);
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
    }
}
