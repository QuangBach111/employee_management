package com.example.assignment2.service;

import com.example.assignment2.dao.impl.DepartmentDaoImpl;
import com.example.assignment2.dao.impl.EmployeeDaoImpl;
import com.example.assignment2.dto.Department;
import com.example.assignment2.dto.person.extend.Employee;
import com.example.assignment2.util.Helper;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class DepartmentService {
	public void listEmployee ( HttpServletRequest req, HttpServletResponse resp ) throws ServletException,
	                                                                                     IOException {
		Long id = Long.valueOf( req.getParameter( "id" ) );
		
		Department department = DepartmentDaoImpl.getInstance().get( id );
		
		List<Employee> employeeList = EmployeeDaoImpl.getInstance().get( department );
		
		req.setAttribute( "list", employeeList );
		req.getRequestDispatcher( "/view/employee-list.jsp" ).forward( req, resp );
	}
	
	public void listDepartment ( HttpServletRequest req, HttpServletResponse resp ) throws ServletException,
	                                                                                       IOException {
		List<Department> departmentList = DepartmentDaoImpl.getInstance().getAll();
		req.setAttribute( "departmentList", departmentList );
		req.getRequestDispatcher( "/view/department-list.jsp" ).forward( req, resp );
	}
	
	public void addDepartment ( HttpServletRequest req, HttpServletResponse resp ) throws ServletException,
	                                                                                      IOException {
		String name = Helper.convertName( req.getParameter( "name" ) );
		
		Department department = new Department();
		department.setName( name );
		
		boolean isSuccess = DepartmentDaoImpl.getInstance().create( department );
		
		if ( !isSuccess ) {
			req.setAttribute( "errorMessage", "Department is already exist" );
			req.getRequestDispatcher( "/view/department-add.jsp" ).forward( req, resp );
			return;
		}
		
		resp.sendRedirect( req.getContextPath() + "/view/department-add.jsp?successMessage=Adding success!" );
	}
}