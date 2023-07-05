package com.example.assignment2.controller;

import com.example.assignment2.service.DepartmentService;
import com.example.assignment2.service.EmployeeService;
import com.example.assignment2.service.UserService;
import com.example.assignment2.util.ServletType;
import com.example.assignment2.util.ServletType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet( urlPatterns = { "/servlet" } )
public class Servlet extends HttpServlet {
	UserService       userService       = new UserService();
	EmployeeService   employeeService   = new EmployeeService();
	DepartmentService departmentService = new DepartmentService();
	
	//    do GET
	@Override
	protected void doGet ( HttpServletRequest req, HttpServletResponse resp ) throws ServletException, IOException {
		// get type from request
		String type = req.getParameter( "type" );
		
		// switch case
		switch ( type ) {
			// list-employee feature
			case ServletType.LIST_EMPLOYEE:
				employeeService.listEmployee( req, resp );
				break;
			
			// logout feature
			case ServletType.LOGOUT:
				userService.logout( req, resp );
				break;
			
			// delete employee
			case ServletType.DELETE_EMPLOYEE:
				employeeService.deleteEmployee( req, resp );
				break;
			
			// edit employee
			case ServletType.EDIT_EMPLOYEE:
				employeeService.editEmployee( req, resp );
				break;
			
			// view employee
			case ServletType.VIEW_EMPLOYEE:
				employeeService.viewEmployee( req, resp );
				break;
			
			// list department
			case ServletType.LIST_Department:
				departmentService.listDepartment( req, resp );
				break;
			
			// list employee in department
			case ServletType.LIST_EMPLOYEE_OF_DEPARTMENT:
				departmentService.listEmployee( req, resp );
				break;
		}
	}
	
	//    do POST
	@Override
	protected void doPost ( HttpServletRequest req, HttpServletResponse resp ) throws ServletException, IOException {
		
		// get type from request
		String type = req.getParameter( "type" );
		
		// switch case
		switch ( type ) {
			// login feature
			case ServletType.LOGIN:
				userService.login( req, resp );
				break;
			
			// add employee
			case ServletType.ADD_EMPLOYEE:
				employeeService.addEmployee( req, resp );
				break;
			
			// update employee
			case ServletType.UPDATE_EMPLOYEE:
				employeeService.updateEmployee( req, resp );
				break;
			
			// add department
			case ServletType.ADD_Department:
				departmentService.addDepartment( req, resp );
				break;
		}
	}
}