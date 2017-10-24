<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<fieldset><legend>Login</legend>
<form action="<spring:url value="/postLogin"></spring:url>" method="post">
<table>
	<tr><td>Email<td><input name="email" />
	<tr><td>Password<td><input name="password" />
	<tr><td><td><input type="submit" value="Login">
</table>
</form>
</fieldset>
 	
