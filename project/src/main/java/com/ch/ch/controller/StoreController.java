package com.ch.ch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch.model.Store;
import com.ch.ch.service.StoreService;


@Controller
public class StoreController {
	@Autowired
	private StoreService ss;
	
	
	//스토어 메인
	@RequestMapping("storeMainForm")
	public String storeMainForm(Model model) {
		
        List<Store> storeList = ss.list();
		model.addAttribute("storeList", storeList);		
		
		return "store/storeMainForm";
	}
	
	//스토어 추가
	@RequestMapping("storeInsertForm")
	public String storeInsertForm(Model model) {
	return "/store/storeInsertForm";
	}
	
	@RequestMapping("storeInsert")  
	public String storeInsert(Store store,Model model) {
		Store st=ss.select(store.getS_num());
		int result=0;
		if(st == null)result =ss.insert(store);
		else result = -1;
		model.addAttribute("result",result);
		return "/store/storeInsert";	
	}
	
	//======================================
	
	@RequestMapping("storeUploadForm")
	public String storeUploadForm(int s_num,Model model) {
		Store store=ss.select(s_num);
		model.addAttribute("store",store);
		return "/store/storeUploadForm";	
	}
	
	@RequestMapping("storeUpload")
	public String storeUpload(Store store,Model model) {
		int result = ss.update(store);		
		model.addAttribute("result",result);
		return "/store/storeUpload";	
	}
	
	@RequestMapping("storeDelete")
	public String storeDelete(int s_num,Model model) {
		int result = ss.delete(s_num);
		model.addAttribute("result",result);	
		return "/store/storeDelete";	
	}
	
//	@RequestMapping("i_snack")
//	public String i_snack(Model model){		
//        List<Store> storeList = ss.list();
//		model.addAttribute("storeList", storeList);				
//		return "store/i_snack";
//	}
	
}
