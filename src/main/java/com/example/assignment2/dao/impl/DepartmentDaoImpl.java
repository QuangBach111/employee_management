package com.example.assignment2.dao.impl;

import com.example.assignment2.dao.Dao;
import com.example.assignment2.dao.JpaDao;
import com.example.assignment2.dto.Department;
import com.example.assignment2.dto.person.extend.Employee;

import javax.persistence.Persistence;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDaoImpl extends JpaDao<Department> implements Dao<Department> {
	private static DepartmentDaoImpl instance;
	
	private DepartmentDaoImpl ( ) {
		emf = Persistence.createEntityManagerFactory( "mysql" );
	}
	
	public static DepartmentDaoImpl getInstance ( ) {
		if ( instance == null ) {
			instance = new DepartmentDaoImpl();
		}
		return instance;
	}
	
	@Override
	public boolean create ( Department department ) {
		return super.create( department );
	}
	
	@Override
	public List<Department> getAll ( ) {
		return super.getAll( Department.class );
	}
	
	@Override
	public Department get ( Long id ) {
		return super.get( Department.class, id );
	}
	
	@Override
	public Department get ( String name ) {
		return super.get( Department.class, "name", name );
	}
	
	public Department get ( String nameField, String name ) {
		return super.get( Department.class, nameField, name );
	}
	
	@Override
	public boolean update ( Department department ) {
		return super.update( department );
	}
	
	@Override
	public boolean delete ( Long id ) {
		return false;
	}
	
	
}