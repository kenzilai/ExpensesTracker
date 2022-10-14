package com.kenzi.expensestracker.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kenzi.expensestracker.models.ExpenseModel;


@Repository
public interface ExpenseRepository extends CrudRepository<ExpenseModel, Long>{

}
