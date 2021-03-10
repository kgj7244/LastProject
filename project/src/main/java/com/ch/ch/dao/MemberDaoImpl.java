package com.ch.ch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch.model.Member;

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
	public int getTotal(Member member) {
		return sst.selectOne("memberns.getTotal", member);
	}
	public List<Member> list(Member member) {
		return sst.selectList("memberns.list", member);
	}
}
