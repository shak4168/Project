<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<%@ include file="../config/header.jsp"%>
<script>
/* 
function execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ''; // 도로명 조합형 주소 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if(data.buildingName !== '' && data.apartment === 'Y'){
        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
      }
      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if(extraRoadAddr !== ''){
        extraRoadAddr = ' (' + extraRoadAddr + ')';
      }
      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
      if(fullRoadAddr !== ''){
        fullRoadAddr += extraRoadAddr;
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
      document.getElementById('roadAddress').value = fullRoadAddr;
      document.getElementById('jibunAddress').value = data.jibunAddress;

      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
      if(data.autoRoadAddress) {
        //예상되는 도로명 주소에 조합형 주소를 추가한다.
        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

      } else if(data.autoJibunAddress) {
          var expJibunAddr = data.autoJibunAddress;
          document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
      } else {
          document.getElementById('guide').innerHTML = '';
      }
      
     
    }
  }).open();
}
 */
	function fn_passwordConfirm() {
		var password = document.getElementById('user_pw');					//비밀번호 
		var passwordConfirm = document.getElementById('_user_pw');	//비밀번호 확인 값
		var confrimMsg = document.getElementById('confirmMsg');				//확인 메세지
		var correctColor = "#00ff00";	//맞았을 때 출력되는 색깔.
		var wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔
		
		if(password.value == passwordConfirm.value){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
			confirmMsg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
			confirmMsg.innerHTML ="비밀번호 일치";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
		}else{
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML ="비밀번호 불일치";
		}
	}

	function fn_overlapped() {
		var user_id = $("#user_id").val();
		if (user_id == '') {
			alert("ID를 입력하세요");
			return;
		}
		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/member/overlapped.do",
			dataType : 'json',
			data : {
				user_id : user_id
			}, // 키 : 값
			success : function(result) {
				 				
				if(result == 0) {
					alert("사용가능한 아이디 입니다.");
				} else {
					alert("중복된 아이디 입니다.");					
				
				}
			},
			error : function(result) {
				console.log("result : " + JSON.stringify(result));
				alert("에러가 발생했습니다.");
			}
		}); //end ajax	 
		

	}
 
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-9 col-lg-8 mx-auto">
				<h3 class="login-heading mb-4">회원가입</h3>
				<form action="${contextPath}/member/addMemberCheck.do" method="post">
				
					<div class="form-floating mb-3" style="width:70%; display:inline-block; float: left;">
						<input type="text" class="form-control" name="user_id" id="user_id" placeholder="id">
					</div>
					
					<div style="float: left; height: 1px">
						<input type="button" id="btnOverlapped" value="중복체크" onClick="fn_overlapped()" >							 
					</div>
					
					<div class="form-floating mb-3" style="width:70%";>
						<input type="password" class="form-control" id="user_pw"
							name="user_pw" placeholder="비밀번호 입력"> 
					</div>
					
					<div class="form-floating mb-3" style="width:70%";>
						<input type="password" class="form-control" id="_user_pw"
							name="_user_pw" placeholder="비밀번호 확인"
							onkeyup="fn_passwordConfirm()"> <span id="confirmMsg"></span>
					</div>
					
					<div class="form-floating mb-3" style="width:70%";>
						<input type="text" class="form-control" id="user_name"
							name="user_name" placeholder="name"> 
					</div>
					<div class="form-floating mb-3" style="width:70%";>
						<input type="email" class="form-control" id="user_email"
							name="user_email" placeholder="email"> 
					</div>
					<div class="form-floating mb-3" style="width:70%";>
						<input type="text" class="form-control" id="user_tel"
							name="user_tel" placeholder="tel">
					</div>
					<div class="form-floating mb-3" style="width:80%";>
						<input type="text" class="form-control" id="user_address"
							name="user_address" placeholder="address"> 
					</div>

		<tr>
			<td>
				<input type="submit" class="btn btn-primary" value="회원 가입">
				<input type="reset" class="btn btn-primary" value="다시입력">
				<input type="button" class="btn btn-primary" value="취소" onClick="location.href='${contextPath}/index.do'"/> 
			</td>
		</tr>
				</form>
			</div>
		</div>
	</div>


	<%-- <h3>회원가입</h3>
	
	<div id="detail_table">
		<table>
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join">아이디</td>
					<td>
					  <input type="text" name="user_id" id="user_id" size="20"/>
					  <
					</td>	
				</tr>
				
				<tr class="dot_line">
					<td class="fixed_join">비밀번호</td>
					<td><input name="user_pw" type="password" size="20" /></td>
				</tr>
				
				<tr class="dot_line">
					<td class="fixed_join">이름</td>
					<td><input name="user_name" type="text" size="20" /></td>
				</tr>
								
				<tr class="dot_line">
					<td class="fixed_join">전화번호</td>
					<td><input  size="20%" type="text" name="user_tel" /></td>
				</tr>
				
				<tr class="dot_line">
					<td class="fixed_join">이메일(e-mail)</td>
					<td><input size="20%"   type="email" name="user_email" /></td> 
				</tr>
				
				<tr class="dot_line">
					<td class="fixed_join">주소</td>
					<td>
					   <input type="text" id="user_address" name="user_address" size="20%">
					  
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		<div class="clear">
		<br><br>
		<table align=center>
		<tr >
			<td >
				<input type="submit" class="btn btn-primary" value="회원 가입">
				<input type="reset" class="btn btn-primary" value="다시입력">
				<input type="button" class="btn btn-primary" value="취소" onClick="location.href='${contextPath}/index.do'"/> 
			</td>
		</tr>
	</table>
	</div>
</form> --%>
</body>
<%@ include file="../config/footer.jsp"%>
</html>