package com.ch.ch.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch.model.Movie;
import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Theater;
import com.ch.ch.model.Ticket;

@Repository
public class TicketDaoImpl implements TicketDao{
	@Autowired
	private SqlSessionTemplate sst;
	public List<Movie> select() {
		return sst.selectList("ticketns.select");
	}
	public int insertTicket(int adult_ticket, int youth_ticket, int t_sale1, String member_id, Date sc_date, String selectList,
			int sc_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("adult_ticket", adult_ticket);
		map.put("youth_ticket", youth_ticket);
		map.put("t_sale1", t_sale1);
		map.put("member_id", member_id);
		map.put("sc_date", sc_date);
		map.put("selectList", selectList);
		map.put("sc_num", sc_num);
		return sst.insert("ticketns.insertTicket", map);
	}
	public Ticket selectBank(String selectList, String member_id, int sc_num) {
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("selectList", selectList);
		map.put("member_id", member_id);
		map.put("sc_num", sc_num);		
		return sst.selectOne("ticketns.selectBank", map);
	}
	public int insertBank(int totalPrice1, String t_deal, String member_id, int t_ordernum) {
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("totalPrice1", totalPrice1);
		map.put("t_deal", t_deal);
		map.put("member_id", member_id);
		map.put("t_ordernum", t_ordernum);
		return sst.insert("ticketns.insertBank",map);
	}
	
	
	public List<Ticket> memberTicketList(String member_id) { //희주 추가
		return sst.selectList("ticketns.memberTicketList", member_id);
	}
	public MovieTheater selectMovieTheater(int mt_num, int t_num) { //희주 추가
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mt_num", mt_num);
		map.put("t_num", t_num);
		return sst.selectOne("ticketns.selectMovieTheater", map);
	}
	public Theater selectTheater(int t_num) { //희주 추가
		return sst.selectOne("ticketns.selectTheater", t_num);
	}
	public Movie selectMovie(int m_num) {
		return sst.selectOne("ticketns.selectMovie", m_num);
	}
	
}
