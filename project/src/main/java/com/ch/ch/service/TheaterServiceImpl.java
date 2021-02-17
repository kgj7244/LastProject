package com.ch.ch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.TheaterDao;

@Service
public class TheaterServiceImpl implements TheaterService{
	@Autowired
	private TheaterDao td;
	
}
