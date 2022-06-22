package com.spring.emp.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.emp.project.dao.EmployeeDao;
import com.spring.emp.project.model.Employee;

@Service("employeeService")
public class EmployeeServices {

	@Autowired
	EmployeeDao employeeDao;
	
	@Transactional
	public List<Employee> getAllEmployies(){
		return employeeDao.getAllEmps();
	}
	
	@Transactional
	public int registerEmployee(Employee emp) {
		return	this.employeeDao.saveEmployee(emp);
	}
	
	@Transactional
	public void updateEmployee(Employee emp) {
		this.employeeDao.updateEmployee(emp);
	}
	
	
	@Transactional
	public int deleteEmployee(int id) {
		return this.employeeDao.deleteEmployee(id);
	}
	
	
	
	
}
