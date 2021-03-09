package com.ch.ch.model;
import java.sql.Date;
import lombok.Data;
@Data
public class ReBoard {
	private int r_num;          // 댓글 번호, 자동 1씩 증가
	private int b_num;          // 원 게시글 번호
	private String member_id;   // 답글 작성자
	private String r_text; 		// 답글
	private Date r_date;     	// 작성일
	private String r_del;       // 삭제 여부
}