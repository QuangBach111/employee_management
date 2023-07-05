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
    <title>View Employee</title>

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
                <h1 class="border-bottom py-2">Add Employee</h1>

                <%--				form--%>
                <form id="add-employee-form"
                      action="${pageContext.request.contextPath}/servlet"
                      method="post">

                    <%--					type--%>
                    <input type="text" name="type" value="<%=ServletType.VIEW_EMPLOYEE%>" hidden="hidden">
                    <%--					end of type--%>


                    <%--					First Name--%>
                    <div class="form-group font-weight-bold">
                        <label>First name </label>
                        <input type="text" class="form-control" id="first-name" name="firstName"
                               placeholder="First name" rules="required" value="${requestScope.employee.firstName}"
                               readonly>
                        <span class="form-message font-weight-normal"></span>
                    </div>
                    <%--					end of Fist name--%>

                    <%--					Last Name--%>
                    <div class="form-group font-weight-bold">
                        <label>
                            Last name
                        </label>
                        <input type="text" class="form-control" id="last-name" name="lastName"
                               placeholder="Last name" rules="required" value="${requestScope.employee.lastName}"
                               readonly>
                        <span class="form-message font-weight-normal"></span>

                    </div>
                    <%--					end of Last name--%>

                    <%--					Phone-number--%>
                    <div class="form-group font-weight-bold">
                        <label>
                            Phone
                        </label>
                        <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone number"
                               rules="required" value="${requestScope.employee.phone}" readonly>
                        <span class="form-message font-weight-normal"></span>

                    </div>
                    <%--					end of Last name--%>

                    <%--					Date of birth--%>
                    <div class="form-group font-weight-bold">
                        <label>
                            Date of birth
                        </label>
                        <input type="date" class="form-control" id="date-of-birth" name="dateOfBirth" rules="required"
                               placeholder="Phone number" value="${requestScope.employee.dateOfBirth}" readonly>
                        <span class="form-message font-weight-normal"></span>

                    </div>
                    <%--					end of Last name--%>

                    <%--					Gender--%>
                    <div class="form-group font-weight-bold">
                        <label>
                            Gender
                        </label>
                        <div class="pl-lg-5">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="inlineCheckbox1" name="gender"
                                       value="1" readonly
                                <c:if test="${requestScope.employee.gender eq '1'}">
                                       checked
                                </c:if>
                                >
                                <label>Male</label>
                            </div>
                            <div class="form-check form-check-inline pl-3">
                                <input class="form-check-input" type="radio" name="gender" value="0" readonly
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
                            User Name
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
                            Email
                        </label>
                        <input type="email" class="form-control" id="email" placeholder="Email"
                               name="email" rules="required|email" value="${requestScope.employee.account.email}"
                               readonly>
                        <span class="form-message font-weight-normal"></span>

                    </div>
                    <%--					end of Email--%>

                    <%--					&lt;%&ndash;					password&ndash;%&gt;--%>
                    <%--					<div class="form-group font-weight-bold">--%>
                    <%--						<label>--%>
                    <%--							Password--%>
                    <%--						</label>--%>
                    <%--						<input type="password" class="form-control" id="password" placeholder="Password"--%>
                    <%--						       rules="required|min:6" name="password" value="${requestScope.employee.account.password}">--%>
                    <%--						<span class="form-message font-weight-normal"></span>--%>
                    <%--					</div>--%>
                    <%--					&lt;%&ndash;					end of password&ndash;%&gt;--%>

                    <%--					Address--%>
                    <div class="form-group font-weight-bold">
                        <label>
                            Address
                        </label>
                        <textarea readonly class="form-control" id="address"
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
                                    <input class="form-check-input" type="radio" name="status" value="1" checked
                                           readonly>
                                    <label>Active</label>
                                </div>
                                <div class="form-check form-check-inline pl-3">
                                    <input class="form-check-input" type="radio" name="status" value="1" readonly>
                                    <label>InActive</label>
                                </div>
                            </c:if>
                            <c:if test="${requestScope.employee.account.status eq 0}">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="status" value="1" readonly>
                                    <label>Active</label>
                                </div>
                                <div class="form-check form-check-inline pl-3">
                                    <input class="form-check-input" type="radio" name="status" value="1" checked
                                           readonly>
                                    <label>InActive</label>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <%--					end of Status--%>

                    <%--					Department--%>
                    <div class="form-group font-weight-bold">
                        <label>
                            Department
                        </label>
                        <input type="text" readonly value="${requestScope.employee.department.name}">
                    </div>
                    <%--					end of Department--%>

                    <%--					Remark--%>
                    <div class="form-group font-weight-bold">
                        <label>
                            Remark
                        </label>
                        <textarea class="form-control" id="remark" readonly>${requestScope.employee.remark}</textarea>

                    </div>
                    <%--					end of Remark--%>

                    <%--						Btn field--%>
                    <div class="form-group">
                        <%--						Back button--%>
                        <a
                                href="${pageContext.request.contextPath}/servlet?type=<%=ServletType.LIST_EMPLOYEE%>"
                                class="btn btn-info"><i class="fa-solid fa-backward"></i> Back</a>
                        <%--						end of Back button--%>
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