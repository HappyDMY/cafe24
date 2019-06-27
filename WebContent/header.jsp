<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko" style="border: 15px solid #555555 ">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>WebTest</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/mystyle.css"/>
  <script src="../js/jquery-3.3.1.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/myscript.js"></script>
  <script src="../js/Clock.js"></script>
  

</head>
 <body onload="showtime()" onunload="killtime()">
<div class="container-fluidclock bg-5 text-center">  
<!-- 시계 -->
     <input type="text" name="clock" id="clock"
            size="25" class="time" readonly>
</div>
<!-- Navbar 메인카테고리 시작 -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">Home</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right" >
        <li><a href="../bbs/bbsList.jsp">Board</a></li>
        <li><a href="#">Notice</a></li>
        <li><a href="../member/loginForm.jsp">Login</a></li>
        <li><a href="../pds/pdsList.jsp">Photo</a></li>
        <li><a href="../mail/mailForm.jsp">Mail</a></li>
        <li><a href="../bbs2/bbslist.do">Board(MVC)</a></li>
        <li><a href="../member2/loginform.do">Login(MVC)</a></li>
      </ul>
    </div>
  </div>
</nav>
 
<!-- Navbar 메인카테고리 끝 -->
<!-- Container Start -->
<div class="container-fluid bg-2 text-center"> 
  <div class="row">
    <div class="col-sm-12"> 
	<!--  ------------분할------------- -->
 