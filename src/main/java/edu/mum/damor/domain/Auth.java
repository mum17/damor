package edu.mum.damor.domain;

public class Auth {

	public final User user;

	public Auth(User user) {
		this.user = user;
	}
	
	public boolean isAuthenticated() {
		return user != null;
	}
	
	public boolean isAnonymous() {
		return user == null;
	}
}
