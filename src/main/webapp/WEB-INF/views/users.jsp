<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<legend>List of Users</legend>

<div class="table-responsive">
	<table class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>&nbsp;</th>
			<th>User id</th>
			<th>First name</th>
			<th>Last name</th>
			<th>Email</th>
			<th>Authority</th>
			<th>Gender</th>
			<th>&nbsp;</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${users}" var="u">
		<tr>
			<td><div style="margin: 0 auto; width: 60px"><img class="avatar" style="width:60px;height:60px;" 
			src="<spring:url value="/photos/${u.id}.png"/>" 
          onerror="if (this.src != '<spring:url value="/resources/no_avatar.png"/>') this.src = '<spring:url value="/resources/no_avatar.png"/>';"/></div></td>
			<td>${u.id}</td>
			<td>${u.firstName}</td>
			<td>${u.lastName}</td>
			<td>${u.email}</td>
			<td>${u.authority}</td>
			<td>${u.gender}</td>
			<td style="text-align:center;"><button class="btn btn-primary" onclick="api.editUser(${u.id})">edit</button></td>
		</c:forEach>
	</tbody>
	</table>
</div>
</body>
</html>

