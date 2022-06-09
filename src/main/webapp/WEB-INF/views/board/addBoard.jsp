<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%@ include file="../config/header.jsp" %>


<%
  request.setCharacterEncoding("UTF-8");
%> 

<!DOCTYPE html>
<html lang="ko">
<head>

<script type="text/javascript">
function board_insert(){
	var Form = $("#board_reg")[0];
	var params = new FormData(Form);
	  $.ajax({
          type : "POST",            // HTTP method type(GET, POST) 형식이다.
          url : "Board_insert.do",      // 컨트롤러에서 대기중인 URL 주소이다.
          data : params,            // Json 형식의 데이터이다.
          contentType : false,
          processData : false,
          success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
            alert("등록되었습니다");
          	location.href="/board/board.do";
          },
          error : function(request,status,error){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
              alert("통신 실패.");
        	  //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }
      });
}


</script>




<title>공지사항 등록</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<div class="container">
		<form id="board_reg" onsubmit="return false()" enctype="multipart/form-data">
			
			<input type="hidden" name="board_type" value="1">
			<input type="hidden" name="user_idx" value="${userIdx}">
		
			<div class="form-group">
				<label for="usr">제목 : </label> <input type="text" class="form-control" id="title" name="board_title">
			</div>
			<div class="form-group">
				<label for="comment">내용 : </label>
				<textarea class="form-control" rows="5" id="comment" name="board_content" rows ="10" cols="70"></textarea>
			</div>

			<div class="form-group">
				<label for="comment">파일 추가</label>
				<input type="file" class="form-control" id="board_file" name="board_file">
			</div>
			
		</form>
		<button type="submit" class="btn btn-success" onClick="board_insert()">등록하기</button>
		<input type="button" class="btn btn-success" value="취소하기" onClick="history.back()"> 
	</div>

</body>

</html>