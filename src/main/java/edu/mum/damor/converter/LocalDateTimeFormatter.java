package edu.mum.damor.converter;

import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import org.springframework.format.Formatter;

public class LocalDateTimeFormatter implements Formatter<LocalDateTime> {

	private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("M/d/yyyy HH:mm").withLocale(Locale.US);
	
	@Override
	public String print(LocalDateTime object, Locale locale) {
		return object.format(formatter);
	}

	@Override
	public LocalDateTime parse(String text, Locale locale) throws ParseException {
		if ("".equals(text)) {
			return null;
		}
		return LocalDateTime.parse(text, formatter);
	}

}
