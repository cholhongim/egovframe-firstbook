<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 등록 폼</title>
</head>
<body>
<form:form commandName="idInfo">
<div>
<form:label path="id">ID:</form:label>
           ${idInfo.id}
</div>
<div>
<form:label path="name">NAME:</form:label>
         ${idInfo.name}
</div>
</form:form>
</body>
</html>