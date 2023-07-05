package com.example.assignment2.dto;

import com.example.assignment2.dto.person.extend.Employee;

import javax.persistence.*;

@Entity
@Table(name = "accounts")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "user_name", unique = true)
    private String userName;
    @Column(name = "email", unique = true)
    private String email;
    private String password;
    private int status;
    @OneToOne(mappedBy = "account", cascade = CascadeType.ALL)
    private Employee employee;

    public Account() {
    }

    public
    void setId(Long id) {
        this.id = id;
    }

    public long getId() {
        return id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Employee getEmployee() {
        return employee;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", userName='" + userName + '\'' + ", email='" + email + '\'' + '}';
    }
}