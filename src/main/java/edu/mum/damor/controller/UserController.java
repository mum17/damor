package edu.mum.damor.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

import edu.mum.damor.domain.Auth;
import edu.mum.damor.domain.User;
import edu.mum.damor.service.UserService;
import edu.mum.damor.util.DamorException;
import edu.mum.damor.util.Debug;
import edu.mum.damor.util.Gender;

@Controller
public class UserController {

	@Autowired
	ServletContext servletContext;
	
	@Autowired
	UserService userService;

	@Autowired
	DataSource dataSource;

	@RequestMapping("/")
	public String home() {
		return "home";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(@ModelAttribute User user, Auth auth) {
		if (auth.isAuthenticated()) {
			return "redirect:/";
		}
		user.setGender(Gender.MALE);
		return "signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signUp(@Valid @ModelAttribute User user, BindingResult br, Model model, HttpServletRequest request) {

		if (br.hasErrors()) {
			return "signup";
		}

		String[] suppressedFields = br.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("Attempt to bind fields that haven't been allowed in initBinder(): "
					+ StringUtils.addStringToArray(suppressedFields, ", "));
		}

		String email = user.getEmail();
		String password = user.getPassword();
		
		try {
			user = userService.save(user);
		} catch (DataIntegrityViolationException ex) {
			if (ex.getMessage().contains("[users_email_uk]")) {
				br.addError(new FieldError("user", "email", email, true, null, null,
						"The email address you have entered is already registered"));
				model.addAttribute("user", user);
				return "signup";
			}
			throw ex;
		}

		savePhoto(user);

		try {
			request.login(email, password);
		} catch (ServletException e) {
			throw new DamorException("Authentication failed", e);
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/user/{userId}", method = RequestMethod.GET)
	public String editUser(@PathVariable("userId") int id, Model model) {
		User user = userService.findOne(id);
		model.addAttribute("theUser", user);
		return "user";
	}
	
	@RequestMapping(value = "/user/*", method = RequestMethod.POST)
	public String editUser(@Valid @ModelAttribute("theUser") User user, BindingResult br, Model model) {
		if (br.hasErrors()) {
			return "user";
		}

		String[] suppressedFields = br.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("Attempt to bind fields that haven't been allowed in initBinder(): "
					+ StringUtils.addStringToArray(suppressedFields, ", "));
		}

		try {
			userService.save(user);
		} catch (DataIntegrityViolationException ex) {
			if (ex.getMessage().contains("[users_email_uk]")) {
				br.addError(new FieldError("user", "email", user.getEmail(), true, null, null,
						"The email address you have entered is already registered"));
				model.addAttribute("theUser", user);
				return "user";
			}
			throw ex;
		}

		savePhoto(user);

		return "redirect:/users";
	}
	
	private void savePhoto(User user) {
		MultipartFile photo = user.getPhoto();
		Debug.log("save photo", photo != null && !photo.isEmpty());
		if (photo != null && !photo.isEmpty()) {
			String filename = user.getId() + ".png";
			try {
				String root = System.getProperty("user.home") + File.separator + "damor_photos";
				File target = new File(root);
				if (!target.exists()) target.mkdirs();
				photo.transferTo(new File(target, filename));
			} catch (Exception ex) {
				throw new DamorException("Employee photo saving failed:" + ex.getMessage(), ex);
			}
		}
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

	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String myRides(Model model, Auth auth) {
		model.addAttribute("users", userService.findAll());
		return "users";
	}
	
}
