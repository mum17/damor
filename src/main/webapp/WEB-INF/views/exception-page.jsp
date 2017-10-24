<%@ page isErrorPage="true" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<body>
	<h3>Exception Page</h3>
	<p>
		status:<br /><%=response.getStatus()%>
	</p>
	<p>
		Exception Message:<br />${exception.message}
	</p>
	<p>
		Exception type:<br />${exception['class'].name}
	</p>
	<pre>
		<% exception.printStackTrace(new java.io.PrintWriter(out)); %>
	</pre>
</body>
</html>