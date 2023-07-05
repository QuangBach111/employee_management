package com.example.assignment2.dao;

import com.example.assignment2.dto.Department;
import com.example.assignment2.dto.person.extend.User;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

public abstract class JpaDao<T> {
	protected EntityManagerFactory emf;
	protected EntityManager        em;
	
	public JpaDao ( ) {
		emf = Persistence.createEntityManagerFactory( "mysql" );
	}
	
	protected boolean create ( T t ) {
		boolean res = false;
		
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin();
			
			em.persist( t );
			
			em.getTransaction().commit();
			res = true;
		} catch ( Exception e ) {
			e.printStackTrace();
		} finally {
			
			em.close();
		}
		
		return res;
	}
	
	protected List<T> getAll ( Class<T> resultClass ) {
		List<T> list = new ArrayList<>();
		
		try {
			em = emf.createEntityManager();
			
			em.getTransaction().begin();
			
			String sql = " FROM " + resultClass.getSimpleName();
			
			list = em.createQuery( sql, resultClass ).getResultList();
			
			em.getTransaction().commit();
			
		} catch ( Exception e ) {
			e.printStackTrace();
		} finally {
			em.close();
		}
		
		return list.isEmpty() ? null : list;
	}
	
	protected T get ( Class<T> resultClass, Long id ) {
		T result = null;
		try {
			em = emf.createEntityManager();
			
			em.getTransaction().begin();
			
			result = em.find( resultClass, id );
			
			
		} catch ( Exception e ) {
			e.printStackTrace();
		} finally {
			em.getTransaction().commit();
			em.close();
		}
		return result;
	}
	
	protected T get ( Class<T> resultClass, String nameField, String value ) {
		T res = null;
		try {
			em = emf.createEntityManager();
			
			em.getTransaction().begin();
			
			String sql = "FROM " + resultClass.getSimpleName() + " WHERE " + nameField + " = :value";
			
			Query hql = em.createQuery( sql, resultClass );
			hql.setParameter( "value", value );
			res = (T) hql.getSingleResult();
			
			em.getTransaction().commit();
			
		} catch ( Exception e ) {
			e.printStackTrace();
		} finally {
			em.close();
		}
		return res;
	}
	
	protected T getOr ( Class<T> resultClass, String nameField1, String value1, String nameField2, String value2 ) {
		T res = null;
		try {
			em = emf.createEntityManager();
			
			em.getTransaction().begin();
			
			String sql =
					"FROM " + resultClass.getSimpleName() + " WHERE " + nameField1 + " = :value1 or " + nameField2 +
					" =:value2";
			
			Query hql = em.createQuery( sql, resultClass );
			hql.setParameter( "value1", value1 );
			hql.setParameter( "value2", value2 );
			res = (T) hql.getSingleResult();
			
			em.getTransaction().commit();
			
		} catch ( Exception e ) {
			e.printStackTrace();
		} finally {
			em.close();
		}
		return res;
	}
	
	protected boolean update ( T t ) {
		boolean res = true;
		
		try {
			em = emf.createEntityManager();
			
			em.getTransaction().begin();
			
			em.merge( t );
			
			em.getTransaction().commit();
		} catch ( Exception e ) {
			e.printStackTrace();
			res = false;
		} finally {
			em.close();
		}
		
		return res;
	}
	
	protected boolean delete ( Class<T> resultClass, Long id ) {
		boolean res = true;
		try {
			em = emf.createEntityManager();
			em.getTransaction().begin();
			
			em.remove( em.find( resultClass, id ) );
			
			em.getTransaction().commit();
		} catch ( Exception e ) {
			e.printStackTrace();
			res = false;
		} finally {
			em.close();
		}
		
		return res;
	}
}