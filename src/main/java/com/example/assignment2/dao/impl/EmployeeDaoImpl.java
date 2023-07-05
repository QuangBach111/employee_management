package com.example.assignment2.dao.impl;

import com.example.assignment2.dao.Dao;
import com.example.assignment2.dao.JpaDao;
import com.example.assignment2.dto.Department;
import com.example.assignment2.dto.person.extend.Employee;

import java.util.ArrayList;
import java.util.List;

public class EmployeeDaoImpl extends JpaDao<Employee> implements Dao<Employee> {
	
	private static EmployeeDaoImpl instance;
	
	private EmployeeDaoImpl ( ) {
		super();
	}
	
	public static EmployeeDaoImpl getInstance ( ) {
		if ( instance == null ) {
			instance = new EmployeeDaoImpl();
		}
		return instance;
	}
	
	
	@Override
	public boolean create ( Employee employee ) {
		return super.create( employee );
	}
	
	@Override
	public List<Employee> getAll ( ) {
		return super.getAll( Employee.class );
	}
	
	@Override
	public Employee get ( Long id ) {
		return super.get( Employee.class, id );
	}
	
	@Override
	public Employee get ( String name ) {
		return null;
	}
	
	@Override
	public boolean update ( Employee employee ) {
		return super.update( employee );
	}
	
	
	@Override
	public boolean delete ( Long id ) {
		return super.delete( Employee.class, id );
	}
	
	public List<Employee> get ( Department department ) {
		List<Employee> employees = new ArrayList<>();
		
		try {
			em = emf.createEntityManager();
			em.getTransaction().begin();
			
			employees = em.createQuery( "FROM Employee WHERE department = :department", Employee.class )
			              .setParameter( "department", department )
			              .getResultList();
			
			em.getTransaction().commit();
		} catch ( Exception e ) {
			e.printStackTrace();
		} finally {
			if ( em.isOpen() ) {
				em.close();
			}
		}
		
		return employees.isEmpty() ? null : employees;
	}
}