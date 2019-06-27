<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="adminAuth.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminLmenu.jsp</title>
<style>
a:link    { text-decoration:none; color:blue;}
a:visited { text-decoration:none; color:black;}
a:hover   { text-decoration:underline; color:blue;}
a:active  { text-decoration:underline; color:black;}
</style>
</head>
<body>
 <div align="center"> 
 <img src="../images/k2.png" width="200">
 <br/>
 <table width="100%">
  <tr>
    <td align=center><strong>관 / 리 / 자 / 메 / 뉴</strong></td>
  </tr>
  <tr>
    <td height=3 bgcolor=#808080></td>
  </tr>
  <tr>
    <td align="right"><a href="adminLogout.jsp" target="_top">로그아웃</a></td>
  </tr>
  <tr>
    <td height=1 bgcolor=#808080></td>
  </tr>
  <tr>
    <td><a href="bbs/bbs_fra.jsp" target="sub">■ 게시판관리</a></td>
  </tr>
  <tr>
    <td height=1 bgcolor=#808080></td>
  </tr>
  <tr>
    <td><a href="mem/mem_fra.jsp" target="sub">■ 회원관리</a></td>
  </tr>
  <tr>
    <td height=1 bgcolor=#808080></td>
  </tr>
  <tr>
    <td><a href="공지관리.jsp" target="sub">■ 공지사항관리</a></td>
  </tr>
  <tr>
    <td height=1 bgcolor=#808080></td>
  </tr>
  </table>
</div>  
</body>
</html>