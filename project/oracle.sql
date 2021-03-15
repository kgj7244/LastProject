--삭제 시퀀스 (테이블 삭제전에 꼭 먼저 삭제해주세요)
drop sequence theater_t_num_seq;
drop sequence st_num; 
drop sequence re_num; 
drop sequence s_num; 
drop sequence t_ordernum; 
drop sequence sc_num; 
drop sequence mt_num;
drop sequence sv_num;
drop sequence t_account;
drop sequence r_num;
drop sequence e_num;
drop sequence eo_num;
drop sequence p_num;
drop sequence n_num;
drop sequence b_num;
drop sequence ord_num;

-----------------------------------삭제 테이블 (순서대로 삭제해주세요.)

drop table service CASCADE CONSTRAINTS;
drop table ord CASCADE CONSTRAINTS;
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
drop table event_over CASCADE CONSTRAINTS;
drop table event CASCADE CONSTRAINTS;
drop table master CASCADE CONSTRAINTS;
drop table reBoard CASCADE CONSTRAINTS;
drop table notice CASCADE CONSTRAINTS;



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

-- 회원 시연용(게시판 시연을 위해)
insert into member values('master','123456789','김희주','남성',sysdate,'lams1@daum.net','010-1111-1111','서울시',sysdate,'n');
insert into member values('lamslams','123456789','김희주','남성',sysdate,'lams1@daum.net','010-1111-1111','서울시',sysdate,'n');
insert into member values('lamslams','123456789','김희주','남성',sysdate,'lams1@daum.net','010-1111-1111','서울시',sysdate,'n');
insert into member values('lamslams2','123456789','김희주','남성',sysdate,'lams1@daum.net','010-1111-1111','서울시',sysdate,'n');
insert into member values('aa11','1234','이다혜','여성',sysdate,'aa11@gmail.com','010-2222-2222','서대문구',sysdate,'n');
insert into member values('bb11','1234','유연지','여성',sysdate,'bb11@naver.com','010-3333-3333','용산구',sysdate,'n');
insert into member values('cc11','1234','한유진','여성',sysdate,'cc11@daum.net','010-4444-4444','마포구',sysdate,'n');
insert into member values('dd11','1234','박예은','여성',sysdate,'dd11@gmail.com','010-5555-5555','서초구',sysdate,'n');
insert into member values('ee11','1234','주단태','남성',sysdate,'ee11@naver.com','010-6666-6666','강남구',sysdate,'n');
insert into member values('ff11','1234','하윤철','남성',sysdate,'ff11@daum.net','010-7777-7777','송파구',sysdate,'n');
insert into member values('gg11','1234','이규진','남성',sysdate,'gg11@gmail.com','010-8888-8888','종로구',sysdate,'n');
insert into member values('hh11','1234','천서진','여성',sysdate,'hh11@naver.com','010-9999-9999','동작구',sysdate,'n');
insert into member values('ii11','1234','오윤희','여성',sysdate,'ii11@daum.net','010-0000-0000','중구',sysdate,'n');

select * from member;

-------------------------------------- 이벤트(추가)
create table event(
	e_num number(10) primary key, 				 			-- 이벤트번호
	e_title nvarchar2(50) not null,            		 		-- 이벤트제목
	e_state nvarchar2(50) not null,           		 		-- 이벤트종류(1: 쿠폰, 2: 상품권)
	e_sale number(10) not null,             				-- 할인금액
	e_poster nvarchar2(100),								-- 포스터 사진
	e_del char(1) default 'n'								-- 삭제여부
);

create sequence e_num increment by 1 start with 1;

---------------------------------------이벤트 중복체크
create table event_over(
	eo_num number(10) primary key,               					-- 중복체크 번호
	member_id nvarchar2(50) not null,  								-- 아이디
	eo_state nvarchar2(50) not null,    			                -- 상태(1. 대기, 2. 발급, 3. 사용)
	e_num number(10) references event(e_num)  						-- 이벤트번호
);
create sequence eo_num increment by 1 start with 1;

--------------------------------------극장
--삭제
drop sequence theater_t_num_seq;
drop table theater CASCADE CONSTRAINTS;

create table theater(
	t_num number primary key not null,   --극장번호 1
	t_title nvarchar2(50) not null,      --이름 2
	t_loc nvarchar2(50) not null,        --지역 3
	t_content nvarchar2(1000) not null, -- 극장 정보 4
	t_floor nvarchar2(500) not null, -- 층별 안내 5
	t_addr nvarchar2(100) not null,     --주소(극장주소) 6 
	t_number nvarchar2(50) not null,   --전화번호 7
	t_gui nvarchar2(1000) not null        --시설 안내 8
);
select * from theater;
create sequence theater_t_num_seq increment by 1 start with 13;

