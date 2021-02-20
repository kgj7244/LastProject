package com.ch.ch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.TicketDao;
import com.ch.ch.model.Moive;

@Service
public class TicketServiceImpl implements TicketService{
	@Autowired
	private TicketDao td;
	public List<Moive> select() {
		return td.select();
	}
}
