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
            <c:foreach var="board" items="${list}">
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
            <c:set var="no1" value="${no-1}"></c:set>
            </c:foreach>
         </c:if>
      </table>      

      <!-- 검색 부분 search, keyword는 board에 포함, pageNum은 따로 전달 -->
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
   </div>
</body>
</html>