insert into theater values(
	1, 
	'신촌','서울','품격을 높여주는 최고급 쇼파에서 고급화된 인테리어의 안락함을 즐겨보세요 전좌석 가죽시트, 핸드폰 충전이 가능한 가장 진화한 컴포트관 (COMFORT)',
	'5층 : COMFORT 1관, 2관 ~ 8관, 매표소, 매점, 무인발권기, 남자 · 여자 화장실',
	'서울특별시 서대문구 신촌로 129 (창천동, 아트레온 2층)',
	'1544-1122',
	'일반상영관, 장애인석');
insert into theater values(
	2, 
	'강남','서울','강남의 중심! 강남 소비문화의 중심지인 지하철 2호선 , 신분당선 - 강남역과 연결 로맨틱 멀티플렉스! 젊은 도시 강남이 한 눈에 보이는 최상의 View를 제공 '
	'8층 : 매표소, 매점, 에스컬레이터, 엘리베이터 , 남자 · 여자 화장실, 비상계단 3',
	'서울특별시 강남구 강남대로 438 (역삼동, 스타플렉스)',
	'1544-1122','일반상영관, 장애인');
insert into theater values(
	3, 
	'용산','서울','강북의 문화 랜드마크, 메가박스 100호점! Meyer Sound와 Dolby ATMOS 시스템, 차세대 상영관의 표준 사운드 특화관 MX관'
	'1층 : 매표소, 매점, 무인발권기, 남자/여자 화장실, 상영관 (MX관, COMFORT관, 3~9관)',
	'서울특별시 용산구 한강대로23길 55 현대아이파크몰 6층',
	'1544-1122','일반상영관, 장애인');
insert into theater values(
	4, 
	'불광','서울',
	'9개관 / 총 1,681석 규모 가장 진화 된 입체음향, 차세대 영화관의 표준을 제시하는 MX관',
	'5층 : 6관, 7관, 8관, 9관, 남/여화장실(상영관 중앙에 위치)',
	'서울특별시 은평구 불광로 20 팜스퀘어 11층',
	'1544-1122','일반상영관, 장애인');
insert into theater values(
	5, 
	'공주','대전',
	'',
	'',
	'충청남도 공주시 신관동 흑수골길 12',
	'1544-1122','일반상영관, 장애인');
insert into theater values(
	6, 
	'논산','대전',
	'충청남도 논산시 중앙로 255',
	'1544-1122','일반상영관, 장애인');
insert into theater values(
	7, 
	'오창','대전',
	'충북 청주시 청원구 오창읍 중심상업1로 8-9',
	'1544-1122','일반상영관, 장애인');
insert into theater values(
	8, 
	'대전','대전',
	'대전 서구 문정로 77 로데오타운 5층',
	'1544-1122','일반상영관, 장애인');
insert into theater values(
	9, 
	'광주상무','광주',
	'광주광역시 서구 치평동 시청로60번길 21 콜롬버스시네마',
	'1544-1122','일반상영관, 장애인');
insert into theater values(
	10, 
	'광주하남','광주',
	'광주광역시 광산구 우산동 풍영철길로 15 콜럼버스월드',
	'1544-1122','일반상영관, 장애인');
insert into theater values(
	11, 
	'송천','광주',
	'전라북도 전주시 덕진구 송천동2가 동부대로 1215 ',
	'1544-1122','일반상영관, 장애인');
insert into theater values(
	12, 
	'순천','광주',
	'전라남도 순천시 덕암동 충효로 15',
	'1544-1122','일반상영관, 장애인');
select * from theater;

-----------------------------------상영관
select * from MOVIETHEATER;
create table movieTheater(
	mt_num number primary key not null,     --상영관번호
	mt_name nvarchar2(50) not null,         --상영관이름
	mt_count number not null,               --좌석
	t_num number references theater(t_num)  --극장번호
);
create sequence mt_num increment by 1 start with 6;
--시연시 보여줄 상영관
insert into movieTheater values(1, '1관',50,1);
insert into movieTheater values(2, '2관',70,1);
insert into movieTheater values(3, '3관',80,1);
insert into movieTheater values(4, '4관',90,1);
insert into movieTheater values(5, '5관',100,1);
--delete from movieTheater where mt_num=28;
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
--insert into review values(1,'재미있습니다.',5,sysdate,sysdate,'lamslams',1);
--insert into review values(2,'재미있습니다1111.',5,sysdate,sysdate,'lamslams',1);
--insert into review values(3,'재미있습니다.22',5,sysdate,sysdate,'lamslams',1);
--insert into review values(4,'재미있습니다22222.',5,sysdate,sysdate,'lamslams',1);

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

