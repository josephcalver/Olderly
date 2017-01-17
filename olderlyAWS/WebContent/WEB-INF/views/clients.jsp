<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="container">

	<h2 class="page-heading">Clients</h2>
	<br /> <br />

	<div class="offset-sm-1 col-sm-10">

		<c:forEach var="client" items="${clients}">
			<div class="frame">
				<dl class="row">

					<dt class="col-sm-3">Client ID:</dt>
					<dd class="col-sm-7">
						<c:out value="${client.id}"></c:out>
					</dd>

					<dt class="col-sm-3">First Name:</dt>
					<dd class="col-sm-7">
						<c:out value="${client.firstName}"></c:out>
					</dd>

					<dt class="col-sm-3">Last Name:</dt>
					<dd class="col-sm-7">
						<c:out value="${client.lastName}"></c:out>
					</dd>

					<dt class="col-sm-3">Address:</dt>
					<dd class="col-sm-7">
						<c:out value="${client.address}"></c:out>
					</dd>

					<dt class="col-sm-3">Telephone:</dt>
					<dd class="col-sm-7">
						<c:out value="${client.telephone}"></c:out>
					</dd>

					<dt class="offset-sm-3"></dt>
					<dd class="offset-sm-3 col-sm-1">
						<br />
						<c:url var="editClientUrl" value="/editclient/${client.id}" />
						<sf:form action="${editClientUrl}" method="get">
							<input class="btn btn-outline-primary" type="submit"
								value="Edit / Delete" />
						</sf:form>
					</dd>
				</dl>
			</div>
			<br />
			<br />
		</c:forEach>
	</div>
</div>