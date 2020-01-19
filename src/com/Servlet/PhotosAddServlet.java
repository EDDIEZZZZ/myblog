package com.Servlet;

import com.bean.Adminuser;
import com.sql.ConnDB;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "PhotosAddServlet")
public class PhotosAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String albumid = null;
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> fileitemlist;

        try{
            fileitemlist = upload.parseRequest(request);
            for(FileItem fm:fileitemlist){
                if(fm.isFormField()){
                    if("albumid".equals(fm.getFieldName())){
                        albumid=fm.getString();
                    }
                }else {

                    String filename = UUID.randomUUID().toString()+fm.getName().substring(fm.getName().lastIndexOf("."));

                    String filePath = request.getSession().getServletContext().getRealPath("upload");

                    File outputFile = new File(filePath + "\\" + filename);
                    fm.write(outputFile);
                    //fileRULlist.add("upload/" + fm.getName());
                    //fileRULList.add(outputFile.getPath());
                    Adminuser adminusersql=(Adminuser) request.getSession().getAttribute("adminuser");

                        Connection conn = ConnDB.getConn();
                        String sql ="insert into photos(p_title,p_url,p_album,p_author) value(?,?,?,?)";
                        PreparedStatement pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, fm.getName().substring(0,fm.getName().lastIndexOf(".")));
                        pstmt.setString(2, "upload/" + filename);
                        pstmt.setInt(3,Integer.parseInt(albumid));
                        pstmt.setInt(4,adminusersql.getId());
                        pstmt.executeUpdate();
                        response.setCharacterEncoding("UTF-8");
                        response.setContentType("text/html;charset=UTF-8");
                        response.getWriter().print("<script>alert('上传成功');location.href='AlbumsListServlet'</script>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
