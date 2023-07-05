package com.example.assignment2.dto.person.extend;

import com.example.assignment2.dto.Account;
import com.example.assignment2.dto.Department;
import com.example.assignment2.dto.person.Person;

import javax.persistence.*;

@Entity
@Table(name = "employees")
public
class Employee extends Person {

	private String     remark;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "account_id", referencedColumnName = "id")
	private Account    account;
	@ManyToOne(cascade = {CascadeType.MERGE})
	@JoinColumn(name = "department_id")
	private Department department;

	public
	Employee() {
	}



	public
	String getRemark() {
		return remark;
	}

	public
	void setRemark(String remark) {
		this.remark = remark;
	}

	public
	Account getAccount() {
		return account;
	}

	public
	void setAccount(Account account) {
		this.account = account;
	}

	public
	Department getDepartment() {
		return department;
	}

	public
	void setDepartment(Department department) {
		this.department = department;
	}

	@Override
	public
	String toString() {
		return "Employee{" + "remark='" + remark + '\'' + ", account=" + account + ", department=" + department + "} " + super.toString();
	}
}