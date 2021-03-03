package com.ch.ch.dao;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

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
	public Screen select(int sc_num) {
		return sst.selectOne("screenns.select", sc_num);
	}
	public MovieTheater selectMovieTheater(int mt_num, String sc_start, String sc_date) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mt_num", mt_num);
		map.put("sc_start", sc_start);
		map.put("sc_date", sc_date);
		return sst.selectOne("screenns.selectMovieTheater", map);
	}
	public MovieTheater selectMovieTheaterFind(int mt_num) {
		return sst.selectOne("screenns.selectMovieTheaterFind", mt_num);
	}
}
