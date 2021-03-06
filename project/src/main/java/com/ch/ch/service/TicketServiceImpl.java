package com.ch.ch.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.TicketDao;
import com.ch.ch.model.Movie;

@Service
public class TicketServiceImpl implements TicketService{
	@Autowired
	private TicketDao td;
	public List<Movie> select() {
		return td.select();
	}
	public int insertTicket(int adult_ticket, int youth_ticket, int t_sale1, String member_id, Date sc_date,
			int sc_num) {
		return td.insertTicket(adult_ticket, youth_ticket, t_sale1, member_id, sc_date, sc_num);
	}
}
