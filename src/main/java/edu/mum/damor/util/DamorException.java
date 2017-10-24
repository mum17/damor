package edu.mum.damor.util;

public class DamorException extends RuntimeException {

	private static final long serialVersionUID = 3917817032415017754L;

	public DamorException() {
		super();
	}

	public DamorException(String message, Throwable cause) {
		super(message, cause);
	}

	public DamorException(String message) {
		super(message);
	}

	public DamorException(Throwable cause) {
		super(cause);
	}

	
}
