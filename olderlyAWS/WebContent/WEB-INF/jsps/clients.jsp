<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table class="clients">
		<tr>
			<td>First Name</td>
			<td>Last Name</td>
			<td>Address</td>
			<td>Telephone</td>
			<td></td>
		</tr>

		<c:forEach var="client" items="${clients}">
			<tr>
				<td><c:out value="${client.firstName}"></c:out></td>
				<td><c:out value="${client.lastName}"></c:out></td>
				<td><c:out value="${client.address}"></c:out></td>
				<td><c:out value="${client.telephone}"></c:out></td>
				<td><c:url var="editClientUrl" value="/editclient/${client.id}" />
					<sf:form action="${editClientUrl}" method="get">
						<input type="submit" value="Edit/Delete" />
					</sf:form></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>