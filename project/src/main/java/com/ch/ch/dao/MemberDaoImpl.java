package com.ch.ch.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch.model.Member;
import com.ch.ch.model.Movie;
import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Theater;
import com.ch.ch.model.Ticket;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate sst;
	public Member select(String member_id) {
		return sst.selectOne("memberns.select",member_id);
	}
	public int insert(Member member) {
		return sst.insert("memberns.insert", member);
	}
	public int update(Member member) {
		return sst.update("memberns.update", member);
	}
	@Override
	public int delete(String member_id) {
		return sst.update("memberns.delete", member_id);
	}
}
