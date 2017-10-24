package edu.mum.damor.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.damor.domain.User;
import edu.mum.damor.repository.UserRepository;
import edu.mum.damor.service.UserService;
import edu.mum.damor.util.Authority;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepository;

	@Override
	public List<User> findAll() {
		return (List<User>) userRepository.findAll();
	}

	@Override
	public User save(User user) {
		if (user.getAuthority() == null) {
			user.setAuthority(Authority.USER);
		}
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(hashedPassword);
		return userRepository.save(user);
	}

	@Override
	public User findOne(long id) {
		return userRepository.findOne(id);
	}

	@Override
	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}

}
