package kr.co.jhta.controller.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.jhta.vo.User;

public class AdminCheckHandlerInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("LOGIN_USER");
		System.out.println(((User) obj).getGrade());
		if (!"A".equals(((User) obj).getGrade())) {
			response.sendRedirect("/jhta/home.do?error=deny");
			return false;
		}
		return true;
	}
}
