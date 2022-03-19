<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../menu.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>老食頁面</title>
<link rel="stylesheet"
	href="${contextRoot}/js/fontawesome-free-6.0.0-web/css/all.min.css">
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
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.menu7 {
	line-height: 0px;
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
	text-align: center;
}
</style>
</head>
<body>

	<!-- <a id="pagetop" name="pagetop"></a> -->
	<!-- <div class="l-container p-header-wrapper p-header-wrapper--top"> -->
	<!--     <div class="l-contents l-contents--fixed"> -->
	<!--         <div class="person-header"> -->
	<!--             <div class="person-header-title"> -->
	<!--                 <p>Le fabuleux destin d'Amelie Poulain</p> -->
	<!--             </div> -->
	<!--             <div id="welcome" class="person-header--nav js-welcome-wrapper"> -->
	<%--                 <a href="${contextRoot}/"> --%>
	<!--                 	<p>回首頁</p> -->
	<!--                 </a> -->
	<!--             </div> -->
	<!--         </div> -->
	<!--     </div> -->
	<!-- </div> -->

	<!-- <div id="js-global-header-reserch" class="global-header-serch" style="padding-top:0px;"> -->
	<!--     <div class="l-container p-header-wrapper p-header-wrapper--bottom"> -->
	<!--         <div class="l-contents l-contents--fixed">全站搜尋列</div> -->
	<!--     </div> -->
	<!-- </div> -->

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
						<c:out value="${memberPage.reviewersetting.reviewer_title}" />
					</p>
					<p class="page-sub-title">
						<c:out value="${memberPage.reviewersetting.reviewer_subtitle}" />
					</p>
				</div>
				<div class="header-cover__actions">
					<div class="reviewer-action-btns">
						<div class="reviewer-action-btns__navi">
							<!--                         <div class="p-follow-btn reviewer-action-btns__navi-item"> -->
							<!--                             <div class="js-follow-btn-wrap" data-rvwr-id="2778702"> -->
							<!--                                 <div class="js-follow-btn"> -->
							<!--                                     <p class="p-follow-btn__target p-follow-btn__target--l reviewer-action-btns__navi-item-target" data-proc="follow"> -->
							<!--                                         <span class="p-follow-btn__text">follow</span> -->
							<!--                                     </p> -->
							<!--                                 </div> -->
							<!--                             </div> -->
							<!--                         </div> -->
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
							<!--                             <a class="reviewer-image-box__reimage js-change-prof-image js-upload-icon-change" id="hoverrr" style="display: none;" href="#"> -->
							<!--                             <button class="c-btn c-btn--s reviewer-image-box__reimage-btn">變更</button> -->
							<!--                             </a> -->
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
							<c:out value="${memberPage.reviewersetting.reviewer_occupation}" />
						</p>
					</div>
					<div class="comment-prof">
						<span class="comment-prof__body"> <c:out
								value="${memberPage.reviewersetting.reviewer_intro}" />
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
									<span class="reviewer-counter__data-num"><c:out
											value="${countFav}" />件</span>
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
									<span class="reviewer-counter__data-num">${picCounts}枚</span>
								</p>
								<!--                             <p class="reviewer-counter__like-count"> -->
								<!--                                 <span class="reviewer-counter__like-count-num">1,224</span> -->
								<!--                             </p> -->
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
									<span class="reviewer-counter__like-count-num">2,7</span>
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
						<a class="reviewer-navi__target"
						href="${contextRoot}/reviewerMainPage"> <span
							class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__menu reviewer-navi__menu--top">首頁</span>
						</span>
					</a>
					</li>
					<li id="reviewer-navi-review"
						class="reviewer-navi__item reviewer-navi__item--review"><a
						class="reviewer-navi__target"
						href="${contextRoot}/reviewerIttaomise"> <span
							class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__count"><c:out value="${countAll}" /></span>
								<span class="reviewer-navi__menu">拜訪店家</span>
						</span>
					</a></li>
					<li id="reviewer-navi-interest"
						class="reviewer-navi__item reviewer-navi__item--interest"><a
						class="reviewer-navi__target" href="${contextRoot}/reviewerKoromi">
							<span class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__count"><c:out value="${countFav}" /></span>
								<span class="reviewer-navi__menu">喜愛店家</span>
						</span>
					</a></li>
					<li id="reviewer-navi-matome"
						class="reviewer-navi__item reviewer-navi__item--matome is-disabled">
						<a class="reviewer-navi__target"
						href="http://localhost:8080/oldFoodMan/eddietest"> <span
							class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__count">0</span> <span
								class="reviewer-navi__menu">小口袋</span>
						</span>
					</a>
					</li>
					<li id="reviewer-navi-follow"
						class="reviewer-navi__item reviewer-navi__item--follow"><a
						class="reviewer-navi__target"
						href="${contextRoot}/relationships/follows"> <span
							class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__count"><c:out
										value="${user.follow_size}" /></span> <span
								class="reviewer-navi__menu">追蹤</span>
						</span>
					</a></li>
					<li id="reviewer-navi-follower"
						class="reviewer-navi__item reviewer-navi__item--follower"><a
						class="reviewer-navi__target"
						href="${contextRoot}/relationships/fans"> <span
							class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__count"><c:out
										value="${user.fan_size}" /></span> <span class="reviewer-navi__menu">追隨者</span>
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
			<div id="container">
				<!-- contents * start -->
				<div id="contents" class="clearfix contents-reviewer">
					<!-- main * start-->
					<div id="column-main" class="layout1-main">
						<div class="recommend-wrap">

							<h1 class="recommend-title gly-b-crown like">
								<i class="fa-solid fa-star"></i>已收藏的地點<i
									class="fa-solid fa-location-dot" style="color: red"></i>
							</h1>
							<input type="hidden" id="member_id2" value="${member.id}"
								class="form-control" required>

							<div id="tryy"></div>
							<br> <br> <br>
							<h1 class="recommend-title gly-b-crown like">
								<i class="fa-solid fa-star"></i>已收藏的食記<i
									class="fa-solid fa-utensils" style="color: gray"></i>
							</h1>
							<div id="tryyy"></div>
							<br> <br> <br>


						</div>
						<section></section>
					</div>
					<!-- main * end-->

					<!-- side * start-->

					<!-- side * end-->
				</div>
				<!-- contents * end -->
			</div>
			<!-- main * end-->

			<!-- side * start-->
			<div id="column-side" class="layout1-side">
				<p class="tra-banner-mypage u-mb">
					<a href="#" class="tra-banner-mypage__target"> <img width="300"
						height="120" alt="面對食物總是老實" src="/img/sidebanner.jpg">
					</a>
				</p>
				<div id="column-side-inner">
					<section class="ranking">
						<div class="side-title ranking__title">
							<h2>Ranking</h2>
							<p class="ranking__setting-area">
								<c:out value="${memberPage.city}" />
							</p>
							<!--                         <span class="ranking__prefecture">（台北市）</span> -->
						</div>

						<div class="u-align-right">
							<a href="${contextRoot}/reviewerAll" class="c-link-arrow"> <span>老食人群</span>
							</a>
						</div>
					</section>
					<section>
						<h2 class="side-title">拜訪區域</h2>
						<div id="area-map">
							<div class="frame">
								<img src="/img/0130藍色的夢.jpg" width="280" height="210" alt="拜訪區域">
							</div>
							<ul>
								<li class="level15" id="tokyo"><img alt src="#"></li>
							</ul>
						</div>
						<div id="area-rank" class="clearfix">
							<ul class="rank-list1">
								<li class="rank1"><a href="#">台北市&nbsp; <span
										class="num"> [ <em>${taipei}</em>件 ]
									</span>
								</a></li>
								<li class="rank2"><a href="#">新北市&nbsp; <span
										class="num"> [ <em>1117</em>件 ]
									</span>
								</a></li>
								<li class="rank3"><a href="#">桃園市&nbsp; <span
										class="num"> [ <em>992</em>件 ]
									</span>
								</a></li>
								<li class="rank4"><a href="#">台中市&nbsp; <span
										class="num"> [ <em>773</em>件 ]
									</span>
								</a></li>
								<li class="rank5"><a href="#">台南市&nbsp; <span
										class="num"> [ <em>337</em>件 ]
									</span>
								</a></li>
								<li class="rank6"><a href="#">高雄市&nbsp; <span
										class="num"> [ <em>337</em>件 ]
									</span>
								</a></li>
								<li class="rank7"><a href="#">宜蘭縣&nbsp; <span
										class="num"> [ <em>337</em>件 ]
									</span>
								</a></li>
								<li class="rank8"><a href="#">新竹縣&nbsp; <span
										class="num"> [ <em>337</em>件 ]
									</span>
								</a></li>
								<li class="rank9"><a href="#">苗栗縣&nbsp; <span
										class="num"> [ <em>337</em>件 ]
									</span>
								</a></li>
								<li class="rank10"><a href="#">彰化縣&nbsp; <span
										class="num"> [ <em>337</em>件 ]
									</span>
								</a></li>

							</ul>
							<ul class="rank-list2">
								<li class="rank1"><a href="#">南投縣&nbsp; <span
										class="num"> [ <em>${taipei}</em>件 ]
									</span>
								</a></li>
								<li class="rank2"><a href="#">雲林縣&nbsp; <span
										class="num"> [ <em>1117</em>件 ]
									</span>
								</a></li>
								<li class="rank3"><a href="#">嘉義縣&nbsp; <span
										class="num"> [ <em>992</em>件 ]
									</span>
								</a></li>
								<li class="rank4"><a href="#">屏東縣&nbsp; <span
										class="num"> [ <em>773</em>件 ]
									</span>
								</a></li>
								<li class="rank5"><a href="#">花蓮縣&nbsp; <span
										class="num"> [ <em>337</em>件 ]
									</span>
								</a></li>
								<li class="rank6"><a href="#">台東縣&nbsp; <span
										class="num"> [ <em>337</em>件 ]
									</span>
								</a></li>
								<li class="rank7"><a href="#">澎湖縣&nbsp; <span
										class="num"> [ <em>337</em>件 ]
									</span>
								</a></li>
								<li class="rank8"><a href="#">基隆市&nbsp; <span
										class="num"> [ <em>337</em>件 ]
									</span>
								</a></li>
								<li class="rank9"><a href="#">新竹市&nbsp; <span
										class="num"> [ <em>337</em>件 ]
									</span>
								</a></li>
								<li class="rank10"><a href="#">嘉義市&nbsp; <span
										class="num"> [ <em>337</em>件 ]
									</span>
								</a></li>
							</ul>
						</div>
					</section>
					<section></section>
					<section></section>
				</div>
			</div>
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
	
