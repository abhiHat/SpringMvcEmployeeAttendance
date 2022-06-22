package com.spring.emp.project.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.emp.project.model.Employee;

@Repository
public class EmployeeDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	public List<Employee> getAllEmps() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Employee> empList = (List<Employee>) session.createQuery("from Employee").list();
		return empList;
	}

	public int saveEmployee(Employee emp) {
		Session session = this.sessionFactory.getCurrentSession();
		int id = (Integer) session.save(emp);
		return id;
	}

	public void updateEmployee(Employee emp) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(emp);
	}
	
	
	
	public int deleteEmployee(int id) {
		
		Session session = this.sessionFactory.getCurrentSession();
		Employee emp = (Employee) session.load(Employee.class, new Integer(id));
		
		if(emp != null) {
			session.delete(emp);
			return 1;
		}
		return 0;
	}
}
