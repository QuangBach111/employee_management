<%@ page import="com.example.assignment2.util.ServletType" %>
<%--
  Created by IntelliJ IDEA.
  User: buiqu
  Date: 6/19/2023
  Time: 6:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Login</title>
	<%--	inlclude library--%>
	<jsp:include page="/common/library.jsp"/>

	<%--	link to css--%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/login-style.css">
</head>
<body>
<div class="wrapper">
	<div class="form-box login">
		<h2>Login</h2>

		<%--		error message--%>
		<p class="text-danger text-center">${requestScope.errorMessage}</p>
		<%--		end of error message--%>
		<%--		  login form--%>
		<form id="login-form"
		      action="${pageContext.request.contextPath}/servlet"
		      method="post">

			<%--		type--%>
			<input type="text" name="type" value="<%=ServletType.LOGIN%>" hidden="hidden">
			<%--		end of type--%>

			<%--			  email--%>
			<div class="form-group">
				<span class="icon"><i class="fa-solid fa-user"></i></span>
				<%--				Icon success--%>
				<span class="icon icon-status icon-success text-success hide">
					<i class="fa-sharp fa-solid fa-circle-check"></i></span>
				<%--				end of Icon success--%>

				<%--				icon danger--%>
				<span class="icon icon-status icon-danger text-danger hide">
					<i class="fa-solid fa-circle-exclamation"></i></span>
				<%--				end of icon danger--%>

				<input id="user-login" name="userName" type="text" rules="required" placeholder="User Name">

				<span class="form-message"></span>
			</div>
			<%--			  end of email--%>

			<%--			  password--%>
			<div class="form-group">
				<span class="icon"><i class="fa-solid fa-lock"></i></span>

				<%--				Icon success--%>
				<span class="icon icon-status icon-success text-success hide">
					<i class="fa-sharp fa-solid fa-circle-check"></i></span>
				<%--				end of Icon success--%>

				<%--				icon danger--%>
				<span class="icon icon-status icon-danger text-danger hide">
					<i class="fa-solid fa-circle-exclamation"></i></span>
				<%--				end of icon danger--%>


				<input id="password-login" name="password" rules="required|min:6" type="password"
				       placeholder="Password">
				<span class="form-message"></span>
			</div>
			<%--			  end of password--%>


			<button type="submit" class="btn btn-lg btn-primary btn-login">Login</button>

			<%--			&lt;%&ndash;				register&ndash;%&gt;--%>
			<%--			<div class="login-register">--%>
			<%--				<p>Don't have an account?--%>
			<%--					<a href="#" class="register-link">Register</a>--%>
			<%--				</p>--%>
			<%--			</div>--%>
			<%--			&lt;%&ndash;				end of register&ndash;%&gt;--%>

		</form>
		<%--		  end of login form--%>

	</div>
</div>
<script src="${pageContext.request.contextPath}/vendor/js/validate-form.js"></script>
<script>
    validator('#login-form');
</script>
</body>
</html>