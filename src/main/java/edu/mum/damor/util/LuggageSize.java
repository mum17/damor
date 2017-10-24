package edu.mum.damor.util;

public enum LuggageSize {
	SMALL("S"), MEDIUM("M"), LARGE("L");
	
	private final String value;
	
	private LuggageSize(String value) {
		this.value = value;
	}
	
	public String value() {
		return value;
	}
}
