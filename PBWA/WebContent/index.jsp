<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Login</title>
</head>
<body>
	<h1>Login</h1>

	<div align="center">

		<form action="login" method="post">
			Name:<input type="text" name="username" /><br />
			<br /> Password:<input type="password" name="userpass" /><br />
			<br /> <input type="submit" value="login" />
		</form>

	</div>

</body>
</html>