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
	<title>Edit Employee</title>

	<%--	include library--%>
	<%@include file="/common/library.jsp" %>

	<%--	include css--%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/employee-list-style.css">
</head>
<%
	List<Department> departmentList = DepartmentDaoImpl.getInstance().getAll();
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
				<h1 class="border-bottom py-2">Edit Employee</h1>

				<%--				form--%>
				<form id="add-employee-form"
				      action="${pageContext.request.contextPath}/servlet"
				      method="post">

					<%--					type--%>
					<input type="text" name="type" value="<%=ServletType.UPDATE_EMPLOYEE%>" hidden="hidden">
					<%--					end of type--%>

					<input type="text" name="id" value="${requestScope.employee.id}" hidden="hidden">
					<input type="text" name="accountId" value="${requestScope.employee.account.id}" hidden="hidden">


					<%--					First Name--%>
					<div class="form-group font-weight-bold">
						<label>First name <span class="text-danger">(*)</span></label>
						<input type="text" class="form-control" id="first-name" name="firstName"
						       placeholder="First name" rules="required" value="${requestScope.employee.firstName}">
						<span class="form-message font-weight-normal"></span>
					</div>
					<%--					end of Fist name--%>

					<%--					Last Name--%>
					<div class="form-group font-weight-bold">
						<label>
							Last name <span class="text-danger">(*)</span>
						</label>
						<input type="text" class="form-control" id="last-name" name="lastName"
						       placeholder="Last name" rules="required" value="${requestScope.employee.lastName}">
						<span class="form-message font-weight-normal"></span>

					</div>
					<%--					end of Last name--%>

					<%--					Phone-number--%>
					<div class="form-group font-weight-bold">
						<label>
							Phone <span class="text-danger">(*)</span>
						</label>
						<input type="text" class="form-control" id="phone" name="phone" placeholder="Phone number"
						       rules="required" value="${requestScope.employee.phone}">
						<span class="form-message font-weight-normal"></span>

					</div>
					<%--					end of Last name--%>

					<%--					Date of birth--%>
					<div class="form-group font-weight-bold">
						<label>
							Date of birth <span class="text-danger">(*)</span>
						</label>
						<input type="date" class="form-control" id="date-of-birth" name="dateOfBirth" rules="required"
						       placeholder="Phone number" value="${requestScope.employee.dateOfBirth}">
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
								<c:if test="${requestScope.employee.gender eq '1'}">
								       checked
								</c:if>
								>
								<label>Male</label>
							</div>
							<div class="form-check form-check-inline pl-3">
								<input class="form-check-input" type="radio" name="gender" value="0"
								<c:if test="${requestScope.employee.gender eq '0'}">
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
						       name="userName" rules="required" value="${requestScope.employee.account.userName}"
						       readonly>
						<span class="form-message font-weight-normal"></span>

					</div>
					<%--					end of User Name--%>

					<%--					Email--%>
					<div class="form-group font-weight-bold">
						<label>
							Email<span class="text-danger">(*)</span>
						</label>
						<input type="email" class="form-control" id="email" placeholder="Email"
						       name="email" rules="required|email" value="${requestScope.employee.account.email}"
						       readonly>
						<span class="form-message font-weight-normal"></span>

					</div>
					<%--					end of Email--%>

					<%--					password--%>
					<div class="form-group font-weight-bold">
						<label>
							Password<span class="text-danger">(*)</span>
						</label>
						<input type="password" class="form-control" id="password" placeholder="Password"
						       rules="required|min:6" name="password" value="${requestScope.employee.account.password}">
						<span class="form-message font-weight-normal"></span>
					</div>
					<%--					end of password--%>

					<%--					Address--%>
					<div class="form-group font-weight-bold">
						<label>
							Address
						</label>
						<textarea class="form-control" id="address"
						          name="address">${requestScope.employee.address}</textarea>
					</div>
					<%--					end of Address--%>

					<%--					Status--%>
					<div class="form-group font-weight-bold">
						<label>
							Status</span>
						</label>
						<div class="pl-lg-5">
							<c:if test="${requestScope.employee.account.status eq 1}">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="status" value="1" checked>
									<label>Active</label>
								</div>
								<div class="form-check form-check-inline pl-3">
									<input class="form-check-input" type="radio" name="status" value="1">
									<label>InActive</label>
								</div>
							</c:if>
							<c:if test="${requestScope.employee.account.status eq 0}">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="status" value="1">
									<label>Active</label>
								</div>
								<div class="form-check form-check-inline pl-3">
									<input class="form-check-input" type="radio" name="status" value="1" checked>
									<label>InActive</label>
								</div>
							</c:if>
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
								<option value="${department.id}"
										<c:if test="${requestScope.employee.department.id == department.id}">
											selected
										</c:if>
								>
										${department.name}
								</option>
							</c:forEach>
						</select>
					</div>
					<%--					end of Department--%>

					<%--					Remark--%>
					<div class="form-group font-weight-bold">
						<label>
							Remark
						</label>
						<textarea class="form-control" id="remark">${requestScope.employee.remark}</textarea>

					</div>
					<%--					end of Remark--%>

					<%--						Btn field--%>
					<div class="form-group">
						<%--						Back button--%>
						<a
								href="${pageContext.request.contextPath}/servlet?type=<%=ServletType.LIST_EMPLOYEE%>"
								class="btn btn-info"><i class="fa-solid fa-backward"></i> Back</a>
						<%--						end of Back button--%>

						<%--						Add button--%>
						<button type="submit" class="btn btn-success"><i class="fa-sharp fa-solid fa-plus"></i> Update
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
	<script src="${pageContext.request.contextPath}/vendor/js/validate-form.js"></script>
	<script>
        validator('#add-employee-form')
	</script>
</body>
</html>