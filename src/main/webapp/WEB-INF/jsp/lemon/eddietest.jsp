<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>老食頁面</title>
<link rel="stylesheet"
	href="${contextRoot}/cssLemon/oldfoodPage01_header.css">
<link rel="stylesheet"
	href="${contextRoot}/cssLemon/oldfoodPage01_navi.css">
<link rel="stylesheet"
	href="${contextRoot}/cssLemon/oldfoodPage01_contents_left.css">
<link rel="stylesheet"
	href="${contextRoot}/cssLemon/oldfoodPage01_contents_right.css">
<link rel="stylesheet"
	href="${contextRoot}/cssLemon/oldfoodPage01_base.css">
<link rel="stylesheet"
	href="${contextRoot}/js/fontawesome-free-6.0.0-web/css/all.min.css">
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<style>
.reviewer-navi.reviewer-navi--l .reviewer-navi__item.is-selected.is-selected.is-selected .reviewer-navi__target::after
	{
	width: 92%;
	margin-left: -46%;
}

.reviewer-navi__item.is-selected.is-selected.is-selected .reviewer-navi__target::after
	{
	position: absolute;
	left: 50%;
	bottom: 0;
	height: 3px;
	width: 85%;
	margin-left: 42.5%;
	background: #463f2d;
	content: '';
}

.reviewer-navi__item:last-child::after {
	background: transparent;
}

li {
	list-style: inherit;
}

ol, ul {
	list-style: none;
}

img {
	vertical-align: bottom;
}

div, p {
	word-wrap: break-word;
	overflow-wrap: break-word;
}

section {
	display: block;
}

h1, h2, strong, em {
	font-size: normal;
	font-weight: bold;
}

dt, span, dl, li, a, span, ul, div, h2, p, section {
	outline: 0;
	margin: 0;
	padding: 0;
	border: 0;
	font: inherit;
	vertical-align: baseline;
	background: transparent;
}

html {
	font-size: 80%;
}

.right {
	float: right;
	font-size: 20px;
	color: red;
}

.right:hover {
	color: black;
}

