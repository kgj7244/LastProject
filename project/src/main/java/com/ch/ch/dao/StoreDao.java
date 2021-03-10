package com.ch.ch.dao;

import java.util.List;

import com.ch.ch.model.Ord;
import com.ch.ch.model.Store;

public interface StoreDao {

	List<Store> list();

	Store select(int s_num);

	int insert(Store store);

	int update(Store store);

	int delete(int s_num);

	List<Store> pclist(int s_Pclass);

	
	List<Ord> ordlist(int s_num);

	List<Ord> memberStore(String member_id);

	int insertOrd(Ord ord);



}
