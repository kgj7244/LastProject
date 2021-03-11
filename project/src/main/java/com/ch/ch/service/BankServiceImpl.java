package com.ch.ch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.BankDao;
import com.ch.ch.model.Bank;

@Service
public class BankServiceImpl implements BankService{
	@Autowired
	private BankDao bdo;

	
	public Bank select_bank(int ord_num) {
		return bdo.select_bank(ord_num);
	}


	
	public int insert_bank(Bank bank) {
		return bdo.insert_bank(bank);
	}

}
