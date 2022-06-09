<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<script type="text/javascript">
	var loopSearch=true;
	function keywordSearch(){
		if(loopSearch==false)
			return;
	 var value=document.frmSearch.searchWord.value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/goods/keywordSearch.do",
			data : {keyword:value},
			success : function(data, textStatus) {
			    var jsonInfo = JSON.parse(data);
				displayResult(jsonInfo);
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}
	
	function displayResult(jsonInfo){
		var count = jsonInfo.keyword.length;
		if(count > 0) {
		    var html = '';
		    for(var i in jsonInfo.keyword){
			   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
		    }
		    var listView = document.getElementById("suggestList");
		    listView.innerHTML = html;
		    show('suggest');
		}else{
		    hide('suggest');
		} 
	}
	
	function select(selectedKeyword) {
		 document.frmSearch.searchWord.value=selectedKeyword;
		 loopSearch = false;
		 hide('suggest');
	}
		
	function show(elementId) {
		 var element = document.getElementById(elementId);
		 if(element) {
		  element.style.display = 'block';
		 }
		}
	
	function hide(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.style.display = 'none';
	   }
	}

</script>
        
<html lang="ko">
<head>
  <title>스프링 게시판</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>


<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <ul class="navbar-nav">
    
    <li class="nav-item">
      <a class="nav-link disabled">스프링게시판</a> 
    </li>
  
    <li class="nav-item active">
      <a class="nav-link" href="${contextPath}/index.do">Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${contextPath}/board/board.do">게시판</a>
    </li>
  </ul>
     <c:if test="${!empty isLogOn}">
  	  	<form class="user_login">
		<button class="btn btn-outline-blue" type="submit">
			<a href="${contextPath}/member/logout.do">로그아웃</a>
		</button>
	</form>
  </c:if>
  <c:if test="${empty isLogOn}">
  	<form class="user_login">
		<button class="btn btn-outline-blue" type="submit">
			<a href="${contextPath}/member/login.do">로그인</a>
		</button>
	</form>
	<form class="user_join">
		<button class="btn btn-outline-blue" type="submit">
			<a href="${contextPath}/member/addMember.do">회원가입</a>
		</button>
	</form>
  </c:if>

</nav>



</body>
</html>