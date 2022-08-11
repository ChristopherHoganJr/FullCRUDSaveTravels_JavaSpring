package com.codingdojo.savetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.savetravels.models.Expense;
import com.codingdojo.savetravels.services.ExpenseService;

@Controller
public class MainController {

	@Autowired
	private ExpenseService expenseServ;

	// just a redirect
	@GetMapping("/")
	public String redirectMe() 
	{
		return "redirect:/expenses";
	}

	// /expenses
	// all the expenses
	@GetMapping("/expenses")
	public String allExpenses(Model model) 
	{

		// Show all expenses
		List<Expense> allExpenses = expenseServ.allExpenses();
		model.addAttribute("allExpenses", allExpenses);
		

		// Set up Expense to be added to list
		Expense expenses = new Expense();
		model.addAttribute("expenses", expenses);

		return "index.jsp";
	}
	
	// POST - CREATE EXPENSE METHOD
	@PostMapping("/expenses")
	public String createExpense(@Valid @ModelAttribute("expenses") Expense expenses, BindingResult result, Model model)
	{
		if(result.hasErrors())
		{
			// Show all expenses
			List<Expense> allExpenses = expenseServ.allExpenses();
			model.addAttribute("allExpenses", allExpenses);
			
			return "index.jsp";
		}
		else 
		{
			expenseServ.createExpense(expenses);
			return "redirect:/expenses";
		}
		
	}
	
	// Render Edit Page
	@GetMapping("/expenses/edit/{id}")
	public String editPage(@PathVariable("id") Long id, Model model)
	{
		// Find the expense provided by the id
		Expense thisExpense = expenseServ.findExpense(id);
		
		// pass thisExpense to the jsp page to show
		model.addAttribute("thisExpense", thisExpense);
		return "edit.jsp";
	}
	
	// Method for edit
	@PutMapping("/expenses/edit/{id}")
	public String update(@Valid @ModelAttribute("thisExpense") Expense expense, BindingResult result)
	{
		if(result.hasErrors())
		{
			return "edit.jsp";
		}
		else
		{
			// if there are no errors
			// update the obj
			expenseServ.updateExpense(expense);
			return "redirect:/expenses";
		}
	}
	
	// Delete
	@DeleteMapping("/expense/{id}")
	public String delete(@PathVariable("id") Long id)
	{
		expenseServ.deleteExpense(id);
		return "redirect:/";
	}
	
	// Single Expense
	@GetMapping("/expenses/{id}")
	public String singleExpense(@PathVariable("id") Long id, Model model)
	{
		Expense thisExpense = expenseServ.findExpense(id);
		model.addAttribute("thisExpense", thisExpense);
		return "single.jsp";
	}
}
