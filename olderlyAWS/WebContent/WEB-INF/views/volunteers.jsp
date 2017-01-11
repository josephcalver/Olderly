<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
<!--
	function onDeleteClick(event) {
		var doDelete = confirm("Are you sure you want to delete this volunteer?")
		if (doDelete == false) {
			event.preventDefault();
		}
	}

	function onReady() {
		$("#delete").click(onDeleteClick);
	}

	$(document).ready(onReady);
//-->
</script>

<div class="container">

	<h2 class="page-heading">Volunteers</h2>
	<br /> <br />

	<div class="offset-sm-1 col-sm-10">

		<c:forEach var="volunteer" items="${volunteers}">
			<div class="frame">
				<dl class="row">

					<dt class="col-sm-3">First Name:</dt>
					<dd class="col-sm-7">
						<c:out value="${volunteer.firstName}"></c:out>
					</dd>

					<dt class="col-sm-3">Last Name:</dt>
					<dd class="col-sm-7">
						<c:out value="${volunteer.lastName}"></c:out>
					</dd>

					<dt class="col-sm-3">Username:</dt>
					<dd class="col-sm-7">
						<c:out value="${volunteer.username}"></c:out>
					</dd>

					<dt class="col-sm-3">Email:</dt>
					<dd class="col-sm-7">
						<c:out value="${volunteer.email}"></c:out>
					</dd>

					<dt class="offset-sm-3"></dt>
					<dd class="offset-sm-3 col-sm-1">
						<br />
						<c:url var="deleteVolunteerUrl" value="/deletevolunteer" />
						<sf:form action="${deleteVolunteerUrl}" method="post"
							modelAttribute="volunteer">
							<input class="btn btn-outline-primary" type="submit"
								name="delete" id="delete" value="Delete" />
							<input type="hidden" name="username" id="delete"
								value="${volunteer.username}" />
						</sf:form>
					</dd>
				</dl>
			</div>
			<br />
			<br />
		</c:forEach>
	</div>
</div>
