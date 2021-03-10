package com.ch.ch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.ReBoardDao;
import com.ch.ch.model.ReBoard;

@Service
public class ReBoardServiceImpl implements ReBoardService {
	@Autowired
	private ReBoardDao rbd;

	public List<ReBoard> list(int b_num) {
		return rbd.list(b_num);
	}

	public void insert(ReBoard reBoard) {
		rbd.insert(reBoard);
	}

	public void update(ReBoard reBoard) {
		rbd.update(reBoard);
	}

	public void delete(int r_num) {
		rbd.delete(r_num);
	}

	public int select_r_count(int b_num) {
		return rbd.select_r_count(b_num);
	}
}
