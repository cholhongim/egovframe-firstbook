<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CUSTOMER LIST</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
	function linkPage(pageNo){
		location.href = "employeeList.do?pageNo="+pageNo;
	}
</script>
<body>
<form:form commandName="searchCriteria" action="employeeList.do">
<div id="wrap">
		<div class="search">
			이름 <input id="searchName" name="searchName" style="width:120px;" type="text" value=""/>
			<input type="submit" value="검색" onclick="this.disabled=true,this.form.submit();" />
		</div>
	<table class="tbl_List">
		<caption>Board</caption>
		<colgroup>
			<col style="width:9%" />
			<col style="width:16%" />
			<col style="width:16%" />
			<col style="width:13%" />
			<col style="width:11%" />
			<col style="width: ;" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${employeelist}" var="employeeinfo">
                <tr>
                    <td><a href="employeeView.do?id=${employeeinfo.id}">${employeeinfo.id}</a></td>
                    <td>${employeeinfo.name}</td>
                </tr>
        </c:forEach>
        </tbody>
    </table>
		<div id="pagination">
		<ui:pagination paginationInfo = "${paginationInfo}"
			type="image"
			jsFunction="linkPage"
			/>
		</div>	
    <p>
    	<div class="txt-rt mt20">
		<input type="button" value="사원추가" onclick="location.href='employeeAdd.do'" />
	</div>
</div>
</form:form>
</body>
</html>