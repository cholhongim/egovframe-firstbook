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
<form:form>
    <div>NAME : 
    <input name="name"/></div>
    <br>
    <div>COMPANY : 
    <input name="company"/></div>
    <br>
    <div>PHONE : 
    <input name="phone"/></div>
    <br>
    <div>EMAIL : 
    <input name="email"/></div>
    <br>
    <div><input type="submit" value="register"></div>
</form:form>
</body>
</html>