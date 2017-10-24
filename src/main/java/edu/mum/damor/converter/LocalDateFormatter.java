package edu.mum.damor.converter;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import org.springframework.format.Formatter;

public class LocalDateFormatter implements Formatter<LocalDate> {

	private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("M/d/yyyy").withLocale(Locale.US);
	
	@Override
	public String print(LocalDate object, Locale locale) {
		return object.format(formatter);
	}

	@Override
	public LocalDate parse(String text, Locale locale) throws ParseException {
		if ("".equals(text)) {
			return null;
		}
		return LocalDate.parse(text, formatter);
	}

}
