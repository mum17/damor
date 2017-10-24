package edu.mum.damor.domain;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.validator.constraints.NotEmpty;

import edu.mum.damor.util.LuggageSize;
import edu.mum.damor.util.RideStatus;

@Entity
@Table(name = "rides")
public class Ride {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ride_id")
	private long id;

	@ManyToOne(optional = false)
	@JoinColumn(name = "driver_id")
	private User driver;

	@Column(name = "pickup_point", length = 100, nullable = false)
	@NotEmpty
	private String pickupPoint;

	@Column(name = "dropoff_point", length = 100, nullable = false)
	@NotEmpty
	private String dropoffPoint;

	@Column(name = "departure_at", nullable = false)
	@NotNull
	private LocalDateTime departureAt;

	@Column(name = "arrival_at", nullable = false)
	@NotNull
	private LocalDateTime arrivalAt;

	@Column(name = "note")
	private String note;

	@Column(name = "luggage_size", length = 1, nullable = false)
	@NotNull
	private LuggageSize luggageSize;

	@Column(name = "pickup_flexibility_in_minutes", nullable = false)
	private int pickupFlexibilityInMinutes;

	@Column(name = "status", nullable = false)
	private RideStatus status;

	@Column(name = "price_per_seat", nullable = false)
	private double pricePerSeat;

	@Column(name = "max_number_of_seats", nullable = false)
	private int maxNumberOfSeats;

	@Column(name = "pickup_lat", nullable = false)
	private double pickupLat;

	@Column(name = "pickup_lng", nullable = false)
	private double pickupLng;

	@Column(name = "dropoff_lat", nullable = false)
	private double dropoffLat;

	@Column(name = "dropoff_lng", nullable = false)
	private double dropoffLng;

	@Column(name = "distance_in_mile", nullable = false)
	private double distanceInMile;

	@OneToMany(mappedBy = "ride")
	@Fetch(FetchMode.JOIN)
	private List<Booking> bookings;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public User getDriver() {
		return driver;
	}

	public void setDriver(User driver) {
		this.driver = driver;
	}

	public String getPickupPoint() {
		return pickupPoint;
	}

	public void setPickupPoint(String pickupPoint) {
		this.pickupPoint = pickupPoint;
	}

	public String getDropoffPoint() {
		return dropoffPoint;
	}

	public void setDropoffPoint(String dropoffPoint) {
		this.dropoffPoint = dropoffPoint;
	}

	public LocalDateTime getDepartureAt() {
		return departureAt;
	}

	public void setDepartureAt(LocalDateTime departureAt) {
		this.departureAt = departureAt;
	}

	public LocalDateTime getArrivalAt() {
		return arrivalAt;
	}

	public void setArrivalAt(LocalDateTime arrivalAt) {
		this.arrivalAt = arrivalAt;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public LuggageSize getLuggageSize() {
		return luggageSize;
	}

	public void setLuggageSize(LuggageSize luggageSize) {
		this.luggageSize = luggageSize;
	}

	public int getPickupFlexibilityInMinutes() {
		return pickupFlexibilityInMinutes;
	}

	public void setPickupFlexibilityInMinutes(int pickupFlexibilityInMinutes) {
		this.pickupFlexibilityInMinutes = pickupFlexibilityInMinutes;
	}

	public RideStatus getStatus() {
		return status;
	}

	public void setStatus(RideStatus status) {
		this.status = status;
	}

	public double getPricePerSeat() {
		return pricePerSeat;
	}

	public void setPricePerSeat(double pricePerSeat) {
		this.pricePerSeat = pricePerSeat;
	}

	public int getMaxNumberOfSeats() {
		return maxNumberOfSeats;
	}

	public void setMaxNumberOfSeats(int maxNumberOfSeats) {
		this.maxNumberOfSeats = maxNumberOfSeats;
	}

	public double getPickupLat() {
		return pickupLat;
	}

	public void setPickupLat(double pickupLat) {
		this.pickupLat = pickupLat;
	}

	public double getPickupLng() {
		return pickupLng;
	}

	public void setPickupLng(double pickupLng) {
		this.pickupLng = pickupLng;
	}

	public double getDropoffLat() {
		return dropoffLat;
	}

	public void setDropoffLat(double dropoffLat) {
		this.dropoffLat = dropoffLat;
	}

	public double getDropoffLng() {
		return dropoffLng;
	}

	public void setDropoffLng(double dropoffLng) {
		this.dropoffLng = dropoffLng;
	}

	public double getDistanceInMile() {
		return distanceInMile;
	}

	public void setDistanceInMile(double distanceInMile) {
		this.distanceInMile = distanceInMile;
	}

	public List<Booking> getBookings() {
		return bookings;
	}

	public void setBookings(List<Booking> bookings) {
		this.bookings = bookings;
	}
	
	public void addBooking(Booking booking) {
		this.bookings.add(booking);
	}
	
	public int availableSeats() {
		int seats = 0;
		for (Booking b : getBookings()) {
			seats += b.getNumberOfSeats();
		}
		return maxNumberOfSeats - seats;
	}

}