// 	進入網頁後載入你所收藏的地點

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
						$
								.each(
										result,
										function(index, value) {
											console.log("IDID: " + value.id)
											msg_data += '<div class="tx-rstname L'+value.id+'">'
											msg_data += '<input type="hidden" id="sid" value='+value.id+'>'
											msg_data += '<a class="like" >'
													+ value.likelocations
													+ '</a>'
											msg_data += '<a type="submit" id="deleteLocation" value="'+value.id+'" class="right"><i class="fa-regular fa-trash-can"></i></a>'
											msg_data += '</div>'

										})

						$('#tryy').append(msg_data)

					},
					error : function(err) {
						console.log(err)
						alert('發生錯誤')
					}

				})

// 		function deletelike(id) { //刪除收藏地點

// 			// 			var record_id = document.getElementById("clot").value;

// 			$.ajax({
// 						url : 'http://localhost:8080/oldFoodMan/deleteSchedule?schedule_id='
// 								+ id,
// 						contentType : 'application/json; charset=UTF-8',
// 						method : 'get',
// 						success : function(result) {
// 							console.log(member_id2)
// 							alert('已成功刪除');
// 							location.reload();
// 						}

// 					})

// 		}

		
//			 	進入網頁後載入你所收藏的食記
		var Member_id2 = document.getElementById('member_id2').value;
		console.log("ID: " + Member_id2)
		$
				.ajax({
					url : 'http://localhost:8080/oldFoodMan/findCollections11?member_id='+ Member_id2,
					contentType : 'application/json ; charset=UTF-8',
					dataType : 'json',
					method : 'get',
					//			data : dtoJsonString,
					success : function(result) {

						var msg_data = '';
						$.each(	result,
										function(index, value) {

											console.log("IDIDff: "
													+ value.record_id)
											msg_data += '<div class="tx-rstname R'+value.record_id.id+'">'
											msg_data += '<input type="hidden" id="sid" value='+value.id+'>'
											msg_data += '<a href="http://localhost:8080/oldFoodMan/viewById?id='+ value.record_id.id +'" class="like" >'
													+ value.record_id.title
													+ '</a>'
											msg_data += '<a type="submit" id="deleteFoodRecord" value="'+ value.record_id.id +'" class="right"><i class="fa-regular fa-trash-can"></i></a>'
											msg_data += '</div>'

										})

						$('#tryyy').append(msg_data)

					}
				// 					,
				// 					error : function(err) {
				// 						console.log(err)
				// 						alert('發生錯誤')
				// 					}

				})

