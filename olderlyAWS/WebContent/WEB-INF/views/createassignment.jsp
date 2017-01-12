<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">

	<h2 class="page-heading">Add a New Assignment</h2>
	<br /> <br />

	<div class="offset-sm-2 col-sm-10">

		<sf:form action="${pageContext.request.contextPath}/docreate"
			method="post" modelAttribute="assignment">

			<div class="form-group row">
				<label for="date" class="col-sm-2 col-form-label">Date:</label>
				<div class="col-sm-4">
					<sf:input type="date" dateFormat="dd/mm/yyy" class="form-control"
						name="date" path="date" id="date" />
					<div class="error">
						<sf:errors path="date"></sf:errors>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="time" class="col-sm-2 col-form-label">Time:</label>
				<div class="col-sm-4">
					<sf:select type="text" class="form-control" path="time" name="time"
						id="time">
						<sf:option value="" label="" />
						<sf:option value="09:00" label="09:00" />
						<sf:option value="09:15" label="09:15" />
						<sf:option value="09:30" label="09:30" />
						<sf:option value="09:45" label="09:45" />
						<sf:option value="10.00" label="10.00" />
						<sf:option value="10.15" label="10.15" />
						<sf:option value="10.30" label="10.30" />
						<sf:option value="10.45" label="10.45" />
						<sf:option value="11.00" label="11.00" />
						<sf:option value="11.15" label="11.15" />
						<sf:option value="11.30" label="11.30" />
						<sf:option value="11.45" label="11.45" />
						<sf:option value="12.00" label="12.00" />
						<sf:option value="12.15" label="12.15" />
						<sf:option value="12.30" label="12.30" />
						<sf:option value="12.45" label="12.45" />
						<sf:option value="13.00" label="13.00" />
						<sf:option value="13.15" label="13.15" />
						<sf:option value="13.30" label="13.30" />
						<sf:option value="13.45" label="13.45" />
						<sf:option value="14.00" label="14.00" />
						<sf:option value="14.15" label="14.15" />
						<sf:option value="14.30" label="14.30" />
						<sf:option value="14.45" label="14.45" />
						<sf:option value="15.00" label="15.00" />
						<sf:option value="15.15" label="15.15" />
						<sf:option value="15.30" label="15.30" />
						<sf:option value="15.45" label="15.45" />
						<sf:option value="16.00" label="16.00" />
						<sf:option value="16.15" label="16.15" />
						<sf:option value="16.30" label="16.30" />
						<sf:option value="16.45" label="16.45" />
						<sf:option value="17.00" label="17.00" />
					</sf:select>
					<div class="error">
						<sf:errors path="time"></sf:errors>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="time" class="col-sm-2 col-form-label">Duration:</label>
				<div class="col-sm-4">
					<sf:select class="form-control" path="duration" type="text"
						name="duration" id="duration">
						<sf:option value="" label="" />
						<sf:option value="1.0" label="1.0" />
						<sf:option value="1.5" label="1.5" />
						<sf:option value="2.0" label="2.0" />
						<sf:option value="2.5" label="2.5" />
						<sf:option value="3.0" label="3.0" />
						<sf:option value="3.5" label="3.5" />
						<sf:option value="4.0" label="4.0" />
						<sf:option value="4.5" label="4.5" />
						<sf:option value="5.0" label="5.0" />
					</sf:select>
					hrs (approx.)
					<div class="error">
						<sf:errors path="duration"></sf:errors>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="client" class="col-sm-2 col-form-label">Client:</label>
				<div class="col-sm-8">
					<sf:select class="form-control" path="clientId" type="text" name="clientId"
						id="clientId">
						<c:forEach var="client" items="${clients}">
							<sf:option value="${client.id}" label="${client.firstName} ${client.lastName}"/>
						</c:forEach>
					</sf:select>
				</div>
			</div>
			<div class="form-group row">
				<label for="description" class="col-sm-2 col-form-label">Duration:</label>
				<div class="col-sm-8">
					<sf:textarea class="form-control" path="description"
						name="description" id="description" type="text" cols="30"
						rows="10" />
					<div class="error">
						<sf:errors path="description"></sf:errors>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<div class="offset-sm-2 col-sm-10">
					<input class="btn btn-primary" type="submit" name="submit"
						value="Create Assignment" />
				</div>
			</div>
		</sf:form>
	</div>
</div>
