<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   response.setHeader("pragma", "No-cache");
   response.setHeader("Cache-Control", "no-cache");
   response.addHeader("Cache-Control", "no-store");
   response.setDateHeader("Expires", 1L);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../include/incMeta.jsp" %>
<title>Login</title>
</head>
<script>
	$(document).ready(function() {
		loginAction();
	});
	
	function loginAction() {
		const loginForm = $('#login_form');
		const loginBtn = $('#login_btn');
		loginBtn.on('click', function() {
			let val_id = loginForm.find('#user_id').val();
			let val_pw = loginForm.find('#user_pw').val();
			$(this).wrap('<form></form>');
			$(this).parent('form').append('<input type="hidden" id="post_user_id" />');
			$(this).parent('form').append('<input type="hidden" id="post_user_pw" />');
			$(this).parent('form').find('#post_user_id').attr('name', 'user_id').val(val_id);
			$(this).parent('form').find('#post_user_pw').attr('name', 'user_pw').val(val_pw);
			$(this).parent('form').attr({
				id: 'login_btn_form',
				action: '/login',
				method: 'post'
			});
			$(this).parent('form').submit();
		});
	}
</script>
<body>
	<div class="login_wrap">
		<div class="login_container">
			<div class="login_box">
				<div class="logo_wrap">
					<h2>JSP <br>MVC</h2>
				</div>
			</div>
			<form id="login_form" class="login_box">
				<div class="login_inp_wrap">
					<input id="user_id" class="login_inp" name="user_id" type="text" placeholder="아이디를 입력해주세요" />
					<c:if test="${ errorMSG == 'error' }">
						<script>
							$(document).ready(function() {
								alert('로그인에 실패하였습니다.');
							});
						</script>
					</c:if>
				</div>
				<div class="login_inp_wrap">
					<input id="user_pw" class="login_inp" name="user_pw" type="password" placeholder="비밀번호를 입력해주세요" />
				</div>
			</form>
			<div class="login_box">
				<div class="login_btn_wrap">
					<button type="button" id="login_btn" class="login_btn">로그인</button>
				</div>
				<div class="login_btn_wrap">
					<button id="join_btn" class="login_btn">회원가입</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>