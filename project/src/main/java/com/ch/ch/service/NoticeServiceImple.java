package com.ch.ch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.NoticeDao;
import com.ch.ch.model.Notice;

@Service
public class NoticeServiceImple implements NoticeService {
	@Autowired
	private NoticeDao nd;

	public int getNtotal(Notice notice) {
		return nd.getNtotal(notice);
	}

	public List<Notice> list(Notice notice) {
		return nd.list(notice);
	}

	public Notice select(int n_num) {
		return nd.select(n_num);
	}

	public int insert(Notice notice) {
		return nd.insert(notice);
	}

	public int update(Notice notice) {
		return nd.update(notice);
	}

	public int delete(int n_num) {
		return nd.delete(n_num);
	}
}
