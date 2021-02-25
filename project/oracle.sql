--삭제 시퀀스 (테이블 삭제전에 꼭 먼저 삭제해주세요)
drop sequence t_num; 
drop sequence m_num; 
drop sequence re_num; 
drop sequence s_num; 
drop sequence t_ordernum; 
drop sequence sc_num; 
drop sequence mt_num;
drop sequence sv_num;

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
drop table movie CASCADE CONSTRAINTS;
drop table movieTheater CASCADE CONSTRAINTS;
drop table theater CASCADE CONSTRAINTS;
drop table member CASCADE CONSTRAINTS;
drop table master CASCADE CONSTRAINTS;



--------------------------------------관리자

create table master (
	master_id nvarchar2(50) primary key not null,
	master_password nvarchar2(50) not null
);
	
insert into master values ('master','1234');

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
select * from member;


--------------------------------------극장

create table theater(
	t_num number primary key not null,   --극장번호
	t_title nvarchar2(50) not null,      --이름
	t_loc nvarchar2(50) not null,        --지역
	t_addr nvarchar2(100) not null,     --주소(극장주소)
	t_number nvarchar2(50) not null,   --전화번호
	t_gui nvarchar2(1000) not null        --시설 안내
);
create sequence t_num increment by 1 start with 1;
insert into theater values(1, '신촌','서울','서울특별시 서대문구 신촌로 129 (창천동, 아트레온 2층)','1544-1122','주자요금 영화 관람시 3시간, 4000원입니다.');
insert into theater values(2, '강남','서울','서울특별시 강남구 강남대로 438 (역삼동, 스타플렉스)','1544-1122','건물 지하2F ~ 지하4F# 주차요금- CGV 영화 관람 시 주차 3시간 6,000원');
insert into theater values(3, '용산','서울','서울특별시 용산구 한강대로23길 55 현대아이파크몰 6층','1544-1122','주자요금- 영화 관람시 4시간, 5000원입니다.');
insert into theater values(4, '불광','서울','서울특별시 은평구 불광로 20 팜스퀘어 11층','1544-1122','건물에 음료 무료가능!');
insert into theater values(5, '대전','대전','주소가 5번이다','1544-1122','건물에 음료 무료가능!');
insert into theater values(6, '용인','대전','주소가 6번이다','1544-1122','건물에 음료 무료가능!');
insert into theater values(7, '수원','대전','주소가 7번이다','1544-1122','건물에 음료 무료가능!');
insert into theater values(8, '이천','대전','주소가 8번이다','1544-1122','건물에 음료 무료가능!');
insert into theater values(9, '쌍팔','광주','주소가 9번이다','1544-1122','건물에 음료 무료가능!');
insert into theater values(10, '이연','광주','주소가 10번이다','1544-1122','건물에 음료 무료가능!');
insert into theater values(11, '지연','광주','주소가 11번이다','1544-1122','건물에 음료 무료가능!');
insert into theater values(12, '희주','광주','주소가 12번이다','1544-1122','건물에 음료 무료가능!');

select * from theater;

-----------------------------------상영관

create table movieTheater(
	mt_num number primary key not null,     --상영관번호
	mt_name nvarchar2(50) not null,         --상영관이름
	mt_count number not null,                --좌석
	t_num number references theater(t_num)  --극장번호
);
create sequence mt_num increment by 1 start with 1;

--------------------------------------영화

create table movie (
	m_num number primary key not null, 	--영화번호
	m_title nvarchar2(50) not null,		--제목
	m_content nvarchar2(1000) not null,	--줄거리
	m_rank nvarchar2(50) not null,		--관람등급	
	m_opendate date not null,			--개봉일
	m_state nvarchar2(50) not null,     --상태(상영 중, 상영 예정)
	m_time number not null,		     	--상영시간
	m_grade number(10,1) not null,		--평균 평점 
	m_poster nvarchar2(100) not null,  	--포스터
	m_director nvarchar2(50) not null,	--감독
	m_actor nvarchar2(100) not null,	--출연진
	m_genre  nvarchar2(50) not null,	--장르
	m_del char(1) default 'n'	        --삭제여부 		
);
create sequence m_num increment by 1 start with 1;

insert into movie values(1, '극장판귀멸의칼날-무한열차편','벽력일섬','15','2021-02-03','상영중',120,0,'001.jsp','소토자키 하루오','하나에 나츠키, 시모노 히로, 마츠오카 요시츠구, 키토 아카리','애니메이션','n');
insert into movie values(2, '소울','피아노 위를 걷는다','전체','2021-01-20','상영중',107,0,'002.jsp','피트 닥터','제이미 폭스, 티나 페이, 다비드 딕스','애니메이션','n');
insert into movie values(3, '미션 파서블','미션 임파서블이 아니네???','15','2021-02-17','상영중',105,0,'003.jsp','김형주','김영광, 이선빈','코미디, 액션','n');
insert into movie values(4, '해리포터와 불의 잔','아브라카타브라','12','2021-02-10','상영중',156,0,'004.jsp','마이크 뉴웰','다니엘 래드클리프, 엠마 왓슨, 루퍼트 그린트','환타지','n');
insert into movie values(5, '해피 투게더 리마스터링 ','유재석?','15','2021-02-04','상영중',97,0,'005.jsp','왕가위','장국영, 양조위, 장첸','드라마, 로맨스, 멜로','n');
insert into movie values(6, '2046 리마스터링 ','ㅗㅜㅑ','19','2021-02-11','상영중',128,0,'006.jsp','왕가위','장쯔이, 장첸, 기무라 타쿠야, 유가령, 양조위, 왕페이, 베이 로건, 장만옥, 공리, 둥제, 소병림, 통차이 맥킨타이어, 오정엽','드라마','n');
insert into movie values(7, '마리오네트 ','인형인가봐','12','2021-02-17','상영중',112,0,'007.jsp','엘버트 반 스트리엔','테크라 레우텐, 피터 뮬란, 엘리야 울프','미스터리, 스릴러','n');
select * from movie;

