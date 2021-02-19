package com.ch.ch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch.model.Movie;

@Repository
public class MovieDaoImpl implements MovieDao{
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<Movie> list() {
		return sst.selectList("moviens.list");
	}
	
	public Movie select(int m_num) {
		return sst.selectOne("moviens.select", m_num);
	}
	
	public int insert(Movie movie) {
		return sst.insert("moviesns.insert", movie);
	}
}
