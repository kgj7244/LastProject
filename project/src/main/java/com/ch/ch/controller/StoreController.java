package com.ch.ch.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.ch.model.Bank;
import com.ch.ch.model.Member;
import com.ch.ch.model.Ord;
import com.ch.ch.model.Store;
import com.ch.ch.service.BankService;
import com.ch.ch.service.MemberService;
import com.ch.ch.service.StoreService;


@Controller
public class StoreController {
	@Autowired
	private StoreService ss;
	@Autowired
	private MemberService ms; //회원
	@Autowired
	private BankService bdo; //은행
	
	
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
	System.out.println("1");
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
	
	//복구
		@RequestMapping("storeRestore")
		public String storeRestore(int s_num,Model model) {
			int result = ss.resurrection(s_num);
			model.addAttribute("result",result);	
			return "/store/storeRestore";	
		}
	
	//카테고리별 리스트
	@RequestMapping("i_snack")
	public String i_snack(int s_Pclass, Model model){	
		List<Store> storeList = ss.pclist(s_Pclass);
		model.addAttribute("s_Pclass", s_Pclass);
		model.addAttribute("storeList", storeList);		
		return "store/i_snack";
	}
	
	//관리자 스토어 목록
	@RequestMapping("master_Storelist")
	public String master_Storelist(Store store,Model model) {
		

        List<Store> storeList = ss.list();
		model.addAttribute("storeList", storeList);	
		return "/store/master_Storelist";	
	}
	
	
	
//====================================================

	
 //상품 상세
	@RequestMapping("storeContent")
	public String storeContent(int s_num,Model model){
		Store store = ss.select(s_num);
		model.addAttribute("store", store);	
		
					
		return "store/storeContent";
	}
	
	//주문페이지로
	@RequestMapping("orderList")
	public String orderList(Ord ord,Model model,HttpSession session)throws IOException {
		String member_id = (String)session.getAttribute("member_id");
		
		Member member = ms.select(member_id);	
		Store store = ss.select(ord.getS_num());
		
		Date date = new Date(System.currentTimeMillis());
		Date date1 = new Date(System.currentTimeMillis());
		date1.setYear(date.getYear()+1);
		
		ord.setBuy_date(date);
		ord.setS_validity(date1);
		
		ord.setFull_price((store.getS_prive() *ord.getS_purchase())-(store.getS_prive() *ord.getS_purchase())*store.getS_sale()/100);
		
		
		model.addAttribute("ord", ord);		
		model.addAttribute("store", store);	
		model.addAttribute("member", member);	
		
		
		
		return "store/orderList";
	}
	
	//결제 진행 
		@RequestMapping("order")
		public String order(int s_num,Bank bank,Ord ord,Model model,HttpSession session)throws IOException {	
			String member_id = (String)session.getAttribute("member_id");
			Member member = ms.select(member_id);
			
			int result = 0;			
			
			Store store = ss.select(ord.getS_num());		
			Date date = new Date(System.currentTimeMillis());
			Date date1 = new Date(System.currentTimeMillis());
			Date date2 = new Date(System.currentTimeMillis());
			date1.setYear(date.getYear()+1);
			
			ord.setBuy_date(date);
			ord.setS_validity(date1);		
			bank.setT_date(date2);
			ord.setMember_id(member_id);
			bank.setMember_id(member_id);
			
			
			ord.setFull_price((store.getS_prive() *ord.getS_purchase())-(store.getS_prive() *ord.getS_purchase())*store.getS_sale()/100);
			bank.setT_price(store.getS_prive() *ord.getS_purchase());
			
		
			result = ss.insertOrd(ord); // result
			int ord2_num = ss.maxOrd_num();//최신번호찾기
			bank.setOrd_num(ord2_num); // 뱅크에 넣음
			
			result = bdo.insert_bank(bank); // result 
			
			store.setS_total(store.getS_total()-ord.getS_purchase());
			ss.update_total(store);
			
			model.addAttribute("result", result);
			model.addAttribute("ord", ord);
			model.addAttribute("member", member);	
			model.addAttribute("bank", bank);	
			model.addAttribute("store", store);	
			
			return "store/order";
		}
//		//결제 진행 
//		@RequestMapping("order")
//		public String order(Bank bank,Ord ord,Model model,HttpSession session)throws IOException {	
//			String member_id = (String)session.getAttribute("member_id");
//			Member member = ms.select(member_id);
//			
//			int result = 0;			
//			
//			Store store = ss.select(ord.getS_num());		
//			Date date = new Date(System.currentTimeMillis());
//			Date date1 = new Date(System.currentTimeMillis());
//			Date date2 = new Date(System.currentTimeMillis());
//			date1.setYear(date.getYear()+1);
//			
//			ord.setBuy_date(date);
//			ord.setS_validity(date1);		
//			bank.setT_date(date2);
//			ord.setMember_id(member_id);
//			bank.setMember_id(member_id);
//			
//			
//			ord.setFull_price(store.getS_prive() *ord.getS_purchase());
//			bank.setT_price(store.getS_prive() *ord.getS_purchase());
//			
//			
//			result = ss.insertOrd(ord);
//			int ord2_num = ss.maxOrd_num();
//			bank.setOrd_num(ord2_num);
//			result = bdo.insert_bank(bank);
//			
//			
//			
//			model.addAttribute("result", result);
//			model.addAttribute("ord", ord);
//			model.addAttribute("member", member);	
//			model.addAttribute("bank", bank);	
//			
//			return "store/order";
//		}
	
	//구매 목록
	@RequestMapping("memberStore") 
	public String memberStore(Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		
		List<Ord> ord = ss.memberStore(member_id);
		
		model.addAttribute("ord", ord);			
		return "/member/memberStore";
	}
	//구매 상품 상세
	@RequestMapping("memberStoreInfo") 
	public String memberStoreInfo(Bank bank,Ord ord,Model model,HttpSession session)throws IOException {
		String member_id = (String)session.getAttribute("member_id");
		
	
		Store store = ss.select(ord.getS_num());
		ord = ss.select_ord(ord.getOrd_num());
		
		bank=bdo.select_bank(ord.getOrd_num());
		
		Member member = ms.select(member_id);	
	
		
//		System.out.println(ord.getOrd_num());
//		System.out.println(ord.getMember_id());			
//		System.out.println("들어갑시다");	
	
		
		model.addAttribute("ord", ord);
		model.addAttribute("store", store);
		model.addAttribute("member", member);	
		model.addAttribute("bank", bank);	
		
		return "/member/memberStoreInfo";
	}
	
	@RequestMapping("orderResult")
	public String orderResult(int ord_num,Model model) {
	
		Ord ord= ss.select_ord(ord_num);
		
		model.addAttribute("ord", ord);	
	return "store/orderResult";
	}

				
	
	//환불
	@RequestMapping("memberStoreRefund") 
	public String memberStoreRefund(Model model,int ord_num, HttpSession session) {
		int result = 0;
		result = ss.update_refund(ord_num);
		model.addAttribute("result", result);	
			
		return "/member/memberStoreRefund";
	}
	

	
		
	}

