<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>Create New Client:</h2>

	<sf:form action="${pageContext.request.contextPath}/createclient"
		method="post" modelAttribute="client">

		<sf:input type="hidden" name="id" path="id" value="${client.id}" />

		<table class="table">
			<tr>
				<td class="label">First Name:</td>
				<td><sf:input class="control" name="firstName" path="firstName"
						type="text" /><br />
					<div class="error">
						<sf:errors path="firstName"></sf:errors>
					</div></td>
			</tr>
			<tr>
				<td class="label">Last Name:</td>
				<td><sf:input class="control" name="lastName" path="lastName"
						type="text" /><br />
					<div class="error">
						<sf:errors path="lastName"></sf:errors>
					</div></td>
			</tr>
			<tr>
				<td class="label">Address:</td>
				<td><sf:input class="control" name="address" path="address"
						type="text" /><br />
					<div class="error">
						<sf:errors path="address"></sf:errors>
					</div></td>
			</tr>
			<tr>
				<td class="label">Telephone:</td>
				<td><sf:input class="control" name="telephone" path="telephone"
						type="text" /><br />
					<div class="error">
						<sf:errors path="telephone"></sf:errors>
					</div></td>
			</tr>
			<tr>
				<td><input class="control" type="submit" value="Update Client" /></td>
				<td><input class="control" type="submit" name="delete"
					value="Delete" /></td>
			</tr>

		</table>

	</sf:form>

</body>
</html>



