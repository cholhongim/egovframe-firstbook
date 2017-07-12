<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원정보</title>
</head>
<body>
<h1>사원정보</h1>
<form action="<%=request.getContextPath()%>/person/personSuccess.jsp" method="post">
    <div>NAME : 
    <input name="name"/></div><br>
    <div>COMPANY : 
    <input name="company"/></div><br>
    <div>PHONE : 
    <input name="phone"/></div><br>
    <div>EMAIL : 
    <input name="email"/></div><br>
    <div><input type="submit" value="register"></div>
</form>
</body>
</html>