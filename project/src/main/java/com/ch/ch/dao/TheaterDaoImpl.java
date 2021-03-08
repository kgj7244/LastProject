package com.ch.ch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		return sst.insert("theaterns.insert");
	}
	public Theater select(int t_num) {
		return sst.selectOne("theaterns.select", t_num);
	}
	public List<Theater> titleList() {
		return sst.selectList("theaterns.titleList");
	}

}