package com.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "CharacterFilter")
public class CharacterFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2) throws ServletException, IOException {
        arg0.setCharacterEncoding("UTF-8");
        arg1.setCharacterEncoding("UTF-8");
        arg1.setContentType("text/html;charset=UTF-8");
        arg2.doFilter(arg0, arg1);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
