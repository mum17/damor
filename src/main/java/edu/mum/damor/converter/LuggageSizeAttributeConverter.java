package edu.mum.damor.converter;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import edu.mum.damor.util.LuggageSize;

@Converter(autoApply = true)
public class LuggageSizeAttributeConverter implements AttributeConverter<LuggageSize, String> {

	@Override
	public String convertToDatabaseColumn(LuggageSize attribute) {
		return attribute.value();
	}

	@Override
	public LuggageSize convertToEntityAttribute(String dbData) {
		if (LuggageSize.SMALL.value().equals(dbData))
			return LuggageSize.SMALL;
		else if (LuggageSize.MEDIUM.value().equals(dbData))
			return LuggageSize.MEDIUM;
		else if (LuggageSize.LARGE.value().equals(dbData))
			return LuggageSize.LARGE;
		throw new IllegalArgumentException("Invalid luggage size format. Please use S, M or L.");
	}

}
