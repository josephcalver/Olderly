<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<sf:form action="${pageContext.request.contextPath}/docreate"
		method="post" modelAttribute="assignment">

		<table>
			<tr>
				<td class="label">Date:</td>
				<td><sf:input class="control" path="date" name="date"
						type="date" /><br /></td>
			</tr>
			<tr>
				<td class="label">Time:</td>
				<td><sf:select class="control" path="time" name="time"
						type="text">
						<sf:option value="09:00" label="09:00" />
						<sf:option value="09:15" label="09:15" />
						<sf:option value="09:45" label="09:45" />
						<sf:option value="10.00" label="10.00" />
						<sf:option value="10.15" label="10.15" />
						<sf:option value="10.30" label="10.30" />
						<sf:option value="10.45" label="10.45" />
						<sf:option value="11.00" label="11.00" />
						<sf:option value="11.15" label="11.15" />
						<sf:option value="11.30" label="11.30" />
						<sf:option value="11.45" label="11.45" />
						<sf:option value="12.00" label="12.00" />
						<sf:option value="12.15" label="12.15" />
						<sf:option value="12.30" label="12.30" />
						<sf:option value="12.45" label="12.45" />
						<sf:option value="13.00" label="13.00" />
						<sf:option value="13.15" label="13.15" />
						<sf:option value="13.45" label="13.45" />
						<sf:option value="14.00" label="14.00" />
						<sf:option value="14.15" label="14.15" />
						<sf:option value="14.30" label="14.30" />
						<sf:option value="14.45" label="14.45" />
						<sf:option value="15.00" label="15.00" />
						<sf:option value="15.15" label="15.15" />
						<sf:option value="15.30" label="15.30" />
						<sf:option value="15.45" label="15.45" />
						<sf:option value="16.00" label="16.00" />
						<sf:option value="16.15" label="16.15" />
						<sf:option value="16.30" label="16.30" />
						<sf:option value="16.45" label="16.45" />
						<sf:option value="17.00" label="17.00" />
					</sf:select></td>
			</tr>
			<tr>
				<td class="label">Duration (approx.):</td>
				<td><sf:select class="control" path="duration" type="text">
						<sf:option value="1.0" label="1.0" />
						<sf:option value="1.5" label="1.5" />
						<sf:option value="2.0" label="2.0" />
						<sf:option value="2.5" label="2.5" />
						<sf:option value="3.0" label="3.0" />
						<sf:option value="3.5" label="3.5" />
						<sf:option value="4.0" label="4.0" />
						<sf:option value="4.5" label="4.5" />
						<sf:option value="5.0" label="5.0" />
					</sf:select> hrs</td>
			</tr>
			<tr>
				<td class="label">Description:</td>
				<td><sf:textarea class="control" path="description"
						name="description" type="text" cols="30" rows="10" /><br /> <sf:errors
						path="description" cssClass="error"></sf:errors></td>
			</tr>
			<tr>
				<td><input class="control" type="submit"
					value="Create Assignment" /></td>
			</tr>
		</table>
	</sf:form>
</body>
</html>