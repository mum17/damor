package edu.mum.damor.service;

import java.util.List;

import edu.mum.damor.domain.User;

public interface UserService {

	List<User> findAll();
	
	User save(User user);
	
	User findOne(long id);
	
	User findByEmail(String email);
}
