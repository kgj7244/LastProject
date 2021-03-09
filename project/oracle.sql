<<<<<<< HEAD
=======
<<<<<<< HEAD
--삭제 시퀀스 (테이블 삭제전에 꼭 먼저 삭제해주세요)
drop sequence theater_t_num_seq; 
=======
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git
--삭제 시퀀스 (테이블 삭제전에 꼭 먼저 삭제해주세요)
<<<<<<< HEAD
drop sequence theater_t_num_seq; 
=======
<<<<<<< HEAD
drop sequence theater_t_num_seq; 
=======
=======
drop sequence theater_t_num_seq; 
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git
drop sequence st_num; 
drop sequence re_num; 
drop sequence s_num; 
drop sequence t_ordernum; 
drop sequence sc_num; 
drop sequence mt_num;
drop sequence sv_num;
drop sequence t_account;
drop sequence r_num;

-----------------------------------삭제 테이블 (순서대로 삭제해주세요.)

drop table service CASCADE CONSTRAINTS;
drop table store CASCADE CONSTRAINTS;
drop table bank CASCADE CONSTRAINTS;
drop table aam_bank CASCADE CONSTRAINTS;
drop table seat CASCADE CONSTRAINTS;
drop table ticket CASCADE CONSTRAINTS;
drop table screen CASCADE CONSTRAINTS;
drop table board CASCADE CONSTRAINTS;
drop table review CASCADE CONSTRAINTS;
drop table stillcut CASCADE CONSTRAINTS;
drop table movie CASCADE CONSTRAINTS;
drop table movieTheater CASCADE CONSTRAINTS;
drop table theater CASCADE CONSTRAINTS;
drop table member CASCADE CONSTRAINTS;
drop table master CASCADE CONSTRAINTS;
drop table reBoard CASCADE CONSTRAINTS;



--------------------------------------관리자

create table master (
	master_id nvarchar2(50) primary key not null,
	master_password nvarchar2(50) not null
);
	
-- insert into master values ('master','1234');
--------------------------------------회원

create table member(
	member_id nvarchar2(50) primary key not null , --아이디
	member_password nvarchar2(50) not null, 		  -- 비번
	member_name nvarchar2(50) not null, 			  -- 이름 
	member_gender nvarchar2(50) not null, 		  -- 성별
	member_birth date not null,       			  -- 생년월일 관람등급
	member_email nvarchar2(50) not null,           -- 이메일
	member_number nvarchar2(50) not null,      -- 휴대전화 * 010
	member_addr nvarchar2(200) not null, 		  -- 주소
	member_date date default sysdate not null,    -- 가입일
	member_del char(1) default 'n'			      -- 탈퇴여부			
);
insert into member values('master','123456789','김희주','남성',sysdate,'lams1@daum.net','010-1111-1111','사울시',sysdate,'n');
insert into member values('lamslams','123456789','김희주','남성',sysdate,'lams1@daum.net','010-1111-1111','사울시',sysdate,'n');
insert into member values('lamslams2','123456789','김희주','남성',sysdate,'lams1@daum.net','010-1111-1111','사울시',sysdate,'n');
<<<<<<< HEAD
select * from member;

-------------------------------------- 이벤트(추가)
create table event(
	e_num nvarchar2(10) primary key,  -- 이벤트번호
	e_title nvarchar2(50) not null,            -- 이벤트제목
	e_state nvarchar2(50) not null,            -- 이벤트종류
	e_sale nvarchar2(50) not null,             -- 이벤트금액
	member_id nvarchar2(50) references member(member_id)        -- 회원아이디
);
=======
select * from member;

-------------------------------------- 이벤트(추가)
create table event(
	event_num nvarchar(10) primary key not null,  -- 이벤트번호
	event_title nvarchar(50) not null,            -- 이벤트제목
	event_state nvarchar(50) not null,            -- 이벤트종류
	event_sale nvarchar(50) not null,             -- 이벤트금액
	member_id references member(member_id)        -- 회원아이디
);
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git

create sequence event_num increment by 1 start with 1;

---------------------------------------이벤트 중복체크
create table event_over(
	member_id nvarchar2(50),
	e_num nvarchar2(10) references event(e_num)
);

--------------------------------------극장

create table theater(
	t_num number primary key not null,   --극장번호
	t_title nvarchar2(50) not null,      --이름
	t_loc nvarchar2(50) not null,        --지역
	t_addr nvarchar2(100) not null,     --주소(극장주소)
	t_number nvarchar2(50) not null,   --전화번호
	t_gui nvarchar2(1000) not null        --시설 안내
);
<<<<<<< HEAD


=======
<<<<<<< HEAD
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git
select * from theater;
<<<<<<< HEAD

=======
=======
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git

<<<<<<< HEAD
create sequence theater_t_num_seq increment by 1 start with 13;

