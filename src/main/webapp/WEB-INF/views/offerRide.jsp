<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<fieldset><legend>Offer ride</legend><form><table>
	<tr><td>Pickup point<td><input name="pickupPoint" size=100 value="2701 W Burlington Ave, Fairfield, IA 52556, USA" />
	<tr><td>Pickup latitude<td><input name="pickupLat" value="41.0076525" />
	<tr><td>Pickup longitude<td><input name="pickupLng" value="-91.993235" />
	<tr><td>Drop-off point<td><input name="dropoffPoint" size=100 value="Ottumwa, IA 52501, USA" />
	<tr><td>Drop-off latitude<td><input name="dropoffLat" value="41.016029" />
	<tr><td>Drop-off longitude<td><input name="dropoffLng" value="-92.408302" />
	<tr><td>Departure at<td><input name="departureAt" value="10/22/2017 10:30"/>
	<tr><td>Arrival at<td><input name="arrivalAt" value="10/26/2017 14:35"/>
	<tr><td>Note</td><td><input name="note" value="hello note"/></td>
	<tr><td>Luggage size:</td><td>
		<label><input type="radio" name="luggageSize" value="S" checked/> Small</label>
		<label><input type="radio" name="luggageSize" value="M"/> Medium</label>
		<label><input type="radio" name="luggageSize" value="F"/> Large</label>
	<tr><td>Pickup flexibility</td><td><input name="pickupFlexibilityInMinutes" value="30"/> (in minutes)</td>
	<tr><td>Price per seats</td><td><input name="pricePerSeat" value="10"/></td>
	<tr><td>Max number of seats</td><td><input name="maxNumberOfSeats" value="3"/></td>
	<tr><td>Distance</td><td><input name="distanceInMile" value="23"/>(in miles)</td>
	<tr><td><td><input type="button" value="Offer ride" onclick="api.offerRide(this.form)" />
	<a href="<spring:url value="/myRides"/>">My rides</a>
</table></form></fieldset>