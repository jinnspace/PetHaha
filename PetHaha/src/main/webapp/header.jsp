<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 
<fmt:setLocale value="ko_KR"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PetHaha</title>
<link href="css/pethaha.css" rel="stylesheet">
<script type="text/javascript" src="/code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="script/jquery-3.6.1.js"></script>
<script type="text/javascript" src="script/pethaha.js"></script>
</head>
<body>
    <div class="headback">
      	<div id="mainlogo">
        	<a href="index"><img src="petlogo.png" /> 펫하하</a>
      	</div>
    <div class="headbuttons">
        <c:choose>
          	<c:when test="${empty loginUser}">
            	<input type="button" value="로그인" class="headbutton" onclick="location.href='loginForm'">
            	<input type="button" value="회원가입" class="headbutton" onclick="location.href='memberJoinForm'">
          	</c:when>   
        </c:choose>
  	</div>
    </div>
 