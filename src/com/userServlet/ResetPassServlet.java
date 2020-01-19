package com.userServlet;

import com.dao.User;
import com.dao.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ResetPassServlet")
public class ResetPassServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        int u_id = Integer.parseInt(request.getParameter("u_id"));
        String u_question = request.getParameter("u_question");
        String u_answer = request.getParameter("u_answer");
        String u_pass = request.getParameter("u_pass");
        User user = new User(u_id,u_question,u_answer,u_pass);
        UserServiceImpl service = new UserServiceImpl();
        boolean result = service.zhaohuiUser(user);
        if(result) {
            request.setAttribute("result", result);
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print("<script>alert('密码修改成功');location.href='login.jsp'</script>");
//            request.getRequestDispatcher("login.jsp").forward(request, response);
        }else {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print("<script>alert('密保错误，请重新输入');location.href='test.jsp'</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
