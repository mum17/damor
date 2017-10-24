package edu.mum.damor.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import edu.mum.damor.domain.User;
import edu.mum.damor.service.UserService;

@Controller
public class AuthController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup() {
		return "signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void signUp(@ModelAttribute User user) {
		userService.save(user);
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ResponseBody
	public String loginfailed(Model model) {
		Map<String, Object> map = model.asMap();
		for (String key : map.keySet()) {
			System.out.println(key + "->" + map.get(key));
		}
 		return "Invalid email or password";
 
	}
	
}