// 		function deleteCollections(id) { //刪除食記

// 			// 			var record_id = document.getElementById("clot").value;

// 			// 		console.log(memberId);
// 			// 		var dtoObject = {
// 			// 			"likelocations" : inputResName,
// 			// 			"member_id":Member_id,
// 			// 			}
// 			// 		var dtoJsonString = JSON.stringify(dtoObject);	
// 			// 			console.log(dtoJsonString);	

// 			console.log(id)

// 			$.ajax({
// 				url : 'http://localhost:8080/oldFoodMan/deleteCollections?record_id='+ id,
// 						contentType : 'application/json; charset=UTF-8',
// 						// 			dataType : 'json',
// 						method : 'get',
// 						// 			data : dtoJsonString,

// 						success : function(result) {

// 							// 				console.log(result)				
// 							alert('已刪除收藏');
// 							location.reload();

// 						}

// 					})

// 		}
	</script>

	<!-- 	AJAX區	 -->
	<script>
	
// 	刪除收藏
// 	$(document).on('click', '#deleteLocation', function (){  //用一般的.click會有氣泡事件問題
// 		var id = $(this).attr("value");

// 		$.ajax({
// 			type : "get",
// 			url : "http://localhost:8080/oldFoodMan/deleteSchedule?schedule_id="+id,
// 			success : function(data) {
				
				
// 			},
// 		});
// 	})
	
	
// 	刪除食記	
// 	$(document).on('click', '#deleteFoodRecord', function (){  //用一般的.click會有氣泡事件問題
// 		var id = $(this).attr("value");
// 		console.log("哈哈 "+id)
// 		$.ajax({
// 			type : "get",
// 			url : "http://localhost:8080/oldFoodMan/deleteCollections?record_id=" + id,
// 			success : function(data) {
// 				Swal.fire({
// 					  title: '確定刪除食記?',
// 					  text: "",
// 					  icon: 'warning',
// 					  showCancelButton: true,
// 					  confirmButtonColor: '#3085d6',
// 					  cancelButtonColor: '#d33',
// 					  confirmButtonText: 'Yes!'
// 					}).then((result) => {
// 					  if (result.isConfirmed) {
// 					    Swal.fire({
// 					    title:'已刪除 !!',
// 					    text:'',
// 					    icon:'success'
					       
