<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CUSTOMER MODIFY ACTION</title>
</head>
<body>
<%
    request.setCharacterEncoding("euc-kr");
    if(request.getParameter("id") == null) {
        response.sendRedirect(request.getContextPath()+"/customerList.jsp");
    } else {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
    
        String dbUrl = "jdbc:mysql://127.0.0.1:3306/com";
        String dbUser = "com";
        String dbPw = "com01";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
            String selectSql = "UPDATE customer SET name=?, addr=? WHERE id=?";
            statement = connection.prepareStatement(selectSql);
            statement.setString(1, name);
            statement.setString(2, address);
            statement.setString(3, id);
            statement.executeUpdate();
            response.sendRedirect(request.getContextPath()+"/customerView.jsp?id="+id);
        } catch(Exception e) {
            e.printStackTrace();
            out.print("MODIFY ERROR!");
        } finally {
            try {statement.close();} catch(Exception e){}
            try {connection.close();} catch(Exception e){}
        }
    }
%>
</body>
</html>
