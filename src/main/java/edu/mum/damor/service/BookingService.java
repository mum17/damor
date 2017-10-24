package edu.mum.damor.service;

import java.util.List;

import edu.mum.damor.domain.Booking;

public interface BookingService {

	List<Booking> findByPassengerId(long passengerId);

	Booking bookSeat(long passengerId, long rideId, int numberOfSeats);
	
	void cancel(long bookingId);
}
