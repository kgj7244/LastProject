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

//======================================
	
	@RequestMapping("storeUploadForm")
	public String storeUploadForm(Model model, HttpSession session,int s_num) {
		
		Store store=ss.select(s_num);
		model.addAttribute("store",store);
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
	
 //상품 상세
	@RequestMapping("storeContent")
	public String storeContent(int s_num,  Model model){
		Store store = ss.select(s_num);
		model.addAttribute("store", store);				
		return "store/storeContent";
	}
	
	//주문페이지로
	@RequestMapping("orderList")
	public String order(int s_num,Model model) {
		
		Store store = ss.select(s_num);
		model.addAttribute("store", store);	
		return "store/orderList";
	}
	
	//장바구니 넣기
//	@RequestMapping("cartInsert")
//	public String cartInsert(Cart cart, int s_num,Model model,HttpSession session)throws IOException  {
//		if(!cart.getFile().isEmpty()) {
//			
//			String s_Pimage = cart.getFile().getOriginalFilename();
//			
//			String real = session.getServletContext().getRealPath("/resources/images/s_pop");
//			String path = real + "/" + s_Pimage; 
//			
//			
//			FileOutputStream fos = new FileOutputStream(path);
//			fos.write(cart.getFile().getBytes());
//			fos.close();
//			
//			cart.setS_Pimage(s_Pimage);
//	
//		} 
//		int result = ss.insert(cart);
//		model.addAttribute("store", cart);				
//		return "store/cartInsert";
//	}
	//장바구니 목록
	@RequestMapping("cartList")
	public String cartList(Model model, int cart_num) {
//        List<Store> cartList = ss.list(cart_num);
//		model.addAttribute("cartList", cartList);			
		return "store/cartList";
	}
	
}
