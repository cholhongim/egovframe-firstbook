<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
<%
    if(request.getParameter("id") == null) {
        response.sendRedirect(request.getContextPath()+"/employeeList.jsp");
    } else {
        String id = request.getParameter("id");
        String dbUrl = "jdbc:mysql://127.0.0.1:3306/com";
        String dbUser = "com";
        String dbPw = "com01";
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
            String sql = "SELECT id, name, dept, age, phone, email, addr FROM employee WHERE id=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            resultSet = statement.executeQuery();
            if(resultSet.next()) {
%>
<body onload="javascript:init(<%=resultSet.getString("dept")%>)">
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
				<td><%=id%></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=resultSet.getString("name")%></td>
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
				<td><%=resultSet.getString("age")%></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><%=resultSet.getString("phone")%></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=resultSet.getString("email")%></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><%=resultSet.getString("addr")%></td>
			</tr>
		</tbody>
	</table>
	<div class="txt-rt mt20">
        <input type="button" value="목록" onclick="location.href='<%=request.getContextPath()%>/employeeList.jsp'"/>
        <input type="button" value="수정" onclick="location.href='<%=request.getContextPath()%>/employeeModifyForm.jsp?id=<%=id%>'"/>
        <input type="button" value="삭제" onclick="location.href='<%=request.getContextPath()%>/employeeRemoveAction.jsp?id=<%=id%>'"/>
    </div>
</div>
<%
            }
        } catch(Exception e) {
            e.printStackTrace();
            out.println("VIEW ERROR!");
        } finally {
            try {resultSet.close();} catch(Exception e){}
            try {statement.close();} catch(Exception e){}
            try {connection.close();} catch(Exception e){}
        }
    }
%>
</form>
</body>
</html>