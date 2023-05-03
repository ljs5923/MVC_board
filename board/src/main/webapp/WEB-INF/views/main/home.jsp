<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="../include/incMeta.jsp" %>
<title>Home</title>
</head>
<script>
	$(document).ready(function() {
		let bestBoardBtn = $('.bestBoardBtn');
		bestBoardBtn.on('click', function() {
			let _this = $(this)
			let boardNum = _this.data('number');			
			_this.wrap('<form></form>');
			_this.parent('form').prepend('<input />');
			_this.parent('form').find('> input').attr({
				type: 'hidden',
				name: 'board_num',
				value: boardNum
			});
			_this.parent('form').attr({
				'action': '/board/detail',
				'method': 'post'
			});
		});
	});
</script>
<body>
	<div class="wrapper">
		<%@ include file="../layout/header.jsp" %>
		<section class="content_wrap grid_wrap">
			<article class="content_box">
				<div class="tit_wrap">
					<div class="tit_box">
						<h2 class="tit">게시물 조회순 BEST5</h2>
					</div>
				</div>
				<div class="ranking_wrap">
					<ul class="ranking_lists">
						<c:forEach var="rankingList" items="${rankingList}" varStatus="status">
							<li class="ranking_list">
								<button class="bestBoardBtn view" data-number="${rankingList.board_num}">
									<c:choose>
										<c:when test="${status.count < 2}">
											<span class="number frist">${status.count}</span>
										</c:when>
										<c:when test="${status.count < 3}">
											<span class="number second">${status.count}</span>
										</c:when>
										<c:otherwise>
											<span class="number">${status.count}</span>
										</c:otherwise>
									</c:choose>									
									${rankingList.board_title}
								</button>
							</li>
						</c:forEach>
					</ul>
				</div>
			</article>
			<article class="content_box">
				<div class="tit_wrap">
					<div class="tit_box">
						<h2 class="tit">게시물 댓글순 BEST5</h2>
					</div>
				</div>
				<div class="ranking_wrap">
					<ul class="ranking_lists">
						<c:forEach var="commentRankingList" items="${commentRankingList}" varStatus="status">
							<li class="ranking_list">
								<c:choose>
									<c:when test="${commentRankingList.board_num == -1}">
										<button class="bestBoardBtn comment" disabled>
											<c:choose>
												<c:when test="${status.count < 2}">
													<span class="number frist">${status.count}</span>
												</c:when>
												<c:when test="${status.count < 3}">
													<span class="number second">${status.count}</span>
												</c:when>
												<c:otherwise>
													<span class="number">${status.count}</span>
												</c:otherwise>
											</c:choose>
											${commentRankingList.board_title}
										</button>
									</c:when>
									<c:otherwise>
										<button class="bestBoardBtn comment" data-number="${commentRankingList.board_num}">
											<c:choose>
												<c:when test="${status.count < 2}">
													<span class="number frist">${status.count}</span>
												</c:when>
												<c:when test="${status.count < 3}">
													<span class="number second">${status.count}</span>
												</c:when>
												<c:otherwise>
													<span class="number">${status.count}</span>
												</c:otherwise>
											</c:choose>
											${commentRankingList.board_title}
										</button>
									</c:otherwise>
								</c:choose>
							</li>
						</c:forEach>
					</ul>
				</div>
			</article>
		</section>
	</div>
</body>
</html>
