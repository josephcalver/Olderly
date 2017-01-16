<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-fixed-top navbar-dark bg-primary">

	<button class="navbar-toggler hidden-sm-up pull-xs-right" type="button"
		data-toggle="collapse" data-target="#navbar" aria-controls="navbar"
		aria-expanded="false" aria-label="Toggle navigation">&#9776;</button>

	<a class="navbar-brand display-4" href="<c:url value='/' />">Olderly</a>

	<div id="navbar" class="collapse navbar-toggleable-xs">

		<ul class="nav navbar-nav pull-xs-right">

			<sec:authorize access="isAuthenticated()">
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/assignments'/>">View All Assignments</a></li>
			</sec:authorize>

			<sec:authorize access="hasAnyRole('USER', 'GUEST_USER')">
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/myassignments'/>">My Assignments</a></li>
			</sec:authorize>

			<sec:authorize access="hasAnyRole('ADMIN', 'GUEST_ADMIN')">
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/createassignment'/>">Add New Assignment</a></li>
			</sec:authorize>

			<sec:authorize access="hasAnyRole('ADMIN', 'GUEST_ADMIN')">
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/clients'/>">View All Clients</a></li>
			</sec:authorize>

			<sec:authorize access="hasAnyRole('ADMIN', 'GUEST_ADMIN')">
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/newclient'/>">Add New Client</a></li>
			</sec:authorize>

			<sec:authorize access="hasAnyRole('ADMIN', 'GUEST_ADMIN')">
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/volunteers'/>">View All Volunteers</a></li>
			</sec:authorize>

			<sec:authorize access="!isAuthenticated()">
				<li class="nav-item"><a class="btn btn-outline-secondary"
					href="<c:url value='/newaccount'/>">Create Account</a></li>
			</sec:authorize>

			<sec:authorize access="!isAuthenticated()">
				<li class="nav-item"><a class="btn btn-outline-secondary"
					href="<c:url value='/login'/>">Log In</a></li>
			</sec:authorize>

			<sec:authorize access="isAuthenticated()">
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/myaccount'/>">My Account</a></li>
			</sec:authorize>

			<sec:authorize access="isAuthenticated()">
				<li class="nav-item"><c:url var="logoutUrl" value="/logout" />
					<form action="${logoutUrl}" method="post">
						<input class="btn btn-outline-secondary" type="submit"
							value="Log Out" /> <input type="hidden"
							name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form></li>
			</sec:authorize>
		</ul>
	</div>
</nav>