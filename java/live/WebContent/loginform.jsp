<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	a{text-decoration:none}
	
 	
 	#rogo{width:200px;height:150;display:table;margin-left:auto;margin-right:auto;}
	#box{width:350px;height:300px;background:#F2F2F2;display:table;margin-left:auto;margin-right:auto;}
	
	
	#title{text-align:left;border-bottom:1px solid black;margin-left:20px;margin-right:20px;}
	#input{border:none;margin-left:20px;font-size:20px;font-weight:bold;}
	#login{color:white;width:80px;height:60px;background-color:#0B243B;}
	#search{text-align:center;}
	button{color:white;font-size:20px;font-weight:bold;width:150px;height:50px;background-color:#0B243B;display:table;margin-left:auto;margin-right:auto;}
	
</style>

</head>
<body>


	<img id="rogo" alt="살다로고" src="./img/살다.png">
	
	<div id=box>
	<div id= title>
	<h3>회원 로그인</h3>
	</div>

	<form action ="access" method="post"> <!--access(로그인)으로 이동-->
		&nbsp;
		&nbsp;
		&nbsp;
		<div id="input" style="display:flex">
			<div style="display:inline-block;text-align:right;">
			<div>
			ID&nbsp;&nbsp;<input type="text" name="id" id="idput"></input>
			</div>
			
			<div>
			PW&nbsp;<input type="text" name="pw" ></input>
			</div>
			</div>
			
			<div style="display:inline-block;">
			<input id="login" type="submit" value="로그인">
			</div>
			
		</div>
		&nbsp;
		&nbsp;
		&nbsp;
		<div id=search>
		&nbsp;
		<a href="SearchId">아이디찾기</a>&nbsp;|
		<a href="SearchPw">비밀번호 찾기</a><br>
		</div>
		&nbsp;
		&nbsp;
		<a href="joinfrm"><button>회원가입</button></a>
	
	</form>
	</div>
	
	
<script>
	var frm=document.joinform;
	//frm.longth(); 활용해서 반복문으로 값을 입력했는지 확인
	
	
	
	
</script>



</body>
</html>