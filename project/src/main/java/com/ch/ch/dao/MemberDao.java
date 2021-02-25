package com.ch.ch.dao;

import com.ch.ch.model.Member;

public interface MemberDao {

	Member select(String member_id);

	int insert(Member member);

	int update(Member member);

	int delete(String member_id);

}
