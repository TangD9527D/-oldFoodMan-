<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ol, ul {
    list-style: none;
}
.concern-list {
    padding-top: 20px;
    padding-bottom: 20px;
    width: 100%;
}
.concern-list ul {
    margin-left: -18px;
}
.concern-list .box {
    float: left;
    width: 32%;
    padding: 20px;
    background-color: #f8fafc;
    margin-left: 1%;
    margin-bottom: 15px;
    min-height: 114px;
}
.concern-list .left-img {
    float: left;
    position: relative;
    width: 40px;
    height: 40px;
    top: 0;
}
.concern-list .left-img .top_head {
    position: absolute;
    top: 0;
    border-radius: 25px;
    width: 40px;
    height: 40px;
    z-index: 1;
}
.concern-list .rightright-c {
    margin-left: 50px;
}
.concern-list .rightright-c .title {
    font-weight: 700;
    color: #07111b;
    padding-bottom: 8px;
    width: 100%;
}
.concern-list .rightright-c .title .nickname {
    text-overflow: ellipsis;
    overflow: hidden;
    whitewhite-space: nowrap;
    max-width: 60%;
    display: inline-block;
    vertical-align: middle;
}
.concern-list .rightright-c .desc {
    text-overflow: ellipsis;
    overflow: hidden;
    whitewhite-space: nowrap;
    min-height: 18px;
}
.concern-list .rightright-c .desc, .concern-list .rightright-c .fs-line {
    color: #93999f;
    padding-bottom: 8px;
    font-size: 12px;
}
.concern-list .rightright-c .desc, .concern-list .rightright-c .fs-line {
    color: #93999f;
    padding-bottom: 8px;
    font-size: 12px;
}
.concern-list .rightright-c .fs-line .u-target {
    color: #93999f!important;
}
.concern-list .rightright-c .fs-line .group {
    display: inline-block;
}
em{
    font-style: normal;
    font-weight: 400;
}
.concern-list .rightright-c .fs-line .u-target {
    color: #93999f!important;
}
concern-list .u-margin-l-5 {
    margin-left: 5px;
}
.concern-list .hide {
    display: none;
}
.concern-list .btn-gray-o {
    border: 1px solid #d0d6d9;
    color: #787d82;
    background-color: #fff;
    margin-right: 14px;
}
.concern-list .btn-o {
    padding: 6px 0;
    margin-bottom: 0;
    font-size: 12px;
    font-weight: 400;
    line-height: 1.42857143;
    whitewhite-space: nowrap;
    vertical-align: middle;
    cursor: pointer;
    width: 76px;
    display: block;
    float: left;
}
.concern-list .btn-o{
    text-align: center;
}
.concern-list .btn-green-o {
    border: 1px solid #00b43c;
    color: #00b43c;
    background-color: #fff;
    margin-right: 14px;
}
.nodata {
    height: 420px;
    line-height: 420px;
    font-size: 18px;
    color: #b5b9bc;
    text-align: center;
}

</style>

</head>



<body>

