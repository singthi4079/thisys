<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${empty user.id ? '添加':'编辑'}用户</title>
</head>
<body>
<form action="${empty user.id ? 'save':'update'}">
	<input type="hidden" name="id" value="${user.id}"/>
	用户名：<input name="name" id="name" value="${user.name}"/>
	<input type="submit" value="保存"/>
</form>
</body>
</html>