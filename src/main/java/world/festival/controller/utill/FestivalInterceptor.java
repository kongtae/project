package world.festival.controller.utill;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class FestivalInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		String loginid = (String)session.getAttribute("loginid");
		String adminid = (String)session.getAttribute("adminid");
		if(loginid==null){
			
			String path = request.getContextPath();
			System.out.println(path);
			response.sendRedirect("interseptorLogin");
			return false;
		}
		return true;
		
	}
	
		@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
			System.out.println("���� postHandle");
	}
		
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("���� afterCompletion");
	}
	
}
