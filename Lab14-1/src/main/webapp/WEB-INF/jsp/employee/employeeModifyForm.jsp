<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CUSTOMER MODIFY FORM</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="employee" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
function save(form){
	if(!validateEmployee(form)){
		return;
	}else{
		form.submit();
	}
}
</script>
</head>
<body>
<form:form commandName="employee" action="employeeModify.do">
<div id="wrap">
	<table class="tbl_View">
		<caption>Employee</caption>
		<colgroup>
			<col style="width:30%" />
			<col style="width: ;" />
		</colgroup>
		<tbody>
			<tr>
				<th><spring:message code="label.id" /></th>
				<td><form:input path="id" value="${employeeinfo.id}" type="text" size="63" maxlength="20" />
				<form:errors path="id" /></td>
			</tr>
			<tr>
				<th><spring:message code="label.dept" /></th>
				<td>
					<form:select path="dept">
						<form:option selected="selected" value="">상위부서를 선택하세요.</form:option>
						<form:option value="01">기획팀</form:option>
						<form:option value="02">영업팀</form:option>
						<form:option value="03">개발팀</form:option>
					</form:select>
					<form:errors path="dept" />
				</td>
			</tr>
			<tr>
				<th><spring:message code="label.name" /></th>
				<td><form:input path="name" type="text" size="63" maxlength="20" />
				<form:errors path="name" /></td>
			</tr>
			<tr>
				<th><spring:message code="label.age" /></th>
				<td><form:input path="age" type="text" size="63" maxlength="20" />
				<form:errors path="age" /></td>
			</tr>
			<tr>
				<th><spring:message code="label.phone" /></th>
				<td><form:input path="phone" type="text" size="63" maxlength="20" />
				<form:errors path="phone" /></td>
			</tr>
			<tr>
				<th><spring:message code="label.email" /></th>
				<td><form:input path="email" type="email" size="63" maxlength="30" />
				<form:errors path="email" /></td>
			</tr>
			<tr>
				<th><spring:message code="label.address" /></th>
				<td><form:input path="address" type="text" size="63" maxlength="20" /></td>
			</tr>
		</tbody>
	</table>
	<div class="txt-rt mt20">
        <input type="button" value="글저장(서버 validation)" onclick="form.submit()"/>
        <input type="button" value="글저장(클라이언트+서버 validation)" onclick="save(this.form)"/>
        <input type="button" value="목록" onclick="location.href='employeeList.do'"/>
    </div>
</div>
</form:form>
</body>

</html>