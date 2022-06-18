package com.spring.emp.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.emp.project.model.Employee;
import com.spring.emp.project.service.EmployeeServices;

@Controller
public class EmpController {

	@Autowired
	EmployeeServices employeeServices;
	
	
	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String getEmployees(Model model) {
		List<Employee> listOfEmps = employeeServices.getAllEmployies();
		model.addAttribute("emps", listOfEmps);
		return "home";
	}

	
}
