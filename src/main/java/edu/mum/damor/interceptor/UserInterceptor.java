package edu.mum.damor.interceptor;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import edu.mum.damor.domain.User;
import edu.mum.damor.service.UserService;

public class UserInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	UserService userService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		request.getSession().setAttribute("user", getUser(request));
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		User user = getUser(request);
		if (user == null) {
			user = new User();
		}
		if (modelAndView != null) {
			ModelMap modelMap = modelAndView.getModelMap();
			if (modelMap != null) {
				modelMap.addAttribute("user", user);
			}
		}
	}

	private User getUser(HttpServletRequest request) {
		Principal principal = request.getUserPrincipal();
		User user = null;

		if (principal != null) {
			return userService.findByEmail(principal.getName());
		}
		return user;
	}

}
