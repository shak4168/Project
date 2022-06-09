<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%-- <html lang="ko">
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="../resources/css/bootstrap.css">
	<script type="text/javascript" src="../resources/js/bootstrap.js"></script>
	 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 
	<c:if test='${not empty message }'>
		<script>
		window.onload=function()
		{
		  result();
		}
		
		function result(){
			alert("아이디나 비밀번호가 틀립니다. 다시 로그인해주세요");
		}
	
		</script>
	</c:if>
	

    
        <title>로그인 / 회원가입 폼 템플릿</title>
        <link rel="stylesheet" href="../resources/css/style_login.css">
 	</head>
 
    <body>
        <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">LOG IN</button>
                    <button type="button" class="togglebtn" onclick="register()">REGISTER</button>
                </div>
                <div class="social-icons">
                    <img src="../resources/img/fb.png" alt="facebook">
                    <img src="../resources/img/tw.png" alt="twitter">
                    <img src="../resources/img/gl.png" alt="google">
                </div>
                <form id="login" action="" class="input-group">
                    <input type="text" class="input-field" placeholder="User name or Email" required>
                    <input type="password" class="input-field" placeholder="Enter Password" required>
                    <input type="checkbox" class="checkbox"><span>Remember Password</span>
                    <button class="submit">Login</button>
                </form>
                <form id="register" action="" class="input-group">
                    <input type="text" class="input-field" placeholder="User name or Email" required>
                    <input type="email" class="input-field" placeholder="Your Email" required>
                    <input type="password" class="input-field" placeholder="Enter Password" required>
                    <input type="checkbox" class="checkbox"><span>Terms and conditions</span>
                    <button class="submit">REGISTER</button>
                </form>
            </div>
        </div>
         <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
        </script>
    </body>
</html> --%>




<html lang="ko">
<head>

	<c:if test='${not empty message }'>
		<script>
		window.onload=function()
		{
		  result();
		}
		
		function result(){
			alert("아이디나 비밀번호가 틀립니다. 다시 로그인해주세요");
		}
	
		</script>
	</c:if>
	
	<title>로그인</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="../resources/login/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="../resources/login/fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="../resources/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="../resources/login/css/main.css">

</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="${contextPath}/member/loginCheck.do" method="post">
					<span class="login100-form-title p-b-26">
						환영합니다.
					</span>
					<span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-font"></i>
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
						<input class="input100" type="text" name="user_id">
						<span class="focus-input100" data-placeholder="Id"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input class="input100" type="password" name="user_pw">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								로그인
							</button>
						</div>
					</div>

					<div class="text-center p-t-115">
						<span class="txt1">
							계정이 없으신가요?
						</span>

						<a class="txt2" href="${contextPath}/member/addMember.do">
							회원가입
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
	<script src="../resources/login/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="../resources/login/vendor/animsition/js/animsition.min.js"></script>
	<script src="../resources/login/vendor/bootstrap/js/popper.js"></script>
	<script src="../resources/login/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../resources/login/vendor/select2/select2.min.js"></script>
	<script src="../resources/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="../resources/login/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="../resources/login/vendor/countdowntime/countdowntime.js"></script>
	<script src="../resources/login/js/main.js"></script>

</body>


<%-- <body class="text-center">

	<main class="form-signin">
		<form action="${contextPath}/member/loginCheck.do" method="post">
			<div>
			<a class="navbar-brand" href="${contextPath}/index.do">쇼핑몰</a>
			</div>
			
			<h1 class="h3 mb-3 fw-normal" align="center">로그인을 해주세요.</h1>

			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="아이디" name="user_id"> <label for="floatingInput"></label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"
					placeholder="비밀번호" name="user_pw"> <label
					for="floatingPassword"></label>
			</div>

			<div class="checkbox mb-3">
					<a href="#">아이디 찾기</a>
					<a href="#">비밀번호 찾기</a>
					<a href="${contextPath}/member/addMember.do">회원가입</a>
					<a href="#">고객센터</a>
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
			<p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>



		</form>
	</main>

</body> --%>
</html>

