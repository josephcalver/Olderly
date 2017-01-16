<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
<!--
	function onCancelClick(event) {
		var doCancel = confirm("Are you sure you want to cancel this assignment?")
		if (doCancel == false) {
			event.preventDefault();
		}
	}

	function onReady() {
		$("#cancel").click(onCancelClick);
	}

	$(document).ready(onReady);
//-->
</script>

<div class="container">

	<h2 class="page-heading">My Assignments</h2>
	<br /> <br />

	<div class="offset-sm-1 col-sm-10">

		<c:forEach var="assignment" items="${myAssignments}">
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

					<dt class="col-sm-3">Client Name:</dt>
					<dd class="col-sm-9">
						<c:out value="${assignment.firstName} ${assignment.lastName}"></c:out>
					</dd>

					<dt class="col-sm-3">Client Address:</dt>
					<dd class="col-sm-9">
						<c:out value="${assignment.address}"></c:out>
					</dd>

					<dt class="col-sm-3">Client Phone:</dt>
					<dd class="col-sm-9">
						<c:out value="${assignment.telephone}"></c:out>
					</dd>

					<dt class="offset-sm-3"></dt>
					<dd class="offset-sm-3 col-sm-1">
						<br />
						<sec:authorize access="hasAnyRole('USER', 'GUEST_USER')">
							<c:url var="cancelUrl" value="/cancel" />
							<sf:form action="${cancelUrl}" method="post">
								<input class="btn btn-primary" type="submit" id="cancel"
									value="Cancel" />
								<input type="hidden" name="id" value="${assignment.id}" />
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
