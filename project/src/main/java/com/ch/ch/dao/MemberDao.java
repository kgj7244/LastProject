package com.ch.ch.dao;

import java.util.List;

import com.ch.ch.model.Member;
import com.ch.ch.model.Movie;
import com.ch.ch.model.MovieTheater;
import com.ch.ch.model.Theater;
import com.ch.ch.model.Ticket;

public interface MemberDao {

	Member select(String member_id);

	int insert(Member member);

	int update(Member member);

	int delete(String member_id);

	int getTotal(Member member);

	List<Member> list(Member member);

}
