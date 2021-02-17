--------------------------------------영화

create table movie (
	m_num number primary key not null, 	--영화번호
	m_title varchar2(50) not null,		--제목
	m_content varchar2(1000) not null,	--줄거리
	m_rank varchar2(50) not null,		--관람등급	
	m_opendate date not null,			--개봉일
	m_state varchar2(40) not null,      --상태(상영 중, 상영 예정)
	m_time varchar2(50) not null,		--상영시간
	m_grade number not null,			--평균 평점
	m_poster varchar2(100) not null,   	--포스터
	m_director varchar2(50) not null,	--감독
	m_actor varchar2(100) not null,		--배우
	m_genre  varchar2(50) not null,		--장르
	m_del char(1) default 'n'	        --삭제여부 		
);
create sequence movie_seq start with 1;
  
 

--------------------------------------극장

create table theater(
	t_num number primary key,  --극장번호
	t_title varchar2(50),      --이름
	t_loc varchar2(100),       --위치(주소)
	t_info varchar2(1000),     --시설 정보
	t_gui varchar2(1000)       --시설 안내
);
create sequence theater_seq start with 1;


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