=======
select * from theater;

create sequence theater_t_num_seq increment by 1 start with 13;
=======
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git
drop sequence theater_t_num_seq;
<<<<<<< HEAD
=======
<<<<<<< HEAD
create sequence theater_t_num_seq increment by 1 start with 13;


=======
create sequence theater_t_num_seq increment by 1 start with 13;
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git
insert into theater values(1, '신촌','서울','서울특별시 서대문구 신촌로 129 (창천동, 아트레온 2층)','1544-1122','주자요금 영화 관람시 3시간, 4000원입니다.');
insert into theater values(2, '강남','서울','서울특별시 강남구 강남대로 438 (역삼동, 스타플렉스)','1544-1122','건물 지하2F ~ 지하4F# 주차요금- CGV 영화 관람 시 주차 3시간 6,000원');
insert into theater values(3, '용산','서울','서울특별시 용산구 한강대로23길 55 현대아이파크몰 6층','1544-1122','주자요금- 영화 관람시 4시간, 5000원입니다.');
insert into theater values(4, '불광','서울','서울특별시 은평구 불광로 20 팜스퀘어 11층','1544-1122','건물에 음료 무료가능!');
insert into theater values(5, '대전','대전','주소가 5번이다','1544-1122','건물에 음료 무료가능!');
insert into theater values(6, '용인','대전','주소가 6번이다','1544-1122','건물에 음료 무료가능!');
insert into theater values(7, '수원','대전','주소가 7번이다','1544-1122','건물에 음료 무료가능!');
insert into theater values(8, '이천','대전','주소가 8번이다','1544-1122','건물에 음료 무료가능!');
insert into theater values(9, '쌍팔','광주','주소가 9번이다','1544-1122','건물에 음료 무료가능!');
insert into theater values(10, '용역','광주','주소가 10번이다','1544-1122','건물에 음료 무료가능!');
insert into theater values(11, '구리','광주','주소가 11번이다','1544-1122','건물에 음료 무료가능!');
insert into theater values(12, '미영','광주','주소가 12번이다','1544-1122','건물에 음료 무료가능!');

--삭제
delete from theater where t_num = 20;
--극장 지역 중복제거
select distinct t_loc from theater;
select * from theater;

-----------------------------------상영관

create table movieTheater(
	mt_num number primary key not null,     --상영관번호
	mt_name nvarchar2(50) not null,         --상영관이름
	mt_count number not null,               --좌석
	t_num number references theater(t_num)  --극장번호
);
create sequence mt_num increment by 1 start with 6;
insert into movieTheater values(1, '1관',50,1);
insert into movieTheater values(2, '2관',70,1);
insert into movieTheater values(3, '3관',80,1);
insert into movieTheater values(4, '4관',90,1);
insert into movieTheater values(5, '5관',100,1);

delete from movieTheater where mt_num=5;

select * from movieTheater;

--------------------------------------영화

create table movie (
	m_num number primary key not null, 	--영화번호
	m_title nvarchar2(50) not null,		--제목
	m_director nvarchar2(50) not null,	--감독
	m_actor nvarchar2(100) not null,	--출연진
	m_content nvarchar2(2000) not null,	--줄거리
	m_rank nvarchar2(50) not null,		--관람등급	
	m_opendate date not null,			--개봉일
	m_state nvarchar2(50) not null,     --상태(상영 중, 상영 예정)
	m_time number not null,		     	--상영시간
	m_genre  nvarchar2(50) not null,	--장르
	m_grade number(10,1) not null,		--평균 평점 
	m_poster nvarchar2(100) not null,  	--포스터
	m_stillcut nvarchar2(500) not null	--스틸컷
);

create table stillcut (
	st_num number primary key not null,		--스틸컷번호
	m_num number references movie(m_num),	--영화번호
	m_stillcut nvarchar2(500) not null		--스틸컷
);
create sequence st_num increment by 1 start with 1;

select * from movie;
select * from stillcut;

--------------------------------------한줄평

create table review (
	re_num number primary key not null,                            --리뷰번호
	re_con nvarchar2(500) not null,			                       --한줄평 내용
	re_grade number(10,1) not null,			                       --한줄평 평점 9.5 
	re_date date default sysdate not null,                         --업로드 시간
	re_update date default sysdate not null,					   --수정시간
	member_id nvarchar2(50) references member(member_id) not null, --회원아이디
	m_num number references movie(m_num)						   --영화번호
);
create sequence re_num increment by 1 start with 1;
insert into review values(1,'재미있습니다.',5,sysdate,sysdate,'lamslams',1);
insert into review values(2,'재미있습니다1111.',5,sysdate,sysdate,'lamslams',1);
insert into review values(3,'재미있습니다.22',5,sysdate,sysdate,'lamslams',1);
insert into review values(4,'재미있습니다22222.',5,sysdate,sysdate,'lamslams',1);

