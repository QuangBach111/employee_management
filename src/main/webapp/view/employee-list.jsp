<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.assignment2.util.ServletType" %><%--
  Created by IntelliJ IDEA.
  User: buiqu
  Date: 6/19/2023
  Time: 7:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Employee List</title>
	<%--	include library--%>
	<jsp:include page="/common/library.jsp"/>
	<%--	include css--%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/employee-list-style.css">
</head>

<body>
<div class="container-fluid">
	<%--	navbar--%>
	<jsp:include page="/common/navbar.jsp"/>
	<%--	end of navbar--%>

	<%--	content--%>
	<div class="row">
		<%--		dashboard--%>
		<div class="col-sm-2 p-0">
			<jsp:include page="/common/dashboard.jsp"/>
		</div>
		<%--		end of dashboard--%>

		<%--		Employee list--%>
		<div class="col-sm-10 content p-0">
			<div class="m-5">
				<h1 class="border-bottom py-2">Employee List</h1>
				<%--			search bar--%>
				<div class="option-field">
					<form class="form-inline mr-4"
					      action="#"
					      method="post">
						<button class="btn" type="submit">Search</button>
						<input class="form-control" type="search" placeholder="Search" aria-label="Search">

					</form>

					<form class="form-inline">
						<div class="form-row align-items-center">
							<select class="form-control">
								<option selected>Choose...</option>
								<option value="name">Name</option>
								<option value="department">Department</option>
							</select>
							<button type="submit" class="btn btn-primary">Filter</button>
						</div>
					</form>

				</div>
				<%--			end of search bar--%>
				<p class="text-center text-success">${param.successMessage}</p>
				<%--			table--%>
				<table class="table table-bordered">
					<thead>
					<tr class="table-secondary">
						<th scope="col">ID</th>
						<th scope="col">Name</th>
						<th scope="col">Date of birth</th>
						<th scope="col">Address</th>
						<th scope="col">Phone number</th>
						<th scope="col">Department</th>
						<th scope="col">Action</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${requestScope.list}" var="employee">
						<tr>
							<th scope="row">${employee.id}</th>
							<td>${employee.firstName} ${employee.lastName}</td>
							<td>${employee.dateOfBirth.getDate()}/${employee.dateOfBirth.getMonth()+1}/${employee.dateOfBirth.getYear()+1900}</td>
							<td>${employee.address}</td>
							<td>${employee.phone}</td>
							<td>${employee.department.name}</td>

								<%--						view, edit, delete--%>
							<td>
									<%--							todo: view feature--%>
								<a class="btn btn-primary mr-2"
								   href="${pageContext.request.contextPath}/servlet?id=${employee.id}&type=<%=ServletType.VIEW_EMPLOYEE%>">
									<i class="fa-solid fa-eye"></i>View
								</a>

									<%--							todo: edit feature--%>
								<a class="btn btn-dark mr-2"
								   href="${pageContext.request.contextPath}/servlet?id=${employee.id}&type=<%=ServletType.EDIT_EMPLOYEE%>">
									<i class="fa-solid fa-pen-to-square"></i>Edit
								</a>

									<%--							todo: delete feature--%>
								<button type="button" class="btn btn-danger"
								        data-toggle="modal" data-target="#deleteModal" aria-hidden="true">
									<i class="fa-solid fa-trash"></i>Delete
								</button>
							</td>
								<%--						end of view, edit, delete--%>

						</tr>
						<!-- Modal -->
						<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
						     aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Delete Employee</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										Do you want to delete
										<strong>${employee.firstName} ${employee.lastName}</strong>?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">Close
										</button>
										<a href="${pageContext.request.contextPath}/servlet?id=${employee.id}&type=<%=ServletType.DELETE_EMPLOYEE%>"
										   class="btn btn-danger">
											Delete
										</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

					</tbody>
				</table>
				<%--			end of table--%>
			</div>
		</div>
		<%--		end of Employee list--%>
	</div>
	<%--	end of content--%>

	<%--	delete model--%>

</div>
</body>
</html>