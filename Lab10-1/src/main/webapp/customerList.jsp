<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CUSTOMER LIST</title>
</head>
<body>
<h1>CUSTOMER LIST</h1>
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
        
    String listSql = "SELECT id,name,addr FROM customer";
    listStatement = connection.prepareStatement(listSql);
    listResultSet = listStatement.executeQuery();
%>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>ADDRESS</th>
            </tr>
        </thead>
        <tbody>
<%
            while(listResultSet.next()) {
%>
                <tr>

                    <td><a href="<%=request.getContextPath()%>/customerView.jsp?id=<%=listResultSet.getString("id")%>"><%=listResultSet.getInt("id")%></a></td>
                    <td><%=listResultSet.getString("name")%></td>
                    <td><%=listResultSet.getString("addr")%></td>
                </tr>
<%        
            }
%>
        </tbody>
    </table>
    <div>
        <a href="<%=request.getContextPath()%>/customerAddForm.jsp">게시글 입력</a>
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



