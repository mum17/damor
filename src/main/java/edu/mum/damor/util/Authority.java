package edu.mum.damor.util;

public enum Authority {
	ADMIN("ADMIN"), USER("USER");
	
	private final String value;

	private Authority(String value) {
		this.value = value;
	}
	
	public String value() {
		return this.value;
	}
}
