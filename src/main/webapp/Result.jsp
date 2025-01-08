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
text-align: left;
}
</style>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	String sql1 = "select mt.id, mt.name, substr(mt.id, 1, 1), substr(mt.id, 2, 2), substr(mt.id, 4, 2), mt. gender, "
				+ "st.korean, st.math, st.english, st.history, "
				+ "st.korean + st.math + st.english + st.history as total, "
				+ "avg((st.korean + st.math + st.english + st.history) / 4) as av, "
				+ "rank() over(order by st.korean + st.math + st.english + st.history desc) as ran "
				+ "from member_tbl_01 mt, score_tbl_01 st "
				+ "where mt.id = st.id "
				+ "group by mt.id, mt.name, substr(mt.id, 1, 1), substr(mt.id, 2, 2), substr(mt.id, 4, 2), mt. gender, st.korean, "
				+ "st.math, st.english, st.history, st.korean + st.math + st.english + st.history ";
				

	String sql2 = "select sum(korean) as sk, sum(math) as sm, sum(english) as se, sum(history) as sh, "
				+ "sum(korean) + sum(math) + sum(english) + sum(history) as total, "
				+ "avg(korean + math + english + history) as ag "
				+ "from score_tbl_01";

	Statement stmt = conn.createStatement();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<br>
	<h2 style="text-align: center;">학생성적 조회</h2>
	<br>
	<section style="display: flex; justify-content: center; ">
		<table border="1" style="border-spacing: 0px;">
			<tr>
				<th>학년</th>
				<th>이름</th>
				<th>학년</th>
				<th>반</th>
				<th>번호</th>
				<th>성별</th>
				<th>국어</th>
				<th>수학</th>
				<th>영어</th>
				<th>역사</th>
				<th>합계</th>
				<th>평균</th>
				<th>순위</th>
			</tr>
			<% 
			ResultSet rs = stmt.executeQuery(sql1);
			while(rs.next()) { %>
			<tr>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4) %></td>
			<td><%= rs.getString(5) %></td>
			<td><%= rs.getString(6) %></td>
			<td><%= rs.getString(7) %></td>
			<td><%= rs.getString(8) %></td>
			<td><%= rs.getString(9) %></td>
			<td><%= rs.getString(10) %></td>
			<td><%= rs.getString(11) %></td>
			<td><%= rs.getString(12) %></td>
			<td><%= rs.getString(13) %></td>
			</tr>
			<%
			} 
			%>
			<tr>
			<td colspan="6"></td>
			<th>국어총합</th>
			<th>수학총합</th>
			<th>영어총합</th>
			<th>역사총합</th>
			<th>총합</th>
			<th>총평균</th>
			<td>------</td>
			</tr>
			<%
			rs = stmt.executeQuery(sql2);
			rs.next();
			%>
			<tr>
			<td colspan="6"></td>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4) %></td>
			<td><%= rs.getString(5) %></td>
			<td><%= rs.getString(6) %></td>
			<td>------</td>
			</tr>
			<%
			rs.close();
			%>
		</table>
	</section>
</body>
</html>