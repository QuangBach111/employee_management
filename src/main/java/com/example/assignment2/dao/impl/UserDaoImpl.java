package com.example.assignment2.dao.impl;

import com.example.assignment2.dao.Dao;
import com.example.assignment2.dao.JpaDao;
import com.example.assignment2.dto.person.extend.Employee;
import com.example.assignment2.dto.person.extend.User;

import javax.persistence.Query;
import java.util.List;

public class UserDaoImpl extends JpaDao<User> implements Dao<User> {
    private static UserDaoImpl instance;

    private UserDaoImpl() {
        super();
    }

    public static UserDaoImpl getInstance() {
        if (instance == null) {
            instance = new UserDaoImpl();
        }
        return instance;
    }


    @Override
    public boolean create(User user) {
        return false;
    }

    @Override
    public List<User> getAll() {
        return null;
    }

    @Override
    public User get(Long id) {
        return null;
    }

    @Override
    public User get(String name) {
        return super.get(User.class, "userName", name);
    }

    @Override
    public boolean update(User user) {
        return false;
    }


    @Override
    public boolean delete(Long id) {
        return false;
    }


}