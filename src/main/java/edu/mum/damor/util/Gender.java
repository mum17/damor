package edu.mum.damor.util;

public enum Gender {
	MALE("M"), FEMALE("F");
	
	private final String value;

	private Gender(String value) {
		this.value = value;
	}
	
	public String value() {
		return this.value;
	}
}
