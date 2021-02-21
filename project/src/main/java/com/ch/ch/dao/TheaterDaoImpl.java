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

}
