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
<title>追蹤中</title>
<link rel="stylesheet"
	href="${contextRoot}/cssLemon/oldfoodPage01_header.css">
<link rel="stylesheet"
	href="${contextRoot}/cssLemon/oldfoodPage01_navi.css">
<link rel="stylesheet"
	href="${contextRoot}/cssLemon/oldfoodPage01_contents_left.css">
<link rel="stylesheet"
	href="${contextRoot}/cssLemon/oldfoodPage01_contents_right.css">
<link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_base">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="/js/jquery-3.6.0.min.js"></script>
<style>
#container {
	position: relative;
	clear: both;
	margin: 0 auto 30px;
	width: 100%;
}

#contents {
	margin: 0 auto;
	width: 980px;
}

.clearfix::before, .clearfix::after {
	display: block;
	overflow: hidden;
	content: '';
}

.clearfix::after {
	clear: both;
}

.layout3-main {
	width: 980px;
}

.rvwr-heading1 {
	display: table;
	position: relative;
	border-bottom: 1px solid #e0dccc;
	width: 100%;
	margin-bottom: 1rem;
	padding-bottom: 1.2rem;
}

.rvwr-view-sort {
	margin-top: 10px;
	background: #faf8f5;
	padding: 14px 0;
}

.c-view-sort {
	position: relative;
	border-bottom: 1px solid #e1e1e1;
	width: 100%;
	box-sizing: border-box;
	line-height: 1.3;
	display: flex;
}

.c-view-sort__item:first-child {
	border-left: none;
}

.c-view-sort__item {
	display: inline-block;
	padding: 0 6px 0 10px;
	color: #13131e;
	white-space: nowrap;
	vertical-align: middle;
}

.follow-rvwr-list-wrap {
	margin-top: 15px;
}

.rvwr-heading1__title {
	display: table-cell;
	color: #13131e;
	font-weight: bold;
	vertical-align: middle;
	font-size: 1.6rem;
}

.rvwr-heading1__count {
	margin-left: 1em;
	font-size: 1rem;
}

.rvwr-heading1__num {
	color: #463f2d;
	font-family: Arial;
	font-weight: normal;
	margin-right: -0.2rem;
	font-size: 1.8rem;
}

.follow-rvwr-list {
	display: table;
	margin: -20px 0 0 -20px;
	border-spacing: 20px 20px;
	border-collapse: separate;
	width: 1020px;
	height: 100%;
	overflow: visible;
	table-layout: fixed;
	min-height: 21.4rem;
}

.follow-rvwr-list__row {
	display: table-row;
	height: 100%;
}

.follow-rvwr-list__item {
	display: table-cell;
	height: 100%;
	vertical-align: top;
}

.follow-rvwr-item {
	position: relative;
	cursor: pointer;
	border: solid 1px #eeece4;
	border-radius: 5px;
	height: 100%;
	box-sizing: border-box;
	background: #fff;
}

.follow-rvwr-item:hover {
	cursor: pointer;
	border-color: #ff9600;
}

.follow-rvwr-item__header {
	position: relative;
}

.p-rvwr-cover.p-rvwr-cover--s {
	height: 90px;
}

.p-rvwr-cover.p-rvwr-cover--s .p-rvwr-cover__img {
	top: 50%;
	left: 50%;
	margin-top: -55px;
	margin-left: -160px;
}

