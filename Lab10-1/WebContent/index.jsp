<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MVC</title>
</head>
<body>
<ul id="menu">
    <li> JSP 
        <ul>      
            <li>Hello World 출력  <a href="<%=request.getContextPath()%>/hello/helloworld.jsp">Hello World</a></li>      
            <li>입력 폼 및 결과 출력  <a href="<%=request.getContextPath()%>/person/personForm.jsp">Person Info Service</a></li>
        </ul>
    </li>
</ul>
</body>
</html>