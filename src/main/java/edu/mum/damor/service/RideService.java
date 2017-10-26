package edu.mum.damor.service;

import java.util.List;

import org.springframework.validation.BindingResult;

import edu.mum.damor.domain.Ride;
import edu.mum.damor.domain.RideSearchInfo;
import edu.mum.damor.domain.dto.DomainErrors;

public interface RideService {
	
	Ride offerRide(Ride ride);

	List<Ride> findAll(Long driverId);
	
	List<Ride> findAll();
	
	List<Ride> findAll(RideSearchInfo info);

	void cancel(long rideId);
	
	public DomainErrors formatBindingResult(BindingResult br);
}
