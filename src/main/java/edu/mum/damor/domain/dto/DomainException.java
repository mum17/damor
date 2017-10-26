package edu.mum.damor.domain.dto;

public class DomainException extends RuntimeException {

	private static final long serialVersionUID = -7875310257219303006L;

	public final DomainErrors errors;

	public DomainException(DomainErrors errors) {
		this.errors = errors;
	}

}
