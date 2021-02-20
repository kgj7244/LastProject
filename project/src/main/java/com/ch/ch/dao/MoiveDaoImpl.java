package com.ch.ch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch.model.Movie;

@Repository
public class MoiveDaoImpl implements MoiveDao{
	@Autowired
	private SqlSessionTemplate sst;
	public List<Movie> select() { // 리스트 검색
		return sst.selectList("moivens.list");
	}
	public Movie selectMovie(int m_num) { // 영화 검색
		return sst.selectOne("moivens.selectMovie", m_num);
	}
}
