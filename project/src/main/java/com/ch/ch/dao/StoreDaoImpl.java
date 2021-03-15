package com.ch.ch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.ch.model.Ord;
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
		return sst.update("storens.delete",s_num);
	}



	
	public List<Store> pclist(int s_Pclass) {
		return sst.selectList("storens.pclist",s_Pclass);
	}



	public List<Ord> ordlist(int s_num) {
		return sst.selectList("ordns.ordlist",s_num);
	}



	
	public List<Ord> memberStore(String member_id) {
		return sst.selectList("ordns.memberStore",member_id);
	}



	public int insertOrd(Ord ord) {
		return sst.insert("ordns.insertOrd",ord);
	}



	
	public Ord select_ord(int ord_num) {
		return sst.selectOne("ordns.select_ord",ord_num);
	}



	
	public int update_refund(int ord_num) {
		return sst.update("ordns.update_refund",ord_num);
	}



	
	public int maxOrd_num() {
		return sst.selectOne("ordns.maxOrd_num");
	}



	
	public int resurrection(int s_num) {
		return sst.update("storens.resurrection",s_num);
	}



	
	public int counts(int s_num) {
		return sst.update("storens.counts",s_num);
	}


	
}
