<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   response.setHeader("pragma", "No-cache");
   response.setHeader("Cache-Control", "no-cache");
   response.addHeader("Cache-Control", "no-store");
   response.setDateHeader("Expires", 1L);
%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../include/incMeta.jsp" %>
</head>
<script>
	$(document).ready(function() {
		pagingAction();
	});
	
	function pagingAction() {
		const pagingContainer = $('.paging');
		let pagingAnchor = pagingContainer.find('li > button');
		pagingAnchor.on('click', function(e) {
			const pagingWrap = $(this).parents('ul');
			let curPageNum = $(this).data('page');	
			let titleKeyword = $('[name="title_keyword"]').val();
			let wirterKeyword = $('[name="wirter_keyword"]').val();
			if (curPageNum == 'firstPage') {
				return false;
			}			
			pagingWrap.wrap('<form></form>');
			pagingWrap.parent('form').attr({
				'id': 'paging_form',
				'action': '/board/list',
				'method': 'post'
			});
			pagingWrap.prepend('<input id="cur_page" />');
			pagingWrap.prepend('<input id="title_keyword" />');
			pagingWrap.prepend('<input id="wirter_keyword" />');
			pagingWrap.find('#cur_page').attr({
				'type': 'hidden',
				'value': curPageNum,
				'name': 'curPage'
			});
			pagingWrap.find('#title_keyword').attr({
				'type': 'hidden',
				'value': titleKeyword,
				'name': 'title_keyword'
			});
			pagingWrap.find('#wirter_keyword').attr({
				'type': 'hidden',
				'value': wirterKeyword,
				'name': 'wirter_keyword'
			});
		});
	}
</script>
<body>
	<div class="wrapper">
		<%@ include file="../layout/header.jsp" %>
		<section class="content_wrap">
			<article class="content_box table_container">
				<div class="tit_wrap">
					<div class="tit_box">
						<h2 class="tit">게시판</h2>
					</div>
				</div>
				<div class="table_wrap">
					<div class="table_search_wrap">
						<form action="/board/list" method="post">
							<table class="search_table">
								<caption>검색 테이블</caption>
								<colgroup>
									<col style="width: 120px;"/>
									<col/>
									<col style="width: 120px;"/>
									<col/>
									<col style="width: 140px;"/>
								</colgroup>
								<tbody>
									<tr>
										<th>
											<label for="serchItem">제목</label>
										</th>
										<td>
											<input id="serchItem" class="inp type_01" type="text" name="title_keyword" value="${paging.title_keyword}" />
										</td>
										<th>
											<label for="wirter">작성자</label>
										</th>
										<td>
											<input id="wirter" class="inp type_01" type="text" name="wirter_keyword" value="${paging.wirter_keyword}" />
										</td>
										<td>
											<button class="search_btn">검색</button>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
					<div class="table_wrap">
						<table class="type01">
							<caption>게시물목록</caption>
							<colgroup>
								<col style="width: 100px;" />
								<col />
								<col style="width: 200px;" />
								<col style="width: 300px;" />
								<col style="width: 100px;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="row">번호</th>
									<th scope="row">제목</th>
									<th scope="row">작성자</th>
									<th scope="row">작성날짜</th>
									<th scope="row">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${paging.totalRowCount != 0}">
									<c:forEach items="${list}" var="list" varStatus="status">
										<tr>
											<td>${ ((paging.curPage - 1) * paging.rowSizePerPage) + status.count}</td>
											<td>
												<form action="/board/detail" method="post" class="detail_btn_wrap">
													<input type="hidden" name="board_num" value="${list.board_num}" />
													<c:if test="${list.diff_date < 2}">
														<span class="new_icon"></span>
													</c:if>
													<button type="submit">${list.board_title}</button>
												</form>
											</td>
											<td>${list.board_writer}</td>
											<td>${list.board_date}</td>
											<td>${list.view_count}</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${paging.totalRowCount == 0}">
									<tr>
										<td class="table_no_data" colspan="5">검색 결과 없습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<div class="paging">
					<ul>
						<c:choose>
								<c:when test="${paging.curPage eq 1}">
									<li>
										<button data-page="firstPage">&laquo;</button>
									</li>
									<li>
										<button data-page="firstPage">&lt;</button>
									</li>
								</c:when>
								<c:otherwise>										
									<li>
										<button data-page="1">&laquo;</button>
									</li>
									<li>
										<button data-page="${paging.curPage - 1}">&lt;</button>
									</li>
								</c:otherwise>
						</c:choose>
						<c:forEach begin="${paging.firstPage}"  end="${paging.lastPage}" var="i">
							<c:choose>
								<c:when test="${i == paging.curPage}">
									<li class="active">
										<button data-page="${i}">${i}</button>
									</li>
								</c:when>
								<c:when test="${i == 0}">
									<li class="active">
										<button data-page="1">1</button>
									</li>
								</c:when>
								<c:otherwise>
									<li>
										<button data-page="${i}">${i}</button>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${paging.curPage eq paging.totalPageCount}">
								<li>
									<button onclick="return false;">&gt;</button>
								</li>
								<li>
									<button onclick="return false;">&raquo;</button>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<button data-page="${ paging.curPage + 1 }">&gt;</button>
								</li>
								<li>
									<button data-page="${ paging.totalPageCount }">&raquo;</button>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div class="btn_wrap right">
					<form action="/home" method="post" class="btn_box">
						<a href="/home">홈</a>
					</form>
					<form action="/board/form" method="post" class="btn_box">
						<button>등록</button>
					</form>
				</div>
			</article>
		</section>		
	</div>
</body>
</html>