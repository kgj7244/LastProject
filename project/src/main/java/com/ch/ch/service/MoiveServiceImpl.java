package com.ch.ch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.MoiveDao;
import com.ch.ch.model.Moive;

@Service
public class MoiveServiceImpl implements MoiveService{
	@Autowired
	private MoiveDao md;
	public List<Moive> select() {
		return md.select();
	}
	public Moive selectMovie(int m_num) {
		return md.selectMovie(m_num);
	}
}
