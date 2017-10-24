package edu.mum.damor.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.damor.domain.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

	User findByEmail(String email);
}
