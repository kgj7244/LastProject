package com.ch.ch.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ch.ch.model.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<Review> list(int m_num) {
		return sst.selectList("rvns.list", m_num);
	}
	
	public void insert(Review rv) {
		sst.insert("rvns.insert", rv);
	}
}
