<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header id="header" class="header">
	<div class="logo_wrap">
		<h1>JSP MVC 게시판</h1>
	</div>
	<nav id="navigation" class="header">
		<ul>
			<li>
				<form action="/" method="post">
					<button type="submit">메인</button>
				</form>
			</li>
			<li>
				<form action="/board/list" method="post">
					<button type="submit">게시판</button>
				</form>
			</li>
		</ul>
	</nav>
</header>