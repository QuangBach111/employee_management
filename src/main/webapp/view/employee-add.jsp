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
	<title>Add Employee</title>

	<%--	include library--%>
	<%@include file="/common/library.jsp" %>
	<%--	include css--%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/employee-list-style.css">
</head>
<%
	List<Department> departmentList = DepartmentDaoImpl.getInstance()
	                                                   .getAll();
    request.setAttribute("departmentList", departmentList);
%>
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
				<h1 class="border-bottom py-2">Add Employee</h1>

				<%-- 				Message --%>
				<p class="text-center text-success">${param.successMessage}</p>
				<p class="text-center text-danger">${requestScope.errorMessage}</p>
				<%-- 				end of Message --%>

				<%--				form--%>
				<form id="add-employee-form"
				      action="${pageContext.request.contextPath}/servlet"
				      method="post">
					<%--					type--%>
					<input type="text" name="type" value="<%=ServletType.ADD_EMPLOYEE%>" hidden="hidden">
					<%--					First Name--%>
					<div class="form-group font-weight-bold">
						<label>First name <span class="text-danger">(*)</span></label>
						<input type="text" class="form-control" id="first-name" name="firstName"
						       placeholder="First name" rules="required" value="${param.firstName}">
						<span class="form-message font-weight-normal"></span>
					</div>
					<%--					end of Fist name--%>

					<%--					Last Name--%>
					<div class="form-group font-weight-bold">
						<label>
							Last name <span class="text-danger">(*)</span>
						</label>
						<input type="text" class="form-control" id="last-name" name="lastName"
						       placeholder="Last name" rules="required" value="${param.lastName}">
						<span class="form-message font-weight-normal"></span>

					</div>
					<%--					end of Last name--%>

					<%--					Phone-number--%>
					<div class="form-group font-weight-bold">
						<label>
							Phone <span class="text-danger">(*)</span>
						</label>
						<input type="text" class="form-control" id="phone" name="phone" placeholder="Phone number"
						       rules="required" value="${param.phone}">
						<span class="form-message font-weight-normal"></span>

					</div>
					<%--					end of Last name--%>

					<%--					Date of birth--%>
					<div class="form-group font-weight-bold">
						<label>
							Date of birth <span class="text-danger">(*)</span>
						</label>
						<input type="date" class="form-control" id="date-of-birth" name="dateOfBirth" rules="required"
						       placeholder="Phone number" value="${param.dateOfBirth}">
						<span class="form-message font-weight-normal"></span>

					</div>
					<%--					end of Last name--%>

					<%--					Gender--%>
						<div class="form-group font-weight-bold">
							<label>
								Gender <span class="text-danger">(*)</span>
							</label>
							<div class="pl-lg-5">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" id="inlineCheckbox1" name="gender"
									       value="1"
									<c:if test="${param.gender eq null}">
									       checked
									</c:if>
									<c:if test="${param.gender eq '1'}">
									       checked
									</c:if>
									>
									<label>Male</label>
								</div>
								<div class="form-check form-check-inline pl-3">
									<input class="form-check-input" type="radio" name="gender" value="0"
									<c:if test="${param.gender eq '0'}">
									       checked
									</c:if>
									>

									<label>Female</label>
								</div>
							</div>
							<span class="form-message font-weight-normal"></span>
						</div>
					<%--					end of Gender--%>

					<%--					User Name--%>
					<div class="form-group font-weight-bold">
						<label>
							User Name<span class="text-danger">(*)</span>
						</label>
						<input type="text" class="form-control" id="" placeholder="User Name"
						       name="userName" rules="required">
						<span class="form-message font-weight-normal"></span>

					</div>
					<%--					end of User Name--%>

					<%--					Email--%>
					<div class="form-group font-weight-bold">
						<label>
							Email<span class="text-danger">(*)</span>
						</label>
						<input type="email" class="form-control" id="email" placeholder="Email"
						       name="email" rules="required|email">
						<span class="form-message font-weight-normal"></span>

					</div>
					<%--					end of Email--%>

					<%--					password--%>
					<div class="form-group font-weight-bold">
						<label>
							Password<span class="text-danger">(*)</span>
						</label>
						<input type="password" class="form-control" id="password" placeholder="Password"
						       rules="required|min:6" name="password">
						<span class="form-message font-weight-normal"></span>
					</div>
					<%--					end of password--%>

					<%--					Address--%>
					<div class="form-group font-weight-bold">
						<label>
							Address
						</label>
						<textarea class="form-control" id="address" name="address">${param.address}</textarea>
					</div>
					<%--					end of Address--%>

					<%--					Status--%>
					<div class="form-group font-weight-bold">
						<label>
							Status</span>
						</label>
						<div class="pl-lg-5">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="status" value="1" checked>
								<label>Active</label>
							</div>
							<div class="form-check form-check-inline pl-3">
								<input class="form-check-input" type="radio" name="status" value="1">
								<label>InActive</label>
							</div>
						</div>
					</div>
					<%--					end of Status--%>

					<%--					Department--%>
					<div class="form-group font-weight-bold">
						<label>
							Department<span class="text-danger">(*)</span>
						</label>
						<select class="form-control" name="departmentId">
							<c:forEach items="${departmentList}" var="department">
								<option value="${department.id}">${department.name}</option>
							</c:forEach>
						</select>
					</div>
					<%--					end of Department--%>

					<%--					Remark--%>
					<div class="form-group font-weight-bold">
						<label>
							Remark
						</label>
						<textarea class="form-control" id="remark">${param.remark}</textarea>

					</div>
					<%--					end of Remark--%>

					<%--						Btn field--%>
					<div class="form-group">
						<%--						Back button--%>
						<a
								href="${pageContext.request.contextPath}/servlet?type=<%=ServletType.LIST_EMPLOYEE%>"
								class="btn btn-info"><i class="fa-solid fa-backward"></i> Back</a>
						<%--						end of Back button--%>


						<%--							Reset button--%>
						<a
								href="${pageContext.request.contextPath}/view/employee-add.jsp"
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
        validator('#add-employee-form')
	</script>
</body>
</html>