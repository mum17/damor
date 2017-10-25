<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="table-responsive">
	<table class="table table-bordered table-striped">
		<thead>
			<tr>
				<th rowspan=2 style="vertical-align:middle;">ID</th>
				<th colspan=3 style="text-align:center;">Pickup</th>
				<th colspan=2 style="text-align:center;">Drop off</th>
				<th colspan=6 style="text-align:center;">Information</th>
				<th rowspan=2 style="vertical-align:middle;">&nbsp;</th>
			</tr>
			<tr>
				<th>Point</th>

				<th>Time</th>
				<th>Flexibility</th>
				<th>Point</th>
	
				<th>Time</th>
				<th>Note</th>
				<th>Luggage</th>
				<th>Status</th>
				<th>Price</th>
				<th>Distance</th>
				<th>Seats</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${rides}" var="r">
			<tr>
				<td>${r.id}</td>
				<td>${r.pickupPoint}</td>

				<td><spring:eval expression="r.departureAt"/></td>
				<td>${r.pickupFlexibilityInMinutes}</td>
				<td>${r.dropoffPoint}</td>

				<td><spring:eval expression="r.arrivalAt"/></td>
				<td>${r.note}</td>
				<td>${r.luggageSize}</td>
				<td>${r.status}</td>
				<td>${r.pricePerSeat}</td>
				<td>${r.distanceInMile}</td>
				<td>${r.maxNumberOfSeats}</td>
				<td><input type="button" value="Book seat" onclick="api.bookSeat(${r.id}, 1)" /></td>
			</c:forEach>
		</tbody>
	</table>
</div>