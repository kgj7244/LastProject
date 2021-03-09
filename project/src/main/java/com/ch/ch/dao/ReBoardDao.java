package com.ch.ch.dao;

import java.util.List;

import com.ch.ch.model.ReBoard;

public interface ReBoardDao {

	List<ReBoard> list(int b_num);

	void insert(ReBoard reBoard);

	void update(ReBoard reBoard);

	void delete(int r_num);

	int select_r_count(int b_num);

}
