<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CUSTOMER MODIFY FORM</title>
</head>
<body>
<h1>CUSTOMER MODIFY</h1>
<%
    if(request.getParameter("id") == null) {
        response.sendRedirect(request.getContextPath()+"/customerList.jsp");
    } else {
        String id = request.getParameter("id");
        String name = "";
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
            String selectSql = "SELECT id, name, addr FROM customer WHERE id=?";
            statement = connection.prepareStatement(selectSql);
            statement.setString(1, id);
            resultSet = statement.executeQuery();
            if(resultSet.next()) {
                name = resultSet.getString("name");
                address = resultSet.getString("addr");
            } else {
                response.sendRedirect(request.getContextPath()+"/customerList.jsp");
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
        <form action="<%=request.getContextPath()%>/customerModifyAction.jsp" method="post">
            <div>Id</div>
            <div><input name="id" value="<%=id%>" id="id" type="text" readonly="readonly"/></div>
            <div>NAME: </div>
            <div><input name="name" value="<%=name%>" id="name" type="text"/></div>
            <div>ADDRESS : </div>
            <div><input name="address" value="<%=address%>" id="address" type="text"/></div>
            <div>
                <input type="submit" value="글수정"/>
                <input type="reset" value="초기화"/>
            </div>
        </form>
<%
    }    
%>
</body>
</html>