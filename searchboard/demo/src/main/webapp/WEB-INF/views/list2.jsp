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
            <c:set var="no" value="${no}"></c:set>
            <c:foreach var="board" items="${list}">
               <tr>
                  <td>${no}</td>
                  <td>a href로</td>
                  <td>작성자</td>
                  <td>작성일</td>
                  <td>조회수</td>
               </tr>
            <c:set var="no" value="${no-1}"></c:set>
            </c:foreach>
         </c:if>
         
      </table>      
   </div>
</body>
</html>