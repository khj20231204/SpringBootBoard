<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Document</title>
</head>
<body>
   pp.startPage: ${pp.startPage}
   pp.endPage: ${pp.endPage}

   <div class="container" align="center">
      <table border="1" width="800">
         <tr>
            <td>번호</td>
            <td>제목</td>
            <td>작성자</td>
            <td>작성일</td>
            <td>조회수</td>
         </tr>
         <c:if test="${empty list}">
            <tr>
            <td colspan="5">데이터가 없습니다.</td>
            </tr>
         </c:if>

         <c:if test="${not empty list}">
            <c:set var="no1" value="${no}"></c:set>
            <c:forEach var="board" items="${list}">
               <tr>
                  <!-- 글 숫자 foreach동안 no-1 -->
                  <td>${no1}</td>
                  
                  <!-- 글제목 : a href, 댓글이면 level만큼 집어넣기 -->
                  <td>
                     <!-- 넘겨줘야 하는 값이 글 pk값과 현재 페이지 -->
                     <a href="view.do?num=${board.num}&pageNum=${pp.currentPage}">
                        <c:if test="${board.re_level > 0}">
                           <span style="width:'${board.re_level * 5}'"></span>
                           <img src="댓글 이미지">
                        </c:if>
                        ${board.subject}
                        <c:if test="${board.re_level > 30}">
                           <img src="핫 이미지">
                        </c:if>
                     </a>
                  </td>
                  <!-- 글제목 끝 -->
                  
                  <td>${board.writer}</td>
                  <td>${board.reg_date}</td>
                  <td>${board.readcount}</td>
               </tr>
            <c:set var="no1" value="${no1-1}"></c:set>
            </c:forEach>
         </c:if>
      </table>      

      <!-- 검색 부분 search, keyword는 board에 포함되어 있는 걸 controller에서 뽑아서 따로 model로 전달 -->
      <form action="list.do">
         <input type="hidden" name="pageNum" value="1">
         <select name="search">
            <option value="subject" <c:if test="${search == 'subject'}">selected</c:if>>제목</option>
            <option value="content" <c:if test="${search == 'content'}">selected</c:if>>내용</option>
            <option value="writer" <c:if test="${search == 'writer'}">selected</c:if>>작성자</option>
            <option value="subcon" <c:if test="${search == 'subcon'}">selected</c:if>> 제목+내용</option>
         </select>
         <input type="text" name="keyword">
         <input type="submit" value="확인">
      </form>

      <!-- 
         검색 했을 경우의 페이징 처리 : 
         page와 search와 keyword를 함께 넘겨준다
      -->
      <c:if test="${not empty keyword}">
         <!-- 
            startPage가 한번에 보여주는 row값 limit=10 또는 limit=5 보다 큰 경우 [이전] 메뉴 표시 
            
            [이전] [11] [12] .. [20] 

            "이전"을 클릭한 경우
            [1] [2] ... [10] 이 나오게 하려면
            startPage - 블록단위(10)를 해야
            시작페이지가 11 인 경우 = 1,
            시작페이지가 21 인 경우 = 11, 
            가 된다
         -->
         <c:if test="${startPage > pp.pagePerBlk}">
            <a href="list.do?pageNum=${pp.startPage - pp.pagePerBlk}&search=${search}&keyword=${keyword}">[이전]</a>
         </c:if>
         <!-- 
            forEach를 돌면서 페이징 처리 
            현재 페이지면 비활성화
            현재 페이지가 아니면 활성화
         -->
         <c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
            <c:if test="${i == pp.currentPage}">
               [${i}]
            </c:if>
            <c:if test="${i != pp.currentPage}">
               <a href="list.do?pageNum=${i}&search=${search}&keyword=${keyword}"> [${i}]</a>
            </c:if>
         </c:forEach>

         <!-- 
            endPage가 totalPage보다 작은 경우 [다음] 메뉴 표시
         -->
         <c:if test="${pp.endPage < pp.totalPage}">
            <a href="list.do?pageNum=${pp.endPage + pp.pagePerBlk}&search=${search}&keyword=${keyword}">[다음]</a>
         </c:if>
      </c:if>

      <!--
         검색 하지 않았을 때의 페이징 처리 :
         page만 넘겨준다
      -->
      <c:if test="${empty keyword}">
         <c:if test="${pp.startPage > pp.pagePerBlk }">
            <a href="list.do?pageNum=${pp.startPage - 1}">[이전]</a>
         </c:if>
         <c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
            <c:if test="${pp.currentPage==i}">
               [${i}]
            </c:if>
            <c:if test="${pp.currentPage != i}">
               <a href="list.do?pageNum=${i}">[${i}]</a>
            </c:if>
         </c:forEach>
         <c:if test="${pp.endPage < pp.totalPage}">
            <a href="list.do?pageNum=${pp.endPage + 1}">[다음]</a>
         </c:if>
      </c:if>
		<div align="center">
			<a href="insertForm.do" class="btn btn-info">글 입력</a>
		</div>
   </div>
</body>
</html>