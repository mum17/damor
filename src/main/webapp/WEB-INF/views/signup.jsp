<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<fieldset><legend>Sign up</legend><form><table>
	<tr><td>First name<td><input name="firstName" value="John" />
	<tr><td>Last name<td><input name="lastName" value="Smith" />
	<tr><td>Email<td><input name="email" value="jsmith@gmail.com"/>
	<tr><td>Password<td><input name="password" value="1234"/>
	<tr><td>Authority:</td><td>
		<label><input type="checkbox" name="authority" value="ADMIN"/> Administrator</label>
	<tr><td>Birth date</td><td><input type="text" name="birthdate" value="1/21/2017"/></td>
	<tr><td>Gender:</td><td>
		<label><input type="radio" name="gender" value="M" checked/> Male</label>
		<label><input type="radio" name="gender" value="F"/> Female</label>
	<tr><td><td><input type="button" value="Sign up" onclick="api.signUp(this.form)" />
</table></form></fieldset>
