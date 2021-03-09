package com.ch.ch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.BoardDao;
import com.ch.ch.model.Board;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao bd;

	public int getTotal(Board board) {
		return bd.getTotal(board);
	}

	public List<Board> list(Board board) {
		return bd.list(board);
	}

	public int getTotalBcode(Board board) {
		return bd.getTotalBcode(board);
	}

	public List<Board> listCode(Board board) {
		return bd.listCode(board);
	}

	public Board select(int b_num) {
		return bd.select(b_num);
	}

	public int insert(Board board) {
		return bd.insert(board);
	}

	public void updateReadCount(int b_num) {
		bd.updateReadCount(b_num);
	}

	public int update(Board board) {
		return bd.update(board);
	}

	public int delete(int b_num) {
		return bd.delete(b_num);
	}

}
