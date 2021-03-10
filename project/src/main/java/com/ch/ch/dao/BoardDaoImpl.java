package com.ch.ch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch.model.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSessionTemplate sst;

	public int getTotal(Board board) {
		return sst.selectOne("boardns.getTotal", board);
	}

	public List<Board> list(Board board) {
		return sst.selectList("boardns.list", board);
	}

	public int getTotalBcode(Board board) {
		return sst.selectOne("boardns.getTotalBcode", board);
	}

	public List<Board> listCode(Board board) {
		return sst.selectList("boardns.listCode", board);
	}

	public Board select(int b_num) {
		return sst.selectOne("boardns.select", b_num);
	}

	public int insert(Board board) {
		return sst.insert("boardns.insert", board);
	}

	public void updateReadCount(int b_num) {
		sst.update("boardns.updateReadCount", b_num);
	}

	public int update(Board board) {
		return sst.update("boardns.update", board);
	}

	public int delete(int b_num) {
		return sst.update("boardns.delete", b_num);
	}
}
