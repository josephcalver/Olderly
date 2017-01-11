<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<title>Login Page</title>

<link href="${pageContext.request.contextPath}/static/css/main.css"
	rel="stylesheet" type="text/css">

</head>
<body onload='document.f.username.focus();'>
	<h3>Login with Username and Password</h3>

	<c:if test="${param.error != null }">

		<p class="error">Login failed. Check that your username and
			password are correct.</p>

	</c:if>

	<c:url value="/login" var="loginUrl" />
	<form name='f' action="${loginUrl}" method="post">

		<table class="formtable">
			<tr>
				<td>Username:</td>
				<td><input type='text' name='username' value=''></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='password' /></td>
			</tr>
			<tr>
				<td>Remember Me:</td>
				<td><input type='checkbox' name='_spring_security_remember_me' checked="checked"/></td>
			</tr>
			<tr>
				<td><input type="submit" name="submit" value="Log In" /><input type="hidden"
					name="${_csrf.parameterName}" value="${_csrf.token}" /></td>
			</tr>
		</table>
	</form>

<!-- <c:url var="loginURL" value="/login" />
		<form action="${loginUrl}" method="post">
			<input type="submit" value="Log In" /> <input type="hidden"
				name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form> -->


	<p>
		<a href="<c:url value="/newaccount"/>">Create New Account</a>
	</p>
</body>
</html>