select* from review;
--------------------------------------회원 게시판

create table board(
	b_num number primary key not null,                              --게시글 번호
	b_title nvarchar2(100) not null, 	                            --제목
	b_content nvarchar2(1000) not null,                             --내용
	b_lock nvarchar2(50) not null,         		 					--비밀글여부
	b_password nvarchar2(50),                             			--비밀번호	
	b_readcount number not null, 	                                --조회수
	b_date date default sysdate not null,                           --작성일	
	b_del char(1) default 'n',		                    		    --삭제여부
 	b_code nvarchar2(40),                                           --카테고리(회원/예매/스토어/기타)
	member_id nvarchar2(50) references member(member_id) not null   --아이디
);
select * from board;

select * from board;

--------------------------------------회원 게시판 마스터전용 댓글

create table reBoard (
	r_num number primary key, 										-- 댓글 번호
	b_num number not null references board(b_num), 					-- 원 게시글 번호
	member_id nvarchar2(50) references member(member_id) not null, 	-- 댓글 작성자
    r_text varchar2(50) not null,    								-- 댓글
	r_date date not null,            								-- 작성일
	r_del char(1) default 'n'              							-- 삭제여부
);

create sequence r_num increment by 1 start with 1;
select * from reBoard;

-----------------------------------상영

create table screen(
	sc_num number primary key not null,            --상영번호
	sc_date date not null,                         --상영일
	sc_start nvarchar2(50) not null,               --시작시간
	sc_end nvarchar2(50) not null,                 --종료시간
	sc_del char(1) default 'n',                    --삭제여부
--	st_name nvarchar2(1000),                        --좌석이름
	t_num number references theater(t_num),        --극장번호
	mt_num number references movieTheater(mt_num), --상영관번호
	m_num number references movie(m_num)          --영화번호 
);
create sequence sc_num increment by 1 start with 1;

select * from screen;

-------------------------------------- 좌석

create table seat(
	st_num nvarchar2(10),                   --좌석번호 
	sc_num number references screen(sc_num) --상영번호
);




--------------------------------------예매

create table ticket(
	t_ordernum number primary key not null,           --예매번호
	t_adult number not null,                          --성인예매수
	t_teen number not null,                           --청소년예매수
	t_sale number not null, 	                      --사용포인트
	t_id nvarchar2(50) not null,                      --예매ID
	t_date date default sysdate not null,             --예매일
	t_state nvarchar2(50) not null,                   --좌석번호 (그대로 이름은 그대로 사용함)
	sc_num number references screen(sc_num) not null  --상영시간번호		
);
create sequence t_ordernum increment by 1 start with 1;


--------------------------------------관리자계좌

create table aam_bank(
	aam_account nvarchar2(50) primary key not null,     --계좌번호
	bank_name nvarchar2(50) not null,   				--은행이름
	aam_name nvarchar2(50) not null     				--이름
);
insert into aam_bank values('565-278311-02-001','우리은행','김희주');

--------------------------------------입금금액

create table bank(
	t_account nvarchar2(50) primary key not null,               --입금번호
	t_date date not null,                                       --입금일	
	t_price number not null,                                    --금액
	t_deal nvarchar2(50) not null,                              --거래방법
	member_id nvarchar2(50) references member(member_id),       --아이디
	aam_account nvarchar2(50) references aam_bank(aam_account), --관리자계좌
	t_ordernum number references ticket(t_ordernum)             --예매번호
);
create sequence t_account increment by 1 start with 1;

--------------------------------------스토어
select * from store;
drop table store CASCADE CONSTRAINTS;
drop sequence s_num; 

create table store(
	s_num number(10) primary key not null,  --스토어 게시글 번호
	s_del char(1) default 'n', 			--#게시글 삭제여부
	s_Pclass number(10) not null, 	--상품 분류(관람권,스낵)
	s_Pname varchar2(50) not null, 		--상품 이름
	s_Pconfig varchar2(50) not null, 	--상품 구성
	s_Pimage varchar2(100) not null, 	--상품 이미지	
	s_purchase number(10) default 0 not null, --#구매수량 
	s_prive number(10) not null,	--가격
	del char(1) default 'n',		--#환불 여부
	
	s_per date, 			--판매기간  시작
	s_pernd date, 			--판매기간   끝 
	s_total number(10), 	--총 판매수량 
	s_sale number(10)		--#할인율 
);	

