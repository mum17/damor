<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<fieldset><table border=1 cellspacing=0>
<tr><th>User id<th>First name<th>Last name<th>Email<th>Authority<th>Gender<th>&nbsp;
<c:forEach items="${users}" var="u">
<tr><td>${u.id}<td>${u.firstName}<td>${u.lastName}
<td>${u.email}<td>${u.authority}<td>${u.gender}
<td><button onclick="api.editUser(${u.id})">edit</button>
</c:forEach>
</table></fieldset>
</body>
</html>
