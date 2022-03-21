<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%-- <jsp:include page="../menu.jsp" /> --%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_header.css">
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_navi.css">
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_contents_left.css">
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_contents_right.css">
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_base">
    
    <style>
    	.menu7{
        	line-height:0px;
        }
    
        #containerr{
            position: relative;
            clear: both;
            margin: 0 auto 30px;
            width: 100%;
        }

        #contents{
            margin: 0 auto;
            width: 980px;
        }

        .contents-rvwr{
            position: relative;
        }

        .clearfix::after{
            clear:both;
        }

        .clearfix::before,.clearfix::after{
            display: block;
            overflow: hidden;
            content: '';
        }

       

        .layout1-main{
            float: left;
            width: 660px;
        }

     
        .layout1-side{
            float: right;
            width: 300px;
        }

        .layout1-main::before{
            position: absolute;
            top: 0;
            left: 10px;
            width: 1px;
            height: 100%;
            content: '';
            background-color: #eeece4;
        }

       

        .rvwr-heading1{
            display: table;
            position: relative;
            border-bottom: 1px solid #e0dccc;
            width: 100%;
            margin-top: 1rem;
            padding-bottom: 1.2rem;
        }

        p.comment-prof{
            margin-top: 10px;
            line-height: 1.6;
        }

        .rvwr-heading1.rvwr-heading1--prof{
            margin-top: 40px;
        }

        .rvwr-heading1__title{
            display: table-cell;
            color: #13131e;
            font-weight: bold;
            vertical-align: middle;
            font-size: 1.6rem;
        }

        .rvwr-heading1__edit-btn{
            position: absolute;
            right: 0;
            bottom: 5px;
        }

        #trend-wrap #rating-box{
            float: left;
            width: 320px;
        }

        #trend-wrap #price-box{
            float: right;
            width: 320px;
        }

        .chart-box{
            margin-top: -1px;
            padding: 10px;
            border: 1px solid #d5d3d0;
            width: 298px;
            background-color: #fff;
        }

        .chart-box .graph{
            padding: 22px 0 0;
            background: url(${contextRoot}/imgLemon/bar.gif) no-repeat right top;
        }

        .chart-box .graph ul{
            width: 298px;
        }

        .chart-box .graph ul li{
            display: block;
            float: left;
            padding: 8px 7px 3px 0;
            width: 292px;
            line-height: 1.3;
        }

        .chart-box .graph ul li .rate-img{
            float: left;
            margin-top: -5px;
            width: 70px;
        }

        .chart-box .graph ul li .score{
            float: left;
            width: 50px;
            font-family: Arial;
            font-weight: bold;
            text-align: right;
        }

        .chart-box .graph ul li .num{
            float: left;
            padding-left: 5px;
            width: 50px;
            color: #b3b3b6;
            font-size: 86%;
        }

        .chart-box .graph ul li .bar{
            float: right;
            margin-top: -3px;
            width: 115px;
        }

        .chart-box .graph ul li .rate-price{
            float: left;
            width: 115px;
            font-family: Arial;
            text-align: right;
        }

        .layout1-side #column-side-inner{
            padding-left: 20px;
            width: 280px;
        }

        .side-camera{
            position: relative;
        }

        .layout1-side .side-title{
            display: block;
            margin-top: 20px;
            border-bottom: 1px solid #e1e1e1;
            box-shadow: 0 1px 0 0 #fff;
            color: #13131e;
            font-weight: bold;
            padding-bottom: 0.5rem;
            font-size: 1.2rem;
        }

        .side-camera__btn{
            position: absolute;
            top: 1px;
            right: 0;
        }

        .side-camera__nothing{
            margin-top: 10px;
        }

        .side-camera__title::before{
            padding-right: 2px;
            color: #b5b2ab;
            font-size: 1.4rem;
            vertical-align: middle;
        }

        .gly-b-camera::before,.gly-a-camera::after{
            content: '';
        }

        .side-camera__title span{
            vertical-align: middle;
        }

        .simple-action-btn{
            position: relative;
            display: inline-block;
        }

        .side-camera__btn-item{
            width: 20px;
            height: 20px;
        }

        .simple-action-btn__target{
            appearance: none;
            display: block;
            cursor: pointer;
            margin: 0;
            outline: none;
            border: 1px solid transparent;
            border-radius: 3px;
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            color: #13131e;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            text-shadow: 0 1px 0 #fff;
            line-height: normal;
        }

        img{
            vertical-align: bottom;
        }

        li{
            list-style: inherit;
        }

        div,p{
            word-wrap: break-word;
            overflow-wrap: break-word;
        }

        ol,ul{
            list-style: none;
        }

        h2,h4,strong{
            font-style: normal;
            font-weight: bold;
        }

        dt,span,dl,ol,ul,li,a,span,ul,div,h2,h3,h4,p,section{
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
                            <span class="reviewer-counter__label">讚!</span>
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
                                <span class="reviewer-counter__like-count-num">2,7</span>
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



<div id="containerr">
    <!--contents * start-->
    <div id="contents" class="clearfix contexts-rvwr">
        <!--main * start-->
        <div id="column-main" class="layout1-main">
            <div class="rvwr-heading1">
                <div class="rvwr-heading1 rvwr-heading1--prof" style="border-bottom: 0;">
                    <h2 class="rvwr-heading1__title">profile</h2>
                    <div class="rvwr-heading1__edit-btn">
                        <p class="simple-action-btn__item">
                            <a class="simple-action-btn__target simple-action-btn__target--setting" title="self introduction" href="${contextRoot}/setReviewerPage">s</a>
                        </p>
                    </div>
                </div>
            </div>
            <p class="comment-prof">
            
            <c:out value="${reviewerPage.reviewer_intro}"/>
            
            </p>
            <div class="rvwrprof-rvwr-medal" style="display: none;"></div>
            <div class="rvwr-heading1 rvwr-heading1--prof" >
                <h2 class="rvwr-heading1__title">Ranking Preference</h2>
            </div>
            <div id="trend-wrap" class="clearfix">
                <div id="rating-box">
                    <h4 class="subtittle">評價分布</h4>
                    <div class="chart-box">
                        <div class="graph">
                            <ul class="clearfix">
                                <li class="clearfix">
                                    <p class="rate-img">
                                        <img src="${contextRoot}/imgLemon/star_s50.gif" width="68" height="12">
                                    </p>
                                    <p class="score">5</p>
                                    <p class="num">
                                        [
                                        <strong>${k5}</strong>
                                        件]
                                    </p>
                                    <p class="bar">
                                        <img width="${k5Avg}%" height="12" src="${contextRoot}/imgLemon/rating_border.gif">
                                    </p>
                                </li>
                                <li class="clearfix">
                                    <p class="rate-img">
                                        <img src="${contextRoot}/imgLemon/star_s40.gif" width="68" height="12">
                                    </p>
                                    <p class="score">4</p>
                                    <p class="num">
                                        [
                                        <strong>${k4}</strong>
                                        件]
                                    </p>
                                    <p class="bar">
                                        <img width="${k4Avg}%" height="12" src="${contextRoot}/imgLemon/rating_border.gif">
                                    </p>
                                </li>
                                <li class="clearfix">
                                    <p class="rate-img">
                                        <img src="${contextRoot}/imgLemon/star_s30.gif" width="68" height="12">
                                    </p>
                                    <p class="score">3</p>
                                    <p class="num">
                                        [
                                        <strong>${k3}</strong>
                                        件]
                                    </p>
                                    <p class="bar">
                                        <img width="${k3Avg}%" height="12" src="${contextRoot}/imgLemon/rating_border.gif">
                                    </p>
                                </li>
                                <li class="clearfix">
                                    <p class="rate-img">
                                        <img src="${contextRoot}/imgLemon/star_s20.gif" width="68" height="12">
                                    </p>
                                    <p class="score">2</p>
                                    <p class="num">
                                        [
                                        <strong>${k2}</strong>
                                        件]
                                    </p>
                                    <p class="bar">
                                        <img width="${k2Avg}%" height="12" src="${contextRoot}/imgLemon/rating_border.gif">
                                    </p>
                                </li>
                                <li class="clearfix">
                                    <p class="rate-img">
                                        <img src="${contextRoot}/imgLemon/star_s10.gif" width="68" height="12">
                                    </p>
                                    <p class="score">1</p>
                                    <p class="num">
                                        [
                                        <strong>${k1}</strong>
                                        件]
                                    </p>
                                    <p class="bar">
                                        <img width="${k1Avg}%" height="12" src="${contextRoot}/imgLemon/rating_border.gif">
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="price-box">
                    <h4 class="sub-title">消費金額分布</h4>
                    <div class="chart-box">
                        <div class="graph">
                            <ul class="clearfix">
                                <li class="clearfix">
                                    <p class="rate-price">0~500 $</p>
                                    <p class="num">
                                        [
                                        <strong>${kp1}</strong>
                                        件]
                                    </p>
                                    <p class="bar">
                                        <img width="${kp1Avg}%" height="12" src="${contextRoot}/imgLemon/rating_border.gif">
                                    </p>
                                </li>
                                <li class="clearfix">
                                    <p class="rate-price">501~1000 $$</p>
                                    <p class="num">
                                        [
                                        <strong>${kp2}</strong>
                                        件]
                                    </p>
                                    <p class="bar">
                                        <img width="${kp2Avg}%" height="12" src="${contextRoot}/imgLemon/rating_border.gif">
                                    </p>
                                </li>
                                <li class="clearfix">
                                    <p class="rate-price">1001~3000 $$$</p>
                                    <p class="num">
                                        [
                                        <strong>${kp3}</strong>
                                        件]
                                    </p>
                                    <p class="bar">
                                        <img width="${kp3Avg}%" height="12" src="${contextRoot}/imgLemon/rating_border.gif">
                                    </p>
                                </li>
                                <li class="clearfix">
                                    <p class="rate-price">3000~ $$$$</p>
                                    <p class="num">
                                        [
                                        <strong>${kp4}</strong>
                                        件]
                                    </p>
                                    <p class="bar">
                                        <img width="${kp4Avg}%" height="12" src="${contextRoot}/imgLemon/rating_border.gif">
                                    </p>
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--main * end-->
        <!--side * start-->
        <div id="column-side" class="layout1-side">
            <div class="side-camera">
                <h3 class="side-camera__title side-title gly-b-camera">
                    <span>使用中的相機</span>
                </h3>
                <div class="side-camera__btn">
                    <div class="simple-action-btn">
                        <p class="side-camera__btn-item">
                            <a class="simple-action-btn__target simple-action-btn__target--setting" title="update using camera" href="${contextRoot}/setReviewerPage">
                                s
                            </a>
                        </p>
                    </div>
                </div>
                <p class="side-camera__nothing" value="沒有使用中相機"><c:out value="${reviewerPage.reviewer_camera}"/></p>
            </div>
        </div>
        <!--side * end -->
    </div>
</div>


</body>
</html>