package com.spring.emp.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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

	@RequestMapping(path = "/register-employee", method = RequestMethod.POST)
	public String registerEmployee(@ModelAttribute Employee emp, Model model) {
		
		int id = employeeServices.registerEmployee(emp);
		
		if(id>0) {
			model.addAttribute("saveFlag", true);
		}else {
			model.addAttribute("saveFlag", false);
		}		
		return "redirect:/";
	}
	
	@RequestMapping(path = "/update-employee", method = RequestMethod.POST)
	public String updateEmployee(@ModelAttribute("employee") Employee emp) {		
		
		if(emp.getId() == 0) {
			
		}else {
			employeeServices.updateEmployee(emp);
		}
		
		
		employeeServices.updateEmployee(emp);
		
		
		return "redirect:/";
	}
	
	@RequestMapping(path = "/deleteEmployee/{id}", method = RequestMethod.GET)
	public String deleteEmployee(@PathVariable("id") int id, Model model) {
		
		int check = employeeServices.deleteEmployee(id); 
		
		if(check == 1) {
			model.addAttribute("deleteFlag", true);
		}else if(check == 0) {
			model.addAttribute("deleteFlag", false);
		}	
		
		return "redirect:/";
	}
	
	
	
	
	
}