<div class="box">
    <div class="box-header with-border">
        <h3 class="box-title">关系管理</h3>
    </div>
    <div class="box-body" id="right-box-body">
        <div id="right-box-body-replace">
            <div class="nav-tabs-custom" style="box-shadow: 0 0;">
                <ul class="nav nav-tabs">
                    <li th:class="${is_follows}?active:''">
                        <a href="javascript:void(0)" data-toggle="tab"
                           class="relationship-tab-btn"
                           data-th-attr="data-type=follows">我的关注</a>
                    </li>
                    <li th:class="${is_fans}?active:''">
                        <a href="javascript:void(0)" data-toggle="tab"
                           class="relationship-tab-btn" data-th-attr="data-type=fans">我的粉丝</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active">
                        <div class="concern-list" th:if="${userPage.totalElements != 0}">
                            <ul>
                                <li class="box" th:each="user : ${userPage.content}">
                                    <div class="left-img">
                                        <a href="/u/3078817" target="_blank">
                                            <img th:src="${user.avatar}"
                                                 class="top_head">
                                        </a>
                                    </div>
                                    <div class="right-c">
                                        <div class="title">
                                            <a th:href="@{'/u/'+${user.username}}" target="_blank">
                                                <span class="nickname"
                                                      th:text="${user.nickname}">言曌</span>
                                            </a>
                                        </div>
                                        <p class="desc" title="全栈工程师"
                                           th:text="${user.job.name}">全栈工程师</p>
                                        <div class="fs-line">
                                            <a href="/u/3078817/follows" class="u-target">
                                                <span class="group">
                                                    <em>关注</em>
                                                    <em class="u-margin-l-5 follow-size" th:text="${user.followSize}">3</em>
                                                </span>
                                            </a>
                                            <a href="/u/3078817/fans"
                                               class="u-target u-margin-l-15">
                                                <span class="group">
                                                    <em>粉丝</em>
                                                    <em class="u-margin-l-5 fan-size" th:text="${user.fanSize}">61</em>
                                                </span>
                                            </a>
                                        </div>
                                        <div class="btn-line" th:if="${is_follows}">
                                            <a href="javascript:void(0)"
                                               data-th-attr="data-uid=${user.id},opt-type=follow"
                                               class="btn-o btn-green-o js-concern-follow"
                                               style="display: none;">关注</a>
                                            <a href="javascript:void(0)"
                                               data-th-attr="data-uid=${user.id},opt-type=notfollow"
                                               class="btn-o btn-gray-o js-concern-already"
                                               th:if="${user.isFriend!=2}">已关注</a>
                                            <a href="javascript:void(0)"
                                               data-th-attr="data-uid=${user.id},opt-type=notfollow"
                                               class="btn-o btn-gray-o js-concern-mutual"
                                               th:if="${user.isFriend==2}">互相关注</a>
                                            <a href="/u/2478917/messages?uid=3078817"
                                               target="_blank"
                                               class="btn-o btn-gray-o  js-concern-msg">私信</a>
                                        </div>
                                        <div class="btn-line" th:if="${is_fans}">
                                            <a href="javascript:void(0)"
                                               data-th-attr="data-uid=${user.id},opt-type=follow"
                                               class="btn-o btn-green-o js-concern-follow"
                                               th:if="${user.isFriend!=2}">关注</a>
                                            <a href="javascript:void(0)"
                                               data-th-attr="data-uid=${user.id},opt-type=follow"
                                               class="btn-o btn-green-o js-concern-follow"
                                               style="display: none;"
                                               th:if="${user.isFriend==2}">关注</a>
                                            <a href="javascript:void(0)"
                                               data-th-attr="data-uid=${user.id},opt-type=notfollow"
                                               class="btn-o btn-gray-o js-concern-mutual"
                                               th:if="${user.isFriend!=2}"
                                               style="display: none;">互相关注</a>
                                            <a href="javascript:void(0)"
                                               data-th-attr="data-uid=${user.id},opt-type=notfollow"
                                               class="btn-o btn-gray-o js-concern-mutual"
                                               th:if="${user.isFriend==2}">互相关注</a>
                                            <a href="/u/2478917/messages?uid=3078817"
                                               target="_blank"
                                               class="btn-o btn-gray-o  js-concern-msg">私信</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="clear"></div>
                        <!--分页-->
                        <div id="pagenation" th:if="${userPage.totalPages >= 2}">
                            <nav aria-label="Page navigation" th:object="${userPage}">
                                <ul class="pagination"
                                    data-th-attr="data-type=${is_follows}?follows:fans">
                                    <li data-th-classappend="*{first} ? 'disabled' : ''">
                                        <a href="javascript:void(0)"
                                           data-th-attr="pageIndex=${userPage.number}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">上一页</span>
                                        </a>
                                    </li>
                                    <li th:each="i: ${#numbers.sequence(1, userPage.totalPages)}"
                                        data-th-classappend="${(userPage.number + 1) eq i} ? 'active' : ''">
                                        <a href="javascript:void(0)"
                                           data-th-attr="pageIndex=${i}">
                                            <span aria-hidden="true" th:text="${i}"></span>
                                        </a>
                                    </li>
                                    <li data-th-classappend="*{last} ? 'disabled' : ''">
                                        <a href="javascript:void(0)"
                                           data-th-attr="pageIndex=${userPage.number} + 2"
                                           aria-label="Next">
                                            <span aria-hidden="true">下一页</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <div class="nodata" th:if="${userPage.totalElements == 0}">
                            <span th:if="${is_follows}">您还没有关注任何用户</span>
                            <span th:if="${is_follows}">您还没有任何粉丝</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

//重新获取数据
$(document).on('click', '.relationship-tab-btn', function () {
    var _ctx = $("meta[name='ctx']").attr("content");
    var url = _ctx + "/manage/relationships/" + $(this).attr("data-type");
    $.ajax({
        url: url,
        data: {async: true},
        success: function (data) {
            $(".tab-content").html(data)
        },
        error: function () {
            layer.msg("出现错误，请尝试刷新页面!", {icon: 2, anim: 6});
        }
    });
});
//分页
$(document).on('click', '.pagination a', function () {
    var _ctx = $("meta[name='ctx']").attr("content");
    var page = $(this).attr('pageIndex');
    var data_type = $(this).parents("ul").attr("data-type");
    var url = _ctx + "/manage/relationships/" + data_type;
    $.ajax({
        url: url,
        data: {
            async: true,
            page: page,
        },
        success: function (data) {
            $(".tab-content").html(data)
        },
        error: function () {
            layer.msg("出现错误，请尝试刷新页面!", {icon: 2, anim: 6});
        }
    });
});
//取消关注
$(document).on('click', '.js-concern-already,.js-concern-mutual', function () {
    var current = $(this);
    var _ctx = $("meta[name='ctx']").attr("content");
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    var url = _ctx + "/manage/relationships/";
    $.ajax({
        url: url,
        type: 'POST',
        data: {
            optType: current.attr('opt-type'),
            userId: current.attr('data-uid'),
        },
        beforeSend: function (request) {
            request.setRequestHeader(header, token); // 添加  CSRF Token
        },
        success: function (data) {
            current.hide();
            current.prev("a").show();
            current.parents(".box").find(".fan-size").html(data.body);
        },
        error: function () {
            layer.msg("出现错误，请尝试刷新页面!", {icon: 2, anim: 6});
        }
    });
});
//关注
$(document).on('click', '.js-concern-follow', function () {
    var current = $(this);
    var _ctx = $("meta[name='ctx']").attr("content");
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    var url = _ctx + "/manage/relationships/";
    $.ajax({
        url: url,
        type: 'POST',
        data: {
            optType: current.attr('opt-type'),
            userId: current.attr('data-uid'),
        },
        beforeSend: function (request) {
            request.setRequestHeader(header, token); // 添加  CSRF Token
        },
        success: function (data) {
            current.hide();
            current.next("a").show();
            current.parents(".box").find(".fan-size").html(data.body);
        },
        error: function () {
            layer.msg("出现错误，请尝试刷新页面!", {icon: 2, anim: 6});
        }
    });
});

</script>

</body>
</html>