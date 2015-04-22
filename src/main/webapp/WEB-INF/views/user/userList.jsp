<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>user</title>
</head>
<body>
	<a href="saveUI">添加</a>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${userList}" var="user">
			<tr>
				<td><c:out value="${user.id}"></c:out></td>
				<td><c:out value="${user.name}"></c:out></td>
				<td><a href="saveUI?id=${user.id}">编辑</a> <a>删除</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>