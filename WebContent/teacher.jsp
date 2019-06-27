<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>My Web</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="./css/bootstrap.min.css">
  <link rel="stylesheet" href="./css/mystyle.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="./js/jquery-3.3.1.min.js"></script>
  <script src="./js/bootstrap.min.js"></script>
  <style>
  .time {
      background-color:#2f2f2f;
      color:#ffff00;
	  border:0; 
	  font:20px; 
	  text-align:center;
	  font-weight:bold;
  }
  #myfilm{
      position:relative;
      left:0px;
      top:10px;
	  background-color:#ffffff;
      width:100%;
      height:100px;
      overflow:hidden;
      margin: 0 auto;
  }   
  </style>
  <script>
  function showtime(){
	var today = new Date();
	var str = "";

    str += today.getFullYear() + ".";
    
	if(today.getMonth()+1<10){
		str += "0";
	}
    str += (today.getMonth()+1) + ".";

    if(today.getDate()<10) {
       str += "0";
    }       
	str += today.getDate();

	switch(today.getDay()) {
		case 0: str += " (일) "; break;
		case 1: str += " (월) "; break;
		case 2: str += " (화) "; break;
		case 3: str += " (수) "; break;
		case 4: str += " (목) "; break;
		case 5: str += " (금) "; break;
		case 6: str += " (토) "; break;
	}
	   
	if(today.getHours()<12)  {
         str += "AM ";
	} else {
         str += "PM ";
	}

	if(today.getHours()>=13)  {
         str += (today.getHours()-12)+":";
	} else {
         str += today.getHours()+":";
	}

	if(today.getMinutes()<10) {
         str += "0";
	} 		
	str += today.getMinutes()+":";

	if(today.getSeconds()<10) {
	      str += "0";
    } 
    str += today.getSeconds();

    document.myform.clock.value = str;

    timer1=setTimeout(showtime, 1000); //1초후 showtime함수 호출
  }//showtime() end
  
  var ctnt=[];
  ctnt[0] ="<img src='images/monkey.png' class='img-responsive img-square margin' style='display:inline' width='85'>";
  ctnt[1] ="<img src='images/crying.png' class='img-responsive img-square margin' style='display:inline' width='85'>";
  ctnt[2] ="<img src='images/angel.png' class='img-responsive img-square margin' style='display:inline' width='85'>";
  ctnt[3] ="<img src='images/devil.png' class='img-responsive img-square margin' style='display:inline' width='85'>";
  ctnt[4] ="<img src='images/smile.png' class='img-responsive img-square margin' style='display:inline' width='85'>";
  ctnt[5] ="<img src='images/face-grin.png' class='img-responsive img-square margin' style='display:inline' width='85'>";
  ctnt[6] ="<img src='images/face-wink.png' class='img-responsive img-square margin' style='display:inline' width='85'>";
  ctnt[7] ="<img src='images/face-kiss.png' class='img-responsive img-square margin' style='display:inline' width='85'>";
  ctnt[8] ="<img src='images/face-smile.png' class='img-responsive img-square margin' style='display:inline' width='85'>";
  ctnt[9] ="<img src='images/face-glasses.png' class='img-responsive img-square margin' style='display:inline' width='85'>";
  ctnt[10]="<img src='images/face-wink.png' class='img-responsive img-square margin' style='display:inline' width='85'>";
  ctnt[11]="<img src='images/face-kiss.png' class='img-responsive img-square margin' style='display:inline' width='85'>";

  function start() { //1) 그림배치
    for(idx=0; idx<ctnt.length; idx++) {
      document.write("<div id='area" + idx + "' style='position:absolute;top:0px;left:" + (90*idx) +"px'>");
      document.write(ctnt[idx]);
	   document.write("</div>");
	 }//for end

	 //3초후에 scroll함수 1번 호출
	 window.setTimeout(scroll, 1000);
  }//start() end

  function scroll() { //2)이미지 스크롤
    //alert(document.getElementById("area0").style);
	 //alert(document.getElementById("area0").style.left);
	 for(idx=0; idx<ctnt.length; idx++) {
	   var temp = document.getElementById("area" + idx).style;
	   temp.left = parseInt(temp.left) - 10 + "px";

      //이미지 순환
	   //id=myfilm의 왼쪽영역을 벗어난 맨 앞의 이미지를
	   //뒤로 보내기
	   if(parseInt(temp.left)<-90){
		 temp.left = 90 * (ctnt.length-1) + "px";
	   }

	 }//for end

	 timer2 = window.setTimeout(scroll, 500);

  }//scroll() end
  
  
  var timer1, timer2; //전역변수

  function killtime() {
	 clearTimeout(timer1);
	 clearTimeout(timer2);
  }//killtime() end  
  </script>

</head>

<body onload="showtime()" onunload="killtime()">
<!-- Navbar -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">HOME</a>
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

<!-- First Container -->
<div class="container-fluid bg-4 text-center">
	<!-- 디지털시계 -->
    <form name="myform">
      <input type="text" name="clock" size="20" class="time" readonly>
    </form>	
</div>

<!-- Second Container -->
<div class="container-fluid bg-3 text-center">
  <h3 class="margin">Welcome to MyWeb</h3>
  <img src="./images/cosmos1.jpg" class="img-responsive img-circle margin" style="display:inline" alt="Bird" width="300" height="280">  
</div>

<!-- Third Container (Grid) -->
<div class="container-fluid bg-3 text-center">    
  <div class="row">
    <div class="col-sm-12">
       <!-- 이미지 스크롤 시작 -->
       <div id='myfilm'>
         <script>
		    start();
         </script>
       </div>
       <!-- 이미지 스크롤 끝 -->
    </div>
  </div>
</div>

<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  Copyright &copy; 2019 myweb   
</footer>

</body>
</html>
