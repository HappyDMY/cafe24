<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 pdsForm.jsp -->
<p>* 사진 올리기 *</p>
<form name="frmData" 
      method="post"
      enctype="multipart/form-data" 
      action="pdsIns.jsp" 
      onsubmit="return pdsCheck(this)" 
	  >

  <table border="1" style="margin: auto;">
  <tr> 
    <th colspan="2">파일 등록 (* 필수 입력사항)</th>
  </tr>
  <tr> 
    <td colspan="2" height="30"> </td>
  </tr>
  <tr> 
    <th width="97">성명*</th>
    <td width="5" ><input  style="color: black;" type="text" name="wname"> </td>
  </tr>
  <tr> 
    <th>제목*</th>
    <td><textarea style="color: black;" name="subject" rows='5' cols='30'></textarea></td>
  </tr>
  <tr> 
    <th>비밀번호*</th>
    <td><input  style="color: black;" type="password" name="passwd"   ></td>
  </tr>
  <tr> 
    <th>파일명*</th>
    <td><input  style="color: black;" type="file" name="filename"></td>
  </tr>
  <tr> 
     <td colspan="2" align="center">
        <input type="submit" value="전송">               
        <input type="reset"  value="취소">               
        <input type="button" value="목록"
               onclick="javascript:location.href='./pdsList.jsp'">
     </td>
  </tr>
  </table>
</form>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>