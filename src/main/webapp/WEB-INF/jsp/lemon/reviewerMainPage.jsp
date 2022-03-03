<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>老食名人</title>
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_header.css">
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_navi.css">
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_contents_left.css">
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_contents_right.css">
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_base">
    <style>
        li{
            list-style: inherit;
        }

        ol, ul{
            list-style: none;
        }

        img{
            vertical-align: bottom;
        }

        div,p {
            word-wrap: break-word;
            overflow-wrap: break-word;
        }

        section{
            display: block;
        }

        h1,h2,strong,em{
            font-size: normal;
            font-weight: bold;
        }

        dt,span,dl,li,a,span,ul,div,h2,p,section{
            outline: 0;
            margin: 0;
            padding: 0;
            border: 0;
            font: inherit;
            vertical-align: baseline;
            background:transparent;
        }

        html{
            font-size: 80%;
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
                <p>置頂個人導覽</p>
            </div>
        </div>
    </div>
</div>

<div id="js-global-header-reserch" class="global-header-serch" style="padding-top:0px;">
    <div class="l-container p-header-wrapper p-header-wrapper--bottom">
        <div class="l-contents l-contents--fixed">全站搜尋列</div>
    </div>
</div>


<div class="reviewer-header-wrap">
    <div class="reviewer-header">
        <div class="header-cover">
            <div class="person-reviewer-cover" id="cover-image">
                <div class="loading header-cover-loader">
                    <div class="loader loader-tabelog-s"></div>
                </div>
                <div class="person-reviewer-cover-image">
                    <div class="oldcrop-frame" style="overflow: hidden; position: relative; width: 980px; height: 340px;">
                        <img class="crop-img js-crop-img oldcrop-image" data-width:="980" data-top="-108" data-left="0" style="position:absolute; width:980px; left:0px; top:-108px; opacity: 0.1;" alt="reviewer's cover image"
                        src="${contextRoot}/img/無留手02.jpg">
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
                                    <p class="p-follow-btn__target p-follow-btn__target--l reviewer-action-btns__navi-item-target" data-proc="follow">
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-contents">
            <div class="header-contents__img-wrap">
                <div class="header-contents__img header-contents__img--l">
                    <div id="reviewer-image" class="reviewer-image-box reviewer-image-box--1 js-reviewer-image js-upload-icon-image">
                        <a href="">
                            <img alt src="${contextRoot}/img/半路04.jpg" width="120" height="120">
                        </a>
                    </div>
                </div>
            </div>
            <div class="header-contents__info header-contents__info--l">
                <div class="reviewer-status reviewer-status--top">
                    <p class="reviewer-status__item">
                        <span class="reviewer-status__nickname">
                            <strong class="reviewer-nickname fs18">斉藤アリス</strong>
                        </span>
                        <span class="reviewer-status__attr">(30歲出頭-女性-花蓮縣)</span>
                    </p>
                    <p class="reviewer-status__occupation">model & writer</p>
                </div>
                <div class="comment-prof">
                    <span class="comment-prof__body">
                        "出生於花蓮,三歲開始在七星潭..."
                    </span>
                    <span class="comment-prof__more">
                        <a class="c-link-arrow" href="">
                            "read more"
                        </a>
                    </span>
                </div>
            </div>
            <div class="header-contents__counts">
                <div class="reviewer-counter">
                    <dl class="reviewer-counter__item">
                        <dt class="reviewer-counter__subject">
                            <span class="reviewer-counter__label">ロコミ数</span>
                            <span class="c-icon-help c-icon-help--dark">
                                <span class="c-icon-help__btn">?</span>
                                <span class="c-icon-help__tooltip-frame reviewer-counter__help">
                                    <span class="c-tooltip-bordered c-tooltip-bordered--top reviewer-counter__tooltip">
                                        お店に掲載されたろこみ数を表示しています
                                    </span>
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
                        <dt class="reviewer-counter__subject reviewer-counter__subject--photo">
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
                        <dt class="reviewer-counter__subject reviewer-counter__subject--visitor">
                            <span class="reviewer-counter__label">訪問者数</span>
                        </dt>
                        <dd class="reviewer-counter__data">
                            <p class="reviewer-counter__data-count">
                                <span class="reviewer-counter__data-num">10,530人</span>
                                <span class="reviewer-counter__sub-num">(先週15人)</span>
                            </p>
                        </dd>
                    </dl>
                    <dl class="reviewer-counter__item">
                        <dt class="reviewer-counter__subject reviewer-counter__subject--visitor">
                            <span class="reviewer-counter__label">いいね!</span>
                            <span class="c-icon-help c-icon-help--dark">
                                <span class="c-icon-help__btn">?</span>
                                <span class="c-icon-help__tooltip-frame reviewer-counter__help">
                                    <span class="c-tooltip-bordered c-tooltip-bordered--top reviewer-counter__tooltip">
                                        「いった」にいいね！された合計数を表示しています。
                                    </span>
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
                <li class="reviewer-navi__item reviewer-navi__item--log is-selected">
                    <a class="reviewer-navi__target" href="#">
                        <span class="reviewer-navi__menu-wrap">
                            <span class="reviewer-navi__menu reviewer-navi__menu--top">トップ</span>
                        </span>
                    </a>
                </li>
                <li id="reviewer-navi-review" class="reviewer-navi__item reviewer-navi__item--review">
                    <a class="reviewer-navi__target" href="#">
                        <span class="reviewer-navi__menu-wrap">
                            <span class="reviewer-navi__count">1478</span>
                            <span class="reviewer-navi__menu">have been to</span>
                        </span>
                    </a>
                </li>
                <li id="reviewer-navi-interest" class="reviewer-navi__item reviewer-navi__item--interest">
                    <a class="reviewer-navi__target" href="#">
                        <span class="reviewer-navi__menu-wrap">
                            <span class="reviewer-navi__count">156</span>
                            <span class="reviewer-navi__menu">favorite</span>
                        </span>
                    </a>
                </li>
                <li id="reviewer-navi-matome" class="reviewer-navi__item reviewer-navi__item--matome is-disabled">
                    <div class="reviewer-navi__target">
                        <sapn class="reviewer-navi__menu-wrap">
                            <span class="reviewer-navi__count">0</span>
                            <span class="reviewer-navi__menu">brief</span>
                        </sapn>
                    </div>
                </li>
                <li id="reviewer-navi-follow" class="reviewer-navi__item reviewer-navi__item--follow">
                    <a class="reviewer-navi__target" href="#">
                        <span class="reviewer-navi__menu-wrap">
                            <span class="reviewer-navi__count">62</span>
                            <span class="reviewer-navi__menu">following</span>
                        </span>
                    </a>
                </li>
                <li id="reviewer-navi-follower" class="reviewer-navi__item reviewer-navi__item--follower">
                    <a class="reviewer-navi__target" href="#">
                        <span class="reviewer-navi__menu-wrap">
                            <span class="reviewer-navi__count">22157</span>
                            <span class="reviewer-navi__menu">follower</span>
                        </span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>   
<div id="container">
    <!-- contents * start -->
    <div id="contents" class="clearfix contents-reviewer">
        <!-- main * start-->
        <div id="column-main" class="layout1-main">
            <div class="recommend-wrap">
                <h2 class="recommend-title gly-b-crown">
                    Recommended Restaurant
                </h2>
            
                <p class="reco-lead"></p>
                <div class="reco-text-wrap">
                    <div class="reco-tx js-rvw-contents clearfix">
                        <!--::before-->
                        <div class="tx-left">
                            <div class="tx-rst">
                                <span class="reco-tx__ranking-no">
                                    <span class="c-ranking-badge">
                                        <span class="c-ranking-badge__no c-ranking-badge__no--no1">
                                            <i class="c-ranking-badge__contents u-text-num">1</i>
                                        </span>
                                    </span>
                                </span>
                                <div class="reco-tx__info-wrap">
                                    <div class="reco-tx__info-wrap">
                                        <div class="tx-rstname">
                                            <a class="tx-rstname__target" href="#">西華飯店</a>
                                        </div>
                                        <span class="tx-pref">台北市</span>
                                        <span class="tx-area">松山區 / 簡餐</span>
                                    </div>
                                </div>
                            </div>
                            <p class="tx-rvwttl">
                                <a href="#">意外的深夜牛肉麵(永久停業)</a>
                            </p>
                        </div>
                        <div class="tx-right">
                            <p class="rating">
                                <span class="subject">rating</span>
                                <!-- <img src=""> -->
                                <strong>4.2</strong>
                            </p>
                        </div>
                    </div>
                    <div class="reco-tx js-rvw-contents clearfix">
                        <div class="tx-left">
                            <div class="tx-rst">
                                <span class="reco-tx__ranking-no">
                                    <span class="c-ranking-badge">
                                        <span class="c-ranking-badge__no c-ranking-badge__no--no2">
                                            <i class="c-ranking-badge__contents u-text-num">2</i>
                                        </span>
                                    </span>
                                </span>
                                <div class="reco-tx__info-wrap">
                                    <div class="tx-rstname">
                                        <a class="tx-rstname__target" href="#">兄弟飯店</a>
                                    </div>
                                    <span class="tx-pref">台北市</span>
                                    <span class="tx-area">中山區 / 簡餐</span>
                                </div>
                            </div>
                            <p class="tx-rvwttl">
                                <a href="#">深夜簡單有效的口味</a>
                            </p>
                        </div>
                        <div class="tx-right">
                            <p class="rating">
                                <span class="subject">rating</span>
                                <!-- <img src=""> -->
                                <strong>4.1</strong>
                            </p>
                        </div>
                    </div>
                    <div class="reco-tx js-rvw-contents clearfix">
                        <div class="tx-left">
                            <div class="tx-rst">
                                <span class="reco-tx__ranking-no">
                                    <span class="c-ranking-badge">
                                        <span class="c-ranking-badge__no c-ranking-badge__no--no3">
                                            <i class="c-ranking-badge__contents u-text-num">3</i>
                                        </span>
                                    </span>
                                </span>
                                <div class="reco-tx__info-wrap">
                                    <div class="tx-rstname">
                                        <a class="tx-rstname__target" href="#">麥當勞</a>
                                    </div>
                                    <span class="tx-pref">台北市</span>
                                    <span class="tx-area">松山區 / 速食</span>
                                </div>
                            </div>
                            <p class="tx-rvwttl">
                                <a href="#">台灣第一家</a>
                            </p>
                        </div>
                        <div class="tx-right">
                            <p class="rating">
                                <span class="subject">rating</span>
                                <!-- <img src=""> -->
                                <strong>3.9</strong>
                            </p>
                        </div>
                    </div>
                    <div class="reco-tx js-rvw-contents clearfix">
                        <div class="tx-left">
                            <div class="tx-rst">
                                <span class="reco-tx__ranking-no">
                                    <span class="c-ranking-badge">
                                        <span class="c-ranking-badge__no c-ranking-badge__no--no4">
                                            <i class="c-ranking-badge__contents u-text-num">4</i>
                                        </span>
                                    </span>
                                </span>
                                <div class="reco-tx__info-wrap">
                                    <div class="tx-rstname">
                                        <a class="tx-rstname__target" href="#">紅屋牛排</a>
                                    </div>
                                    <span class="tx-pref">台北市</span>
                                    <span class="tx-area">松山區 / 牛排</span>
                                </div>
                            </div>
                            <p class="tx-rvwttl">
                                <a href="#">老派牛排</a>
                            </p>
                        </div>
                        <div class="tx-right">
                            <p class="rating">
                                <span class="subject">rating</span>
                                <!-- <img src=""> -->
                                <strong>3.8</strong>
                            </p>
                        </div>
                    </div>
                    <div class="reco-tx js-rvw-contents clearfix">
                        <div class="tx-left">
                            <div class="tx-rst">
                                <span class="reco-tx__ranking-no">
                                    <span class="c-ranking-badge">
                                        <span class="c-ranking-badge__no c-ranking-badge__no--no5">
                                            <i class="c-ranking-badge__contents u-text-num">5</i>
                                        </span>
                                    </span>
                                </span>
                                <div class="reco-tx__info-wrap">
                                    <div class="tx-rstname">
                                        <a class="tx-rstname__target" href="#">金湘玉手工酸辣粉</a>
                                    </div>
                                    <span class="tx-pref">台北市</span>
                                    <span class="tx-area">大安區 / 小吃</span>
                                </div>
                            </div>
                            <p class="tx-rvwttl">
                                <a href="#">好想吃吃看哦</a>
                            </p>
                        </div>
                        <div class="tx-right">
                            <p class="rating">
                                <span class="subject">rating</span>
                                <!-- <img src=""> -->
                                <strong>3.7</strong>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <section></section>
        </div>
        <!-- main * end-->

        <!-- side * start-->
        <div id="column-side" class="layout1-side">
            <p class="tra-banner-mypage u-mb">
                <a href="#" class="tra-banner-mypage__target">
                    <img width="300" height="120" alt="面對食物總是老實" src="${contextRoot}/img/sidebanner.jpg">
                </a>
            </p>
            <div id="column-side-inner">
                <section class="ranking">
                    <div class="side-title ranking__title">
                        <h2>Ranking</h2>
                        <p class="ranking__setting-area">松山區</p>
                        <span class="ranking__prefecture">（台北市）</span>
                    </div>
                    <div class="ranking-contents">
                        <div class="ranking-contents__month">
                            <div class="ranking-contents__month-ranking">
                                <span class="u-text-num">2022</span>年
                                <span class="u-text-num">2</span>月
                                <span class="u-text-rum ranking-contents__ranking-num">5</span>
                                <span class="ranking-contents__ranking-text">位</span>
                            </div>
                            <div class="ranking-contents__review">
                                <div>喜愛餐廳數量</div>
                                <div>
                                    <span class="u-text-num ranking-contents__review-count">1</span>件
                                </div>
                            </div>
                        </div>
                        <div class="ranking-contents__year">
                            <div class="ranking-contents__month-ranking ranking-contents__month-ranking--outof-ranking">
                                <span>年排名</span>
                                <div class="ranking-contents__outof-wrap">
                                    <div class="ranking-contents__place-text-top100">TOP一百名</div>
                                    <strong>圈外</strong>
                                </div>
                            </div>
                            <div class="ranking-contents__review">
                                <div>喜愛餐廳數量</div>
                                <div>
                                    <span class="u-text-num ranking-contents__review-count">1</span>件
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="u-align-right">
                        <a href="#" class="c-link-arrow">
                            <span>觀看排名</span>
                        </a>
                    </div>
                </section>
                <section>
                    <h2 class="side-title">拜訪區域</h2>
                    <div id="area-map">
                        <div class="frame">
                            <img src="${contextRoot}/img/0130藍色的夢.jpg" width="280" height="210" alt="拜訪區域">
                        </div>
                        <ul>
                            <li class="level15" id="tokyo">
                                <img alt src="#">
                            </li>
                        </ul>
                    </div>
                    <div id="area-rank" class="clearfix">
                        <ul class="rank-list">
                            <li class="rank1">
                                <a href="#">台北&nbsp;
                                    <span class="num">
                                        [
                                        <em>1318</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li class="rank2">
                                <a href="#">高雄&nbsp;
                                    <span class="num">
                                        [
                                        <em>1117</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li class="rank3">
                                <a href="#">台南&nbsp;
                                    <span class="num">
                                        [
                                        <em>992</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li class="rank4">
                                <a href="#">花蓮&nbsp;
                                    <span class="num">
                                        [
                                        <em>773</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li class="rank5">
                                <a href="#">台中&nbsp;
                                    <span class="num">
                                        [
                                        <em>337</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
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

</body>
</html>