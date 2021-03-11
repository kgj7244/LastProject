package com.ch.ch.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch.model.Bank;

@Repository
public class BankDaoImpl implements BankDao{
	@Autowired
	private SqlSessionTemplate sst;

	
	public Bank select_bank(int ord_num) {
		return sst.selectOne("bankns.select_bank",ord_num);
		}


	
	public int insert_bank(Bank bank) {
		return sst.insert("bankns.insert_bank",bank);
	}

}