-- 게시판 시연용
insert into board values (0,'인터넷예매시 환불 가능한가요?','제곧내','unlock',null,0,sysdate,'n','tk','lamslams');
insert into board values (1,'예매를 한 뒤 시간대나 좌석변경이 가능한가요?','제곧내','unlock',null,0,sysdate,'n','tk','lamslams2');
insert into board values (2,'영화 관람등급은 어떻게 되나요?','제곧내','lock',1,0,sysdate,'n','tk','aa11');
insert into board values (3,'영화예매가능시간은 몇 분 전까지인가요?','제곧내','unlock',null,0,sysdate,'n','tk','bb11');
insert into board values (4,'아이디와 비밀번호를 잃어버렸어요','제곧내','unlock',null,0,sysdate,'n','mem','cc11');--
insert into board values (5,'예매 수수료가 있나요?','제곧내','lock',1,0,sysdate,'n','tk','dd11');--
insert into board values (6,'외부음식 반입이 가능한가요?','제곧내','lock',1,0,sysdate,'n','etc','ee11');
insert into board values (7,'스토어에서 구매한 관람권이 등록이 안되네요','제곧내','unlock',null,0,sysdate,'n','st','ff11');
insert into board values (8,'주차가 가능한가요?','제곧내','lock',1,0,sysdate,'n','etc','gg11');--
insert into board values (9,'스토어 상품은 어떻게 사용할 수 있나요?','제곧내','unlock',null,0,sysdate,'n','st','hh11');
insert into board values (10,'아이디를 바꾸고 싶은데 수정할 수 있나요?','제곧내','unlock',null,0,sysdate,'n','mem','ii11');

select * from board;

--------------------------------------회원 게시판 마스터전용 댓글

create table reBoard (
	r_num number primary key, 										-- 댓글 번호
	b_num number not null references board(b_num), 					-- 원 게시글 번호
	member_id nvarchar2(50) references member(member_id) not null, 	-- 댓글 작성자
    r_text varchar2(1000) not null,    								-- 댓글
	r_date date not null,            								-- 작성일
	r_del char(1) default 'n'              							-- 삭제여부
);

create sequence r_num increment by 1 start with 1;

-- 댓글 시연용
insert into reboard values(1,8,'master','모든 영화관에는 주차공간이 마련되어있습니다. 감사합니다:-)',sysdate,'n');
insert into reboard values(2,4,'master','대표번호로 문의 주시면 감사하겠습니다:-)',sysdate,'n');
insert into reboard values(3,5,'master','별도 수수료는 발생되지 않습니다. 감사합니다:-)',sysdate,'n');

select * from reBoard;

----------------------------------- 공지 게시판

create table notice (
	n_num number primary key not null,      -- 공지 번호
	n_branch nvarchar2(50),                 -- 지점
	n_title nvarchar2(100) not null,        -- 공지 제목
	n_content nvarchar2(1000) not null,     -- 공지 내용
	n_date date default sysdate not null,   -- 공지 등록일
	n_del char(1) default 'n'               -- 삭제여부
);

create sequence n_num increment by 1 start with 1;

-- 시연시 보여줄 공지
insert into notice values(1,'신촌','21년 3월 휴관일 안내','3월 휴관일 : 3/12, 3/19 (금요일)',sysdate,'n');
insert into notice values(2,'강남','주차창 이용 변경 안내','매점 창구에서 당일 영화 티켓 확인 후 입차 시간 기준 4시간 무료',sysdate,'n');
insert into notice values(3,'용산','공사로 인한 일부건물 이용불가 안내','21년 3월19일까지 공영주차장에서 주차 부탁드립니다',sysdate,'n');
insert into notice values(4,'전체','개인정보 처리방침 변경 안내','개정내용 : 개인정보처리방침 제 6조(개인정보파기)',sysdate,'n');
insert into notice values(5,'대전','영화관람 요금 조정 안내','21년 4월부터 요금이 2,000원이 인상됩니다',sysdate,'n');
insert into notice values(6,'용인','운영일자 임시 조정 안내','내부 사정으로 인하여 부득이하게 극장 운영 일자가 임시 조정됩니다',sysdate,'n');
insert into notice values(7,'전체','굿즈 구매 제한 안내','카드(인당 4개), 퍼즐(인당 4개) 구매 제한',sysdate,'n');
insert into notice values(8,'이천','임시 휴점 안내','코로나19 확산으로 인해 메가박스 양산지점의 영업을 21년 3월 10일까지 임시 중단하게 되었습니다. 죄송합니다',sysdate,'n');
insert into notice values(9,'수원','21년 3월1일 건물운영안내','B1 메인 출입구는 입장이 불가합니다',sysdate,'n');
insert into notice values(10,'구리','21년 3월 휴관일 안내','3월 휴관일 : 3/10, 3/24 (수요일)',sysdate,'n');
insert into notice values(11,'전체','21년 3월 시스템 정기점검 안내','작업일시: 2021년 3월 16일(화) 00:00 ~ 05:00',sysdate,'n');

