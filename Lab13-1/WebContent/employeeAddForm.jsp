<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CUSTOMER ADD</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form action="<%=request.getContextPath()%>/employeeAddAction.jsp" method="post">
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
				<td><input name="id" type="text" size="63" maxlength="20" /></td>
			</tr>
			<tr>
				<th>부서</th>
				<td>
					<select name="dept">
						<option selected="selected" value="">상위부서를 선택하세요.</option>
						<option value="01">기획팀</option>
						<option value="02">영업팀</option>
						<option value="03">개발팀</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input name="name" type="text" size="63" maxlength="20" /></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input name="age" type="text" size="63" maxlength="20" /></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input name="phone" type="text" size="63" maxlength="20" /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input name="email" type="email" size="63" maxlength="30" /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input name="address" type="text" size="63" maxlength="20" /></td>
			</tr>
		</tbody>
	</table>
	<div class="txt-rt mt20">
        <input type="button" value="글저장" onclick="form.submit()"/>
        <input type="button" value="목록" onclick="location.href='<%=request.getContextPath()%>/employeeList.jsp'"/>
    </div>
</div>
</form>
</body>
</html>