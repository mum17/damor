package edu.mum.damor.controller;

import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import edu.mum.damor.domain.Auth;
import edu.mum.damor.domain.User;
import edu.mum.damor.service.UserService;

@Controller
public class AuthController {

	@Autowired
	UserService userService;
	
	@Autowired
	DataSource dataSource;

	@RequestMapping("/")
	public String home() {
		return "home";
	}

	@RequestMapping("/createdb")
	public String createDefaultDB() {
		//DataSource dataSource = (DataSource)ApplicationContextProvider.getApplicationContext().getBean("dataSource");

		Resource resource = new ClassPathResource("createdb.sql");
		ResourceDatabasePopulator databasePopulator = new ResourceDatabasePopulator(resource);
		databasePopulator.execute(dataSource);
		
		return "redirect:/";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(Auth auth) {
		if (auth.isAuthenticated()) {
			return "redirect:/";
		}
		return "signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void signUp(@ModelAttribute User user) {
		userService.save(user);
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Auth auth) {
		if (auth.isAuthenticated()) {
			return "redirect:/";
		}
		return "login";
	}

	@RequestMapping(value = "/loginfailed", method = RequestMethod.GET)
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