// 					    }).then((result) => {
// 							location.reload();
// 						})
					    
// 					  }else{
// 						  return ;
// 					  }
// 					})
				
// 			},
// 		});
// 	})
	
	
	
	
	
	
	
	
	</script>


	<script>

//SweetAlert2刪除收藏地點

$(document).on('click', '#deleteLocation', function (){  //用一般的.click會有氣泡事件問題deleteLocation
 			
 		
 			var id = $(this).attr("value");
 			const swalWithBootstrapButtons = Swal.mixin({
 				  customClass: {
 				    confirmButton: 'btn btn-success',
 				    cancelButton: 'btn btn-danger'
 				  },
 				  buttonsStyling: false
 				})

 				swalWithBootstrapButtons.fire({
 				  title: '是否確定要刪除此收藏地點？',
 				  text: "您將無法還原此內容！",
 				  icon: 'warning',
 				  showCancelButton: true,
 				  confirmButtonText: '是，確認刪除！',
 				  cancelButtonText: '否，取消！',
 				  reverseButtons: true
 				}).then((result) => {
 				  if (result.isConfirmed) {
 				    swalWithBootstrapButtons.fire(
 				      '刪除！',
 				      '已完成刪除.',
 				      'success'
 				    )
 				    
 				   $.ajax({
 		 				type : "get",
 		 				url : "http://localhost:8080/oldFoodMan/deleteSchedule?schedule_id="+id,
 		 				success : function(data) {	 							 						    
 		 						
 		 					$('.L'+id+'').remove();
 		 					
 		 				},
 		 			});    
			     				    
 				    
 				  } else if (
 				    /* Read more about handling dismissals below */
 				    result.dismiss === Swal.DismissReason.cancel
 				  ) {
 				    swalWithBootstrapButtons.fire(
 				    	'取消刪除',
 		 				':)',
 				        'error'
 				    )
 				  }
 				})
 		
 		
 		})

 		
 		//SweetAlert2刪除收藏食記
 		$(document).on('click', '#deleteFoodRecord', function (){  //用一般的.click會有氣泡事件問題deleteLocation
 			
 		
 			var id = $(this).attr("value");
 			const swalWithBootstrapButtons = Swal.mixin({
 				  customClass: {
 				    confirmButton: 'btn btn-success',
 				    cancelButton: 'btn btn-danger'
 				  },
 				  buttonsStyling: false
 				})

 				swalWithBootstrapButtons.fire({
 					  title: '是否確定要刪除此收藏食記？',
 	 				  text: "您將無法還原此內容！",
 	 				  icon: 'warning',
 	 				  showCancelButton: true,
 	 				  confirmButtonText: '是，確認刪除！',
 	 				  cancelButtonText: '否，取消！',
 	 				  reverseButtons: true
 				}).then((result) => {
 				  if (result.isConfirmed) {
 				    swalWithBootstrapButtons.fire(
 				    		  '刪除！',
 		 				      '已完成刪除.',
 		 				      'success'
 				    )
 				    
 				   $.ajax({
		 				type : "get",
		 				url : "http://localhost:8080/oldFoodMan/deleteCollections?record_id=" + id,
		 				success : function(data) {	 							 						    
		 						
		 					$('.R'+id+'').remove();
		 					
		 				},
		 			});        
 				    
 				  } else if (
 				    /* Read more about handling dismissals below */
 				    result.dismiss === Swal.DismissReason.cancel
 				  ) {
 				    swalWithBootstrapButtons.fire(
 				      '取消刪除',
 				      ':)',
 				      'error'
 				    )
 				  }
 				})
 		
 		
 		})

</script>

</body>
</html>