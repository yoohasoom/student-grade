<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td {
	text-align: center;
}

</style>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	String sql = "select id, name, substr(id, 1, 1), substr(id, 2, 2), substr(id, 4, 2), gender from member_tbl_01";

	ResultSet rs = conn.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<br>
	<h2 style="text-align: center;">학생 조회</h2>
	<br>
	<section style="display: flex; justify-content: center;">
		<table border="1" style="border-spacing: 0px;">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학년</th>
				<th>반</th>
				<th>번호</th>
				<th>성별</th>
			</tr>
			<%
			while(rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</body>
</html>