package com.example.assignment2.dto;

import com.example.assignment2.dto.person.extend.Employee;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table( name = "departments" )

public class Department {
	@Id
	@GeneratedValue( strategy = GenerationType.IDENTITY )
	private Long           id;
	private String         name;
	@OneToMany( mappedBy = "department", cascade = { CascadeType.PERSIST, CascadeType.MERGE } )
	private List<Employee> employees;
	
	public Department ( ) {
	
	}
	
	public long getId ( ) {
		return id;
	}
	
	public String getName ( ) {
		return name;
	}
	
	public void setName ( String name ) {
		this.name = name;
	}
	
	public List<Employee> getEmployees ( ) {
		return employees;
	}
	
	public void setEmployees ( List<Employee> employees ) {
		this.employees = employees;
	}
	
	public Department ( long id, String name ) {
		this.id = id;
		this.name = name;
	}
	
	@Override
	public String toString ( ) {
		return "Department{" + "id=" + id + ", name='" + name + '\'' + '}';
	}
}