select * from notice;

-----------------------------------상영

create table screen(
	sc_num number primary key not null,            --상영번호
	sc_date date not null,                         --상영일
	sc_start nvarchar2(50) not null,               --시작시간
	sc_end nvarchar2(50) not null,                 --종료시간
	sc_del char(1) default 'n',                    --삭제여부
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
select * from seat
--------------------------------------예매

create table ticket(
	t_ordernum number primary key,           --예매번호
	t_adult number not null,                          --성인예매수
	t_teen number not null,                           --청소년예매수
	t_sale number not null, 	                      --사용포인트
	t_id nvarchar2(50) not null,                      --예매ID
	t_date date default sysdate not null,             --예매일
	t_state nvarchar2(50) not null,                   --좌석번호 (그대로 이름은 그대로 사용함)
	sc_num number references screen(sc_num) not null  --상영시간번호		
);
create sequence t_ordernum increment by 1 start with 1;


--------------------------------------스토어
select * from STORE;

drop table STORE CASCADE CONSTRAINTS;

create table store(
	s_num number(10) primary key not null,  --스토어 게시글 번호
	s_del char(1) default 'n', 			--#게시글 삭제여부
	s_Pclass number(10) not null, 	--상품 분류(관람권,스낵)
	s_Pname varchar2(50) not null, 		--상품 이름
	s_Pconfig varchar2(500) not null, 	--상품 구성
	s_Pimage varchar2(100) not null, 	--상품 이미지	
	s_purchase number(10) default 0 not null, --#구매수량 
	s_prive number(10) not null,	--가격
	del char(1) default 'n',		--#환불 여부
	
	s_per date, 			--판매기간  시작
	s_pernd date, 			--판매기간   끝 
	s_total number(10), 	--총 판매수량 
	s_sale number(10)		--#할인율 
);	


create sequence s_num increment by 1 start with 20; 
-----#
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
insert into store values(14,'n','1','전용 관람권','전용 관람권 1매','전용관람권.jpg',0,13000,'n','1111-03-02','9999-12-02',100,0);
insert into store values(15,'n','1','4DX관람권','4DX관람권 1매','4DX관람권.jpg',0,19000,'n','1111-03-02','9999-12-02',100,0);
insert into store values(16,'n','4','IMAX 관람권','IMAX 관람권 1매','IMAX 관람권.jpg',0,16000,'n','2021-03-02','2021-04-02',500,10);
insert into store values(17,'n','4','반지의 제왕 오리지널 티켓','오리지널 티켓 1종','반지의 제왕.jpg',0,14000,'n','2021-03-18','2021-04-02',1000,0);
insert into store values(18,'n','4','즉시할인 스위트 콤보','오리지널L+탄산음료 M2','스위트콤보.jpg',0,9000,'n','2021-03-18','2021-04-02',200,15);
insert into store values(19,'n','4','메이플스토리 콤보','팝콘L+탄산음료M2+메이플 탑퍼컵2+돌의 정령 팝콘통1','메이플 스토리 콤보.jpg',0,15000,'n','2021-01-18','2021-02-15',2000,0);

------------------------------- order 구매 데이터(미완성)
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

create sequence ord_num increment by 1 start with 1;

--------------------------------------관리자계좌
create table aam_bank(
	aam_account nvarchar2(50) primary key not null,     --계좌번호
	bank_name nvarchar2(50) not null,   				--은행이름
	aam_name nvarchar2(50) not null     				--이름
);
insert into aam_bank values('565-278311-02-001','우리은행','김희주');

--------------------------------------입금금액
drop table bank CASCADE CONSTRAINTS;

create table bank(
	t_account nvarchar2(50) primary key not null,               --입금번호
	t_date date not null,                                       --#입금일	
	t_price number not null,                                    --#금액
	t_deal nvarchar2(50) not null,                              --거래방법
	member_id nvarchar2(50) references member(member_id),      --아이디
	aam_account nvarchar2(50) references aam_bank(aam_account), --관리자계좌	
	t_ordernum number references ticket(t_ordernum),            --예매번호(티켓
	ord_num number(10) references ord(ord_num)		            --주문번호(스토어
);
create sequence t_account increment by 1 start with 1;

select * from EVENT_OVER;
select* from ticket;
select * from bank;
select * from event e, event_over eo where e.e_num = eo.e_num and eo.eo_num = 0;