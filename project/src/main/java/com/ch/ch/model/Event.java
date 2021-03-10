package com.ch.ch.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Event {
	private int e_num; //이벤트번호
	private String e_title; //이벤트제목
	private String e_state; // 이벤트종류(1: 쿠폰, 2: 상품권)
	private int e_sale; //할인금액
	private String e_poster;// 포스터 사진
	private String e_del; // 삭제 여부		
	
	private MultipartFile file; //이미지 파일

}
