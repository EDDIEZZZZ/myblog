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

@WebServlet(name = "UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        user.setName(request.getParameter("name"));
        user.setPass(request.getParameter("pass"));

        Connection conn= ConnDB.getConn();
        //使用用户提交的账号密码作为条件去查询user数据表，如果能找到记录，说明该账户密码匹配，可以登录
        String sql="select * from user where u_name=? and u_pass=? and is_used = true";

        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPass());
            ResultSet rs=pstmt.executeQuery();
            //next方法下移记录指针，如果有记录，指向到该记录，返回true，如果无记录，返回false
            if(rs.next()) {
                user.setId(rs.getInt("u_id"));
                user.setName(rs.getString("u_name"));
                user.setPass(rs.getString("u_pass"));
                user.setCreatetime(rs.getTimestamp("createtime"));

                request.getSession().setAttribute("loginuser", user);
                String sql2 = "insert into userlog(l_user,l_ipaddr) values (?,?)";
                PreparedStatement pstmt2 = conn.prepareStatement(sql2);
                pstmt2.setInt(1,user.getId());
                pstmt2.setString(2,request.getRemoteAddr());
                pstmt2.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("IndexServlet").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);

    }
}
