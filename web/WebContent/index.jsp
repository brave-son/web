
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>

<table>
  <tr>
    <th>name</th>
    <th>kind</th>
    <th>gender</th>
  </tr>


<%
	Connection con = null; // DB ����
PreparedStatement stmt = null; // Query ����
ResultSet rs = null; // ��ȸ Query ��� ����
StringBuffer query = new StringBuffer();
// ���� �ۼ�
String url = "jdbc:mysql://localhost:3306/java";
String id = "root";
String pw = "1234";
query.append("SELECT ID, NAME, GENDER, KIND FROM ANIMAL");
// 1. ����̹� �ε�
Class.forName("com.mysql.jdbc.Driver");
// 2. DB ����
con = DriverManager.getConnection(url, id, pw);// 3. Query�� ������ �� �ֵ��� Statement ��ü �غ�

stmt = con.prepareStatement(query.toString());
rs = stmt.executeQuery(); // 4. Query ����
while (rs.next()) { // 5. ��ȸ��� ó��
	// rs.getString();
	int id2 = rs.getInt("ID");
	String name = rs.getString("NAME");
	String gender = rs.getString("GENDER");
	String kind = rs.getString("KIND");
	out.println("<tr>"+"<td>"+name +"</td>");
	out.println("<td>"+kind +"</td>");
	out.println("<td>"+gender +"</td>" +"</tr>");
}
rs.close();
stmt.close();
con.close();
%>


