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
<title>게시물 등록</title>
<script>
	$(document).ready(function() {
		postEnrollmentAction();
	});
	function postEnrollmentAction() {
		const postEnrollmentBtn = $('#postEnrollment');
		postEnrollmentBtn.on('click', function() {
			const writeForm = $('#writeForm');
			$.ajax({
				url: '/board/write',
				type: 'post',
				data: writeForm.serialize(),
				dataType : "JSON",
				success: function(checkedNumber) {
					if (checkedNumber > 0) {
						alert('게시물 등록을 완료 하였습니다.')
						writeForm.parents('.content_box').append('<form></form>');
						writeForm.parents('.content_box').find('> form').attr({
							'id': 'prevListForm',
							'action': '/board/list',
							'method': 'post'
						});
						writeForm.parents('.content_box').find('> form').submit();
					} else {
						alert('게시물 등록을 실패 하였습니다.')
					}					
				},
				error: function(error) {
					console.log(error)
				}
			});
		});
	}
</script>
</head>
<body>
	<div class="wrapper">
		<%@ include file="../layout/header.jsp" %>
		<section class="content_wrap">
			<article class="content_box table_write_container">
				<div class="tit_wrap">
					<div class="tit_box txt_center">
						<h2 class="tit">게시물 작성</h2>
					</div>
				</div>
					<form id="writeForm" name="writeForm" class="table_wrap">
						<table class="type02">
							<colgroup>
								<col />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th>
										<label for="title">제목</label>
									</th>
									<td>
										<input id="title" class="inp no_bd" type="text" name="board_title"/>
									</td>
								</tr>
								<tr>
									<th>
										<label for="writer">작성자</label>
									</th>
									<td>
										<input id="writer" class="inp no_bd" type="text" name="board_writer" />
									</td>
								</tr>
								<tr>
									<th scope="col">
										<label for="content">내용</label>
									</th>
									<td>
										<textarea id="content" class="inp no_bd" name="board_content"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<div class="btn_wrap right">
						<form action="/board/list" method="post" class="btn_box">
							<button>목록</button>
						</form>
						<div class="btn_box">
							<button id="postEnrollment">등록</button>
						</div>
					</div>
			</article>
		</section>
	</div>
</body>
</html>