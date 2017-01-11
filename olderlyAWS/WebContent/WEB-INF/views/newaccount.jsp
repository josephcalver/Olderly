<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">

	<h2 class="page-heading">Create a New Account</h2>
	<br /> <br />

	<div class="offset-sm-3 col-sm-12">

		<sf:form id="details" method="post"
			action="${pageContext.request.contextPath}/createaccount"
			modelAttribute="user">

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
				<label for="username" class="col-sm-2 col-form-label">Username:</label>
				<div class="col-sm-4">
					<sf:input type="text" class="form-control" name="username"
						path="username" id="username" />
					<div class="error">
						<sf:errors path="username"></sf:errors>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="email" class="col-sm-2 col-form-label">Email:</label>
				<div class="col-sm-4">
					<sf:input type="text" class="form-control" name="email"
						path="email" id="email" />
					<div class="error">
						<sf:errors path="email"></sf:errors>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="password" class="col-sm-2 col-form-label">Password:</label>
				<div class="col-sm-4">
					<sf:input type="password" class="form-control" name="password"
						path="password" id="password" />
					<div class="error">
						<sf:errors path="password"></sf:errors>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="confirmpass" class="col-sm-2 col-form-label">Confirm
					Password:</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" name="confirmpass"
						id="confirmpass" />
					<div id="matchpass"></div>
				</div>
			</div>
			<div class="form-group row">
				<div class="offset-sm-2 col-sm-10">
					<input class="btn btn-primary" type="submit" name="submit"
						value="Create Account" />
				</div>
			</div>
		</sf:form>
	</div>
</div>