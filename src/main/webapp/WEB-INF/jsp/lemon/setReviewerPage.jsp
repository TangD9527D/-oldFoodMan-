<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%-- <jsp:include page="../messages/layout/navbar.jsp" /> --%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SettingMyPage</title>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<style>
#container {
	position: relative;
	display: flex;
	justify-content: center;
	clear: both;
	margin: 0 auto 30px;
	width: 100%;
}

.clearfix::before {
	display: block;
	overflow: hidden;
	content: '';
}

.layout4-main {
	width: 760px;
}

.heading1 {
	border-top: 3px solid #a5bcd1;
	border-bottom: 3px solid #a5bcd1;
}

.heading1 {
	display: table;
	padding: 10px 10px 9px 12px;
	width: 100%;
	box-sizing: border-box;
	color: #13131e;
	font-weight: bold;
	font-size: 134%;
}

.lead {
	margin: 15px 12px;
}

.lead>p {
	margin: 10px 0;
}

.c-heading2 {
	border-top: 2px solid #a5bcd1;
	background: #e3eaf0;
}

.setting-mypage__title {
	margin: 20px 0 15px;
}

.c-heading2 {
	display: table;
	width: 100%;
	color: #13131e;
	font-weight: bold;
	padding: 1.1rem 1rem 0.9rem 1.2rem;
	box-sizing: border-box;
	font-size: 1.4rem;
	box-shadow: 0 1px 0 #fff inset;
}

.c-table--form {
	border-top: 1px solid #a5bcd1;
	border-collapse: separate;
}

.c-table {
	width: 100%;
	background-color: #fff;
}

.c-textfield.c-textfield--full {
	width: 100%;
}

.c-textfield {
	display: inline-block;
	position: relative;
	outline: 0;
	border: 1px solid #d2d2d2;
	height: 2.5em;
	vertical-align: middle;
	background-color: #fff;
	appearance: none;
	padding: 0.4rem 0.5rem 0.3rem;
	box-sizing: border-box;
	box-shadow: 0 1px 2px rgb(89 89 96/ 10%) inset;
	font-size: 1.3rem;
}

.c-table tr {
	vertical-align: top;
}

.c-table.c-table--form tbody tr th {
	border-bottom: 1px solid #a5bcd1;
	background-color: #f1f4f8;
	border-top: 1px solid #fff;
}

.p-input-form tbody tr th {
	width: 20%;
	vertical-align: top;
	padding: 1.2rem 1rem;
}

.c-table tbody tr th {
	color: #13131e;
	font-weight: bold;
}

caption, th {
	text-align: left;
}

.c-table--form tbody tr td {
	border-bottom: 1px solid #a5bcd1;
	vertical-align: inherit;
}

.p-input-form tbody tr td {
	padding: 1rem;
}

.setting-notice {
	margin-top: 5px;
}

.setting-notice:first-child {
	margin-top: 0;
	margin-bottom: 5px;
}

.u-text-notice {
	color: #82ad24;
}

.fs11 {
	font-size: 92%;
}

.setting-table__label {
	vertical-align: top;
}

.c-label.c-label--s {
	padding: 0.2rem 0.3rem;
	font-size: 1.1rem;
}

.c-label.c-label--emphasis {
	background-color: #e64c30;
}

.setting-table__label-icoon {
	margin-top: -1px;
}

.p-input-form__th-option {
	float: right;
	margin: -0.2rem -0.2rem 0.2rem 0.8rem;
}

.c-label {
	display: inline-block;
	color: #fff;
	font-weight: normal;
	text-decoration: none;
	vertical-align: middle;
	line-height: 1.2rem;
	border-radius: 2px;
}

.c-textfield.c-textfield--textarea {
	height: auto;
	line-height: 1.5;
	resize: vertical;
}

.setting-table.setting-table--footer {
	margin: 20px 0 28px;
}

.setting-table.setting-table--footer .setting-footer {
	padding: 15px 10px;
}

.c-table tbody tr td {
	border-bottom: 1px solid #a5bcd1;
}

.setting-footer {
	background-color: #e3eaf0;
}

.p-input-form__footer {
	box-shadow: 0 3px 2px -2px rgb(188 176 138/ 30%) inset;
}

