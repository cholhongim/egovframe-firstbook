<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
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
        String sql = "INSERT INTO employee(id, name, dept, age, phone, email, addr) values(?,?,?,?,?,?,?)";
        statement = connection.prepareStatement(sql);
        statement.setString(1,id);
        statement.setString(2,name);
        statement.setString(3,dept);
        statement.setString(4,age);
        statement.setString(5,phone);
        statement.setString(6,email);
        statement.setString(7,address);
        statement.executeUpdate();
        
      response.sendRedirect(request.getContextPath()+"/employeeList.jsp");
    } catch(Exception e) {
        e.printStackTrace();
        out.print("입력 예외 발생");
    } finally {
        try {statement.close();} catch(Exception e){}
        try {connection.close();} catch(Exception e){}
    }
%>
</body>
</html>