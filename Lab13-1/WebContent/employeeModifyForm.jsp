<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CUSTOMER MODIFY FORM</title>
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
        response.sendRedirect(request.getContextPath()+"/customerList.jsp");
    } else {
        String id = request.getParameter("id");
        String name = "";
        String dept = "";      
        String age = "";
        String phone = "";
        String email = "";
        String address = "";
        String dbUrl = "jdbc:mysql://127.0.0.1:3306/com";
        String dbUser = "com";
        String dbPw = "com01";
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
            String selectSql = "SELECT * FROM employee WHERE id=?";
            statement = connection.prepareStatement(selectSql);
            statement.setString(1, id);
            resultSet = statement.executeQuery();
            if(resultSet.next()) {
                id = resultSet.getString("id");
                name = resultSet.getString("name");
                dept = resultSet.getString("dept");
                age = resultSet.getString("age");
                phone = resultSet.getString("phone");
                email = resultSet.getString("email");
                address = resultSet.getString("addr");
            } else {
                response.sendRedirect(request.getContextPath()+"/employeeList.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("BOARD MODIFY FROM ERROR!");
        } finally {
            try {resultSet.close();} catch(Exception e){}
            try {statement.close();} catch(Exception e){}
            try {connection.close();} catch(Exception e){}
        }
%>    
<body onload="javascript:init(<%=dept%>)">
        <form name="hmsForm" action="<%=request.getContextPath()%>/employeeModifyAction.jsp" method="post">
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
				<td><input name="id" value="<%=id%>" type="text" size="63" maxlength="20" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input name="name" value="<%=name%>" type="text" size="63" maxlength="20" /></td>
			</tr>
			<tr>
				<th>부서</th>
				<td>
					<select name="dept">
						<option value="01">기획팀</option>
						<option value="02">영업팀</option>
						<option value="03">개발팀</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input name="age" value="<%=age%>" type="text" size="63" maxlength="20" /></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input name="phone" value="<%=phone%>" type="text" size="63" maxlength="20" /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input name="email" value="<%=email%>" type="email" size="63" maxlength="30" /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input name="address" value="<%=address%>" type="text" size="63" maxlength="20" /></td>
			</tr>
		</tbody>
	</table>
	<div class="txt-rt mt20">
        <input type="button" value="글저장" onclick="form.submit()"/>
        <input type="button" value="목록" onclick="location.href='<%=request.getContextPath()%>/employeeList.jsp'"/>
    </div>
</div>

        </form>
<%
    }    
%>
</body>

</html>