<%@ page import="com.example.assignment2.util.ServletType" %>
<%@ page import="com.example.assignment2.dao.impl.DepartmentDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.assignment2.dto.Department" %><%--
  Created by IntelliJ IDEA.
  User: buiqu
  Date: 6/19/2023
  Time: 7:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Add Department</title>

	<%--	include library--%>
	<%@include file="/common/library.jsp" %>
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
				<h1 class="border-bottom py-2">Add Department</h1>

				<%-- 				Message --%>
				<p class="text-center text-success">${param.successMessage}</p>
				<p class="text-center text-danger">${requestScope.errorMessage}</p>
				<%-- 				end of Message --%>



				<%--				form--%>
				<form id="add-department-form"
				      action="${pageContext.request.contextPath}/servlet"
				      method="post">
					<%--				type--%>
					<input type="text" name="type" value="<%=ServletType.ADD_Department%>" hidden="hidden">

					<%--				end of type--%>
					<div class="form-group font-weight-bold">
						<label>
							Department Name<span class="text-danger">(*)</span>
						</label>
						<input type="text" class="form-control" id="" placeholder="Department Name"
						       name="name" rules="required" value="${param.name}">
						<span class="form-message font-weight-normal"></span>
					</div>

					<%--						Btn field--%>
					<div class="form-group">
						<%--						Back button--%>
						<a
								href="${pageContext.request.contextPath}/servlet?type=<%=ServletType.LIST_Department%>"
								class="btn btn-info"><i class="fa-solid fa-backward"></i> Back</a>
						<%--						end of Back button--%>

						<%--							Reset button--%>
						<a
								href="${pageContext.request.contextPath}/view/department-add.jsp"
								class="btn btn-warning text-white">
							<i class="fa-sharp fa-solid fa-arrow-rotate-left"></i> Reset
						</a>
						<%--							end of Reset button--%>

						<%--						Add button--%>
						<button type="submit" class="btn btn-success"><i class="fa-sharp fa-solid fa-plus"></i> Add
						</button>
						<%--						end of Add button--%>

					</div>
					<%--						end of Btn field--%>
				</form>
				<%--				end of form--%>


			</div>
			<%--		end of Employee list--%>

		</div>
		<%--	end of content--%>

	</div>
	<script src="../vendor/js/validate-form.js"></script>
	<script>
        validator('#add-department-form')
	</script>
</body>
</html>