.follow-rvwr-item__cover {
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

.follow-rvwr-item__rvwr-img {
	position: absolute;
	bottom: -10px;
	left: 12px;
}

.rvwr-img-box.rvwr-img-box--m {
	padding: 3px;
	border-radius: 5px;
}

.rvwr-img-box {
	position: relative;
	border: 1px solid #ebe8e6;
	box-sizing: border-box;
	background: #fff;
}

.rvwr-img-box--m img {
	border-radius: 5px;
}

.follow-rvwr-item__page-name {
	position: absolute;
	bottom: 10px;
	left: 95px;
	width: 64%;
	color: #fff;
	font-weight: bold;
}

.follow-rvwr-item__page-name {
	position: absolute;
	bottom: 10px;
	left: 95px;
	width: 64%;
	color: #fff;
	font-weight: bold;
}

.p-rvwr-cover {
	position: relative;
	overflow: hidden;
}

.follow-rvwr-item__contents {
	padding: 10px 12px 12px;
}

.follow-rvwr-item__contents-head {
	display: table;
	border-spacing: 0;
	width: 100%;
}

.u-text-num {
	font-family: Arial;
}

.follow-rvwr-item__lastupdate {
	position: absolute;
	right: 12px;
	bottom: 12px;
}

.follow-rvwr-item__lastupdate .rf-today {
	color: #e64c30;
}

.follow-rvwr-item__lastupdate .highlight {
	padding: 3px 3px 2px;
	background-color: #fcf4ce;
	font-size: 1rem;
}

.follow-rvwr-item__status {
	display: table-cell;
	vertical-align: middle;
	word-break: break-all;
}

.follow-rvwr-item__status-text {
	padding: 0.8em 0 0 0.5em;
	border-bottom: solid 1px #eeece4;
	line-height: 1.2;
	margin-bottom: 0.8rem;
}

.rvwr-nickname {
	color: #13131e;
	font-weight: bold;
	line-height: 1.3;
}

.fs14 {
	font-size: 117%;
}

.follow-rvwr-item__attr {
	color: #949499;
	font-size: 1rem;
}

.follow-rvwr-item__follow {
	display: table-cell;
	padding-left: 14px;
	width: 1%;
	text-align: right;
	vertical-align: middle;
}

.p-follow-btn {
	display: inline-block;
	position: relative;
}

.p-follow-btn__target.p-follow-btn__target--s {
	width: 3.7rem;
	height: 1.5rem;
}

.p-follow-btn__target.is-added {
	border-color: transparent;
	color: #fff;
	background: #87a5c2;
}

.p-follow-btn__target {
	display: inline-block;
	position: relative;
	cursor: pointer;
	margin: 0;
	outline: none;
	border: 1px solid #d2d2d2;
	border-radius: 3px;
	box-sizing: border-box;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	vertical-align: middle;
	line-height: normal;
}

.follow-rvwr-item__lastupdate {
	position: absolute;
	right: 12px;
	bottom: 12px;
}

a {
	color: #06c;
	text-decoration: none;
}

option {
	font-weight: normal;
	display: block;
	white-space: nowrap;
	min-height: 1.2em;
	padding: 0 2px 1px;
}

input, button, textarea, select {
	margin: 0;
	font: inherit;
}

label {
	cursor: pointer;
}

img {
	vertical-align: bottom;
}

li {
	list-style: inherit;
}

div, p {
	word-wrap: break-word;
	overflow-wrap: break-word;
}

ol, ul {
	list-style: none;
}

h2, h4, strong, b {
	font-style: normal;
	font-weight: bold;
}

dt, span, dl, ol, ul, li, a, span, ul, div, h2, h3, h4, p, section, p {
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
</style>
</head>
<body>

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
								style="position: absolute; width: 980px; left: 0px; top: -108px; opacity: 0.1;"
								alt="reviewer's cover image" src="imgLemon/無留手02.jpg">
							<!-- image size=1470*981 -->
						</div>
					</div>
				</div>
				<div id="page-info" class="header-cover--info js-page-info">
					<p class="page-name">Alice's Tea Party</p>
					<p class="page-sub-title">Just a cafe lover</p>
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
								<p class="js-main-block-btn c-btn reviewer-block-btn__target">
									<span class="c-btn__text">s</span>
								</p>
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
							<a href=""> <img alt src="imgLemon/半路04.jpg" width="120"
								height="120">
							</a>
						</div>
					</div>
				</div>
				<div class="header-contents__info header-contents__info--l">
					<div class="reviewer-status reviewer-status--top">
						<p class="reviewer-status__item">
							<span class="reviewer-status__nickname"> <strong
								class="reviewer-nickname fs18">斉藤アリス</strong>
							</span> <span class="reviewer-status__attr">(30歲出頭-女性-花蓮縣)</span>
						</p>
						<p class="reviewer-status__occupation">model & writer</p>
					</div>
					<div class="comment-prof">
						<span class="comment-prof__body"> "出生於花蓮,三歲開始在七星潭..." </span> <span
							class="comment-prof__more"> <a class="c-link-arrow"
							href=""> "read more" </a>
						</span>
					</div>
				</div>
				<div class="header-contents__counts">
					<div class="reviewer-counter">
						<dl class="reviewer-counter__item">
							<dt class="reviewer-counter__subject">
								<span class="reviewer-counter__label">ロコミ数</span> <span
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
								<span class="reviewer-counter__label">写真</span>
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
								<span class="reviewer-counter__label">訪問者数</span>
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
								<span class="reviewer-counter__label">いいね!</span> <span
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
					<li class="reviewer-navi__item reviewer-navi__item--log"><a
						class="reviewer-navi__target" href="#"> <span
							class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__menu reviewer-navi__menu--top">トップ</span>
						</span>
					</a></li>
					<li id="reviewer-navi-review"
						class="reviewer-navi__item reviewer-navi__item--review"><a
						class="reviewer-navi__target" href="#"> <span
							class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__count">1478</span> <span
								class="reviewer-navi__menu">have been to</span>
						</span>
					</a></li>
					<li id="reviewer-navi-interest"
						class="reviewer-navi__item reviewer-navi__item--interest"><a
						class="reviewer-navi__target" href="#"> <span
							class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__count">156</span> <span
								class="reviewer-navi__menu">favorite</span>
						</span>
					</a></li>
					<li id="reviewer-navi-matome"
						class="reviewer-navi__item reviewer-navi__item--matome is-disabled">
						<div class="reviewer-navi__target">
							<sapn class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__count">0</span> <span
								class="reviewer-navi__menu">brief</span> </sapn>
						</div>
					</li>
					<li id="reviewer-navi-follow"
						class="reviewer-navi__item reviewer-navi__item--follow is-selected">
						<a class="reviewer-navi__target" href="#"> <span
							class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__count">62</span> <span
								class="reviewer-navi__menu">following</span>
						</span>
					</a>
					</li>
					<li id="reviewer-navi-follower"
						class="reviewer-navi__item reviewer-navi__item--follower"><a
						class="reviewer-navi__target" href="#"> <span
							class="reviewer-navi__menu-wrap"> <span
								class="reviewer-navi__count">22157</span> <span
								class="reviewer-navi__menu">follower</span>
						</span>
					</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!--header end-->

	<div id="container">
		<!-- contents start -->
		<div id="contents" class="clearfix">
			<!--main * start-->
			<div id="column-main" class="layout3-main">
				<div class="rvwr-heading1">
					<h2 class="rvwr-heading1__title">
						追蹤中 <strong class="rvwr-heading1__count"> <b
							class="rvwr-heading1__num"> 2 </b> 人
						</strong>
					</h2>
				</div>
				<div class="c-view-sort rvwr-view-sort">
					<ul class="c-view-sort__list js-sort-list">
						<li class="c-view-sort__item"><a
							class="js-sort-by is-selected is-desc c-view-sort__target"
							href="#"> 喜愛店家最新更新日 </a></li>
						<li class="c-view-sort__item"><a
							class="js-sort-by c-view-sort__target" href="#"> 追蹤日期 </a></li>
					</ul>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">First</th>
							<th scope="col">Last</th>
							<th scope="col">Handle</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var='id' items='${ids}'>
						<tr>
							<th scope="row"><c:out value="${id}"/></th>
							<td>O_O</td>
							<td>O_O</td>
							<td>@_@</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!--main * end-->
		</div>
		<!-- contents end -->
	</div>
</body>
</html>