package com.ch.ch.service;

import com.ch.ch.model.Bank;

public interface BankService {

	Bank select_bank(int ord_num);

	int insert_bank(Bank bank);

}
