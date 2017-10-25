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
    <th style="text-align:center;">Flexibility</th>
	<th style="text-align:center;">Point</th>
	<th style="display:none;">Latitude</th>
	<th style="display:none;">Longitude</th>
	<th style="text-align:center;">Time</th>
	<th style="text-align:center;">Note</th>
	<th style="text-align:center;">Luggage</th>
	<th style="text-align:center;">Status</th>
	<th style="text-align:center;">Price</th>
	<th style="text-align:center;">Distance</th>
<!-- 	<th style="text-align:center;">Seats</th> -->
</thead>
<c:forEach items="${rides}" var="r">
<tr><td>${r.id}
<td>${r.pickupPoint}<td style="display:none;">${r.pickupLat}<td style="display:none;">${r.pickupLng}<td><spring:eval expression="r.departureAt"/><td>${r.pickupFlexibilityInMinutes}
<td>${r.dropoffPoint}<td style="display:none;">${r.dropoffLat}<td style="display:none;">${r.dropoffLng}<td><spring:eval expression="r.arrivalAt"/>
<td>${r.note}<td>${r.luggageSize}<td>${r.status}<td>${r.pricePerSeat}<td>${r.distanceInMile}<td>${r.maxNumberOfSeats}
<td><button class="btn btn-danger" onclick="api.cancelRide(${r.id})">cancel</button>
</c:forEach>

</table>
 	</div>
