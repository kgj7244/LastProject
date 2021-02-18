--삭제 시퀀스 (테이블 삭제전에 꼭 먼저 삭제해주세요)
drop sequence t_ordernum; 
drop sequence m_num; 
drop sequence t_num; 
drop sequence s_num; 
drop sequence re_num; 

-----------------------------------삭제 테이블 (순서대로 삭제해주세요.)

drop table ticket CASCADE CONSTRAINTS;
drop table review CASCADE CONSTRAINTS; 
drop table movie CASCADE CONSTRAINTS; 
drop table bank; 
drop table member CASCADE CONSTRAINTS; 
drop table master;  
drop table theater CASCADE CONSTRAINTS; 
drop table board CASCADE CONSTRAINTS; 
drop table store CASCADE CONSTRAINTS;


--------------------------------------관리자

create table master (
	master_id varchar2(50) primary key not null,
	master_password varchar2(50) not null
);
	
insert into master values ('master','1234');

--------------------------------------회원

create table member(
	member_id varchar2(50) primary key not null , --아이디
	member_password varchar2(50) not null, 		  -- 비번
	member_name varchar2(50) not null, 			  -- 이름 
	member_gender varchar2(50) not null, 		  -- 성별
	member_birth date not null,       			  -- 생년월일 관람등급
	member_email varchar2(50) not null,           -- 이메일
	member_number varchar2(50) not null,          -- 휴대전화
	member_addr varchar2(200) not null, 		  -- 주소
	member_date date default sysdate not null,    -- 가입일
	member_del char(1) default 'n'			      -- 탈퇴여부			
);
select * from member;

--------------------------------------영화

create table movie (
	m_num number primary key not null, 	--영화번호
	m_title varchar2(50) not null,		--제목
	m_content varchar2(1000) not null,	--줄거리
	m_rank varchar2(50) not null,		--관람등급	
	m_opendate date not null,			--개봉일
	m_state varchar2(50) not null,      --상태(상영 중, 상영 예정)
	m_time varchar2(50) not null,		--상영시간
	m_grade number not null,			--평균 평점
	m_poster varchar2(100) not null,   	--포스터
	m_director varchar2(50) not null,	--감독
	m_actor varchar2(100) not null,		--배우
	m_genre  varchar2(50) not null,		--장르
	m_del char(1) default 'n'	        --삭제여부 		
);
create sequence m_num increment by 1 start with 1;
insert into movie values(1, '해리포터','아프라카타브라','15','2011-11-11','상영','120','0','xxx.jsp','김희주','해리','마법','n');
insert into movie values(2, '해리포터','아프라카타브라','19','2011-11-11','상영','120','0','xxx.jsp','김희주','해리','마법','n');
insert into movie values(3, '해리포터','아프라카타브라','15','2011-11-11','상영','120','0','xxx.jsp','김희주','해리','마법','n');
insert into movie values(4, '트랜스포머','아프라카타브라','15','2011-11-11','상영','120','0','xxx.jsp','김희주','해리','마법','n');
insert into movie values(5, '어벤져스','아프라카타브라','15','2011-11-11','상영','120','0','xxx.jsp','김희주','해리','마법','n');
insert into movie values(6, '해리포터','아프라카타브라','15','2011-11-11','상영','120','0','xxx.jsp','김희주','해리','마법','n'); 

--------------------------------------극장

create table theater(
	t_num number primary key not null,  --극장번호
	t_title varchar2(50) not null,      --이름
	t_loc varchar2(100) not null,       --위치(주소)
	t_info varchar2(1000) not null,     --시설 정보
	t_gui varchar2(1000) not null      --시설 안내
);
create sequence t_num increment by 1 start with 1;

--------------------------------------회원 게시판
create table board(
	b_num number primary key not null, --게시글 번호
	member_id varchar2(50) references member(member_id) not null, --아이디
	b_email varchar2(50) not null,     --이메일
	b_title varchar2(50) not null, 	   --제목
	b_content varchar2(1000) not null, --내용
	b_password varchar2(50) not null,  --비밀번호	
	b_view number not null, 		   --조회수
	b_ip varchar2(50) not null, 	   --아이피	
	b_ref number not null, 			   --참조번호
	b_level number not null, 		   --참조레벨	
	b_date date default sysdate not null,--작성일	
	b_ans char(1) default 'n', 		   --답변여부
	b_del char(1) default 'n'		   --삭제여부
);


--------------------------------------계좌
create table bank(
	t_account varchar2(50) primary key not null, --계좌번호
	t_ordername varchar2(50) REFERENCES member(member_id) not null,  --주문자
	t_price number not null,              		 --금액
	t_deal varchar2(50) not null        		 --거래방법
);

--------------------------------------스토어
create table store(
	s_num number primary key not null,  --스토어 게시글 번호
	s_title varchar2(50) not null, 		-- 제목
	s_del char(1) default 'n', 			--게시글 삭제여부
	s_Pclass varchar2(100) not null, 	--상품 분류(관람권,스낵)
	s_Pname varchar2(50) not null, 		--상품 이름
	s_Pconfig varchar2(50) not null, 	--상품 구성
	s_Pimage varchar2(100) not null, 	--상품 이미지
	
	s_per date not null, 		--판매기간
	s_validity date not null, 	--유효기간
	s_total number not null, 	--총 판매수량
	s_purchase number not null, --구매수량
	s_prive number not null,	--금액
	s_sale number not null,		--할인율
	del char(1) default 'n'	--구매 취소 여부
);

create sequence s_num increment by 1 start with 1;


--------------------------------------한줄평
create table review (
	re_num number primary key not null, --번호
	re_con varchar2(500) not null,		--한줄평 내용
	re_grade number not null,			--한줄평 평점
	re_date date not null, 				--업로드 시간
	member_id varchar2(50) references member(member_id) not null, --회원아이디
	m_num number references movie(m_num) --영화번호
);

create sequence re_num increment by 1 start with 1;


--------------------------------------예매
create table ticket(
	t_ordernum number primary key not null, --주문번호
	m_num number references movie(m_num),	--영화번호
	t_account varchar2(50) references bank(t_account),   --계좌번호
	member_id varchar2(50) references member(member_id), --회원 아이디

	t_adult number not null,     -- 성인 예매수
	t_teen number not null,      -- 청소년 예매수
	t_sale number not null, 	 --할인
	m_title varchar2(50) not null, --영화제목
	t_date date default sysdate not null, -- 날짜	
	
	t_num number references theater(t_num),  --극장번호
	t_seat varchar2(30) not null,	--좌석번호
	t_time varchar2(50) not null,	--시간
	t_addr varchar2(50) not null	--지역
);

create sequence t_ordernum increment by 1 start with 1;
