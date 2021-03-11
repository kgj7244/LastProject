package com.ch.ch.dao;

import com.ch.ch.model.Bank;

public interface BankDao {

	Bank select_bank(int ord_num);

	int insert_bank(Bank bank);

}
