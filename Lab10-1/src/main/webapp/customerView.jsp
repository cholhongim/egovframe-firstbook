<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CUSTOMER VIEW</title>
</head>
<body>
<h1>CUSTOMER VIEW</h1>
<%
    if(request.getParameter("id") == null) {
        response.sendRedirect(request.getContextPath()+"/customerList.jsp");
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
            String sql = "SELECT id, name, addr FROM customer WHERE id=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            resultSet = statement.executeQuery();
            if(resultSet.next()) {
%>
                <div>ID :</div>
                <div><%=id%></div>
                <div>NAME :</div>
                <div><%=resultSet.getString("name")%></div>
                <div>ADDRESS :</div>
                <div><%=resultSet.getString("addr")%></div>
                <div>
                    <a href="<%=request.getContextPath()%>/customerList.jsp">목록</a>
                    <a href="<%=request.getContextPath()%>/customerModifyForm.jsp?id=<%=id%>">수정</a>
                    <a href="<%=request.getContextPath()%>/customerRemoveAction.jsp?id=<%=id%>">삭제</a>
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
</body>
</html>