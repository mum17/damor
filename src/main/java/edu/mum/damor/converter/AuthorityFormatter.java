package edu.mum.damor.converter;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.format.Formatter;

import edu.mum.damor.util.Authority;

public class AuthorityFormatter implements Formatter<Authority> {

	@Override
	public String print(Authority object, Locale locale) {
		return object.value();
	}

	@Override
	public Authority parse(String text, Locale locale) throws ParseException {
		if (Authority.ADMIN.value().equals(text))
			return Authority.ADMIN;
		else if (Authority.USER.value().equals(text))
			return Authority.USER;
		throw new IllegalArgumentException("Invalid authority format. Please use ADMIN or USER.");
	}

}
