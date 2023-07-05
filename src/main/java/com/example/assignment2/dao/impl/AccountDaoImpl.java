package com.example.assignment2.dao.impl;

import com.example.assignment2.dao.Dao;
import com.example.assignment2.dao.JpaDao;
import com.example.assignment2.dto.Account;

import java.util.List;

public class AccountDaoImpl extends JpaDao<Account> implements Dao<Account> {
	
	private static AccountDaoImpl instance;
	
	public AccountDaoImpl ( ) {
		super();
	}
	
	public static AccountDaoImpl getInstance ( ) {
		if ( instance == null ) {
			instance = new AccountDaoImpl();
		}
		return instance;
	}
	
	@Override
	public boolean create ( Account account ) {
		return false;
	}
	
	@Override
	public List<Account> getAll ( ) {
		return null;
	}
	
	@Override
	public Account get ( Long id ) {
		return null;
	}
	
	@Override
	public Account get ( String name ) {
		return null;
	}
	
	@Override
	public boolean delete ( Long id ) {
		return false;
	}
	
	@Override
	public boolean update ( Account account ) {
		return false;
	}
	
	public Account getOr ( String nameField1, String value1, String nameField2, String value2 ) {
		return super.getOr( Account.class, nameField1, value1, nameField2, value2 );
	}
	
}