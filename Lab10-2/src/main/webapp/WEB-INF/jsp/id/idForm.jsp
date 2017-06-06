<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CUSTOMER ADD</title>
</head>
<body>
<h1>CUSTOMER ADD</h1>
<form:form commandName="idInfo">
    <div>ID : 
    <form:input path="id"/></div>
    <br>
    <div>NAME : 
    <form:input path="name"/></div>
    <br>
    <div><input type="submit" value="register"></div>
</form:form>
</body>
</html>