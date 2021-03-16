package com.ch.ch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.ch.dao.StoreDao;
import com.ch.ch.model.Ord;
import com.ch.ch.model.Store;

@Service
public class StoreServiceImpl implements StoreService{
	@Autowired
	private StoreDao sd;

	
	public List<Store> list() {		
		return sd.list();
	}


	public Store select(int s_num) {
		return sd.select(s_num);
	}


	public int insert(Store store) {
		return sd.insert(store);
	}


	
	public int update(Store store) {
		return sd.update(store);
	}


	
	public int delete(int s_num) {
		return sd.delete(s_num);
	}


	
	public List<Store> pclist(int s_Pclass) {
		return sd.pclist(s_Pclass);
	}


	public List<Ord> ordlist(int s_num) {
		return sd.ordlist(s_num);
	}


	
	public List<Ord> memberStore(String member_id) {
		return sd.memberStore(member_id);
		
	}


	public int insertOrd(Ord ord) {
		return sd.insertOrd(ord);
	}


	
	public Ord select_ord(int ord_num) {
		return sd.select_ord(ord_num);
	}


	
	public int update_refund(int ord_num) {
		return sd.update_refund(ord_num);
	}


	
	public int maxOrd_num() {
		return sd.maxOrd_num();
	}


	public int resurrection(int s_num) {
		return sd.resurrection(s_num);
	}


	
	public int counts(int s_num) {
		return sd.counts(s_num);
	}


	}


	

