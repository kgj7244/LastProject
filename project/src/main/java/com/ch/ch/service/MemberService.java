package com.ch.ch.service;

import com.ch.ch.model.Member;

public interface MemberService {

	Member select(String member_id);

	int insert(Member member);

}
