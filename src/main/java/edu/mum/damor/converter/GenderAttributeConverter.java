package edu.mum.damor.converter;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import edu.mum.damor.util.Gender;

@Converter(autoApply = true)
public class GenderAttributeConverter implements AttributeConverter<Gender, String> {

	@Override
	public String convertToDatabaseColumn(Gender attribute) {
		return attribute.value();
	}

	@Override
	public Gender convertToEntityAttribute(String dbData) {
		if (Gender.MALE.value().equals(dbData))
			return Gender.MALE;
		else if (Gender.FEMALE.value().equals(dbData))
			return Gender.FEMALE;
		throw new IllegalArgumentException("Invalid gender format. Please use M or F.");
	}

}