.like {
	font-size: 20px;
	text-align:center;
	
}
</style>
</head>
<body>

	<a id="pagetop" name="pagetop"></a>
	<div class="l-container p-header-wrapper p-header-wrapper--top">
		<div class="l-contents l-contents--fixed">
			<div class="person-header">
				<div class="person-header-title">
					<p>Le fabuleux destin d'Amelie Poulain</p>
				</div>
				<div id="welcome" class="person-header--nav js-welcome-wrapper">
					<a href="${contextRoot}/">
						<p>回首頁</p>
					</a>
				</div>
			</div>
		</div>
	</div>

	<div id="js-global-header-reserch" class="global-header-serch"
		style="padding-top: 0px;">
		<div class="l-container p-header-wrapper p-header-wrapper--bottom">
			<div class="l-contents l-contents--fixed">全站搜尋列</div>
		</div>
	</div>

	<!--Header * Start-->
	<div class="reviewer-header-wrap">
		<div class="reviewer-header">
			<div class="header-cover">
				<div class="person-reviewer-cover" id="cover-image">
					<div class="loading header-cover-loader">
						<div class="loader loader-tabelog-s"></div>
					</div>
					<div class="person-reviewer-cover-image">
						<div class="oldcrop-frame"
							style="overflow: hidden; position: relative; width: 980px; height: 340px;">
							<img class="crop-img js-crop-img oldcrop-image" data-width:="980"
								data-top="-108" data-left="0"
								style="position: absolute; width: 980px; left: 0px; top: -108px; opacity: 1;"
								alt="reviewer's cover image"
								src="<c:url value='/getPictureLemon/${memberPage.id}' />">
							<!-- image size=1470*981 -->
						</div>
					</div>
				</div>
				<div id="page-info" class="header-cover--info js-page-info">
					<p class="page-name">
						<c:out value="${reviewerPage.reviewer_title}" />
					</p>
					<p class="page-sub-title">
						<c:out value="${reviewerPage.reviewer_subtitle}" />
					</p>
				</div>
				<div class="header-cover__actions">
					<div class="reviewer-action-btns">
						<div class="reviewer-action-btns__navi">
							<div class="p-follow-btn reviewer-action-btns__navi-item">
								<div class="js-follow-btn-wrap" data-rvwr-id="2778702">
									<div class="js-follow-btn">
										<p
											class="p-follow-btn__target p-follow-btn__target--l reviewer-action-btns__navi-item-target"
											data-proc="follow">
											<span class="p-follow-btn__text">follow</span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="reviewer-action-btns__block">
							<div class="reviewer-block-btn">
								<a href="${contextRoot}/setReviewerPage">
									<p class="js-main-block-btn c-btn reviewer-block-btn__target">
										<span class="c-btn__text">s</span>
									</p>
								</a>
								<div></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="header-contents">
				<div class="header-contents__img-wrap">
					<div class="header-contents__img header-contents__img--l">
						<div id="reviewer-image"
							class="reviewer-image-box reviewer-image-box--1 js-reviewer-image js-upload-icon-image">
							<div id="js-reviewer-image-display">
								<img src="<c:url value='/getPhoto/${memberPage.id}' />"
									width="120" height="120">
							</div>
							<a
								class="reviewer-image-box__reimage js-change-prof-image js-upload-icon-change"
								id="hoverrr" style="display: none;" href="#">
								<button class="c-btn c-btn--s reviewer-image-box__reimage-btn">變更</button>
							</a>
						</div>
					</div>
				</div>
				<div class="header-contents__info header-contents__info--l">
					<div class="reviewer-status reviewer-status--top">
						<p class="reviewer-status__item">
							<span class="reviewer-status__nickname"> <strong
								class="reviewer-nickname fs18"><c:out
										value="${memberPage.memberName}" /></strong>
							</span> <span class="reviewer-status__attr">(${bdd}-<c:out
									value="${memberPage.city}" />)
							</span>
						</p>
						<p class="reviewer-status__occupation">
							<c:out value="${reviewerPage.reviewer_occupation}" />
						</p>
					</div>
					<div class="comment-prof">
						<span class="comment-prof__body"> <c:out
								value="${reviewerPage.reviewer_intro}" />
						</span> <span class="comment-prof__more"> <a class="c-link-arrow"
							href="${contextRoot}/reviewerPageIntro"> read more </a>
						</span>
					</div>
				</div>
				<div class="header-contents__counts">
					<div class="reviewer-counter">
						<dl class="reviewer-counter__item">
							<dt class="reviewer-counter__subject">
								<span class="reviewer-counter__label">喜好店家</span> <span
									class="c-icon-help c-icon-help--dark"> <span
									class="c-icon-help__btn">?</span> <span
									class="c-icon-help__tooltip-frame reviewer-counter__help">
										<span
										class="c-tooltip-bordered c-tooltip-bordered--top reviewer-counter__tooltip">
											お店に掲載されたろこみ数を表示しています </span>
								</span>
								</span>
							</dt>
							<dd class="reviewer-counter__data">
								<p class="reviewer-counter__data-count">
									<span class="reviewer-counter__data-num">44件</span>
								</p>
							</dd>
						</dl>
						<dl class="reviewer-counter__item">
							<dt
								class="reviewer-counter__subject reviewer-counter__subject--photo">
								<span class="reviewer-counter__label">照片</span>
							</dt>
							<dd class="reviewer-counter__data">
								<p class="reviewer-counter__data-count">
									<span class="reviewer-counter__data-num">473枚</span>
								</p>
								<p class="reviewer-counter__like-count">
									<span class="reviewer-counter__like-count-num">1,224</span>
								</p>
							</dd>
						</dl>
						<dl class="reviewer-counter__item">
							<dt
								class="reviewer-counter__subject reviewer-counter__subject--visitor">
								<span class="reviewer-counter__label">瀏覽次數</span>
							</dt>
							<dd class="reviewer-counter__data">
								<p class="reviewer-counter__data-count">
									<span class="reviewer-counter__data-num">10,530人</span> <span
										class="reviewer-counter__sub-num">(先週15人)</span>
								</p>
							</dd>
						</dl>
						<dl class="reviewer-counter__item">
							<dt
								class="reviewer-counter__subject reviewer-counter__subject--visitor">
								<span class="reviewer-counter__label">讚!</span> <span
									class="c-icon-help c-icon-help--dark"> <span
									class="c-icon-help__btn">?</span> <span
									class="c-icon-help__tooltip-frame reviewer-counter__help">
										<span
										class="c-tooltip-bordered c-tooltip-bordered--top reviewer-counter__tooltip">
											「いった」にいいね！された合計数を表示しています。 </span>
								</span>
								</span>
							</dt>
							<dd class="reviewer-counter__data">
								<p class="reviewer-counter__like-count">
									<span class="reviewer-counter__like-count-num">2,786</span>
								</p>
							</dd>
						</dl>
					</div>
				</div>
			</div>
			<div class="reviewer-navi reviewer-navi--l">
				<ul class="reviewer-navi__list">
					<li
						class="reviewer-navi__item reviewer-navi__item--log is-selected">
						<a class="reviewer-navi__target" href="#"> <span
							class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__menu reviewer-navi__menu--top">首頁</span>
						</span>
					</a>
					</li>
					<li id="reviewer-navi-review"
						class="reviewer-navi__item reviewer-navi__item--review"><a
						class="reviewer-navi__target" href="#"> <span
							class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__count">1478</span> <span
								class="reviewer-navi__menu">拜訪店家</span>
						</span>
					</a></li>
					<li id="reviewer-navi-interest"
						class="reviewer-navi__item reviewer-navi__item--interest"><a
						class="reviewer-navi__target" href="#"> <span
							class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__count">156</span> <span
								class="reviewer-navi__menu">喜愛店家</span>
						</span>
					</a></li>
					<li id="reviewer-navi-matome"
						class="reviewer-navi__item reviewer-navi__item--matome is-disabled">
						<a class="reviewer-navi__target" href="#"> <span
							class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__count">0</span> <span
								class="reviewer-navi__menu">小口袋</span>
						</span>
					</a>
					</li>
					<li id="reviewer-navi-follow"
						class="reviewer-navi__item reviewer-navi__item--follow"><a
						class="reviewer-navi__target" href="#"> <span
							class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__count">62</span> <span
								class="reviewer-navi__menu">追蹤</span>
						</span>
					</a></li>
					<li id="reviewer-navi-follower"
						class="reviewer-navi__item reviewer-navi__item--follower"><a
						class="reviewer-navi__target" href="#"> <span
							class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__count">22157</span> <span
								class="reviewer-navi__menu">追隨者</span>
						</span>
					</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!--header end-->

	<div id="container">
		<!-- contents * start -->
		<div id="contents" class="clearfix contents-reviewer">
			<!-- main * start-->
			<div id="column-main" class="layout1-main">
				<div class="recommend-wrap">

					<h1 class="recommend-title gly-b-crown like"><i class="fa-solid fa-star"></i>已收藏的地點</h1>
					<input type="hidden" id="member_id2" value="${member.id}"
						class="form-control" required>

					<div id="tryy"></div>
					<%-- 			<c:forEach var="collections" items="${page.content}">	 --%>
					<!-- 					<p class="reco-lead"></p> -->
					<!-- 					<div class="reco-text-wrap"> -->
					<!-- 						<div class="reco-tx js-rvw-contents clearfix"> -->
					<!-- 							::before -->
					<!-- 							<div class="tx-left"> -->
					<!-- 								<div class="tx-rst"> -->
					<!-- 									<span class="reco-tx__ranking-no"> <span -->
					<!-- 										class="c-ranking-badge"> <span -->
					<!-- 											class="c-ranking-badge__no c-ranking-badge__no--no1"> -->
					<!-- 												<i class="c-ranking-badge__contents u-text-num">1</i> -->
					<!-- 										</span> -->
					<!-- 									</span> -->
					<!-- 									</span> -->
					<!-- 									<div class="reco-tx__info-wrap"> -->

					<!-- 										<div class="reco-tx__info-wrap"> -->
					<!-- 											<div class="tx-rstname"> -->
					<!-- 												<a class="tx-rstname__target" -->
					<%-- 													href="#">${collections.shopName}</a> --%>
					<!-- 											</div> -->
					<%-- 											<span class="tx-pref">${collections.city}</span> <span class="tx-area">${collections.town} --%>
					<!-- 												</span> -->
					<!-- 										</div> -->
					<!-- 									</div> -->
					<!-- 								</div> -->
					<!-- 								<p class="tx-rvwttl"> -->
					<!-- 									<a href="#">意外的深夜牛肉麵(永久停業)</a> -->
					<!-- 								</p> -->
					<!-- 							</div> -->
					<!-- 							<div class="tx-right"> -->
					<!-- 								<p class="rating"> -->
					<!-- 									<span class="subject">rating</span> -->
					<!-- 									<img src=""> -->
					<%-- 									<strong>${collections.gender}</strong> --%>


					<!-- 								</p> -->
					<!-- 							</div> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
					<%-- 					</c:forEach> --%>

				</div>
				<section></section>
			</div>
			<!-- main * end-->

			<!-- side * start-->

			<!-- side * end-->
		</div>
		<!-- contents * end -->
	</div>


	<script type="Text/JavaScript">
		$(document).ready(function() {
			$('#reviewer-image').hover(function() {
				$('#hoverrr').css('display', 'block');
			}, function() {
				$('#hoverrr').css('display', 'none');
			});
		})
	</script>

	<!--   Eddie  -->
	<script>
		var Member_id2 = document.getElementById('member_id2').value;

		console.log("ID: " + Member_id2)
		$
				.ajax({
					url : 'http://localhost:8080/oldFoodMan/likeloctest?member_id='
							+ Member_id2,
					contentType : 'application/json ; charset=UTF-8',
					dataType : 'json',
					method : 'get',
					//			data : dtoJsonString,
					success : function(result) {

						var msg_data = '';
						$.each(	result,function(index, value) {
											console.log("IDID: " + value.id)
											msg_data += '<div class="tx-rstname">'
											msg_data += '<input type="hidden" id="sid" value='+value.id+'>'
											msg_data += '<a class="like" >'+ value.likelocations + '</a>'
											msg_data += '<a type="button" onclick="deletelike('+value.id+');" class="right"><i class="fa-regular fa-trash-can"></i></a>'
											msg_data += '</div>'

										})

						$('#tryy').append(msg_data)

					},
					error : function(err) {
						console.log(err)
						alert('發生錯誤')
					}

				})

		function deletelike(id) { //刪除收藏地點

// 			var record_id = document.getElementById("clot").value;
		
		
				$.ajax({
						url : 'http://localhost:8080/oldFoodMan/deleteSchedule?schedule_id='+ id,
						contentType : 'application/json; charset=UTF-8',
						method : 'get',
						success : function(result) {
							console.log(member_id2)
							alert('已成功刪除');
							location.reload();
						}

					})

		}

		// 		var Member_id2 = document.getElementById('member_id2').value;
		// 		console.log("ID: " + Member_id2)
		// 		$
		// 				.ajax({
		// 					url : 'http://localhost:8080/oldFoodMan/likeloctest?member_id='
		// 							+ Member_id2,
		// 					contentType : 'application/json ; charset=UTF-8',
		// 					dataType : 'json',
		// 					method : 'get',
		// 					//			data : dtoJsonString,
		// 					success : function(result) {

		// 						var msg_data = '';
		// 						$
		// 								.each(
		// 										result,
		// 										function(index, value) {

		// 											msg_data += '<div class="reco-tx js-rvw-contents clearfix">'
		// 											msg_data += '<div class="tx-left">'
		// 											msg_data += '<div class="tx-rst">'
		// 											msg_data += '<span class="reco-tx__ranking-no">'
		// 											msg_data += '<span class="c-ranking-badge">'
		// 											msg_data += '<span class="c-ranking-badge__no c-ranking-badge__no--no1">'
		// 											msg_data += '<i class="c-ranking-badge__contents u-text-num"></i>'
		// 											msg_data += '</span>'
		// 											msg_data += '</span>'
		// 											msg_data += '</span>'
		// 											msg_data += '<div class="reco-tx__info-wrap">'
		// 											msg_data += '<div class="reco-tx__info-wrap">'
		// 											msg_data += '<div class="tx-rstname">'
		// 											msg_data += '<a class="tx-rstname__target" href="#">西華飯店</a>'
		// 											msg_data += '</div>'
		// 											msg_data += '<span class="tx-pref">台北市</span>'
		// 											msg_data += '<span class="tx-area">松山區 / 簡餐</span>'
		// 											msg_data += '</div>'
		// 											msg_data += '</div>'
		// 											msg_data += '</div>'
		// 											msg_data += '<p class="tx-rvwttl">'
		// 											msg_data += '<a href="#">意外的深夜牛肉麵(永久停業)</a>'
		// 											msg_data += '</p>'
		// 											msg_data += '</div>'
		// 											msg_data += '<div class="tx-right">'
		// 											msg_data += '<p class="rating">'
		// 											msg_data += '<span class="subject">rating</span>'
		// 											msg_data += '<strong>4.2</strong>'
		// 											msg_data += '</p>'
		// 											msg_data += '</div>'
		// 											msg_data += '</div>'

		// 										})

		// 						$('#tryy').append(msg_data)

		// 					}
		// 			,
		// 			error : function(err) {
		// 				console.log(err)
		// 				alert('發生錯誤')
		// 			}

		// 				})
	</script>


</body>
</html>