create sequence s_num increment by 1 start with 15; 
--#
insert into store values(1,'n','3','콜라 M','콜라 M','콜라M.jpg',0,2500,'n','1111-03-02','9999-12-02',99999,0);
insert into store values(2,'n','3','콜라 L','콜라 L','콜라L.jpg',0,3000,'n','1111-03-02','9999-12-02',99999,0);
insert into store values(3,'n','3','사이다 M','사이다 M','사이다M.jpg',0,2500,'n','1111-03-02','9999-12-02',99999,0);
insert into store values(4,'n','3','사이다 L','사이다 L','사이다L.jpg',0,3000,'n','1111-03-02','9999-12-02',99999,0);
insert into store values(5,'n','3','오리지널팝콘 M','오리지널팝콘 M','오리지널팝콘M.jpg',0,4500,'n','1111-03-02','9999-12-02',99999,0);
insert into store values(6,'n','3','오리지널팝콘 L','오리지널팝콘 L','오리지널팝콘L.jpg',0,5000,'n','1111-03-02','9999-12-02',99999,0);
insert into store values(7,'n','3','카라멜팝콘 M','카라멜팝콘 M','카라멜팝콘M.jpg',0,5500,'n','1111-03-02','9999-12-02',99999,0);
insert into store values(8,'n','3','카라멜팝콘 L','카라멜팝콘 L','카라멜팝콘L.jpg',0,6000,'n','1111-03-02','9999-12-02',99999,0);
insert into store values(9,'n','3','반반팝콘(오리지널카라멜) L','반반팝콘(오리지널+카라멜) L','반반팝콘(오리지널카라멜)L.jpg',0,6000,'n','1111-03-02','9999-12-02',99999,0);
insert into store values(10,'n','2','스위트 콤보','오리지널L+탄산음료 M2','스위트콤보.jpg',0,9000,'n','1111-03-02','9999-12-02',99999,0);
insert into store values(11,'n','2','반반콤보','반반팝콘L+탄산음료 M2','반반콤보.jpg',0,9500,'n','1111-03-02','9999-12-02',99999,0);
insert into store values(12,'n','2','더블콤보','카라멜팝콘M+오리지널M+탄산음료 M2','더블콤보.jpg',0,13000,'n','1111-03-02','9999-12-02',99999,0);

insert into store values(13,'n','1','일반 관람권','일반 관람권 1매','일반관람권.jpg',0,11000,'n','1111-03-02','9999-12-02',99999,0);
insert into store values(14,'n','4','전용 관람권','전용 관람권 1매','전용관람권.jpg',0,13000,'n','2021-03-02','2021-04-02',100,0);


------------------------------- order 구매 데이터(미완성)
drop table ord;
select * from ord;

	create table ord (
	ord_num number(10) primary key,
	member_id nvarchar2(50) not null REFERENCES member(member_id), --로그인 여부
	s_num number(10) not null REFERENCES store(s_num),
	
	s_purchase number(10) not null, 	--#구매수량 
	full_price number(10) not null, 	--총 금액
	buy_date date, 				--구매 날짜
	s_validity date not null, 	--유통기한 sysdate+365
	buy_i char(1) default 'n',	--구매 여부 구매=y면 마이페이지 추가
	del char(1) default 'n'		--환불 여부 (구매날짜-sysdate)
	);
--	, t_account varchar2(50) references bank(t_account) not null --입금번호
	
-----------------------------------------고객센터(미완성)
create table service(
	sv_num number primary key not null,  --고객센터번호
	sv_title nvarchar2(50) not null,     --제목
	sv_content nvarchar2(1000) not null, --내용
	sv_id nvarchar2(50) not null,        --신청자ID
	sv_date date not null,               --신청일자
	sv_Aid nvarchar2(50),                --답변자ID
	sv_Adate date,                       --답변일자
	sv_state nvarchar2(50) not null      --답변상태
);

create sequence sv_num increment by 1 start with 1;

<<<<<<< HEAD
select * from movie where m_num = 1;
=======
select * from movie order by m_genre desc;
<<<<<<< HEAD
<<<<<<< HEAD
select * from bank;
select * from screen;
select * from ticket where t_id = 'master';
=======
select * from stillcut;
select * from 
select * from ticket where t_id = 'master';
<<<<<<< HEAD
select * from theater;
=======
select * from ticket;
=======
select * from seat;
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git
select * from screen;
<<<<<<< HEAD
select * from movie where m_title='극장판 귀멸의 칼날-무한열차편';
select * from theater where t_title ='신촌';
select * from screen s, movieTheater m where s.t_num = m.t_num and m.mt_num = 5 and s.sc_num =23 and s.sc_del = 'n'
select s.*, m.mt_num from screen s, movieTheater m where s.t_num = m.t_num and s.sc_num = 23 and m.mt_num =5 and s.sc_del = 'n'
<<<<<<< HEAD
select * from ticket where t_id='lamslams' and sc_num = 23;
=======
select * from ticket where t_id='lamslams' and sc_num = 23;
=======
select * from ticket;
select * from bank;
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git

<<<<<<< HEAD
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git
=======
select * from movieTheater order by mt_num;
select * from theater where t_loc='서울';
select * from theater where t_loc='서울' and t_title='강릉';
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git
