<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>My Web</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="./css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <link rel="stylesheet" href="./css/mystyle.css"/>
  <script src="./js/jquery-3.3.1.min.js"></script>
  <script src="./js/bootstrap.min.js"></script>

</head>
<body>

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
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">게시판</a></li>
        <li><a href="#">공지사항</a></li>
        <li><a href="#">로그인</a></li>
        <li><a href="#">포토갤러리</a></li>
        <li><a href="#">메일보내기</a></li>
        <li><a href="#">게시판(MVC)</a></li>
        <li><a href="#">로그인(MVC)</a></li>
      </ul>
    </div>
  </div>
</nav>
<!-- Navbar 메인카테고리 끝 -->
<!-- Container Start -->
<div class="container-fluid bg-2 text-center"> 
  <div class="row">
    <div class="col-sm-12">
    
<!--     ---------------분할----------------- -->
    
    </div>
  </div>
</div><!-- Container end -->


<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  <p>하하하하하<a href="https://www.naver.com">네이버로가자</a></p> 
</footer>

</body>
</html>
