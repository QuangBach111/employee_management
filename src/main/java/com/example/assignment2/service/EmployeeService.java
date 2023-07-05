package com.example.assignment2.service;

import com.example.assignment2.dao.impl.AccountDaoImpl;
import com.example.assignment2.dao.impl.DepartmentDaoImpl;
import com.example.assignment2.dao.impl.EmployeeDaoImpl;
import com.example.assignment2.dto.Account;
import com.example.assignment2.dto.Department;
import com.example.assignment2.dto.person.extend.Employee;
import com.example.assignment2.util.Helper;
import com.example.assignment2.util.ServletType;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class EmployeeService {
	public void listEmployee ( HttpServletRequest req, HttpServletResponse resp ) throws ServletException,
	                                                                                     IOException {
		List<Employee> employeeList = EmployeeDaoImpl.getInstance().getAll();
		
		req.setAttribute( "list", employeeList );
		req.getRequestDispatcher( "view/employee-list.jsp" ).forward( req, resp );
	}
	
	public void addEmployee ( HttpServletRequest req, HttpServletResponse resp ) throws ServletException, IOException {
		// Create account
		Account newAccount = new Account();
		newAccount.setUserName( req.getParameter( "userName" ) );
		newAccount.setEmail( req.getParameter( "email" ) );
		newAccount.setPassword( req.getParameter( "password" ) );
		newAccount.setStatus( Integer.parseInt( req.getParameter( "status" ) ) );
		
		// get account from database by userName and email
		Account checkAccount = AccountDaoImpl.getInstance()
		                                     .getOr( "userName",
		                                             newAccount.getUserName(),
		                                             "email",
		                                             newAccount.getEmail() );
		
		// If userName or email is already register
		if ( checkAccount != null ) {
			if ( checkAccount.getEmail().equals( newAccount.getEmail() ) ) {
				
				req.setAttribute( "errorMessage", "Your Email is already exist!" );
				
				req.getRequestDispatcher( "/view/employee-add.jsp" ).forward( req, resp );
				return;
			}
			
			if ( checkAccount.getUserName().equals( newAccount.getUserName() ) ) {
				
				req.setAttribute( "errorMessage", "Your User Name is already exist!" );
				
				req.getRequestDispatcher( "/view/employee-add.jsp" ).forward( req, resp );
				return;
			}
		}
		
		// if account is valid
		if ( checkAccount == null ) {
			Long departmentId = Long.valueOf( req.getParameter( "departmentId" ) );
			// Create department
			Department department = DepartmentDaoImpl.getInstance().get( departmentId );
			
			// Create employee object with param from req
			Employee employee = new Employee();
			employee.setFirstName( req.getParameter( "firstName" ) );
			employee.setLastName( req.getParameter( "lastName" ) );
			employee.setPhone( req.getParameter( "phone" ) );
			employee.setDateOfBirth( Helper.convertDate( req.getParameter( "dateOfBirth" ) ) );
			employee.setGender( Integer.parseInt( req.getParameter( "gender" ) ) );
			employee.setDepartment( department );
			employee.setAccount( newAccount );
			employee.setRemark( req.getParameter( "remark" ) );
			employee.setAddress( req.getParameter( "address" ) );
			
			EmployeeDaoImpl.getInstance().create( employee );
			
			req.setAttribute( "successMessage", "Adding successes!" );
			
			resp.sendRedirect( req.getContextPath() + "/view/employee-add.jsp?successMessage=Adding successes!" );
		}
	}
	
	public void viewAddEmployee ( HttpServletRequest req, HttpServletResponse resp ) throws ServletException,
	                                                                                        IOException {
		List<Department> departmentList = DepartmentDaoImpl.getInstance().getAll();
		
		req.setAttribute( "departmentList", departmentList );
		req.getRequestDispatcher( "/view/employee-add.jsp" ).forward( req, resp );
	}
	
	public void deleteEmployee ( HttpServletRequest req, HttpServletResponse resp ) throws IOException {
		Long id = Long.valueOf( req.getParameter( "id" ) );
		
		EmployeeDaoImpl.getInstance().delete( id );
		
		resp.sendRedirect( req.getContextPath() + "/servlet?type=" + ServletType.LIST_EMPLOYEE );
	}
	
	public void editEmployee ( HttpServletRequest req, HttpServletResponse resp ) throws ServletException,
	                                                                                     IOException {
		Long id = Long.valueOf( req.getParameter( "id" ) );
		Employee employee = EmployeeDaoImpl.getInstance().get( id );
		
		req.setAttribute( "employee", employee );
		req.getRequestDispatcher( "/view/employee-edit.jsp" ).forward( req, resp );
	}
	
	public void viewEmployee ( HttpServletRequest req, HttpServletResponse resp ) throws ServletException,
	                                                                                     IOException {
		Long id = Long.valueOf( req.getParameter( "id" ) );
		Employee employee = EmployeeDaoImpl.getInstance().get( id );
		
		req.setAttribute( "employee", employee );
		req.getRequestDispatcher( "/view/employee-view.jsp" ).forward( req, resp );
	}
	
	public void updateEmployee ( HttpServletRequest req, HttpServletResponse resp ) throws IOException {
		
		Employee employee = createEmployeeFromRequest( req );
		boolean isSuccess = EmployeeDaoImpl.getInstance().update( employee );
		resp.sendRedirect( req.getContextPath() + "/servlet?successMessage=Update Success!&type=" + ServletType.LIST_EMPLOYEE );
	}
	
	private Employee createEmployeeFromRequest ( HttpServletRequest req ) {
		// Create account
		Account account = new Account();
		
		account.setId( Long.valueOf( req.getParameter( "accountId" ) ) );
		account.setUserName( req.getParameter( "userName" ) );
		account.setEmail( req.getParameter( "email" ) );
		account.setPassword( req.getParameter( "password" ) );
		account.setStatus( Integer.parseInt( req.getParameter( "status" ) ) );
		
		
		// get department from database
		Long departmentId = Long.valueOf( req.getParameter( "departmentId" ) );
		Department department = DepartmentDaoImpl.getInstance().get( departmentId );
		
		// Create employee object with param from req
		Employee employee = new Employee();
		employee.setId( Long.valueOf( req.getParameter( "id" ) ) );
		employee.setFirstName( req.getParameter( "firstName" ) );
		employee.setLastName( req.getParameter( "lastName" ) );
		employee.setPhone( req.getParameter( "phone" ) );
		employee.setDateOfBirth( Helper.convertDate( req.getParameter( "dateOfBirth" ) ) );
		employee.setGender( Integer.parseInt( req.getParameter( "gender" ) ) );
		employee.setDepartment( department );
		employee.setAccount( account );
		employee.setRemark( req.getParameter( "remark" ) );
		employee.setAddress( req.getParameter( "address" ) );
		
		return employee;
	}
}