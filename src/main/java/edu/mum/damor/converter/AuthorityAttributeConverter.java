package edu.mum.damor.converter;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import edu.mum.damor.util.Authority;

@Converter(autoApply = true)
public class AuthorityAttributeConverter implements AttributeConverter<Authority, String> {

	@Override
	public String convertToDatabaseColumn(Authority attribute) {
		return attribute.value();
	}

	@Override
	public Authority convertToEntityAttribute(String dbData) {
		if (Authority.ADMIN.value().equals(dbData))
			return Authority.ADMIN;
		else if (Authority.USER.value().equals(dbData))
			return Authority.USER;
		throw new IllegalArgumentException("Invalid authority format. Please use ADMIN or USER.");
	}

}
