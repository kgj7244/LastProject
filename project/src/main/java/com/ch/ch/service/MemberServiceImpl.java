package com.ch.ch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao md; 
}
