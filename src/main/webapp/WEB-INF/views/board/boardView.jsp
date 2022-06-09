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

/* 수정페이지 이동 함수 */
function boardUpdate(idx) {

	var url = '/board/boardUpdate.do';
	
	$('#board_idx').val(idx);
	
	$('#frm').attr('action', url);
	$('#frm').submit();
}

/* 삭제 함수 */
function boardDelete(idx) {
	
	$.ajax({
        type : "POST",
        url : "Board_delete.do",
        data : $("#frm").serialize(),
        dataType : "json",
        success : function(data){
          alert("삭제 되었습니다");
        	location.href="/board/board.do";
        },
        error : function(request,status,error){
          alert("로그인을 해주세요.");
          location.href="/member/login.do";
      	  //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}

</script>

<title>상세페이지</title>
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
		<form id="frm" method="POST">
			<div class="form-group">
				<label for="usr">제목 : </label> <c:out value="${boardView.board_title }" />
			</div>
			<div class="form-group">
				<label for="comment">내용 : </label>
				<c:out value="${boardView.board_content }" />
			</div>
			<div class="form-group">
				<label for="comment">첨부파일 : </label>
				<a href="${boardView.board_file_path }" download="${boardView.board_real_file }">${boardView.board_real_file }</a>
			</div>
			<input type="hidden" name="board_type" value="1">
			<input type="hidden" id="board_idx" name="board_idx" value="${boardView.board_idx}">
		</form>
		
		<button class="btn btn-success" onClick="boardUpdate(${boardView.board_idx})">수정</button>
		<button class="btn btn-success" onClick="history.back()">목록</button>
		<button class="btn btn-success" onClick="boardDelete(${boardView.board_idx})">삭제</button>
		
	</div>

</body>

</html>