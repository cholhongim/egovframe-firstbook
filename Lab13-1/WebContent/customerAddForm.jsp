<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CUSTOMER ADD</title>
</head>
<body>
<h1>CUSTOMER ADD</h1>
<form action="<%=request.getContextPath()%>/customerAddAction.jsp" method="post">
    <div>ID : 
    <input name="id" type="text"/></div><p>
    <div>NAME : 
    <input name="name" type="text"/></div><p>
    <div>ADDRESS :
    <input name="address" type="text"/></div>
    <p>
    <div>
        <input type="submit" value="글저장"/>
        <input type="reset" value="초기화"/>
    </div>
</form>
</body>
</html>