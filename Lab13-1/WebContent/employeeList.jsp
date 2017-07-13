<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CUSTOMER LIST</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%

    String dbUrl = "jdbc:mysql://127.0.0.1:3306/com";
    String dbUser = "com";
    String dbPw = "com01";
    Connection connection = null;
    PreparedStatement totalStatement = null;
    PreparedStatement listStatement = null;
    ResultSet totalResultSet = null;
    ResultSet listResultSet = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
        
    String listSql = "SELECT id,name FROM employee";
    listStatement = connection.prepareStatement(listSql);
    listResultSet = listStatement.executeQuery();
%>
<div id="wrap">

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
<%
            while(listResultSet.next()) {
%>
                <tr>
                    <td><a href="<%=request.getContextPath()%>/employeeView.jsp?id=<%=listResultSet.getString("id")%>"><%=listResultSet.getInt("id")%></a></td>
                    <td><%=listResultSet.getString("name")%></td>
                </tr>
<%        
            }
%>
        </tbody>
    </table>
    <p>
    	<div class="txt-rt mt20">
		<input type="button" value="사원추가" onclick="location.href='<%=request.getContextPath()%>/employeeAddForm.jsp'" />
	</div>
</div>
<%
    } catch(Exception e) {
        e.printStackTrace();
        out.print("목록 가져오기 실패!");
    } finally {
        try {listResultSet.close();} catch(Exception e){}
        try {listStatement.close();} catch(Exception e){}
        try {connection.close();} catch(Exception e){}
    }
%>
</body>
</html>



