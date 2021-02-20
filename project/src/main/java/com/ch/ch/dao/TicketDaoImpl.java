package com.ch.ch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch.model.Moive;

@Repository
public class TicketDaoImpl implements TicketDao{
	@Autowired
	private SqlSessionTemplate sst;
	public List<Moive> select() {
		return sst.selectList("ticketns.select");
	}
}
