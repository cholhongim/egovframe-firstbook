<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CUSTOMER VIEW</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
 <script>
        function init(code){
                var form  = document.hmsForm;
                selectBox(form.dept, code);
        }

        function selectBox(sel, val){
                var selOptions = sel.options;
                var size = selOptions.length;
                for(var i = 0; i<size; i++){
                        if(selOptions[i].value == val){
                                selOptions[i].selected = true;
                                break;
                        }
                }
        }
 </script>
<body onload="javascript:init(${employeeinfo.dept})">
<form name="hmsForm">
<div id="wrap">
	<table class="tbl_View">
		<caption>Employee</caption>
		<colgroup>
			<col style="width:30%" />
			<col style="width: ;" />
		</colgroup>
		<tbody>
			<tr>
				<th>사원번호</th>
				<td>${employeeinfo.id}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${employeeinfo.name}</td>
			</tr>
			<tr>
				<th>부서</th>
				<td>
					<select name="dept" disabled>
						<option value="01">기획팀</option>
						<option value="02">영업팀</option>
						<option value="03">개발팀</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>${employeeinfo.age}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${employeeinfo.phone}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${employeeinfo.email}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${employeeinfo.address}</td>
			</tr>
		</tbody>
	</table>
	<div class="txt-rt mt20">
        <input type="button" value="목록" onclick="location.href='employeeList.do'"/>
        <input type="button" value="수정" onclick="location.href='employeeModify.do?id=${employeeinfo.id}'"/>
        <input type="button" value="삭제" onclick="location.href='employeeRemove.do?id=${employeeinfo.id}'"/>
    </div>
</div>
</form>
</body>
</html>