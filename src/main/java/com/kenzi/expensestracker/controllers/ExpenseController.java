package com.kenzi.expensestracker.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.kenzi.expensestracker.models.ExpenseModel;
import com.kenzi.expensestracker.services.ExpenseService;

@Controller
public class ExpenseController {
	
	public final ExpenseService expenseService;

	public ExpenseController(ExpenseService expenseService)
		{
		this.expenseService = expenseService;
		}

	//Read	
	@GetMapping("/")
	public String redirect()
		{
		return "redirect:/expenses";
		}
	
	@GetMapping("/expenses")
	public String index(@ModelAttribute("expense") ExpenseModel expense, Model model)
		{
		List<ExpenseModel> allExpenses = this.expenseService.allExpenses();
		model.addAttribute("allExpenses", allExpenses);
		return "index.jsp";
		}

	@GetMapping("/expenses/{id}")
	public String show(
			@PathVariable("id") Long id,
			Model model
			)
		{
		ExpenseModel detail = this.expenseService.findExpense(id);
		model.addAttribute("detail", detail);
		return "detail.jsp";
		}
	
	//Create
	@PostMapping("/expenses/add")
    public String add(@Valid @ModelAttribute("expense") ExpenseModel expense, BindingResult result, Model model)
		{
        if (result.hasErrors())
	        {
        	List<ExpenseModel> allExpenses = this.expenseService.allExpenses();
    		model.addAttribute("allExpenses", allExpenses);
            return "index.jsp";
	        }
        else
	        {
        	this.expenseService.add(expense);
            return "redirect:/expenses";
	        }
		}

	//Update
	@GetMapping("/expenses/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model)
		{
		ExpenseModel edit = this.expenseService.findExpense(id);
		model.addAttribute("edit", edit);
		return "edit.jsp";
		}
	
	@PutMapping("/expenses/{id}/update")
	public String update(@PathVariable("id") Long id,@Valid @ModelAttribute("edit") ExpenseModel edit, BindingResult result)
		{
		if (result.hasErrors())
			{
			return "edit.jsp";
			}
		else
			{
			this.expenseService.update(edit);
			return "redirect:/expenses";
			}
		}
	
	//Delete
	@DeleteMapping("/expenses/{id}/delete")
    public String delete(@PathVariable("id") Long id) {
        expenseService.delete(id);
        return "redirect:/expenses";
    }
}


























