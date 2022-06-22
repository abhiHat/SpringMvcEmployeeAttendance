<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home - ESMCV CRM</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>



</head>

<body>

	<div class="container">

		<h2 class="text-center">Welcome to Employee SMVC Portal</h2>

		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">Add Employee</button>



		<c:if test="${param.saveFlag}">
			<div class="alert alert-success mt-5 text-center" role="alert">An
				Employee Registered Successfully !!</div>
		</c:if>

		<c:if test="${param.deleteFlag}">
			<div class="alert alert-danger mt-5 text-center" role="alert">An
				Employee Deleted Successfully !!</div>
		</c:if>







		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Register
							Employee</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">


						<form action="register-employee" method="post">
							<div class="row">
								<div class="mb-3 col-md-6">
									<label for="exampleInputEmail1" class="form-label">First
										Name</label> <input type="text" name="firstName" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp">
								</div>

								<div class="mb-3 col-md-6">
									<label for="exampleInputEmail1" class="form-label">Last
										Name</label> <input type="text" name="lastName" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp">
								</div>

								<div class="mb-3 col-md-12">
									<label for="exampleInputEmail1" class="form-label">Email
										Address</label> <input type="email" name="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp">
								</div>

								<div class="mb-3 col-md-12">
									<label for="exampleInputEmail1" class="form-label">Contact
										Number</label> <input type="text" maxlength="10" name="contact"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp">
								</div>

								<div class="mb-3 col-md-12">
									<label for="exampleInputEmail1" class="form-label">Address</label>
									<textarea class="form-control" name="address"
										id="exampleFormControlTextarea1" rows="3"></textarea>
								</div>
							</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Register
							Employee</button>
					</div>
					</form>
				</div>
			</div>
		</div>

		<div class="container mt-4">

			<c:if test="${!empty emps}">
				<table class="table col-6">
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Full Name</th>
						<th scope="col">Email</th>
						<th scope="col">Edit</th>
						<th scope="col">Delete</th>
					</tr>
					<c:forEach items="${emps}" var="emp">
						<tr>
							<td>${emp.id}</td>
							<td data-bs-toggle="modal"
								data-bs-target="#staticViewEmp${emp.id}">${emp.firstName} ${emp.lastName}</td>
							<td>${emp.email}</td>

							<td><button class="btn btn-primary btn-sm"
									data-bs-toggle="modal"
									data-bs-target="#staticUpdateEmp${emp.id}">update</button></td>
							<td><a class="btn btn-danger btn-sm"
								href="<c:url value='/deleteEmployee/${emp.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>

		</div>
	</div>


	<c:forEach items="${emps}" var="emp">
		<div class="modal fade" id="staticUpdateEmp${emp.id}"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Update
							Employee</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">


						<form action="update-employee" method="post">
							<div class="row">

								<input style="display: none" name="id" value="${emp.id}" />

								<div class="mb-3 col-md-6">
									<label for="exampleInputEmail1" class="form-label">First
										Name</label> <input type="text" name="firstName" class="form-control"
										id="exampleInputEmail1" value="${emp.firstName}"
										aria-describedby="emailHelp">
								</div>

								<div class="mb-3 col-md-6">
									<label for="exampleInputEmail1" class="form-label">Last
										Name</label> <input type="text" name="lastName" class="form-control"
										id="exampleInputEmail1" value="${emp.lastName}"
										aria-describedby="emailHelp">
								</div>

								<div class="mb-3 col-md-12">
									<label for="exampleInputEmail1" class="form-label">Email
										Address</label> <input type="email" name="email" class="form-control"
										id="exampleInputEmail1" value="${emp.email}"
										aria-describedby="emailHelp">
								</div>

								<div class="mb-3 col-md-12">
									<label for="exampleInputEmail1" class="form-label">Contact
										Number</label> <input type="text" maxlength="10" name="contact"
										class="form-control" id="exampleInputEmail1"
										value="${emp.contact}" aria-describedby="emailHelp">
								</div>

								<div class="mb-3 col-md-12">
									<label for="exampleInputEmail1" class="form-label">Address</label>
									<textarea class="form-control" name="address"
										id="exampleFormControlTextarea1" rows="3">${emp.address}</textarea>
								</div>
							</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Update
							Employee</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</c:forEach>



	<c:forEach items="${emps}" var="emp">
		<div class="modal fade" id="staticViewEmp${emp.id}"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Employee Details</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">


							<div class="row">

								<div class="mb-3 col-md-6">
									<label for="exampleInputEmail1" class="form-label">First
										Name</label> <input type="text" name="firstName" class="form-control"
										id="exampleInputEmail1" disabled="disabled" value="${emp.firstName}"
										aria-describedby="emailHelp">
								</div>

								<div class="mb-3 col-md-6">
									<label for="exampleInputEmail1" class="form-label">Last
										Name</label> <input type="text" name="lastName" class="form-control"
										id="exampleInputEmail1" disabled="disabled" value="${emp.lastName}"
										aria-describedby="emailHelp">
								</div>

								<div class="mb-3 col-md-12">
									<label for="exampleInputEmail1" class="form-label">Email
										Address</label> <input type="email" name="email" class="form-control"
										id="exampleInputEmail1" disabled="disabled" value="${emp.email}"
										aria-describedby="emailHelp">
								</div>

								<div class="mb-3 col-md-12">
									<label for="exampleInputEmail1" class="form-label">Contact
										Number</label> <input type="text" maxlength="10" name="contact"
										class="form-control" id="exampleInputEmail1"
										value="${emp.contact}" disabled="disabled" aria-describedby="emailHelp">
								</div>

								<div class="mb-3 col-md-12">
									<label for="exampleInputEmail1" class="form-label">Address</label>
									<textarea class="form-control" disabled="disabled" name="address"
										id="exampleFormControlTextarea1" rows="3">${emp.address}</textarea>
								</div>
							</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						
					</div>
				</div>
			</div>
		</div>
	</c:forEach>














	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
		integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
		integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
		crossorigin="anonymous"></script>

</body>
</html>