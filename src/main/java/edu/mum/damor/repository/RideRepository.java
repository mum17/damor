package edu.mum.damor.repository;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.damor.domain.Ride;

@Repository
public interface RideRepository extends CrudRepository<Ride, Long> {

	List<Ride> findByDriverId(Long driverId);

	@Query(value = "SELECT * FROM rides r " + //
			"where geodist(r.pickup_lat, r.pickup_lng, ?1, ?2) < ?3" + //
			"  and geodist(r.dropoff_lat, r.dropoff_lng, ?4, ?5) < ?6" + //
			"  and r.departure_at between ?7 and ?8 " + //
			"  and r.price_per_seat between ?9 and ?10" + //
			"  and r.status = 1", nativeQuery = true)
	public List<Ride> findAll(double pickupLat, double pickupLng, double pickupRadius, //
			double dropoffLat, double dropoffLng, double dropoffRadius, //
			Timestamp departureAtFrom, Timestamp departureAtTo, //
			double priceFrom, double priceTo);
}
