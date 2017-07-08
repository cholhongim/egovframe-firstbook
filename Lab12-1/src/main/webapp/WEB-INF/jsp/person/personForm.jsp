<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사원정보</title>
</head>
<body>
<h1>사원정보</h1>
<form:form commandName="personinfo">
    <div><spring:message code="label.name" /> : 
    <form:input path="name"/></div><br>
    <div><spring:message code="label.company" /> : 
    <form:input path="company"/></div><br>
    <div><spring:message code="label.phone" /> : 
    <form:input path="phone"/></div><br>
    <div><spring:message code="label.email" /> : 
    <form:input path="email"/></div><br>
    <div><input type="submit" value="register"></div>
</form:form>
</body>
</html>