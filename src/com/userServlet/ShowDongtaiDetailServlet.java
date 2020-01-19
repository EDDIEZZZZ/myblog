package com.userServlet;

import com.bean.Adminuser;
import com.bean.Dongtai;
import com.bean.Pinglun;
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

@WebServlet(name = "ShowDongtaiDetailServlet")
public class ShowDongtaiDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String d_id=request.getParameter("d_id");
        Dongtai dongtai=new Dongtai();
        List<Pinglun> pinglunlist=new ArrayList<Pinglun>();
        Connection conn = ConnDB.getConn();
        Connection conn2 = ConnDB.getConn();
        PreparedStatement pstmt=null;
        if(d_id!=null){
            try {
                Integer id=Integer.parseInt(d_id);

                String sql = "select * from dongtai as d left join adminuser a on d.d_author=a.a_id  where d_id=?";
                pstmt = conn.prepareStatement(sql);
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


                String sql2 = "select * from pinglun as p left join user u on p.pl_author=u.u_id  where pl_dongtai=?";
                pstmt = conn2.prepareStatement(sql2);
                pstmt.setInt(1,id );
                ResultSet rs2=pstmt.executeQuery();

                while(rs2.next()){
                    Pinglun pinglun = new Pinglun();
                    pinglun.setId(rs2.getInt("pl_id"));
                    pinglun.setContent(rs2.getString("pl_content"));
                    pinglun.setCreatetime(rs2.getTimestamp("createtime"));
                    pinglun.setIs_used(rs2.getBoolean("is_used"));
                    User u=new User();
                    u.setId(rs2.getInt("u_id"));
                    u.setName(rs2.getString("u_name"));
                    u.setPass(rs2.getString("u_pass"));
                    pinglun.setAuthor(u);
                    pinglunlist.add(pinglun);

                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        request.setAttribute("d_id",d_id);
        request.setAttribute("pinglunlist",pinglunlist);
        request.setAttribute("dongtaidetail",dongtai);
        request.getRequestDispatcher("dongtaidetail.jsp").forward(request, response);
    }
}