.p-input-form__action {
	display: table;
	margin: 0 auto;
	border-collapse: separate;
	table-layout: fixed;
	border-spacing: 2rem 0.8rem;
	box-sizing: border-box;
}

.p-input-form__action-item {
	display: table-cell;
	width: 24rem;
}

.c-btn.c-btn--success {
	border: 1px solid #82ad24;
	box-shadow: 0 0 1px rgb(255 255 255/ 60%) inset, 0 1px 0 rgb(0 0 0/ 10%);
	color: #fff;
	text-shadow: 0 -1px 0 rgb(0 0 0/ 30%);
	background-color: #9c0;
	background-image: linear-gradient(to bottom, #c90, #82ad24);
}

.p-input-form__action-target {
	width: 100%;
}

.c-btn {
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
	padding: 0.6rem 1.2 rem;
	font-size: 1.2 rem;
}

table {
	border-spacing: 0;
	word-break: break-all;
	empty-cells: show;
	table-layout: fixed;
}

label {
	cursor: pointer;
}

input, textarea {
	padding: 0;
}

input, button, textarea, select {
	margin: 0;
	font: inherit;
}

h1, h2, h3, strong, em {
	font-size: normal;
	font-weight: bold;
}

div, p {
	word-wrap: break-word;
	overflow-wrap: break-word;
}

dt, span, dl, li, a, span, ul, div, h2, p, section, label, tbody, th, tr
	{
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
	<div id="container" class="clearfix">
		<div class="layout4-main setting-mypage" id="column-main">
			<h2 class="heading1">Setting My Page</h2>
			<div class="lead">
				<p>可以進行各種設定</p>
			</div>
			<!-- account -->
			<form:form name="FrmMain2" enctype="multipart/form-data"
				id="js-user-form2" action="${contextRoot}/editMember"
				accept-charset="UTF8" method="post" modelAttribute="member">
				<h3 class="c-heading2 setting-mypage__title">個人帳號編輯</h3>
				<form:input style="display: none;" path="id" />
				<form:input style="display: none;" path="createDate" />
				<form:input  path="memberPwd" style="display: none;"
					value="${member.memberPwd}" />
				<form:input type="text" path="account" style="display: none;" />
				<form:input path="memberName" style="display: none;" />
				<div class="form">
					<table class="p-input-form c-table c-table--form">
						<tbody>
							<tr>
								<th><label for="user_view_my_page_sub_title"> 個人圖像
								</label></th>
								<td>
									<p class="u-text-notice setting-notice fs11">※設定背景圖片</p> 
									<form:input name="memberImage" id="memberImage" path="memberImage"
										type="file" /><img id="seeImage" style="height: 90px; width: 90px;" />
								</td>
							</tr>
							<tr>
								<th><label for="user_profile_occupation"> 電話 </label></th>
								<td>
									<p>
										<form:input class="c-textfield c-textfield--full"
											maxlength="35" size="35" type="text"
											name="user_profile[occupation]" id="user_phone7"
											path="phone" value="${member.phone}" />
									</p>
								</td>
							</tr>
							<tr>
								<th><label for="user_profile_occupation"> 暱稱 </label></th>
								<td>
									<p>
										<form:input class="c-textfield c-textfield--full"
											maxlength="35" size="35" type="text"
											name="user_profile[occupation]" id="user_nickName7"
											path="nickName" value="${member.nickName}" />
									</p>
								</td>
							</tr>
							<tr>
								<th><label for="user_profile_occupation"> 生日 </label></th>
								<td>
									<p>
										<form:input class="c-textfield c-textfield--full"
											maxlength="35" size="35" type="date"
											name="user_profile[occupation]" id="user_birth7"
											path="birth" value="${member.birth}" />
									</p>
								</td>
							</tr>
							<tr>
								<th><label for="user_profile_occupation"> 居住城市 </label></th>
								<td>
									<p>
										<form:input class="c-textfield c-textfield--full"
											maxlength="35" size="35" type="text"
											name="user_profile[occupation]" id="user_city7"
											path="city" value="${member.city}" />
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<table
					class="p-input-form c-table c-table--form p-input-form prof-table setting-table setting-table--footer">
					<tbody>
						<tr>
							<td class="p-input-form__footer setting-footer">
								<div class="p-input-form__action">
									<div class="p-input-form__action-item">
										<input
											class="p-input-form__action-target c-btn c-btn--success"
											id="js-summit-btn2" name="commit" type="submit" value="更新">
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form:form>

			<!-- Reviewer -->
			<form:form name="FrmMain" enctype="multipart/form-data"
				id="js-user-form" action="${contextRoot}/setReviewerPage"
				accept-charset="UTF8" method="post" modelAttribute="rvwrSet">
				<h3 class="c-heading2 setting-mypage__title">Reviewer Page</h3>
				<div class="form">
					<table class="p-input-form c-table c-table--form">
						<tbody>
							<tr>
								<th><label for="user_view_my_page_sub_title"> Cover
										Image </label></th>
								<td>
									<p class="u-text-notice setting-notice fs11">※設定背景圖片</p> <form:input
										name="coverImage" id="coverImage" path="coverImage"
										type="file" />
								</td>
							</tr>
							<tr>
								<th><label class="setting-table__label"
									for="user_view_my_page_name"> Title <i
										class="p-input-form__th-option c-label c-label--s c-label--emphasis setting-table__label-icon">必須</i>
								</label></th>
								<td>
									<p class="u-text-notice setting-notice fs11">設定個人頁面標題</p>
									<p>
										<form:input
											class="c-textfield c-textfield--full js-user-mypage-title"
											maxlength="100" size="100" type="text"
											name="user_view[my_page_name]" id="user_view_my_page_name"
											path="reviewer_title" />
									</p>
								</td>
							</tr>
							<tr>
								<th><label for="user_view_my_page_sub_title">
										SubTitle </label></th>
								<td>
									<p class="u-text-notice setting-notice fs11">設定個人頁面副標題</p>
									<p>
										<form:input
											class="c-textfield c-textfield--full js-user-mypage-title"
											maxlength="100" size="100" type="text"
											name="user_view[my_page_sub_title]"
											id="user_view_my_page_sub_title" path="reviewer_subtitle" />
									</p>
								</td>
							</tr>
							<tr>
								<th><label for="user_profile_profile"> 自我介紹 </label></th>
								<td>
									<p class="u-text-notice setting-notice fs11">
										顯示在自己老食評論頁面的個人檔案</p> <form:textarea name="editor1" id="intro"
										path="reviewer_intro"
										class="c-textfield c-textfield--full c-textfield--textarea"
										maxlength="1000" rows="3" cols="47"></form:textarea>

								</td>
							</tr>
							<tr>
								<th><label for="user_review[answers][1]"> 使用的相機 </label></th>
								<td><form:textarea name="user_view[answers][1]"
										id="user_view_camera"
										class="c-textfield c-textfield--full c-textfield--textarea"
										maxlength="250" rows="3" cols="47" path="reviewer_camera"></form:textarea>
								</td>
							</tr>
							<tr>
								<th><label for="user_profile_occupation"> 職業 </label></th>
								<td>
									<p>
										<form:input class="c-textfield c-textfield--full"
											maxlength="35" size="35" type="text"
											name="user_profile[occupation]" id="user_profile_occupation"
											path="reviewer_occupation" />
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<table
					class="p-input-form c-table c-table--form p-input-form prof-table setting-table setting-table--footer">
					<tbody>
						<tr>
							<td class="p-input-form__footer setting-footer">
								<div class="p-input-form__action">
									<div class="p-input-form__action-item">
										<input
											class="p-input-form__action-target c-btn c-btn--success"
											id="js-summit-btn" name="commit" type="submit" value="更新">
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form:form>
		</div>
	</div>

	<script>
		$(document)
				.ready(
						function() {
							$("#user_view_my_page_name")
									.attr("value",
											'<c:out value="${preview.reviewer_title}" />');
							$("#user_view_my_page_sub_title")
									.attr("value",
											'<c:out value="${preview.reviewer_subtitle}" />');

							$("#user_view_camera")
									.val(
											'<c:out value="${preview.reviewer_camera}" />');
							$("#user_profile_occupation")
									.attr("value",
											'<c:out value="${preview.reviewer_occupation}" />');
						});
		
	$('#memberImage').on('change', function(e){      
      const file = this.files[0];
      const objectURL = URL.createObjectURL(file);
      
      $('#seeImage').attr('src', objectURL);
    });
	</script>

</body>
</html>