package com.ch.ch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch.model.ReBoard;

@Repository
public class ReBoardDaoImpl implements ReBoardDao{ 
	@Autowired
	private SqlSessionTemplate sst;

	public List<ReBoard> list(int b_num) {
		return sst.selectList("reBoardns.list", b_num);
	}

	public void insert(ReBoard reBoard) {
		sst.insert("reBoardns.insert", reBoard);
	}

	public void update(ReBoard reBoard) {
		sst.update("reBoardns.update", reBoard);
	}

	public void delete(int r_num) {
		sst.update("reBoardns.delete", r_num);
	}

	public int select_r_count(int b_num) {
		return sst.selectOne("reBoardns.select_r_count", b_num);
	}
}