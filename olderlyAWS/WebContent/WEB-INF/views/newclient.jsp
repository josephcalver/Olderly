<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">

	<h2 class="page-heading">Add a New Client</h2>
	<br /> <br />

	<div class="offset-sm-3 col-sm-12">

		<sf:form action="${pageContext.request.contextPath}/createclient"
			method="post" modelAttribute="client">

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
					<input class="btn btn-primary" type="submit" name="submit"
						value="Create Client" />
				</div>
			</div>
		</sf:form>
	</div>
</div>