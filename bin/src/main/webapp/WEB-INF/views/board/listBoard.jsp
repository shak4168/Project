<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%@ include file="../config/header.jsp" %>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
function boardView(idx) {
	var url = '/board/boardView.do';
	
	$('#board_idx').val(idx);
	
	$('#frm').attr('action', url);
	$('#frm').submit();
}


function fn_search() {
	
	$('#search').submit();
	
}



</script>


  <title>공지사항</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>


<form id="frm" action="${contextPath}/board/board.do" method="POST">
<input type="hidden" id="board_idx" name="board_idx" value=""/>	
<div class="container">
  <h2>공지사항</h2>
  <table class="table" align="center", width="80%">
    <thead>
      <tr align="center">
        <th width="10%">글번호</th>
        <th width="50%">제목</th>
        <th>작성자</th>
        <th>작성일</th> 
      </tr>
    </thead>
    <tbody>
     	<c:choose>
     		<c:when test="${not empty boardList}">
     			<c:forEach var="board" items="${boardList }" varStatus="boardNum">
     				<tr align="center">
     				<td width="10%">${boardNum.count }</td>
     				<td width="50%"><a href="#" onClick="boardView(${board.board_idx});"> ${board.board_title }</a></td>
     				<td width="10%">${board.user_id}</td>
     				<td width="10%">${board.write_date}</td>
     				</tr>
     			</c:forEach>
     		</c:when>
     		<c:when test="${empty boardList}">
	     		<tr> 	
	     			<td colspan="4">
	     			<p align="center">
	     				<b><span>등록된 글이 없습니다.</span></b>
	     			</p>
	     			</td>
	     		</tr>
     		</c:when>
     	</c:choose>
    </tbody>
    <tr>
    	<td>
<%--     	  	<<c:if test="${session != null }"> --%>
				<div class="confirm" style="float: left; width: 10%;">
					<input type="button" class="btn btn-success" value="등록하기" onClick="location.href='${contextPath}/board/addBoard.do'" />
				</div>
			<%-- </c:if> --%>
    	</td>
		<td colspan=2>
			<div class="search-wrap" style="float: left; width: 80%;">
				<input type="text" class="form-control" name="search_string"
					id="search">
			</div>
			<div style="float: left; width: 20%;">
				<button onClick="fn_search()" class="btn btn-primary">검색</button>
			</div>
		</td>
    	<td>
    		<div style="float: left; width: 10%;">
				 <input type="button" class="btn btn-success" value="뒤로가기" onClick="location.href='${contextPath}/index.do'" />
			</div>
 
    	<td>
    </tr>
    

  </table>	

			<div style="display: block; text-align: center;">		
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a href="/board/board.do?nowPage=${p }">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>

		</div>		
</form>

</body>
</html>
<%@ include file="../config/footer.jsp" %>   