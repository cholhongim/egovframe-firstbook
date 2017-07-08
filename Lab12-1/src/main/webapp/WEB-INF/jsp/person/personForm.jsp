<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사원정보</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="person" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
function save(form){
	if(!validatePerson(form)){
		return;
	}else{
		form.submit();
	}
}
</script>
</head>
<body>
<h1>사원정보</h1>
<form:form commandName="person">
    <div><spring:message code="label.name" /> : 
    <form:input path="name"/><form:errors path="name" /></div><br>
    <div><spring:message code="label.company" /> : 
    <form:input path="company"/><form:errors path="company" /></div><br>
    <div><spring:message code="label.phone" /> : 
    <form:input path="phone"/><form:errors path="phone" /></div><br>
    <div><spring:message code="label.email" /> : 
    <form:input path="email"/><form:errors path="email" /></div><br>
    <div><input type="button" value="CLIENT" onclick="save(this.form)"/> 
         <input type="submit" value="SERVER"/> </div>
</form:form>
</body>
</html>