--------------------------------------한줄평

create table review (
	re_num number primary key not null,                            --리뷰번호
	re_con nvarchar2(500) not null,			                       --한줄평 내용
	re_grade number(10,1) not null,			                       --한줄평 평점 9.5 
	re_date date default sysdate not null,                         --업로드 시간
	re_update date default sysdate not null,					   --수정시간
	member_id nvarchar2(50) references member(member_id) not null, --회원아이디
	m_num number references movie(m_num),						   --영화번호
	re_del char(1) default 'n'									   --삭제여부
);

create sequence re_num increment by 1 start with 1;

select* from review;
insert into review values(1, '재미있어요', 5, sysdate, sysdate, 'lamslams', 1, 'n');
insert into review values(2, '하하호호', 5, sysdate, sysdate, 'lamslams', 1, 'n');
--------------------------------------회원 게시판

create table board(
	b_num number primary key not null,                             --게시글 번호
	b_email nvarchar2(50) not null,                                --이메일
	b_title nvarchar2(50) not null, 	                           --제목
	b_content nvarchar2(1000) not null,                            --내용
	b_password nvarchar2(50) not null,                             --비밀번호	
	b_view number not null, 	                                   --조회수
	b_ip nvarchar2(50) not null, 	                               --아이피
	b_ref number not null, 		                                   --참조번호
	b_level number not null, 	                                   --참조레벨	
	b_date date default sysdate not null,                          --작성일	
	b_ans char(1) default 'n', 		                               --답변여부
	b_del char(1) default 'n',		                               --삭제여부
	member_id nvarchar2(50) references member(member_id) not null --아이디
);

-----------------------------------상영

create table screen(
	sc_num number primary key not null,            --상영번호
	sc_date date not null,                         --상영일
	sc_start nvarchar2(50) not null,               --시작시간
	sc_end nvarchar2(50) not null,                 --종료시간
	t_num number references theater(t_num),        --극장번호
	mt_num number references movieTheater(mt_num), --상영관번호
	m_num number references movie(m_num)          --영화번호 
);
create sequence sc_num increment by 1 start with 1;


--------------------------------------예매

create table ticket(
	t_ordernum number primary key not null,           --예매번호
	t_adult number not null,                          --성인예매수
	t_teen number not null,                           --청소년예매수
	t_sale number not null, 	                      --사용포인트
	t_id nvarchar2(50) not null,                      --예매ID
	t_date date default sysdate not null,             --예매일
	t_state nvarchar2(50) not null,                   --예매상태
	sc_num number references screen(sc_num) not null --상영시간번호		
);
create sequence t_ordernum increment by 1 start with 1;

-------------------------------------- 좌석

create table seat(
	st_num nvarchar2(50),                   --좌석번호
	st_state nvarchar2(50),                 --사용가능여부 
	sc_num number references screen(sc_num) --상영번호
);



--------------------------------------관리자계좌

create table aam_bank(
	aam_account nvarchar2(50) primary key not null,       --계좌번호
	bank_name nvarchar2(50) default '카카오뱅크' not null,   --은행이름
	aam_name nvarchar2(50) default 'AAM' not null         --이름
);

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

--------------------------------------스토어

create table store(
	s_num number(10) primary key not null,  --스토어 게시글 번호
--	s_title varchar2(50) not null, 		-- 제목#
	s_del char(1) default 'n', 			--게시글 삭제여부
	s_Pclass varchar2(100) not null, 	--상품 분류(관람권,스낵)
	s_Pname varchar2(50) not null, 		--상품 이름
	s_Pconfig varchar2(50) not null, 	--상품 구성
	s_Pimage varchar2(100) not null, 	--상품 이미지
	
	s_per date not null, 			--판매기간 #  날짜+숫자=날짜
	s_validity date not null, 		--유효기간 #
	s_total number(10) not null, 	--총 판매수량 #
	s_purchase number(10) not null, --구매수량
	s_prive number(10) not null,	--금액
	s_sale number(10) not null,		--할인율 
	del char(1) default 'n',		--구매 취소 여부
	
	t_account varchar2(50) references bank(t_account) not null --입금번호
);

create sequence s_num increment by 1 start with 1;


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

select distinct t_loc, (select count(*) from theater where t_loc = '서울') as t_total from theater order by t_loc;

