package com.ch.ch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.TicketDao;

@Service
public class TicketServiceImpl implements TicketService{
	@Autowired
	private TicketDao td;
}
