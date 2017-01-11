<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
<!--
	function onDeleteClick(event) {
		var doDelete = confirm("Are you sure you want to delete this client?")
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

	<h2 class="page-heading">Edit / Delete Client</h2>
	<br /> <br />

	<div class="offset-sm-3 col-sm-12">

		<sf:form action="${pageContext.request.contextPath}/updateclient"
			method="post" modelAttribute="client">

			<sf:input type="hidden" name="id" path="id" value="${client.id}" />

			<div class="form-group row">
				<label for="firstName" class="col-sm-2 col-form-label">First
					Name:</label>
				<div class="col-sm-4">
					<sf:input type="text" class="form-control" name="firstName"
						path="firstName" id="firstName" />
					<div class="error">
						<sf:errors path="firstName"></sf:errors>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="lastName" class="col-sm-2 col-form-label">Last
					Name:</label>
				<div class="col-sm-4">
					<sf:input type="text" class="form-control" name="lastName"
						path="lastName" id="lastName" />
					<div class="error">
						<sf:errors path="lastName"></sf:errors>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="address" class="col-sm-2 col-form-label">Address:</label>
				<div class="col-sm-4">
					<sf:input type="text" class="form-control" name="address"
						path="address" id="address" />
					<div class="error">
						<sf:errors path="address"></sf:errors>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="telephone" class="col-sm-2 col-form-label">Telephone:</label>
				<div class="col-sm-4">
					<sf:input type="text" class="form-control" name="telephone"
						path="telephone" id="telephone" />
					<div class="error">
						<sf:errors path="telephone"></sf:errors>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<div class="offset-sm-2 col-sm-10">
					<a class="btn btn-primary" role="button"
						href="${pageContext.request.contextPath}/clients">Cancel</a> <input
						class="btn btn-primary" type="submit" name="submit" value="Update" />
					<input class="btn btn-primary" type="submit" name="delete"
						id="delete" value="Delete" />
				</div>
			</div>
		</sf:form>
	</div>
</div>