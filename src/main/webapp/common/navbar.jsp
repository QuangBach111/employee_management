<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--link to css--%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/navbar-style.css">

<%--navbar--%>
<nav class="d-flex justify-content-between align-items-center">
	<div class="nav-item-left">
		<i class="fa-solid fa-users"></i>
		Employee
	</div>

	<div class="d-flex nav-item-right align-items-center">
		<c:if test="${sessionScope.user == null}">
			<a href="${pageContext.request.contextPath}/view/login.jsp">
				<i class="fa-sharp fa-solid fa-circle-user"></i>
				Login
			</a>
		</c:if>

		<c:if test="${sessionScope.user != null}">
			<p>Welcome ${sessionScope.user.userName}</p>
			<span>
			<button class="btn btn-light"
			        data-toggle="modal" data-target="#logoutModal">
				<i class="fa-solid fa-right-from-bracket"></i>
				Logout
				</button>
			</span>
		</c:if>

	</div>

	<!-- Modal -->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
	     aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Logout</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					Do you want to log out?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel
					</button>
					<a class="btn btn-primary"
					   href="${pageContext.request.contextPath}/servlet?type=logout">
						logout
					</a>
				</div>
			</div>
		</div>
	</div>
</nav>
<%--end of navbar--%>