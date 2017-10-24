package edu.mum.damor.converter;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;

import edu.mum.damor.domain.User;
import edu.mum.damor.service.UserService;

public class UserFormatter implements Formatter<User> {

	@Autowired
	UserService userService;
	
	@Override
	public String print(User object, Locale locale) {
		return String.valueOf(object.getId());
	}

	@Override
	public User parse(String text, Locale locale) throws ParseException {
		if ("".equals(text)) {
			return null;
		}
		return userService.findOne(Long.parseLong(text));
	}

}
