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
    <title>喜愛店家</title>
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_header.css">
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_navi.css">
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_contents_left.css">
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_contents_right.css">
    <link rel="stylesheet" href="${contextRoot}/cssLemon/oldfoodPage01_base">
    <style>

			.menu7{
        	line-height:0px;
        	}

            .reviewer-navi__item.reviewer-navi__item--interest.is-selected .reviewer-navi__target::after{
            position: absolute;
            left: 50%;
            bottom: 0;
            height: 3px;
            width: 85%;
            margin-left: 42.5%;
            background: #463f2d;
            content: '';
            width: 92%;
            margin-left: -46%;
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

        .clearfix::before,.clearfix::after{
            display: block;
            overflow: hidden;
            content: '';
        }

        .rvwr-list-sidebar{
            position: relative;
            z-index: 2;
        }

        .layout5-side{
            float: left;
            width: 190px;
        }

        .list-sidebar.list-sidebar--modal-link{
            padding-bottom: 0;
        }

        .list-sidebar{
            margin-bottom: 17px;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box;
            box-shadow: 0 0 1px 1px rgb(19 19 30/ 10%);
            background: #fff;
        }

        .list-sidebar__heading{
            position: relative;
            padding: 14px 10px 10px;
            color: #13131e;
            font-size: 100%;
        }

        .list-sidebar__item{
            position: relative;
            line-height: 1.3;
        }

        .select-wrap{
            display: block;
            padding: 15px 0;
            border-top: solid 1px #e5e2da;
            border-bottom: dotted 1px #e5e2da;
            border-left: solid 1px #fa0;
            border-right: solid 1px #e5e2da;
            width: 100%;
            color: #463f2d;
            font-weight: bold;
            text-decoration: none;
            background: #fefae6;
            box-sizing: border-box;
        }

        .select-wrap::after{
            clear: both;
            display: block;
            overflow: hidden;
            content: '';
        }

        .list-sidebar__btn{
            width: 100%;
        }

        .list-sidebar__title>strong{
            font-size: 125%;
        }

        .list-sidebar__content+.list-sidebar__sub-title.list-sidebar__sub-title--condition{
            border-top: 1px solid #eeece4;
        }

        .list-sidebar__sub-title.list-sidebar__sub-title--condition{
            padding: 7px 8px 6px;
            color: #463f2d;
            background:#faf8f5;
        }

        .list-sidebar__sub-title{
            font-weight: bold;
        }

        .list-sidebar__content{
            display: block;
            position: relative;
            margin: 8px;
        }

        .list-sidebar__content:last-child{
            margin-bottom: 4px;
        }

        .list-sidebar__price{
            width: 100%;
            margin: 10px 0;
        }

        .u-clearfix::after{
            clear: both;
        }

        .u-clearfix::before,.u-clearfix::after{
            display: block;
            overflow: hidden;
            content: '';
        }

        .list-sidebar__select-wrap.list-sidebar__select-wrap--price{
            float: left;
            width: 45%;
        }

        .list-sidebar__select-wrap{
            display: block;
            box-sizing: border-box;
        }

        .c-select{
            position: relative;
            border: 1px solid #d2d2d2;
            height: auto;
            overflow: hidden;
            vertical-align: middle;
            background-color: #fff;
        }

        .list-sidebar__select-wrap .list-sidebar__select{
            padding: 0 0 0 4px;
        }

        .c-select>select, .c-select>input{
            display: block;
            position: relative;
            z-index: 1;
            cursor: pointer;
            outline: none;
            border: none;
            width: 100%;
            height: 2.4rem;
            background: rgba(255,255,255,0);
            appearance: none;
            box-sizing: border-box;
            font-size: 1.3rem;
        }

        .c-select>select>option, c-select>input>option{
            color: #595960;
        }

        .list-sidebar__price-between{
            float: left;
            width: 10%;
            height: 2.4em;
            text-align: center;
            line-height: 2.4em;
        }

        .list-sidebar__select-wrap.list-sidebar__select-wrap--price::after{
            top: 16px;
        }

        .list-sidebar__select-wrap::after{
            position: absolute;
            right: 5px;
            width: 1em;
            height: 1em;
            color: #bcb08a;
            pointer-events: none;
        }

        .c-select::after{
            display: block;
            z-index: 2;
            margin-top: 0.5em;
            line-height: 1;
            font-family: 'Lucida Sans';
            font-style: normal;
            font-weight: normal;
            font-variant: normal;
            content: '';
        }

        .c-btn.c-btn--success{
            border: 1px solid #82ad24;
            box-shadow: 0 0 1px rgb(255 255 255/60%)inset,0 1px 0 rgb(0 0 0/10%);
            color: #fff;
            text-shadow: 0 -1px 0 rgb(0 0 0/30%);
            background-color: #9c0;
            background-image: linear-gradient(to bottom,#9c0,#82ad24);
        }

        .list-sidebar.list-sidebar--main:last-child{
            margin-bottom: 16px;
        }

        .c-btn{
            display: inline-block;
            position: relative;
            cursor: pointer;
            margin: 0;
            outline: none;
            border-radius: 3px;
            box-sizing: border-box;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            vertical-align: middle;
            line-height: normal;
            appearance: none;
            padding: 0.6rem 1.2rem;
            font-size: 1.2rem;

        }

        .rvwr-list-main{
            position: relative;
            z-index: 1;
        }

        .layout5-main{
            float: right;
            width: 770px;
        }

        .search-condition {
            position: relative;
            padding: 19px 20px;
            border-top: 3px solid #e0dccc;
            border-bottom: 1px solid #e0dccc;
            box-sizing: border-box;
            background: #fff;
        }

        .search-condition__header{
            position: relative;
            padding-right: 150px;
        }

        .search-condition__result{
            display: inline;
            color: #463f2d;
            font-weight: bold;
        }

        .search-condition__title{
            padding-right: 15px;
            font-size: 17px;
        }

        .rvwr-view-sort{
            margin-top: 10px;
            background: #faf8f5;
            padding: 14px 0;
        }

        .c-view-sort{
            position: relative;
            border-bottom: 1px solid #e1e1e1;
            width: 100%;
            box-sizing: border-box;
            line-height: 1.3;
            display: flex;
        }

        .rvw-page-count{
            display: table;
            position: relative;
            margin:18px 0;
            width: 100%;
        }

        .rvw-page-count__item{
            display: table-cell;
            vertical-align: middle;
        }

        .rvw-item{
            border: solid 1px #e0dccc;
            border-radius: 5px;
            background-color: #fff;
            margin-top: 1.5rem;
        }

        .simple-rvw__rst-info{
            position: relative;
            min-height: 90px;
        }

        .simple-rvw__rst-img{
            position: absolute;
            top: 0;
            left: 0;
            z-index: 1;
            box-sizing: border-box;
            overflow: hidden;
        }

        .simple-rvw__rst-data{
            position: relative;
            padding: 2px 0 0 105px;
        }

        .simple-rvw__rst-name.simple-rvw__rst-name--mypage{
            width: calc(100% - 86px);
        }

        .simple-rvw__rst-name{
            font-weight: 600;
            font-size: 1.6rem;
        }

        .simple-rvw__area-catg{
            margin: 3px 0 4px;
            color: #949499;
            font-size: 1.1rem;
        }

        .simple-rvw__area-catg>span{
            padding: 0 0.3rem;
        }

        .simple-rvw__rate{
            display: flex;
            margin-top: 0.8rem;
            align-items: center;
        }

        .simple-rvw__rvw-count{
            display: inline-block;
            margin-left: 1px ;
            vertical-align: baseline;
            line-height: 1;
        }

        .simple-rvw__rvw-count-subject{
            color: #13131e;
            font-weight: normal;
            font-size: 1.1rem;
        }

        .simple-rvw__rvw-count-subject::before{
            display: inline-block;
            margin-top: -0.14em;
            margin-right: 0.4em;
            width: 1em;
            height: 1em;
            color: #bcb08a;
            vertical-align: middle;
            font-size: 1.4rem;
        }

        .gly-b-review::before{
            content: '';
        }
        
        .simple-rvw__rvw-count-target{
            color: #13131e;
            text-decoration: underline;
            font-size: 1.2rem;
        }

        .simple-rvw__rst-subdata{
            display: flex;
            margin-top: 1rem;
            flex-wrap: wrap;
        }

        .c-rating.c-rating--s{
            font-size: 1.2rem;
        }

        .simple-rvw__budget{
            display: inline-block;
            position: relative;
            margin: 0 0.7em 0.4em 0;
            vertical-align: middle;
        }

        .c-rating__val{
            display: block;
            float: left;
            font-family: Arial;
            font-weight: normal;
        }

        .p-preview-visit.p-preview-visit--score{
            flex-wrap: wrap;
        }

        .p-preview-visit__favorite.p-preview-visit__favorite--rating{
            line-height: 1;
        }

        .p-preview-visit__favorite{
            display: flex;
            padding-right: 2rem;
            box-sizing: border-box;
            overflow: hidden;
            vertical-align: middle;
            align-items: center;
            flex-grow: 1;
        }

        .p-preview-visit__favorite.p-preview-visit__favorite--rating+.p-preview-visit__favorite.p-preview-visit__favorite--comment{
            display: block;
            width: 100%;
            line-height: 1;
            flex-basis: 100%;
            line-height: 1;
            margin-top: 1rem;
        }

        .p-preview-visit__favorite.p-preview-visit__favorite--comment{
            padding-right: 0.8rem;
            color: #595960;
            font-weight: normal;
        }

        .p-preview-visit__favorite{
            box-sizing: border-box;
            overflow: hidden;
            vertical-align: middle;
            align-items: center;
            flex-grow: 1;
        }

        .p-preview-visit__favorite-text{
            margin-top: 1px;
            color: #13131e;
            line-height: 1.1;
            display: inline-block;
            max-width: 100%;
            overflow: hidden;
            text-overflow: ellipsis;
            word-wrap: normal;
            white-space: nowrap;
        }

        .p-preview-visit{
            display: flex;
            position: relative;
            border: 1px solid #eeece4;
            border-radius: 2px;
            width: 100%;
            min-height: 39px;
            align-items: center;
            padding: 0.9rem 2.7rem 0.9rem 0.9rem;
            margin-top: 1.4rem;
            box-sizing: border-box;
        }

        .p-preview-visit__rstdata{
            display: table-cell;
            text-align: right;
            white-space: nowrap;
            vertical-align: middle;
            box-sizing: border-box;
        }

        .p-preview-visit__visited-date{
            margin-right: 8px;
            margin-left: 0.8rem;
            font-size: 1.1rem;
        }

        .p-preview-visit__bkm-rate{
            font-size: 1.6rem;
        }

        .c-rating-v2{
            display: inline-block;
            overflow-wrap: normal;
            white-space: nowrap;
            vertical-align: text-bottom;
            line-height: 1;
        }

        .c-rating-v2::before, .c-rating-v2::after{
            display: block;
            overflow: hidden;
            content: '';
        }

        .c-rating-v2__val.c-rating-v2__val--strong{
            color: #e10000;
            font-weight: bold;
        }

        .c-rating-v2__val{
            display: block;
            float: left;
            font-family: Arial;
        }

        .c-rating-v2::after{
            clear: both;
        }

        .simple-rvw{
            position: relative;
            padding: 14px;
            cursor: pointer;
        }

        .c-page-count__num{
            font-family: Arial;
            font-size: 1.5rem;
        }

        .c-page-count{
            display: inline-block;
            color: #595960;
        }

        .search-condition__words{
            margin-top: 6px;
            font-size: 1.1rem;
        }

        .search-condition__word-item{
            position: relative;
            font-weight: normal;
        }

        .search-condition__word-item::before{
            display: inline-block;
            margin-right: 0.4em;
            padding: 0.4em;
            border-radius: 1.4em;
            color: #fff;
            font-family: 'Courier New';
            font-style: normal;
            font-weight: normal;
            font-size: 86%;
            line-height: 1;
            content: '';
            background-color: #d6ceb4;
        }

        .c-view-sort__item:first-child{
            border-left: none;
        }

        .c-view-sort__item{
            display: inline-block;
            padding: 0 6px 0 10px;
            color: #13131e;
            white-space: nowrap;
            vertical-align: middle;
        }

        .c-view-sort__target img{
            margin-right: 4px;
            vertical-align: -1px;
        }

        .list-sidebar .list-sidebar--main{
            margin-top: 8px;
        }

        .list-sidebar{
            padding-bottom: 8px;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box;
            box-shadow: 0 0 1px 1px rgb();
        }

        .star-rating{
            padding-right: 5px;
        }

        .ratings{
            position: relative;
            vertical-align: middle;
            display: inline-block;
            color: #ddd; /*背景星星顏色*/
            overflow: hidden;
            font-size: 20px; /*調整星星大小*/
            text-shadow: 0px 1px 0 #999;
        }

        .full_star{
            width: 90%; /*星等*/
            position: absolute;
            left: 0;
            top: 0;
            white-space: nowrap;
            overflow: hidden;
            color: #D56A16; /*前面星星顏色*/
        }

        a{
            color: #06c;
            text-decoration: none;
        }

        option{
            font-weight: normal;
            display: block;
            white-space: nowrap;
            min-height: 1.2em;
            padding: 0 2px 1px;
        }

        input, button, textarea, select{
            margin: 0;
            font: inherit;
        }

        label{
            cursor: pointer;
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

        h2,h4,strong,b{
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
                <p class="page-name"><c:out value="${reviewerPage.reviewer_title}"/></p>
                <p class="page-sub-title"><c:out value="${reviewerPage.reviewer_subtitle}"/></p>
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
                    <p class="reviewer-status__occupation"><c:out value="${reviewerPage.reviewer_occupation}"/></p>
                </div>
                <div class="comment-prof">
                    <span class="comment-prof__body">
                        <c:out value="${reviewerPage.reviewer_intro}"/>
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
                                <span class="reviewer-counter__data-num">44件</span>
                            </p>
                        </dd>
                    </dl>
                    <dl class="reviewer-counter__item">
                        <dt class="reviewer-counter__subject reviewer-counter__subject--photo">
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
                    <a class="reviewer-navi__target" href="${contextRoot}/reviewerMainPage">
                        <span class="reviewer-navi__menu-wrap">
                            <span class="reviewer-navi__menu reviewer-navi__menu--top">首頁</span>
                        </span>
                    </a>
                </li>
                <li id="reviewer-navi-review" class="reviewer-navi__item reviewer-navi__item--review">
                    <a class="reviewer-navi__target" href="${contextRoot}/reviewerIttaomise">
                        <span class="reviewer-navi__menu-wrap">
                            <span class="reviewer-navi__count">1478</span>
                            <span class="reviewer-navi__menu">拜訪店家</span>
                        </span>
                    </a>
                </li>
                <li id="reviewer-navi-interest" class="reviewer-navi__item reviewer-navi__item--interest">
                    <a class="reviewer-navi__target" href="${contextRoot}/reviewerKoromi">
                        <span class="reviewer-navi__menu-wrap">
                            <span class="reviewer-navi__count">156</span>
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
                            <span class="reviewer-navi__count">62</span>
                            <span class="reviewer-navi__menu">追蹤</span>
                        </span>
                    </a>
                </li>
                <li id="reviewer-navi-follower" class="reviewer-navi__item reviewer-navi__item--follower">
                    <a class="reviewer-navi__target" href="${contextRoot}/relationships/fans">
                        <span class="reviewer-navi__menu-wrap">
                            <span class="reviewer-navi__count">22157</span>
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
        <div class="clearfix" id="contents">
            <div class="layout5-side rvwr-list-sidebar" id="column-side">
                <div class="list-sidebar-wrap">
                    <div class="list-sidebar list-sidebar--main">
                        <div class="list-sidebar__heading">
                            <p class="list-sidebar__title list-sidebar__title--area">
                                <strong>區域</strong>
                                尋找
                            </p>
                        </div>
                        <div class="list-sidebar__item">
                            <div class="select-wrap">
                                <label class="list-sidebar__select-wrap list-sidebar__select-wrap--price c-select">
                                    <select class="list-sidebar__select" name="Area">
                                        <option selected="selected" value="0">花蓮縣</option>
                                        <option value="1">高雄市</option>
                                        <option value="2">台南市</option>
                                        <option value="3">宜蘭縣</option>
                                        <option value="4">彰化縣</option>
                                        <option value="5">台北市</option>
                                    </select>
                                </label>
                            </div>    
                        </div>
                    </div>
                    <div class="list-sidebar list-sidebar--main">
                        <div class="list-sidebar__heading">
                            <p class="list-sidebar__title list-sidebar__title--genre">
                                <strong>種類</strong>
                                尋找
                            </p>
                        </div>
                        <div class="list-sidebar__item">
                            <div class="select-wrap">
                                <label class="list-sidebar__select-wrap list-sidebar__select-wrap--price c-select">
                                    <select class="list-sidebar__select" name="Genre">
                                        <option selected="selected" value="0">酒精</option>
                                        <option value="1">燒肉</option>
                                        <option value="2">日本料理</option>
                                        <option value="3">海產</option>
                                        <option value="4">小吃</option>
                                        <option value="5">咖啡</option>
                                    </select>
                                </label>
                            </div>    
                        </div>
                    </div>
                </div>
                <form action="#" accept-charset="UTF-8" method="get">
                    <div class="list-sidebar list-sidebar--modal-link">
                        <h4 class="list-sidebar__sub-title list-sidebar__sub-title--condition">預算</h4>
                        <div class="list-sidebar__content">
                            <div class="list-sidebar__price u-clearfix">
                                <label class="list-sidebar__select-wrap list-sidebar__select-wrap--price c-select">
                                    <select class="list-sidebar__select" name="LstCos">
                                        <option selected="selected" value="0">無下限</option>
                                        <option value="1">200</option>
                                        <option value="2">500</option>
                                        <option value="3">1000</option>
                                        <option value="4">1500</option>
                                        <option value="5">2000</option>
                                    </select>
                                </label>
                                <span class="list-sidebar__price-between">~</span>
                                <label class="list-sidebar__select-wrap list-sidebar__select-wrap--price c-select">
                                    <select class="list-sidebar__select" name="LstCosT">
                                        <option selected="selected" value="0">無上限</option>
                                        <option value="1">200</option>
                                        <option value="2">500</option>
                                        <option value="3">1000</option>
                                        <option value="4">1500</option>
                                        <option value="5">2000</option>
                                    </select>            
                                </label>
                            </div>
                        </div>
                        <div class="list-sidebar__content">
                            <button class="c-btn c-btn--success list-sidebar__btn js-analytics" name="commit" type="submit" value="送出條件">送出條件</button>
                        </div>
                    </div>   
                </form>    
            </div>
            <div class="layout5-main rvwr-list-main js-rvwr-list-main" id="column-main">
                <div class="search-condition">
                    <div class="search-condition__header">
                        <h2 class="search-condition__result">
                            <strong class="search-condition__title">去過的店</strong>
                        </h2>
                    </div>
                    <div class="search-condition__body">
                        <p class="search-condition__words">
                            <span class="search-condition__word-item">
                                無指定條件
                            </span>
                        </p>
                    </div>
                </div>
                <div class="c-view-sort rvwr-view-sort">
                    <ul class="c-view-sort__list">
                        <li class="c-view-sort__item">
                            <a class="c-view-sort__target" href="#">
                                <img src="/imgLemon/triangle_down.gif" width="11" height="11" alt="下三角">
                                <strong>更新日順序</strong>
                            </a>
                        </li>
                        <li class="c-view-sort__item">
                            <a class="c-view-sort__target" href="#">
                                <img src="/imgLemon/triangle_down.gif" width="11" height="11" alt="下三角">
                                <span>評價順序</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="rvw-page-count">
                    <p class="c-page-count">
<!--                         <span class="c-page-count__num"> -->
<!--                             <strong>1</strong> -->
<!--                         </span> -->
<!--                         ~ -->
<!--                         <span class="c-page-count__num"> -->
<!--                             <strong>1</strong> -->
<!--                         </span> -->
<!--                         件表示 -->
<!--                         <span class="c-page-count__line"> / </span> -->
                        全
                        <span class="c-page-count__num">
                            <strong><c:out value="${count}"/></strong>
                        </span>
                        件
                    </p>
                </div>
                <!-- 食記AREA -->
                <c:forEach var='frd' items='${frds}'>
                <div class="js-bookmark js-done">
                    <div class="rvw-item rvw-item--simple rvw-item--rvwlst js-rvw-item">
                        <div class="simple-rvw simple-rvw--rstdata">
                            <div class="simple-rvw__rst-info js-rst-clickable-area">
                                <p class="simple-rvw__rst-img">
                                    <img width="90" height="90" alt="店名" src="/imgLemon/無留手02.jpg">
                                </p>
                                <div class="simple-rvw__rst-data">
                                    <div class="simple-rvw__rst-name simple-rvw__rst-name--mypage">
                                        <h3>
                                            <a class="simple-rvw__rst-name-target" target="_blank" href="#">
                                                <c:out value="${frd.shopName}"/>        
                                            </a>
                                        </h3>
                                    </div>
                                    <p class="simple-rvw__area-catg">
                                    	<c:out value="${frd.city}"/>
                                    	<span> / </span>
                                        <c:out value="${frd.town}"/>
                                        <span> / </span>
                                        <c:out value="${frd.shopType}"/>
                                    </p>
                                    <div class="simple-rvw__rate">
                                        <p class="c-rating simple-rvw__score-total c-rating--va135">
                                            <div class="star-rating">
                                                <div class="ratings">
                                                    <div class="empty_star">★★★★★</div>
                                                    <div class="full_star">★★★★★</div>
                                                </div>
                                            </div>
                                        </p>
                                        <p class="simple-rvw__rvw-count">
                                            <span class="simple-rvw__rvw-count-subject gly-b-reviw">
                                                <a class="simple-rvw__rvw-count-target" href="#">
                                                    <em>186</em>
                                                    件
                                                </a>
                                            </span>
                                        </p>
                                    </div>
                                    <div class="simple-rvw__rst-subdata">
                                        <p class="c-rating c-rating--s simple-rvw__budget">
                                            <span class="c-rating__val">$<c:out value="${frd.priceScope}"/></span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="p-preview-visit js-rvw-clickable-area p-preview-visit--score">
                                <div class="p-preview-visit__favorite p-preview-visit__favorite--rating">
                                    <p class="c-rating-v2 p-preview-visit__bkm-rate">
                                        <b class="c-rating-v2__val c-rating-v2__val--strong"><c:out value="${frd.gender2}"/></b>
                                    </p>
                                </div>
                                <div class="p-preview-visit__favorite p-preview-visit__favorite--comment">
                                     <p class="p-preview-visit__favorite-text"><c:out value="${frd.cp}"/></p>
                                </div>
                                <p class="p-preview-visit__rstdata">
                                    <span class="p-preview-visit__visit-date"><c:out value="${frd.added}"/></span>
                                </p>
                            </div>
                            <div class="rvw-item__bkm-custom-wrap"></div>
                        </div>
                    </div>
                </div>
				</c:forEach>
				<!-- 食記AREA結束 -->
            </div>
        </div>
    </div>


</body>
</html>