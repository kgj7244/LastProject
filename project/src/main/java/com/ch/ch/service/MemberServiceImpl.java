package com.ch.ch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.MemberDao;
import com.ch.ch.model.Member;
import com.ch.ch.model.Movie;
import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Theater;
import com.ch.ch.model.Ticket;

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
	public int update(Member member) {
		return md.update(member);
	}
	@Override
	public int delete(String member_id) {
		return md.delete(member_id);
	}
	public int getTotal(Member member) {
		return md.getTotal(member);
	}
	public List<Member> list(Member member) {
		return md.list(member);
	} 
}
