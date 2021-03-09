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


	

}
