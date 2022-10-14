package com.kenzi.expensestracker.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kenzi.expensestracker.models.ExpenseModel;
import com.kenzi.expensestracker.repositories.ExpenseRepository;

@Service
public class ExpenseService {

	private final ExpenseRepository expenseRepository;
	    
	public ExpenseService(ExpenseRepository expenseRepository) {
        this.expenseRepository = expenseRepository;
    }
	
	public List<ExpenseModel> allExpenses() {
        return (List<ExpenseModel>)this.expenseRepository.findAll();
    }
	
	public ExpenseModel add(ExpenseModel expense) {
		return this.expenseRepository.save(expense);
	}
	
	public ExpenseModel findExpense(Long id) {
		return this.expenseRepository.findById(id).orElse(null);
	}
	
	public ExpenseModel update(ExpenseModel expense) {
		return this.expenseRepository.save(expense);
	}
	
	public void delete(Long id) {
		this.expenseRepository.deleteById(id);
	}
}
