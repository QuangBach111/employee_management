package com.example.assignment2.dao;

import java.util.List;

public interface Dao<E> {
	boolean create ( E e );
	
	List<E> getAll ( );
	
	E get ( Long id );
	
	E get ( String name );
	
	boolean update ( E e );
	
	boolean delete ( Long id );
}