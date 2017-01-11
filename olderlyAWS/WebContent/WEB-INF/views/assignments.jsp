<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="container">

	<h2 class="page-heading">Latest Assignments</h2>
	<br /> <br />

	<div class="offset-sm-1 col-sm-10">

		<c:forEach var="assignment" items="${assignments}">
			<div class="frame">
				<dl class="row">

					<dt class="col-sm-3">Date:</dt>
					<dd class="col-sm-3">
						<c:out value="${assignment.date}"></c:out>
					</dd>

					<dt class="col-sm-3">Time:</dt>
					<dd class="col-sm-3">
						<c:out value="${assignment.time}"></c:out>
					</dd>

					<dt class="col-sm-3">Duration:</dt>
					<dd class="col-sm-3">
						<c:out value="${assignment.duration}"></c:out>
						hrs
					</dd>

					<dt class="col-sm-3">Description:</dt>
					<dd class="col-sm-9">
						<c:out value="${assignment.description}"></c:out>
					</dd>

					<dt class="offset-sm-3"></dt>
					<dd class="offset-sm-3 col-sm-1">
						<br />
						<sec:authorize access="hasRole('ROLE_USER')">
							<c:url var="volunteerUrl" value="/volunteer" />
							<sf:form action="${volunteerUrl}" method="post">
								<input class="btn btn-primary" type="submit" value="Volunteer!" />
								<input type="hidden" name="id" value="${assignment.id}" />
							</sf:form>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<c:url var="editAssignmentUrl"
								value="/editassignment/${assignment.id}" />
							<sf:form action="${editAssignmentUrl}" method="get">
								<input class="btn btn-outline-primary" type="submit"
									value="Edit / Delete" />
							</sf:form>
						</sec:authorize>
					</dd>
				</dl>
			</div>
			<br />
			<br />
		</c:forEach>

	</div>
</div>

