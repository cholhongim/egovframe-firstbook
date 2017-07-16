<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CUSTOMER ADD</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form:form commandName="employee" action="employeeAdd.do">
<div id="wrap">
	<table class="tbl_View">
		<caption>Employee</caption>
		<colgroup>
			<col style="width:30%" />
			<col style="width: ;" />
		</colgroup>
		<tbody>
			<tr>
				<th>사원번호</th>
				<td><form:input path="id" type="text" size="63" maxlength="20" /></td>
			</tr>
			<tr>
				<th>부서</th>
				<td>
					<form:select path="dept">
						<form:option selected="selected" value="">상위부서를 선택하세요.</form:option>
						<form:option value="01">기획팀</form:option>
						<form:option value="02">영업팀</form:option>
						<form:option value="03">개발팀</form:option>
					</form:select>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><form:input path="name" type="text" size="63" maxlength="20" /></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><form:input path="age" type="text" size="63" maxlength="20" /></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><form:input path="phone" type="text" size="63" maxlength="20" /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><form:input path="email" type="email" size="63" maxlength="30" /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><form:input path="address" type="text" size="63" maxlength="20" /></td>
			</tr>
		</tbody>
	</table>
	<div class="txt-rt mt20">
        <input type="button" value="글저장" onclick="form.submit()"/>
        <input type="button" value="목록" onclick="location.href='employeeList.do'"/>
    </div>
</div>
</form:form>
</body>
</html>