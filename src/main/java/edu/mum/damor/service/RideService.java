package edu.mum.damor.service;

import java.util.List;

import edu.mum.damor.domain.Ride;
import edu.mum.damor.domain.RideSearchInfo;

public interface RideService {
	
	Ride offerRide(Ride ride);

	List<Ride> findAll(Long driverId);
	
	List<Ride> findAll();
	
	List<Ride> findAll(RideSearchInfo info);

	void cancel(long rideId);
}
