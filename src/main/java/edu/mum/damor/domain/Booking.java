package edu.mum.damor.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "bookings")
public class Booking {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "booking_id")
	private long id;

	@ManyToOne(optional = false)
	@JoinColumn(name = "ride_id")
	private Ride ride;

	@ManyToOne(optional = false)
	@JoinColumn(name = "passenger_id")
	private User passenger;

	@Column(name = "booking_at", nullable = false)
	private LocalDateTime bookingAt;

	@Column(name = "number_of_seats", nullable = false)
	private int numberOfSeats;

	@Column(name = "passenger_comment")
	private String passengerComment;

	@Column(name = "passenger_rating")
	private int passengerRating;

	@Column(name = "driver_comment")
	private String driverComment;

	@Column(name = "driver_rating")
	private int driverRating;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Ride getRide() {
		return ride;
	}

	public void setRide(Ride ride) {
		this.ride = ride;
	}

	public User getPassenger() {
		return passenger;
	}

	public void setPassenger(User passenger) {
		this.passenger = passenger;
	}

	public LocalDateTime getBookingAt() {
		return bookingAt;
	}

	public void setBookingAt(LocalDateTime bookingAt) {
		this.bookingAt = bookingAt;
	}

	public int getNumberOfSeats() {
		return numberOfSeats;
	}

	public void setNumberOfSeats(int numberOfSeats) {
		this.numberOfSeats = numberOfSeats;
	}

	public String getPassengerComment() {
		return passengerComment;
	}

	public void setPassengerComment(String passengerComment) {
		this.passengerComment = passengerComment;
	}

	public int getPassengerRating() {
		return passengerRating;
	}

	public void setPassengerRating(int passengerRating) {
		this.passengerRating = passengerRating;
	}

	public String getDriverComment() {
		return driverComment;
	}

	public void setDriverComment(String driverComment) {
		this.driverComment = driverComment;
	}

	public int getDriverRating() {
		return driverRating;
	}

	public void setDriverRating(int driverRating) {
		this.driverRating = driverRating;
	}

}
