package com.ch.ch.dao;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Screen;

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
	public MovieTheater selectTitle(String mt_name) {
		return sst.selectOne("screenns.selectTitle", mt_name);
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
}
