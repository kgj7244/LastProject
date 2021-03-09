package com.ch.ch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.NoticeDao;

@Service
public class NoticeServiceImple implements NoticeService {
	@Autowired
	private NoticeDao nd;
}
