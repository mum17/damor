<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<div class="table-responsive">
<table class="table table-bordered table-striped">
<thead >
<tr >
	<th rowspan=2 style="vertical-align:middle;">ID</th>
	<th colspan=2 style="text-align:center;">Pickup</th>
	<th rowspan=2 style="vertical-align:middle;">Range</th>
	<th colspan=2 style="text-align:center;">Drop off</th>
	<th colspan=6 style="text-align:center;">Ride Details</th>
	<th rowspan=2 style="vertical-align:middle;">Action</th>
</tr>
<tr>
	<th style="text-align:center;">Point</th>
	<th style="display:none;">Latitude</th>
	<th style="display:none;">Longitude</th>
	<th style="text-align:center;">Time</th>
	<th style="text-align:center;">Point</th>
	<th style="display:none;">Latitude</th>
	<th style="display:none;">Longitude</th>
	<th style="text-align:center;">Time</th>
	<th style="text-align:center;">Note</th>
	<th style="text-align:center;">Luggage</th>
	<th style="text-align:center;">Status</th>
	<th style="text-align:center;">Price</th>
	<th style="text-align:center;">Distance</th>
	<th style="text-align:center;">Seats</th>
</thead>
<c:forEach items="${rides}" var="r">
<tr>
	<td>${r.id}</td>
	<td>${r.pickupPoint}</td>
	<td style="display:none;">${r.pickupLat}</td>
	<td style="display:none;">${r.pickupLng}</td>
	<td><spring:eval expression="r.departureAt"/></td>
	<td>${r.pickupFlexibilityInMinutes}</td>
	<td>${r.dropoffPoint}</td>
	<td style="display:none;">${r.dropoffLat}</td>
	<td style="display:none;">${r.dropoffLng}</td>
	<td><spring:eval expression="r.arrivalAt"/></td>
	<td>${r.note}</td>
	<td>${r.luggageSize}</td>
	<td>${r.status}</td>
	<td>${r.pricePerSeat}</td>
	<td>${r.distanceInMile}</td>
	<td>${r.maxNumberOfSeats}</td>
	<td><button class="btn btn-danger" onclick="api.cancelRide(${r.id})">cancel</button></td>
</c:forEach>

</table>
 	</div>
