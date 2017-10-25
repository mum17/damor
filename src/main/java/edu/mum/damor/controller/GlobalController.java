package edu.mum.damor.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import edu.mum.damor.domain.Auth;
import edu.mum.damor.service.UserService;
import edu.mum.damor.util.DamorException;

@ControllerAdvice
public class GlobalController {
	
	@Autowired
	UserService userService;
	
	@ModelAttribute
	public Auth getUser(Principal principal) {
		if (principal != null) {
			return new Auth(userService.findByEmail(principal.getName()));
		}
		return new Auth(null);
	}

	@ExceptionHandler(DataIntegrityViolationException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ResponseBody
	public String handleError(DataIntegrityViolationException ex) {
		if (ex.getMessage().contains("[users_email_uk]")) {
			return "The email address you have entered is already registered";
		}
		return ex.getMessage();
	}

	@ExceptionHandler(DamorException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ResponseBody
	public String handleError(DamorException ex) {
		return ex.getMessage();
	}

	@ExceptionHandler
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public String handleException(Exception exception, Model model) {
		model.addAttribute("exception", exception);
		return "exception-page";
	}
}
