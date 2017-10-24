package edu.mum.damor.domain;

import java.time.LocalDateTime;

public class RideSearchInfo {

	private double pickupLat;
	private double pickupLng;
	private double pickupRadius;
	private double dropoffLat;
	private double dropoffLng;
	private double dropoffRadius;
	private LocalDateTime departureAtFrom;
	private LocalDateTime departureAtTo;
	private double priceFrom;
	private double priceTo;
	
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
	public double getPickupRadius() {
		return pickupRadius;
	}
	public void setPickupRadius(double pickupRadius) {
		this.pickupRadius = pickupRadius;
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
	public double getDropoffRadius() {
		return dropoffRadius;
	}
	public void setDropoffRadius(double dropoffRadius) {
		this.dropoffRadius = dropoffRadius;
	}
	public LocalDateTime getDepartureAtFrom() {
		return departureAtFrom;
	}
	public void setDepartureAtFrom(LocalDateTime departureAtFrom) {
		this.departureAtFrom = departureAtFrom;
	}
	public LocalDateTime getDepartureAtTo() {
		return departureAtTo;
	}
	public void setDepartureAtTo(LocalDateTime departureAtTo) {
		this.departureAtTo = departureAtTo;
	}
	public double getPriceFrom() {
		return priceFrom;
	}
	public void setPriceFrom(double priceFrom) {
		this.priceFrom = priceFrom;
	}
	public double getPriceTo() {
		return priceTo;
	}
	public void setPriceTo(double priceTo) {
		this.priceTo = priceTo;
	}
	@Override
	public String toString() {
		return "RideSearchInfo [pickupLat=" + pickupLat + ", pickupLng=" + pickupLng + ", pickupRadius=" + pickupRadius
				+ ", dropoffLat=" + dropoffLat + ", dropoffLng=" + dropoffLng + ", dropoffRadius=" + dropoffRadius
				+ ", departureAtFrom=" + departureAtFrom + ", departureAtTo=" + departureAtTo + ", priceFrom="
				+ priceFrom + ", priceTo=" + priceTo + "]";
	}

	
}
