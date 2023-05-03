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
<title>상세보기</title>
</head>
<script>
	$(document).ready(function() {
		const commentEnrollBox = $('#comment_enroll_box');
		const commentEnrollBtn = $('#comment_enroll_btn');
		let detailInfoBoardNum = $('#detailInfo_board_num');
		commentEnrollBtn.on('click', function() {
			$.ajax({
				url: '/comment/write',
				type: 'post',
				data: commentEnrollBox.serialize(),
				dataType : "JSON",
				success: function(checkedNumber) {					
					if (checkedNumber > 0) {
						alert('댓글 등록 완료하였습니다.');
						detailInfoBoardNum.wrap('<form></form>');
						detailInfoBoardNum.parent('form').attr({
							'action': '/board/detail',
							'method': 'post'
						});
						detailInfoBoardNum.parent('form').submit();
					} else {
						alert('댓글 등록을 실패하였습니다.')
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
			<article class="content_box table_detail_container">
				<div class="tit_wrap">
					<div class="tit_box txt_center">
						<h2 class="tit">${detailInfo.board_title}</h2>
					</div>
				</div>
				<div class="table_wrap">
					<table class="type02">			
						<colgroup>
							<col />
							<col />
							<col />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">작성자</th>
								<td>${detailInfo.board_writer}</td>
								<th scope="row">날짜</th>
								<td>${detailInfo.board_date}</td>
							</tr>
							<tr>
								<th class="detail_tit" scope="col" colspan="4">내용</th>
							</tr>
							<tr>
								<td class="detail_content" colspan="4">${detailInfo.board_content}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="comment_container">					
					<div class="comment_wrap">
						<form id="comment_enroll_box" class="comment_box">
							<div class="comment_write_box">
								<div class="tit_box">
									<h3>댓글 작성</h3>
								</div>
								<div class="writer_box">
									<div class="txt_box">
										<label for="commentContent" class="hidden">댓글</label>
										<textarea id="commentContent" name="comment_content" placeholder="댓글을 입력해주세요!"></textarea>
									</div>
									<div class="tit_box">
										<label for="commentWriter">작성자</label>
										<input id="commentWriter" name="comment_writer" type="text" placeholder="작성자를 입력해주세요" />
									</div>
								</div>
								<div class="btn_wrap right">
									<div class="btn_box">
										<button type="button" id="comment_enroll_btn">등록</button>
									</div>
								</div>
							</div>							
							<input id="detailInfo_board_num" type="hidden" name="board_num" value="${detailInfo.board_num}" />
						</form>
						<div class="comment_box comment_view">
							<c:forEach items="${commentList}" var="commentList" varStatus="status">
								<div class="comment_view_box">
									<div class="view_box">
										<div class="txt_box">
											<div class="comment_writer_box">
												<span class="writer">${commentList.comment_writer}</span>
											</div>
											<div class="comment_text_box">
												<span class="comment_text">${commentList.comment_content}</span>
											</div>
											<div class="comment_date_box">
												<span class="comment_date">${commentList.comment_date}</span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="btn_wrap right">		
					<form action="/board/list" method="post" class="btn_box">
						<button>목록</button>
					</form>
					<form action="/board/editPage" method="post" class="btn_box">
						<input type="hidden" name="board_num" value="${detailInfo.board_num}" />
						<button>수정</button>
					</form>
					<form action="/board/delete" method="post" class="btn_box">
						<input type="hidden" value="${detailInfo.board_num}" name="board_num" />						
						<button>삭제</button>
					</form>
				</div>
			</article>
		</section>
	</div>
</body>
</html>