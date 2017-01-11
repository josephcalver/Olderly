<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">


	<h2 class="page-heading">Please enter your login details:</h2>
	<br /> <br />

	<div class="offset-sm-3 col-sm-12">

		<c:if test="${param.error != null }">

			<p class="error">Login failed. Check that your username and
				password are correct.</p>

		</c:if>


		<c:url var="loginUrl" value="/login" />
		<form class="form" name='f' action="${loginUrl}" method="post">

			<div class="form-group row">
				<label for="username" class="col-sm-2 col-form-label">Username</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="username"
						id="username" placeholder="Username">
				</div>
			</div>
			<div class="form-group row">
				<label for="password" class="col-sm-2 col-form-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" name="password"
						id="password" placeholder="Password">
				</div>
			</div>
			<div class="form-group row">
				<label for="rememberme" class="col-sm-2 col-form-label">Remember
					Me</label>
				<div class="col-sm-10">
					<div class="form-check">
						<label class="form-check-label"> <input type="checkbox"
							class="form-check-input" name="rememberme" id="rememberme"
							name="_spring_security_remember_me" checked="checked">
						</label>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<div class="offset-sm-2 col-sm-10">
					<input class="btn btn-primary" type="submit" name="submit"
						value="Log In" /><input type="hidden"
						name="${_csrf.parameterName}" value="${_csrf.token}" />
				</div>
			</div>
		</form>
	</div>
</div>
