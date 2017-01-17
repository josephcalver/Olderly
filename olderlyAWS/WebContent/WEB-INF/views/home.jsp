<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<div class="jumbotron jumbotron-fluid">
	<div class="container-fluid">
		<div class="jumbotron-text">
			<p>
			<h1 class="display-1">Olderly</h1>
			</p>
			<p>
			<h1 class="display-4">Volunteering, made simple.</h1>
			</p>
		</div>
	</div>
</div>
<br />
<sec:authorize var="userLoggedIn"
	access="hasAnyRole('USER', 'GUEST_USER')" />
<sec:authorize var="adminLoggedIn"
	access="hasAnyRole('ADMIN', 'GUEST_ADMIN')" />
<c:choose>
	<c:when test="${userLoggedIn}">
		<div class="container-fluid">
			<div class="offset-sm-3">
				<div class="col-sm-8 home-page-text">
					<p>
					<h1 class="display-4">Hello, ${user.firstName}!</h1>
					</p>
					<br />
					<p>
					<h4>To view your upcoming assignments or browse for new ones,
						please use the links above.</h4>
					</p>

				</div>
			</div>
		</div>
	</c:when>
	<c:when test="${adminLoggedIn}">
		<div class="container-fluid">
			<div class="offset-sm-3">
				<div class="col-sm-8 home-page-text">
					<p>
					<h1 class="display-4">Hello, ${user.firstName}!</h1>
					</p>
					<br />
					<p>
					<h4>To manage assignments, users and clients, please use the
						links above.</h4>
					</p>

				</div>
			</div>
		</div>

	</c:when>
	<c:otherwise>
		<div class="container-fluid">
			<div class="offset-sm-3">
				<div class="col-sm-8 h1 home-page-text">
					<p>What is Olderly, and how does it work?</p>
					<br />
					<p>
						<a class="btn btn-primary btn-lg" role="button"
							href="${pageContext.request.contextPath}/about">Learn more</a>
					</p>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>