package edu.mum.damor.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.damor.converter.LocalDateTimeAttributeConverter;
import edu.mum.damor.domain.Ride;
import edu.mum.damor.domain.RideSearchInfo;
import edu.mum.damor.repository.RideRepository;
import edu.mum.damor.service.RideService;
import edu.mum.damor.util.RideStatus;

@Service
@Transactional
public class RideServiceImpl implements RideService {

	@Autowired
	RideRepository rideRepository;

	@Override
	public Ride offerRide(Ride ride) {
		ride.setStatus(RideStatus.AVAILABLE);
		return rideRepository.save(ride);
	}

	@Override
	public List<Ride> findAll(Long driverId) {
		return rideRepository.findByDriverId(driverId);
	}

	@Override
	public List<Ride> findAll() {
		return (List<Ride>) rideRepository.findAll();
	}

	@Override
	public void cancel(long rideId) {
		Ride ride = rideRepository.findOne(rideId);
		ride.setStatus(RideStatus.CANCELLED);
		rideRepository.save(ride);
	}

	@Override
	public List<Ride> findAll(RideSearchInfo info) {
		System.out.println(info);
		LocalDateTimeAttributeConverter a = new LocalDateTimeAttributeConverter();
		return rideRepository.findAll(info.getPickupLat(), info.getPickupLng(), info.getPickupRadius(), //
				info.getDropoffLat(), info.getDropoffLng(), info.getDropoffRadius(), //
				a.convertToDatabaseColumn(info.getDepartureAtFrom()), //
				a.convertToDatabaseColumn(info.getDepartureAtTo()), //
				info.getPriceFrom(), info.getPriceTo());
	}

}
