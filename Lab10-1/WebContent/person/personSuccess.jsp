<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원정보</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String company = request.getParameter("company");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
%>
<div>NAME: <%=name%></div>
<div>COMPANY: <%=company%></div>
<div>PHONE: <%=phone%></div>
<div>EMAIL: <%=email%></div>
</body>
</html>