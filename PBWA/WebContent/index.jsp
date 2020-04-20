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


		<c:choose>


			<c:when test="${username == null }">

				<form action="login" method="get">
				
				
					Name:<input type="text" name="username" /><br /> <br />
					Password:<input type="password" name="userpass" /><br /> <br />
					<input type="submit" value="login" />
					<a href="${pageContext.request.servletContext.contextPath }/logoutController">logout</a>
				</form>

			</c:when>

			<c:otherwise>
				<div class=" alert alert-sucesss" role="alert">
					<strong>you are signed in ${username }</strong>

				</div>
				<div>
					<a href="${pageContext.request.servletContext.contextPath }/logoutController">logout</a>
					
					<a href="">cardenas</a>
				</div>
			

			</c:otherwise>
		</c:choose>



	</div>

</body>
</html>