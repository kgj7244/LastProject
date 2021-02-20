package com.ch.ch.service;

import java.util.List;

import com.ch.ch.model.Moive;

public interface MoiveService {

	List<Moive> select();

	Moive selectMovie(int m_num);

}
