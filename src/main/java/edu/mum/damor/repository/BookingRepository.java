package edu.mum.damor.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.damor.domain.Booking;

@Repository
public interface BookingRepository extends CrudRepository<Booking, Long> {

	List<Booking> findByPassengerId(long passengerId);
}
