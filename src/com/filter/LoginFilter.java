package com.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(filterName = "LoginFilter")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)arg0;
        String url = request.getRequestURI();

        if(url.contains("admin_login.jsp")||url.contains("admin_checklogin.jsp")) {
            arg2.doFilter(arg0, arg1);
        }else {
            if (request.getSession().getAttribute("adminflag") != null) {
                arg2.doFilter(arg0, arg1);
            } else {
                arg1.setCharacterEncoding("UTF-8");
                arg1.setContentType("text/html;charset=UTF-8");
                PrintWriter out = arg1.getWriter();
                out.print("<script>alert('你还没有登陆，请先登录');location.href='admin_login.jsp'</script>");
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
