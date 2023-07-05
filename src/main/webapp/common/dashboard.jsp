<%@ page import="com.example.assignment2.util.ServletType" %>
<%--link to csss--%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/dashboard-style.css">
<%--end of link to csss--%>

<%--dashboard--%>
<div class="dashboard">
	<%--	dashboard list--%>
	<ul>
		<%--		dashboard title--%>
		<li>
			<i class="fa-solid fa-gauge-high">
			</i> Dashboard
		</li>
		<%--		end of dashboard title--%>

		<%--			employee manager--%>
		<li>
			<div class="list-item d-flex justify-content-between align-items-center">
				<span>
					<i class="fa-solid fa-chart-column"></i>
					Employee manager
				</span>
				<span>
					<button
							class="btn bg-light btn-employee-menu"><i
							class="fa-sharp fa-solid fa-angle-down"></i></button>
				</span>
			</div>


			<%--			end of employee manager--%>

			<ul>
				<%--				employee list--%>
				<li>
					<a href="${pageContext.request.contextPath}/servlet?type=<%=ServletType.LIST_EMPLOYEE%>">
						<i class="fa-solid fa-list"></i>
						Employee List
					</a>
				</li>
				<%--				end of employee list--%>

				<%--					add employee--%>
				<li>
					<a href="${pageContext.request.contextPath}/view/employee-add.jsp">
						<i class="fa-solid fa-plus"></i>
						Add employee
					</a>
				</li>
				<%--					end of add employee--%>

			</ul>
		</li>
		<%--		end of Employee --%>

			<%--			department manager--%>
			<li>
				<div class="d-flex justify-content-between align-items-center">
				<span>
					<i class="fa-solid fa-chart-column"></i>
					Department manager
				</span>
					<span>
					<button
							class="btn bg-light btn-employee-menu"><i
							class="fa-sharp fa-solid fa-angle-down"></i></button>
				</span>
				</div>


				<%--			end of department manager--%>

				<ul>
					<%--				department list--%>
					<li>
						<a href="${pageContext.request.contextPath}/servlet?type=<%=ServletType.LIST_Department%>">
							<i class="fa-solid fa-list"></i>
							Department List
						</a>
					</li>
					<%--				end of employee list--%>

					<%--					add employee--%>
					<li>
						<a href="${pageContext.request.contextPath}/view/department-add.jsp">
							<i class="fa-solid fa-plus"></i>
							Add department
						</a>
					</li>
					<%--					end of add employee--%>

				</ul>
			</li>
			<%--		end of Employee --%>


	</ul>
	<%--	end of dashboard list--%>
</div>
<%--end of dashboard--%>

<script src="${pageContext.request.contextPath}/common/js/dashboard-script.js"></script>