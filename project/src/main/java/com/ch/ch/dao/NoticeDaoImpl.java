package com.ch.ch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch.model.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	private SqlSessionTemplate sst;

	public int getNtotal(Notice notice) {
		return sst.selectOne("noticens.getNtotal", notice);
	}
	
	public List<Notice> list(Notice notice) {
		return sst.selectList("noticens.list", notice);
	}

	public Notice select(int n_num) {
		return sst.selectOne("noticens.select", n_num);
	}

	public int insert(Notice notice) {
		return sst.insert("noticens.insert", notice);
	}

	public int update(Notice notice) {
		return sst.update("noticens.update", notice);
	}

	public int delete(int n_num) {
		return sst.update("noticens.delete", n_num);
	}

}
