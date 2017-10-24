package edu.mum.damor.converter;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.format.Formatter;

import edu.mum.damor.util.LuggageSize;

public class LuggageSizeFormatter implements Formatter<LuggageSize> {

	@Override
	public String print(LuggageSize object, Locale locale) {
		return object.value();
	}

	@Override
	public LuggageSize parse(String text, Locale locale) throws ParseException {
		if (LuggageSize.SMALL.value().equals(text))
			return LuggageSize.SMALL;
		else if (LuggageSize.MEDIUM.value().equals(text))
			return LuggageSize.MEDIUM;
		else if (LuggageSize.LARGE.value().equals(text))
			return LuggageSize.LARGE;
		throw new IllegalArgumentException("Invalid luggage size format. Please use S, M or L.");
	}

}
