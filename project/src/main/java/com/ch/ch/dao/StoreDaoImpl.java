package com.ch.ch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch.model.Store;

@Repository
public class StoreDaoImpl implements StoreDao{
	@Autowired
	private SqlSessionTemplate sst;

	
	public List<Store> list() {	
		return sst.selectList("storens.list");
	}


	
	public Store select(int s_num) {
		return sst.selectOne("storens.select",s_num);
	}



	
	public int insert(Store store) {
		return sst.insert("storens.insert",store);	
	}


	
	public int update(Store store) {
		return sst.update("storens.update",store);
	}


	
	public int delete(int s_num) {
		return sst.delete("storens.delete",s_num);
	}
}
