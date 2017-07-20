package cn.IBeauty.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;

public class RegistFilter implements Filter{
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
			String requestURI = req.getRequestURI();
			//System.out.println(requestURI);
			HttpSession session = req.getSession(); 
            String email=req.getParameter("email");
            String nickname=req.getParameter("nickname");
            String ecode= req.getParameter("valild");
            String pwd=req.getParameter("pwd");
            String spwd=req.getParameter("spwd");
            String emailOK = (String) session.getAttribute("emailOK");  
            String NameOK  = (String) session.getAttribute("NameOK");

			if(emailOK!=null  ||  NameOK!=null || ecode==null || email==null || nickname==null || pwd==null || spwd==null){
				req.getSession().setAttribute("errMsg", "请正确填写注册信息");
				javax.servlet.http.HttpServletResponse res =(javax.servlet.http.HttpServletResponse)arg1;
				res.sendRedirect("/IBeauty/regist.jsp");
			}
			else{
				arg2.doFilter(arg0, arg1);
			}
		} 
	 public void init(FilterConfig filterConfig) throws ServletException {  
	        config = filterConfig;  
	    } 
}
