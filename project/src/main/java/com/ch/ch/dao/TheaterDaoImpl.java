package com.ch.ch.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Theater;

@Repository
public class TheaterDaoImpl implements TheaterDao{
	@Autowired
	private SqlSessionTemplate sst;
	public List<Theater> locList(Theater theater) {
		return sst.selectList("theaterns.locList", theater);
	}
	public List<Theater> selectTheater(String id) {
		return sst.selectList("theaterns.selectTheater", id);
	}
	public Theater selectTitle(String t_title) {
		return sst.selectOne("theaterns.selectTitle", t_title);
	}
	public List<Theater> list() {
		return sst.selectList("theaterns.list");
	}
	public List<Theater> listT_loc() {
		return sst.selectList("theaterns.listT_loc");
	}
	public int insert(Theater theater) {
		return sst.insert("theaterns.insert", theater);
	}
	public List<Theater> select(String t_loc, String t_title) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("t_loc", t_loc);
		map.put("t_title", t_title);
		return sst.selectList("theaterns.select", map);
	}
	public List<String> titleList() {
		return sst.selectList("theaterns.titleList");
	}
	public List<MovieTheater> movieTheaterList() {
		return sst.selectList("theaterns.movieTheaterList");
	}
	public int numInsert(String mt_name, int mt_count, int t_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mt_name", mt_name);
		map.put("mt_count", mt_count);
		map.put("t_num", t_num);
		return sst.insert("theaterns.numInsert",map);
	}
	public List<Theater> locList(String t_loc) {
		return sst.selectList("theaterns.locList2",t_loc);
	}
	public Theater theaterView(int t_num) {
		return sst.selectOne("theaterns.theaterView",t_num);
	}
}