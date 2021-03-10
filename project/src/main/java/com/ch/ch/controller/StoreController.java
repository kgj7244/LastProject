package com.ch.ch.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch.model.Store;
import com.ch.ch.model.Ord;
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
	public String storeInsert(Store store,Model model,HttpSession session)throws IOException  {
		
		if(!store.getFile().isEmpty()) {
			String s_Pimage = store.getFile().getOriginalFilename();
			
			String real = session.getServletContext().getRealPath("/resources/images/s_pop");
			String path = real + "/" + s_Pimage; 
			
			
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(store.getFile().getBytes());
			fos.close();
			
			store.setS_Pimage(s_Pimage);
	
		} 
		int result = ss.insert(store);

		model.addAttribute("result", result);
		return "/store/storeInsert";	
		} 

	//스토어 수정
	@RequestMapping("storeUploadForm")
	public String storeUploadForm(Model model,int s_num) {
		
		Store store=ss.select(s_num);	
		List<Store> storeList = ss.list();
	
		model.addAttribute("store",store);
		model.addAttribute("storeList",storeList);
		return "/store/storeUploadForm";	
	}
	
	@RequestMapping("storeUpload")
	public String storeUpload(Store store,Model model,HttpSession session) throws IOException {
	
		String s_Pimage = store.getFile().getOriginalFilename();
		
		if (s_Pimage != null && !s_Pimage.equals("")) {			
			store.setS_Pimage(s_Pimage);
			
			String real = session.getServletContext()
				.getRealPath("/resources/images/s_pop");
			
	FileOutputStream fos = new FileOutputStream(
								new File(real+"/"+s_Pimage));
			
			fos.write(store.getFile().getBytes());
			fos.close();
			
			store.setS_Pimage(s_Pimage);
		}
		int result = ss.update(store);
		model.addAttribute("result",result);
		return "/store/storeUpload";	
	}
	//삭제
	@RequestMapping("storeDelete")
	public String storeDelete(int s_num,Model model) {
		int result = ss.delete(s_num);
		model.addAttribute("result",result);	
		return "/store/storeDelete";	
	}
	
	//카테고리별 리스트
	@RequestMapping("i_snack")
	public String i_snack(int s_Pclass, Model model){	
		List<Store> storeList = ss.pclist(s_Pclass);
		model.addAttribute("s_Pclass", s_Pclass);
		model.addAttribute("storeList", storeList);		
		return "store/i_snack";
	}
	
//====================================================
	
	
 //상품 상세
	@RequestMapping("storeContent")
	public String storeContent(int s_num,Model model){
		Store store = ss.select(s_num);
		model.addAttribute("store", store);	
		
					
		return "store/storeContent";
	}
//	//상품 상세
//	@RequestMapping("storeContent")
//	public String storeContent(int s_num,Model model,String s_purchase){
//		Store store = ss.select(s_num);
//		int s_purchase1=0;
//		
//		List<Store> list = ss.list();
//		int total = 0;
//		for(Store store1:list) {
//			total+=store1.getS_prive()*s_purchase1;
//		}
//		
//		model.addAttribute("store", store);				
//		model.addAttribute("total", total);				
//		return "store/storeContent";
//	}
	
	//주문페이지로
	@RequestMapping("orderList")
	public String orderList( int s_num,Model model,int s_purchase,HttpSession session)throws IOException {
		String member_id = (String)session.getAttribute("member_id");
		
		Store store = ss.select(s_num);
	
//		int result=0;
//		Ord ord = new Ord();
//		ord.setS_num(s_num);
//		ord.setS_purchase(s_purchase);
//		
//		result=ss.insertOrd(ord);
//	
//	
//		model.addAttribute("result", result);	
		
		model.addAttribute("store", store);	
		
	

		return "store/orderList";
	}
	
	
	//주문페이지로 
//	@RequestMapping("orderList")
//	public String orderList(int s_num,Model model,int s_purchase) {
//		Store store = ss.select(s_num);
//		List<Ord> ordlist = ss.ordlist(s_num);	
//		
//		int result=0;
//		
//		
//		store.setS_num(s_num);		
//		
//		
//		model.addAttribute("store", store);	
//		model.addAttribute("ordlist", ordlist);	
//		
//		return "store/orderList";
//	}
	
	
	
	//결제 진행
	@RequestMapping("order")
	public String order(int s_num, Model model,int s_purchase,HttpSession session) {
		
		Store store = ss.select(s_num);
		model.addAttribute("store", store);	
		
		
				
		
		return "store/order";
	}
	
	//주문
//	@RequestMapping("order")
//	public String order(Model model,HttpSession session)throws IOException  {
//	String member_id = (String)session.getAttribute("member_id"); 
	
	
//		ord = ss.insertOrd(member_id,s_num)
//		
//		int result = ss.insertOrd(ord);
//		
//		model.addAttribute("ord", ord);	
//		model.addAttribute("result", result);
//		return "store/order";
//	}
	
	//구매 리스트에 추가
//	@RequestMapping("memberStoreInsert")
//	public String o(Model model,String full_price) {
//		Store store = ss.select(s_num);
//			
//		
//		model.addAttribute("store", store);	
//		model.addAttribute("store", store);	
//		
//		
//		model.addAttribute("store", store);	
//		model.addAttribute("s_purchase", s_purchase);	
//		model.addAttribute("full_price", full_price);	
//		
//		
//		model.addAttribute("ord", ord);	
//		return "store/OK";
//	}
	

	
	
	
	
	//구매 목록 넘겨주기만
	@RequestMapping("memberStore") 
	public String memberStore(Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		List<Ord> ord = ss.memberStore(member_id); 
		
		
		model.addAttribute("ord", ord);	
		return "/member/memberStore";
	}
	@RequestMapping("memberStoreInfo") 
	public String memberStoreInfo(int s_num, Model model) {
		
		
		Store store =ss.select(s_num);
		
		
		model.addAttribute("store", store);	
		
		return "/member/memberStoreInfo";
	}
	
	
//	@RequestMapping("memberStore") 
//	public String memberStore(int s_num,Model model, HttpSession session) {
//		String member_id = (String)session.getAttribute("member_id");
//		List<Ord> ord = ss.memberStore(member_id); 
//		
//		
//		Store store=ss.select(s_num);
//		List<Ord> ordlist = ss.ordlist(s_num); 
//	
//		model.addAttribute("store", store);		
//		model.addAttribute("ord", ord);	
//		model.addAttribute("ordlist", ordlist);	
//		return "/member/memberStore";
//	}
//	
		
	}

