<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../menu.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>老食頁面</title>
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_header.css">
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_navi.css">
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_contents_left.css">
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_contents_right.css">
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_base.css">
    <script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
    <style>
        
        .collectionBBB {
			width:10px;
			height:10px; 
		    background:#ccc; 
		    border:0 none;
			cursor:pointer;
			border-radius: 50%;
			color:#ccc;
		}
        
        .menu7{
        line-height:0px;
        }

        .reviewer-navi__item.is-selected.is-selected.is-selected .reviewer-navi__target::after{
            position: absolute;
            left: 50%;
            bottom: 0;
            height: 3px;
            width: 85%;
            margin-left: 42.5%;
            background: #463f2d;
            content: '';
        }

        .reviewer-navi__item:last-child::after{
            background: transparent;
        }

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
                    <div class="oldcrop-frame" style="overflow: hidden; position: relative; width: 980px; height: 340px;">
                        <img class="crop-img js-crop-img oldcrop-image" data-width:="980" data-top="-108" data-left="0" style="position:absolute; width:980px; left:0px; top:-108px; opacity: 1;" alt="reviewer's cover image"
                        src="<c:url value='/getPictureLemon/${memberPage.id}' />">
                        <!-- image size=1470*981 -->
                    </div>
                </div>
            </div>
            <div id="page-info" class="header-cover--info js-page-info">
                <p class="page-name"><c:out value="${memberPage.reviewersetting.reviewer_title}"/></p>
                <p class="page-sub-title"><c:out value="${memberPage.reviewersetting.reviewer_subtitle}"/></p>
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
                    <div id="reviewer-image" class="reviewer-image-box reviewer-image-box--1 js-reviewer-image js-upload-icon-image">
                        <div id="js-reviewer-image-display">
                            <img src="<c:url value='/getPhoto/${memberPage.id}' />" width="120" height="120">
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
                        <span class="reviewer-status__nickname">
                            <strong class="reviewer-nickname fs18"><c:out value="${memberPage.memberName}"/></strong>
                        </span>
                        <span class="reviewer-status__attr">(${bdd}-<c:out value="${memberPage.city}"/>)</span>
                    </p>
                    <p class="reviewer-status__occupation"><c:out value="${memberPage.reviewersetting.reviewer_occupation}"/></p>
                </div>
                <div class="comment-prof">
                    <span class="comment-prof__body">
                        <c:out value="${memberPage.reviewersetting.reviewer_intro}"/>
                    </span>
                    <span class="comment-prof__more">
                        <a class="c-link-arrow" href="${contextRoot}/reviewerPageIntro">
                            read more
                        </a>
                    </span>
                </div>
            </div>
            <div class="header-contents__counts">
                <div class="reviewer-counter">
                    <dl class="reviewer-counter__item">
                        <dt class="reviewer-counter__subject">
                            <span class="reviewer-counter__label">喜好店家</span>
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
                                <span class="reviewer-counter__data-num"><c:out value="${countFav}"/>件</span>
                            </p>
                        </dd>
                    </dl>
                    <dl class="reviewer-counter__item">
                        <dt class="reviewer-counter__subject reviewer-counter__subject--photo">
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
                        <dt class="reviewer-counter__subject reviewer-counter__subject--visitor">
                            <span class="reviewer-counter__label">瀏覽次數</span>
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
                            <span class="reviewer-counter__label">收藏食記</span>
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
                                <span class="reviewer-counter__like-count-num">${colleCounts}</span>
                            </p>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="reviewer-navi reviewer-navi--l">
            <ul class="reviewer-navi__list">
                <li class="reviewer-navi__item reviewer-navi__item--log is-selected">
                    <a class="reviewer-navi__target" href="${contextRoot}/reviewerMainPage">
                        <span class="reviewer-navi__menu-wrap">
                            <span class="reviewer-navi__menu reviewer-navi__menu--top">首頁</span>
                        </span>
                    </a>
                </li>
                <li id="reviewer-navi-review" class="reviewer-navi__item reviewer-navi__item--review">
                    <a class="reviewer-navi__target" href="${contextRoot}/reviewerIttaomise">
                        <span class="reviewer-navi__menu-wrap">
                            <span class="reviewer-navi__count"><c:out value="${countAll}"/></span>
                            <span class="reviewer-navi__menu">拜訪店家</span>
                        </span>
                    </a>
                </li>
                <li id="reviewer-navi-interest" class="reviewer-navi__item reviewer-navi__item--interest">
                    <a class="reviewer-navi__target" href="${contextRoot}/reviewerKoromi">
                        <span class="reviewer-navi__menu-wrap">
                            <span class="reviewer-navi__count"><c:out value="${countFav}"/></span>
                            <span class="reviewer-navi__menu">喜愛店家</span>
                        </span>
                    </a>
                </li>
                <li id="reviewer-navi-matome" class="reviewer-navi__item reviewer-navi__item--matome is-disabled">
                     <a class="reviewer-navi__target" href="http://localhost:8080/oldFoodMan/eddietest">                    
                        <span class="reviewer-navi__menu-wrap">
                            <span class="reviewer-navi__count">0</span>
                            <span class="reviewer-navi__menu">小口袋</span>
                        </span>
                    </a>
                </li>                
                <li id="reviewer-navi-follow" class="reviewer-navi__item reviewer-navi__item--follow">
                    <a class="reviewer-navi__target" href="${contextRoot}/relationships/follows">
                        <span class="reviewer-navi__menu-wrap">
                            <span class="reviewer-navi__count"><c:out value="${user.follow_size}"/></span>
                            <span class="reviewer-navi__menu">追蹤</span>
                        </span>
                    </a>
                </li>
                <li id="reviewer-navi-follower" class="reviewer-navi__item reviewer-navi__item--follower">
                    <a class="reviewer-navi__target" href="${contextRoot}/relationships/fans">
                        <span class="reviewer-navi__menu-wrap">
                            <span class="reviewer-navi__count"><c:out value="${user.fan_size}"/></span>
                            <span class="reviewer-navi__menu">追隨者</span>
                        </span>
                    </a>
                </li>
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
               
                <h2 class="recommend-title gly-b-crown">
                    Recommended Restaurant
                </h2>
            <input type="hidden" id="member_id2" value="${member.id}"
					class="form-control" required>
					
                <p class="reco-lead"></p>
                <div class="reco-text-wrap">
                <!-- 食記AREA -->
                <c:forEach var='rsr' items='${rsrs}'>
                    <div class="reco-tx js-rvw-contents clearfix">
                        <!--::before-->
                        <div class="tx-left">
                            <div class="tx-rst">
                                <span class="reco-tx__ranking-no">
                                    <span class="c-ranking-badge">
                                        <span class="c-ranking-badge__no c-ranking-badge__no--no1">
                                            <i class="c-ranking-badge__contents u-text-num">${rsr.gender_sum}</i>
                                        </span>
                                    </span>
                                </span>
                                <div class="reco-tx__info-wrap">
                                
                               <div  class="reco-tx__info-wrap">
                                        <div class="tx-rstname">
                                            <a class="tx-rstname__target" href="http://localhost:8080/oldFoodMan/viewById?id=${rsr.record_id}">${rsr.store_name}</a>
                                        </div>
                                        <span class="tx-pref">${rsr.store_city}</span>
                                        <span class="tx-area">${rsr.store_area} / ${rsr.store_type}</span>
                                    </div>
                                </div>
                            </div>
                            <p class="tx-rvwttl">
                                <a id="unfollowBtn">${rsr.artical_title}</a>
                                <input type="button" value="<c:out value='${rsr.record_id}'/>" onclick="ttt(this)" class="collectionBBB"/>移除
