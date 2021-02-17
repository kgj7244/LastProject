package com.ch.ch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.MoiveDao;

@Service
public class MoiveServiceImpl implements MoiveService{
	@Autowired
	private MoiveDao md;
}
