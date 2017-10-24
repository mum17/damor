<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<fieldset><table border=1 cellspacing=0>
<tr><th>ID<th>Ride id<th>Booking time<th>Seats<th>My comment<th>My rating<th>Driver comment<th>Driver rating<th>&nbsp;
<c:forEach items="${bookings}" var="b">
<tr><td>${b.id}<td>${b.ride.id}<td>${b.bookingAt}<td>${b.numberOfSeats}
<td>${b.passengerComment}<td>${b.passengerRating}<td>${b.driverComment}<td>${b.driverRating}
<td><button onclick="api.cancelBooking(${b.id})">cancel</button>
</c:forEach>
</table></fieldset>
</body>
</html>