<%--                                 <input type="hidden" value="<c:out value='${rsr.record_id}'/>" id="recordIdValue"/> --%>
                            </p>
                        </div>
                        <div class="tx-right">
                            <p class="rating">
                                <span class="subject">rating</span>
                                <!-- <img src=""> -->
                                <strong>${rsr.gender_avg}</strong>
                            </p>
                        </div>
                    </div>
                    </c:forEach>
					<!-- 食記AREA結束 -->
<!--                     <div class="reco-tx js-rvw-contents clearfix"> -->
<!--                         <div class="tx-left"> -->
<!--                             <div class="tx-rst"> -->
<!--                                 <span class="reco-tx__ranking-no"> -->
<!--                                     <span class="c-ranking-badge"> -->
<!--                                         <span class="c-ranking-badge__no c-ranking-badge__no--no2"> -->
<!--                                             <i class="c-ranking-badge__contents u-text-num">2</i> -->
<!--                                         </span> -->
<!--                                     </span> -->
<!--                                 </span> -->
<!--                                 <div class="reco-tx__info-wrap"> -->
<!--                                     <div class="tx-rstname"> -->
<!--                                         <a class="tx-rstname__target" href="#">兄弟飯店</a> -->
<!--                                     </div> -->
<!--                                     <span class="tx-pref">台北市</span> -->
<!--                                     <span class="tx-area">中山區 / 簡餐</span> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <p class="tx-rvwttl"> -->
<!--                                 <a href="#">深夜簡單有效的口味</a> -->
<!--                             </p> -->
<!--                         </div> -->
<!--                         <div class="tx-right"> -->
<!--                             <p class="rating"> -->
<!--                                 <span class="subject">rating</span> -->
<!--                                 <img src=""> -->
<!--                                 <strong>4.1</strong> -->
<!--                             </p> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="reco-tx js-rvw-contents clearfix"> -->
<!--                         <div class="tx-left"> -->
<!--                             <div class="tx-rst"> -->
<!--                                 <span class="reco-tx__ranking-no"> -->
<!--                                     <span class="c-ranking-badge"> -->
<!--                                         <span class="c-ranking-badge__no c-ranking-badge__no--no3"> -->
<!--                                             <i class="c-ranking-badge__contents u-text-num">3</i> -->
<!--                                         </span> -->
<!--                                     </span> -->
<!--                                 </span> -->
<!--                                 <div class="reco-tx__info-wrap"> -->
<!--                                     <div class="tx-rstname"> -->
<!--                                         <a class="tx-rstname__target" href="#">麥當勞</a> -->
<!--                                     </div> -->
<!--                                     <span class="tx-pref">台北市</span> -->
<!--                                     <span class="tx-area">松山區 / 速食</span> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <p class="tx-rvwttl"> -->
<!--                                 <a href="#">台灣第一家</a> -->
<!--                             </p> -->
<!--                         </div> -->
<!--                         <div class="tx-right"> -->
<!--                             <p class="rating"> -->
<!--                                 <span class="subject">rating</span> -->
<!--                                 <img src=""> -->
<!--                                 <strong>3.9</strong> -->
<!--                             </p> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="reco-tx js-rvw-contents clearfix"> -->
<!--                         <div class="tx-left"> -->
<!--                             <div class="tx-rst"> -->
<!--                                 <span class="reco-tx__ranking-no"> -->
<!--                                     <span class="c-ranking-badge"> -->
<!--                                         <span class="c-ranking-badge__no c-ranking-badge__no--no4"> -->
<!--                                             <i class="c-ranking-badge__contents u-text-num">4</i> -->
<!--                                         </span> -->
<!--                                     </span> -->
<!--                                 </span> -->
<!--                                 <div class="reco-tx__info-wrap"> -->
<!--                                     <div class="tx-rstname"> -->
<!--                                         <a class="tx-rstname__target" href="#">紅屋牛排</a> -->
<!--                                     </div> -->
<!--                                     <span class="tx-pref">台北市</span> -->
<!--                                     <span class="tx-area">松山區 / 牛排</span> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <p class="tx-rvwttl"> -->
<!--                                 <a href="#">老派牛排</a> -->
<!--                             </p> -->
<!--                         </div> -->
<!--                         <div class="tx-right"> -->
<!--                             <p class="rating"> -->
<!--                                 <span class="subject">rating</span> -->
<!--                                 <img src=""> -->
<!--                                 <strong>3.8</strong> -->
<!--                             </p> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="reco-tx js-rvw-contents clearfix"> -->
<!--                         <div class="tx-left"> -->
<!--                             <div class="tx-rst"> -->
<!--                                 <span class="reco-tx__ranking-no"> -->
<!--                                     <span class="c-ranking-badge"> -->
<!--                                         <span class="c-ranking-badge__no c-ranking-badge__no--no5"> -->
<!--                                             <i class="c-ranking-badge__contents u-text-num">5</i> -->
<!--                                         </span> -->
<!--                                     </span> -->
<!--                                 </span> -->
<!--                                 <div class="reco-tx__info-wrap"> -->
<!--                                     <div class="tx-rstname"> -->
<!--                                         <a class="tx-rstname__target" href="#">金湘玉手工酸辣粉</a> -->
<!--                                     </div> -->
<!--                                     <span class="tx-pref">台北市</span> -->
<!--                                     <span class="tx-area">大安區 / 小吃</span> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <p class="tx-rvwttl"> -->
<!--                                 <a href="#">好想吃吃看哦</a> -->
<!--                             </p>                       -->
                                                       
