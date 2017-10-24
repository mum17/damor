package edu.mum.damor.controller;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import edu.mum.damor.util.DamorException;

@ControllerAdvice
public class ExceptionController {

	@ExceptionHandler(DataIntegrityViolationException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ResponseBody
	public String handleError(DataIntegrityViolationException ex) {
		if (ex.getMessage().contains("[user_email_uk]")) {
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
