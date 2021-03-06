package com.ch.ch.dao;

import java.sql.Date;
import java.util.List;

import com.ch.ch.model.Movie;

public interface TicketDao {

	List<Movie> select();

	int insertTicket(int adult_ticket, int youth_ticket, int t_sale1, String member_id, Date sc_date, int sc_num);

}