<!--                         </div> -->
                        
<!--                         <div class="tx-right"> -->
<!--                             <p class="rating"> -->
<!--                                 <span class="subject">rating</span> -->
<!--                                 <img src=""> -->
<!--                                 <strong>3.7</strong> -->
<!--                             </p> -->
                            
<!--                         </div> -->
<!--                     </div> -->
                </div>
            </div>
            <div id="tryy"></div>
            <section></section>
        </div>
        <!-- main * end-->

        <!-- side * start-->
        <div id="column-side" class="layout1-side">
<!--             <p class="tra-banner-mypage u-mb"> -->
<!--                 <a href="#" class="tra-banner-mypage__target"> -->
<!--                     <img width="300" height="120" alt="面對食物總是老實" src="/img/sidebanner.jpg"> -->
<!--                 </a> -->
<!--             </p> -->
            <div id="column-side-inner">
                <section class="ranking">
                    <div class="side-title ranking__title">
                        <h2>Ranking</h2>
                        <p class="ranking__setting-area"><c:out value="${memberPage.city}"/></p>
<!--                         <span class="ranking__prefecture">（台北市）</span> -->
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
                                    <span class="u-text-num ranking-contents__review-count"><c:out value="${countFav}"/></span>件
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
                                    <span class="u-text-num ranking-contents__review-count"><c:out value="${countFav}"/></span>件
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="u-align-right">
                        <a href="${contextRoot}/reviewerAll" class="c-link-arrow">
                            <span>老食人群</span>
                        </a>
                    </div>
                </section>
                <section>
                    <h2 class="side-title">拜訪區域</h2>
                    <div id="area-map">
                        <div class="frame">
