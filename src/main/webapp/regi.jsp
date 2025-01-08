<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<br>
	<h2 style="text-align: center;">학생 성적 등록</h2>
	<br>
	<section style="display: flex; justify-content: center;">
		<form action="RegiConfirm.jsp">
			<table border="1" style="border-spacing: 0px">
				<tr>
					<th>학번</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>국어</th>
					<td><input type="text" name="korean"></td>
				</tr>
				<tr>
					<th>영어</th>
					<td><input type="text" name="english"></td>
				</tr>
				<tr>
					<th>수학</th>
					<td><input type="text" name="math"></td>
				</tr>
				<tr>
					<th>역사</th>
					<td><input type="text" name="history"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>