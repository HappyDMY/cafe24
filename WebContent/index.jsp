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
  
  <link rel="stylesheet" href="./css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="./js/jquery-3.3.1.min.js"></script>
  <script src="./js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="./css/mystyle.css"/>  
  <script src="./js/Clock.js"></script>

</head>
 <body onload="showtime()" onunload="killtime()">
<div class="container-fluidclock bg-5 text-center">  
<!-- 시계 -->
     <input type="text" name="clock" id="clock"
            size="25" class="time" readonly>
 </div>
<!-- Navbar (메인카테고리) -->
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
        <li><a href="./bbs/bbsList.jsp">Board</a></li>
        <li><a href="#">Notice</a></li>
        <li><a href="./member/loginForm.jsp">Login</a></li>
        <li><a href="./pds/pdsList.jsp">Photo</a></li>
        <li><a href="./mail/mailForm.jsp">Mail</a></li>
        <li><a href="./bbs2/bbslist.do">Board(MVC)</a></li>
        <li><a href="./member2/loginform.do">Login(MVC)</a></li>
      </ul>
    </div>
  </div>
</nav>
<!-- Navbar (메인카테고리) 끝-->

<!-- 배경돌리기 -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="./images//jp.jpg" alt="New York" width="1200" height="700" style="margin:0 auto;">
        <div class="carousel-caption">
          <h3>Osaka</h3>
          <p>~~~~~~~~</p>
        </div>      
      </div>

      <div class="item">
        <img src="./images//jpb.jpg" alt="Chicago" width="1200" height="700" style="margin:0 auto;">
        <div class="carousel-caption">
          <h3>Fukuoka</h3>
          <p>!~!~!~!</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="./images//mel.jpg" alt="Los Angeles" width="1200" height="700" style="margin:0 auto;">
        <div class="carousel-caption">
          <h3>Melbourne</h3>
          <p>!!!!!!!!!!!</p>
        </div>      
      </div>
    </div>
      <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
    <!-- 배경돌리기 -->
    
    
    <!-- ------------------------------------ -->

<!-- First Container -->
<div class="container-fluid bg-2 text-center">
  <h3 class="margin">This is the first Container</h3>
  <img src="./images/jp.jpg" class="img-responsive img-circle margin" style="display:inline" alt="Bird" width="350" height="350">
  <h3>to the next Container</h3>
</div>

<!-- Second Container -->
<div class="container-fluid bg-1 text-center">
  <h3 class="margin">Welcome to My Web</h3>
  <p> 어서어서 오세요 </p>
  <p> We have created a fictional band website. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
  <a href="https://www.google.com/webhp?hl=ko&sa=X&ved=0ahUKEwi5urja5ezfAhXM7mEKHYK7ALwQPAgH" class="btn btn-default btn-lg">
    <span class="glyphicon glyphicon-search"></span> Search
  </a>
</div>

<!-- Third Container (Grid) -->
<div class="container-fluid bg-3 text-center">    
  <h3 class="margin">나의 공간</h3><br>
 </div>

<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  <p>Copyright &copy; 2019 myweb </p> 
</footer>

</body>
</html>
