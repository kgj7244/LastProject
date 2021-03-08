package com.ch.ch.service;

import java.util.List;

import com.ch.ch.model.Board;

public interface BoardService {

	int getTotal(Board board);

	List<Board> list(Board board);

	int getTotalBcode(Board board);

	List<Board> listCode(Board board);

	Board select(int b_num);

	int insert(Board board);

	void updateReadCount(int b_num);

	int update(Board board);

}
