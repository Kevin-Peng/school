package cn.IBeauty.filter;

import java.io.IOException;  
  


import javax.servlet.Filter;  
import javax.servlet.FilterChain;  
import javax.servlet.FilterConfig;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpServletResponseWrapper; 
public class SessionFilter implements Filter {

	public FilterConfig config;  
    
    public void destroy() {  
        this.config = null;  
    }  
      
    public static boolean isContains(String container, String[] regx) {  
        boolean result = false;  
  
        for (int i = 0; i < regx.length; i++) {  
            if (container.indexOf(regx[i]) != -1) {  
                return true;  
            }  
        }  
        return result;  
    }  
  
    public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		javax.servlet.http.HttpServletRequest req = (javax.servlet.http.HttpServletRequest)arg0;
		Object user = req.getSession().getAttribute("user");
		if(user == null){
			req.getSession().setAttribute("errMsg", "你尚未登录，请登录...");
			javax.servlet.http.HttpServletResponse res =(javax.servlet.http.HttpServletResponse)arg1;
			res.sendRedirect("/IBeauty/login.jsp");
		}
		else{
			arg2.doFilter(arg0, arg1);
		}
	} 
  
    public void init(FilterConfig filterConfig) throws ServletException {  
        config = filterConfig;  
    }  
}
