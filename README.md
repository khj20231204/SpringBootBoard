# SpringBootBoard

<div style="text-align:center">
<img src="https://github.com/khj20231204/SpringBootBoard/blob/main/board.jpg?raw=true" style="border:3px solid black;border-radius:9px;width:400px"></div>

1. # 개발 환경✔️
	+ SptringBoot 3.1.9
	+ MyBatis
	+ jsp   
	+ Oracle - jdbc11  
	+ lombok
	+ tomcat - 10.1

1. # 개요 💡
	현재 수료 중인 중앙정보처리학원에서 수업 시간에 들은 내용을 토대로 만들어본 간단한 게시판입니다
	
1. # 주요 특징 ✈️
	1. 검색 기능이 있으며 페이징 부분을 클래스(PagingPgm)로 작성   
	2. 검색 기능의 keyword와 search부분을 DTO인 Board부분에 넣어서 Board 하나의 값만 넘겨주면 검색 기능이 가능   
	3. 댓글 부분   
	ref : 부모 글의 pk값  
	re_level : 같은 댓글 안에서 순서   
	re_step : 들여쓰기   
	4. insert를 할 때 PK인 num값에 sequence를 넣지 않고 현재 num값에서 가장 큰 수를 구하여 	더하기 1을 하는 씩으로 insert 실행   
	- 쿼리문 -
	```sql
		<selectKey keyProperty="num" 
			order="BEFORE" resultType="int">
			select nvl(max(num),0) + 1 from board
		</selectKey>
	```
	5. 동적 SQL문   
	MyBatis의 mapper부분에서 if문을 사용하여 검색 기능이 있는 경우와 없는 경우를 나누는 조건문을 사용
	- 쿼리문 -
	```
	<select id="list" parameterType="board" resultMap="boardResult">
		select * from (select a.*,rowNum rn from (
		select * from board
		<where>
			<if test="keyword != null and search!='subcon'">
				${search} like '%'||#{keyword}||'%'
			</if>
			<if test="keyword != null and search=='subcon'">
				subject like '%'||#{keyword}||'%' or
				content like '%'||#{keyword}||'%'
			</if>
		</where>
		order by ref desc,re_step) a )
		where rn between #{startRow} and #{endRow}
	</select>
	```
	제목과 내용을 함께 검색하는 부분과 따로 검색하는 부분으로 나눔   
	