<!--                             <img src="/img/0130藍色的夢.jpg" width="280" height="210" alt="拜訪區域"> -->
                        </div>
                        <ul>
                            <li class="level1" id="taipei">
<!--                                 <img alt src="#"> -->
                            </li>
                        </ul>
                    </div>
                    <div id="area-rank" class="clearfix">
                        <ul class="rank-list1">
                            <li>
                                <a href="#">台北市&nbsp;
                                    <span class="num">
                                        [
                                        <em>${taipei}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">新北市&nbsp;
                                    <span class="num">
                                        [
                                        <em>${newtaipei}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">桃園市&nbsp;
                                    <span class="num">
                                        [
                                        <em>${taoyuan}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">台中市&nbsp;
                                    <span class="num">
                                        [
                                        <em>${taichung}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">台南市&nbsp;
                                    <span class="num">
                                        [
                                        <em>${tainan}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">高雄市&nbsp;
                                    <span class="num">
                                        [
                                        <em>${kaohsiung}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">宜蘭縣&nbsp;
                                    <span class="num">
                                        [
                                        <em>${yilan}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">新竹縣&nbsp;
                                    <span class="num">
                                        [
                                        <em>${hsinchu}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">苗栗縣&nbsp;
                                    <span class="num">
                                        [
                                        <em>${miaoli}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">彰化縣&nbsp;
                                    <span class="num">
                                        [
                                        <em>${changhua}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            
                        </ul>
                        <ul class="rank-list2">
                            <li>
                                <a href="#">南投縣&nbsp;
                                    <span class="num">
                                        [
                                        <em>${nantou}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">雲林縣&nbsp;
                                    <span class="num">
                                        [
                                        <em>${yunlin}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">嘉義縣&nbsp;
                                    <span class="num">
                                        [
                                        <em>${jiayi}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">屏東縣&nbsp;
                                    <span class="num">
                                        [
                                        <em>${pingtong}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">花蓮縣&nbsp;
                                    <span class="num">
                                        [
                                        <em>${hualian}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">台東縣&nbsp;
                                    <span class="num">
                                        [
                                        <em>${taitong}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">澎湖縣&nbsp;
                                    <span class="num">
                                        [
                                        <em>${penghu}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">基隆市&nbsp;
                                    <span class="num">
                                        [
                                        <em>${keelongcity}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">新竹市&nbsp;
                                    <span class="num">
                                        [
                                        <em>${hsinchucity}</em>件
                                        ]
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">嘉義市&nbsp;
                                    <span class="num">
                                        [
                                        <em>${jiayicity}</em>件
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


<script type="Text/JavaScript">
    $(document).ready(function(){
        $('#reviewer-image').hover(function(){
            $('#hoverrr').css('display','block');
        },function(){
            $('#hoverrr').css('display','none');
        });
    })
    
//     //取消收藏
//     $('#unfollowBtn').click(function(){
//     	var memberId= document.getElementById("recordIdValue").value;
//     	if( $("#recordIdValue").val() == null){ alert("null"); }
//     	console.log(memberId);
    	
//     	$.ajax({
//     		url:'http://localhost:8080/oldFoodMan/ittaomise/unsavingTop/'+ memberId,
//     		contentType :'application/json; charset=UTF-8',
//     		method :'post',

//     		success:function(fanSize){
//     			var f=fanSize
//     			if(f=1){
//     				alert("QAQ");
//     			}
//     		}
//     	})
//     })
    
    //test
     function ttt(o){
    	var memberId = $(o).attr("value")
		console.log(memberId);
    	
    	$.ajax({
    		url:'http://localhost:8080/oldFoodMan/ittaomise/unsavingTop/'+ memberId,
    		contentType :'application/json; charset=UTF-8',
    		method :'post',

    		success:function(fanSize){
    			var f=fanSize
    			location.reload();
    			if(f=1){
    				alert("QAQ");
    			}
    			
    		}
    	})
    }

</script>





</body>
</html>