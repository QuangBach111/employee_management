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
	<title>Department List</title>
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
				<h1 class="border-bottom py-2">Department List</h1>
				<%--			table--%>
				<table class="table table-bordered">
					<thead>
					<tr class="table-secondary">
						<th scope="col">ID</th>
						<th scope="col">Department Name</th>
						<th>Action</th>

					</tr>
					</thead>
					<tbody>
					<c:forEach items="${requestScope.departmentList}" var="department">
						<tr>
							<th scope="row">${department.id}</th>
							<td>${department.name}</td>
								<%--						view, edit, delete--%>
							<td>
								<a class="btn btn-primary mr-2"
								   href="${pageContext.request.contextPath}/servlet?id=${department.id}&type=<%=ServletType.LIST_EMPLOYEE_OF_DEPARTMENT%>">
									<i class="fa-solid fa-eye"></i>View Employee
								</a>
							</td>
								<%--						end of view, edit, delete--%>

						</tr>
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