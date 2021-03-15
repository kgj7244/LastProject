package com.ch.ch.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch.model.Event;
import com.ch.ch.model.Event_over;
import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Screen;
import com.ch.ch.model.Seat;
import com.ch.ch.model.Theater;

@Repository
public class ScreenDaoImpl implements ScreenDao{
	@Autowired
	private SqlSessionTemplate sst;
	public List<Screen> selectTitleList(int movie_num, int theater_num, String sc_date) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movie_num", movie_num);
		map.put("theater_num", theater_num);
		map.put("sc_date", sc_date);
		return sst.selectList("screenns.selectTitleList", map);
	}
	public int selectCnt(int t_num) {
		return sst.selectOne("screenns.selectCnt", t_num);
	}
	public Screen select(int sc_num, int mt_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sc_num", sc_num);
		map.put("mt_num", mt_num);
		return sst.selectOne("screenns.select", map);
	}
	public MovieTheater selectMovieTheater(int mt_num, String sc_start, String sc_date) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mt_num", mt_num);
		map.put("sc_start", sc_start);
		map.put("sc_date", sc_date);
		return sst.selectOne("screenns.selectMovieTheater", map);
	}
	public MovieTheater selectMovieTheaterFind(int mt_num, int sc_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sc_num", sc_num);
		map.put("mt_num", mt_num);
		return sst.selectOne("screenns.selectMovieTheaterFind",map);
	}
	public List<MovieTheater> list() {
		return sst.selectList("screenns.list");
	}
	public MovieTheater selectTitle(String mt_name ,int t_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mt_name", mt_name);
		map.put("t_num", t_num);
		return sst.selectOne("screenns.selectTitle", map);
	}
	public int screenInsert(int m_num, int t_num, int mt_num, String sc_date, String sc_start, String sc_end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", m_num);
		map.put("t_num", t_num);
		map.put("mt_num", mt_num);
		map.put("sc_date", sc_date);
		map.put("sc_start", sc_start);
		map.put("sc_end", sc_end);
		return sst.insert("screenns.screenInsert", map);
	}
	public Screen selectSeat(int sc_num) {
		return sst.selectOne("screenns.selectSeat", sc_num);
	}
	public int insertSeat(String st_name, int sc_num) { // 기존에 있는 상영에다가 st_num에 좌석으로 추가하는거여서 update로 함
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("st_name", st_name);
		map.put("sc_num", sc_num);
		return sst.update("screenns.insertSeat", map);
	}
	public int screenReFund(int sc_num, String seat) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sc_num", sc_num);
		map.put("seat", seat);		
		return sst.update("screenns.screenReFund", map);
	}
	public int bankReFund(int t_ordernum, String member_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("t_ordernum", t_ordernum);
		map.put("member_id", member_id);
		return sst.delete("screenns.bankReFund", map);
	}
	public int ticketReFund(int t_ordernum, int sc_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("t_ordernum", t_ordernum);
		map.put("sc_num", sc_num);
		return sst.delete("screenns.ticketReFund", map);
	}


	//새로운
	public void newInsertSeat(int sc_num, String seat) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sc_num", sc_num);
		map.put("seat", seat);
		sst.insert("screenns.newInsertSeat", map);
	}
	public List<Seat> seatFind(int sc_num) {
		return sst.selectList("screenns.seatFind", sc_num);
	}
	public void deleteSeatReFund(String st_num, int sc_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("st_num", st_num);
		map.put("sc_num", sc_num);
		sst.delete("screenns.deleteSeatReFund", map);
	}
	public Theater selectTheater(String t_title) {
		return sst.selectOne("screenns.selectTheater", t_title);
	}
	public List<MovieTheater> mTheater(int t_num) {
		return sst.selectList("screenns.mTheater", t_num);
	}
	public int insertEvent(Event event) {
		return sst.insert("screenns.insertEvent", event);
	}
	public List<Event> eventList() {
		return sst.selectList("screenns.eventList");
	}
	public List<Event_over> eventFind(int e_num, String member_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("e_num", e_num);
		map.put("member_id", member_id);
		return sst.selectList("screenns.eventFind", map);
	}
	public int event_overInsert(int e_num, String member_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("e_num", e_num);
		map.put("member_id", member_id);
		return sst.insert("screenns.event_overInsert", map);
	}
	public List<Event_over> event_overList() {
		return sst.selectList("screenns.event_overList");
	}
	public int rankUp(int eo_num) {
		return sst.update("screenns.rankUp",eo_num);
	}
	public int eventCancel(int eo_num) {
		return sst.delete("screenns.eventCancel", eo_num);
	}
	public Event selectEvent(int e_num) {
		return sst.selectOne("screenns.selectEvent",e_num);
	}
	public int eventUpdate(Event event) {
		return sst.update("screenns.eventUpdate", event);
	}
	public int eventDelete(int e_num) {
		return sst.update("screenns.eventDelete", e_num);
	}
	public List<Event_over> coupon(String member_id) {
		return sst.selectList("screenns.coupon", member_id);
	}
	public List<Event_over> memberEvent_over(String member_id) {
		return sst.selectList("screenns.memberEvent_over", member_id);
	}
	public Event eventNumFind(int eo_num) {
		return sst.selectOne("screenns.eventNumFind",eo_num);
	}
	public void event_use(int eo_num) {
		sst.update("screenns.event_use", eo_num);
	}
}
