package com.ch.ch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.StoreDao;

@Service
public class StoreServiceImpl implements StoreService{
	@Autowired
	private StoreDao sd;
}
