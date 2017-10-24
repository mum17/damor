<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<fieldset><legend>Find ride</legend><form><table>
	<tr><td>Pickup latitude<td><input name="pickupLat" value="41.0178238" />
	<tr><td>Pickup longitude<td><input name="pickupLng" value="-91.9672906" />
	<tr><td>Pickup radius</td><td><input name="pickupRadius" value="1"/>(in miles)</td>
	<tr><td>Drop-off latitude<td><input name="dropoffLat" value="41.016029"/>
	<tr><td>Drop-off longitude<td><input name="dropoffLng" value="-92.408302"/>
	<tr><td>Drop-off radius</td><td><input name="dropoffRadius" value="1"/>(in miles)</td>
	<tr><td>Departure at from<td><input name="departureAtFrom" value="10/22/2017 09:30"/>
	<tr><td>Departure at to<td><input name="departureAtTo" value="10/22/2017 12:30"/>
	<tr><td>Price from<td><input name="priceFrom" value="0"/>
	<tr><td>Price from<td><input name="priceTo" value="100"/>
	<tr><td><td><input type="button" value="Find ride" onclick="api.findRide(this.form)" />
		<a href="<spring:url value="/myBookings"/>">My bookings</a>
</table></form></fieldset>

<fieldset><legend>Found rides</legend>
<div id="foundRides"></div>
</fieldset>