package com.ch.ch.dao;

import java.util.List;

import com.ch.ch.model.Notice;

public interface NoticeDao {

	int getNtotal(Notice notice);

	List<Notice> list(Notice notice);

	Notice select(int n_num);

	int insert(Notice notice);

	int update(Notice notice);

	int delete(int n_num);


}
