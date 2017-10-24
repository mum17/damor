package edu.mum.damor.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.damor.domain.Booking;
import edu.mum.damor.domain.Ride;
import edu.mum.damor.repository.BookingRepository;
import edu.mum.damor.repository.RideRepository;
import edu.mum.damor.repository.UserRepository;
import edu.mum.damor.service.BookingService;
import edu.mum.damor.util.DamorException;
import edu.mum.damor.util.RideStatus;

@Service
@Transactional
public class BookingServiceImpl implements BookingService {

	@Autowired
	BookingRepository bookingRepository;
	
	@Autowired
	RideRepository rideRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Override
	public List<Booking> findByPassengerId(long passengerId) {
		return bookingRepository.findByPassengerId(passengerId);
	}

	@Override
	public Booking bookSeat(long passengerId, long rideId, int numberOfSeats) {
		Ride ride = rideRepository.findOne(rideId);
		if (ride.getStatus() != RideStatus.AVAILABLE) {
			throw new DamorException("Ride is not available");
		}
		
		Booking booking = new Booking();
		booking.setRide(ride);
		booking.setPassenger(userRepository.findOne(passengerId));
		booking.setBookingAt(LocalDateTime.now());
		booking.setNumberOfSeats(numberOfSeats);
				
		if (ride.availableSeats() - numberOfSeats == 0) {
			ride.setStatus(RideStatus.FULL);
			rideRepository.save(ride);
		}
		
		return bookingRepository.save(booking);
	}

	@Override
	public void cancel(long bookingId) {
		Booking booking = bookingRepository.findOne(bookingId);
		bookingRepository.delete(bookingId);
		Ride ride = rideRepository.findOne(booking.getRide().getId());
		if (ride.getStatus() == RideStatus.FULL && ride.availableSeats() > 0) {
			ride.setStatus(RideStatus.AVAILABLE);
			rideRepository.save(ride);
		}
	}

	
}
