package com.ch.ch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.MemberDao;
import com.ch.ch.model.Member;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao md;
	public Member select(String member_id) {
		return md.select(member_id);
	}
	public int insert(Member member) {
		return md.insert(member);
	} 
}
