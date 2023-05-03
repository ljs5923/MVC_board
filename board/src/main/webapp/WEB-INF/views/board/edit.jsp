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
<title>게시물 수정</title>
</head>
<script>
	$(document).ready(function() {
		const edtiBtn = $('#edit_btn');
		edtiBtn.on('click', function() {			
			const editForm = $('#edit_form');
			let board_num = editForm.find('[name=board_num]').val();
			$.ajax({
				url: '/board/edit',
				type: 'post',
				data: editForm.serialize(),
				dataType: 'JSON',
				success: function(checkNumber) {
					if (checkNumber > 0) {
						alert('수정이 완료되었습니다.');
						edtiBtn.wrap('<form></form>');
						edtiBtn.parent('form').append('<input type="hidden" name="board_num"/>');
						edtiBtn.parent('form').find('[name=board_num]').val(board_num);
						edtiBtn.parent('form').attr({
							action: '/board/detail',
							method: 'post'
						});
						edtiBtn.parent('form').submit();
					} else {
						alert('수정 실패하였습니다.')
					}
				}
			})
		});
	});
</script>
<body>
	<div class="wrapper">
		<%@ include file="../layout/header.jsp" %>
		<section class="content_wrap">
			<article class="content_box table_edit_container">
					<div class="tit_wrap">
						<div class="tit_box txt_center">
							<h2 class="tit">수정 페이지</h2>
						</div>
					</div>
					<div class="table_wrap">
						<form id="edit_form" class="btn_box">
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
											<input id="title" class="inp no_bd" type="text" name="board_title" value="${detailInfo.board_title}"/>
										</td>
									</tr>
									<tr>
										<th class="detail_tit" scope="col" colspan="2">
											<label for="content">내용</label>
										</th>
									</tr>
									<tr>
										<td class="detail_content" colspan="2">
											<textarea id="content" class="inp no_bd" name="board_content">${detailInfo.board_content}</textarea>
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" value="${detailInfo.board_num}" name="board_num" />
						</form>
					</div>
					<div class="btn_wrap right">					
						<form action="/board/detail" method="post" class="btn_box">
							<input type="hidden" value="${detailInfo.board_num}" name="board_num" />
							<button>이전</button>
						</form>
						<div class="btn_box">							
							<button type="button" id="edit_btn">수정</button>
						</div>
					</div>
			</article>
		</section>
	</div>
</body>
</html>