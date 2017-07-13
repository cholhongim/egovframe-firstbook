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
    request.setCharacterEncoding("UTF-8");
    if(request.getParameter("id") == null) {
        response.sendRedirect(request.getContextPath()+"/employeeList.jsp");
    } else {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String dept = request.getParameter("dept");
        String age = request.getParameter("age");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
    
        String dbUrl = "jdbc:mysql://127.0.0.1:3306/com";
        String dbUser = "com";
        String dbPw = "com01";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
            String selectSql = "UPDATE employee SET name=?, dept=?, age=?, phone=?, email=?, addr=? WHERE id=?";
            statement = connection.prepareStatement(selectSql);
            statement.setString(1,name);
            statement.setString(2,dept);
            statement.setString(3,age);
            statement.setString(4,phone);
            statement.setString(5,email);
            statement.setString(6,address);
            statement.setString(7, id);
            statement.executeUpdate();
            response.sendRedirect(request.getContextPath()+"/employeeView.jsp?id="+id);
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
