package edu.mum.damor.converter;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.format.Formatter;

import edu.mum.damor.util.Gender;

public class GenderFormatter implements Formatter<Gender> {

	@Override
	public String print(Gender object, Locale locale) {
		return object.value();
	}

	@Override
	public Gender parse(String text, Locale locale) throws ParseException {
		if (Gender.MALE.value().equals(text))
			return Gender.MALE;
		else if (Gender.FEMALE.value().equals(text))
			return Gender.FEMALE;
		throw new IllegalArgumentException("Invalid gender format. Please use M or F.");
	}

}
