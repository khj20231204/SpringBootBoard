-- 게시판
select * from tab;
select * from board;

create table board (
	num number primary key, 			-- primary key
	writer varchar2(20) not null, 		-- 작성자
	subject varchar2(50) not null, 		-- 제목
	content varchar2(500) not null, 	-- 내용
	email varchar2(30) , 				-- 이메일
	readcount number default 0, 		-- 조회수
	passwd varchar2(12) not null, 		-- 비밀번호
	ref number not null, 				-- 답변글끼리 그룹
	re_step number not null, 			-- 댓글 출력 순서
	re_level number not null, 			-- 댓글 레벨
	ip varchar2(20) not null, 			-- 작성자 ip
	reg_date date not null, 			-- 작성일
	del char(1)
);


insert into board values(1,'홍홍홍','홍홍홍이 쓴 글','홍홍홍이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(2,'홍길동','홍길동이 쓴 글','홍길동이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(3,'단백질','단백질이 쓴 글','단백질이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(4,'닥터유','닥터유가 쓴 글','닥터유가 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(5,'장비','장비가 쓴 글','장비가 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(6,'관우','관우가 쓴 글','관우가 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(7,'홍홍홍','홍홍홍이 쓴 글','홍홍홍이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(8,'홍길동','홍길동이 쓴 글','홍길동이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(9,'단백질','단백질이 쓴 글','단백질이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(10,'닥터유','닥터유가 쓴 글','닥터유가 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(11,'장비','장비가 쓴 글','장비가 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(12,'관우','관우가 쓴 글','관우가 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(13,'홍홍홍','홍홍홍이 쓴 글','홍홍홍이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(14,'홍길동','홍길동이 쓴 글','홍길동이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(15,'단백질','단백질이 쓴 글','단백질이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(16,'닥터유','닥터유가 쓴 글','닥터유가 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(17,'장비','장비가 쓴 글','장비가 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(17,'관우','관우가 쓴 글','관우가 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(18,'홍홍홍','홍홍홍이 쓴 글','홍홍홍이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(19,'홍길동','홍길동이 쓴 글','홍길동이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(20,'단백질','단백질이 쓴 글','단백질이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(21,'닥터유','닥터유가 쓴 글','닥터유가 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(22,'장비','장비가 쓴 글','장비가 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(23,'홍홍홍','홍홍홍이 쓴 글','홍홍홍이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(24,'홍길동','홍길동이 쓴 글','홍길동이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(25,'단백질','단백질이 쓴 글','단백질이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(26,'닥터유','닥터유가 쓴 글','닥터유가 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(27,'장비','장비가 쓴 글','장비가 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(28,'관우','관우가 쓴 글','관우가 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(29,'홍홍홍','홍홍홍이 쓴 글','홍홍홍이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(30,'홍길동','홍길동이 쓴 글','홍길동이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(31,'단백질','단백질이 쓴 글','단백질이 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(32,'닥터유','닥터유가 쓴 글','닥터유가 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(33,'장비','장비가 쓴 글','장비가 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');
insert into board values(34,'관우','관우가 쓴 글','관우가 쓴 내용','홍홍@email.com',0,'1234',0,0,0,'ip',SYSDATE,'N');

select * from board;

select * from board where writer like '%백질%' or content like 
'%백질%';

select count(*) from board where subject like '% 홍 %';

commit;