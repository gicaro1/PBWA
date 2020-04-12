<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/styles.css" />
  
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->




<title>Dashoard</title>



</head>
<body>

	<a href="deposit.jsp">Deposit</a>

	<div align="center">




	<%-- 	<c:if test="${ProductExpense == null}"> --%>
			<form action="insert" method="post">
	<%-- 	</c:if> --%>


		<table border="1">




			<c:if test="${EX1 != null}">
				<input type="hidden" name="id" value="<c:out value='${EX1.id}' />" />
			</c:if>
			<tr>
				<th>Purpose:</th>

				<td><input type="text" name="purpose" size="45"
					value="<c:out value='${EX1.purpose}' />" /></td>
			</tr>

			<tr>
				<th>Sum:</th>
				<td><input type="text" name="sum" size="5"
					value="<c:out value='${EX1.sum}' />" /></td>
			</tr>
			<tr>
				<th>Date:</th>
				<td><input type="text" name="date" size="45"
					value="<c:out value='${EX1.dfec}' />" /></td>
			</tr>



			<tr>
				<th>Category:</th>

				<td><input type="radio" name="dish" value="transport">Transport
					<input type="radio" name="dish" value="home"> Home <input
					type="radio" name="dish" value="Travel"> Travel</td>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Save" /></td>
		</table>
		</form>
	</div>

	<!-- --------------- TABLE------------------------- -->
	<div align="right">
		<h1>Personal Budget Web Application</h1>

		<table border="1">

			<tr>
				<th>ID</th>
				<th>Purpose</th>
				<th>Category</th>
				<th>Sum</th>
				<th>Date</th>
			</tr>
			<c:forEach var="temp" items="${ELIST}">
				<tr>
					<td><c:out value="${temp.id}" /></td>
					<td><c:out value="${temp.purpose}" /></td>
					<td><c:out value="${temp.category}" /></td>
					<td><c:out value="${temp.sum}" /></td>
					<td><c:out value="${temp.dfec}" /></td>

					<td><a href="edit?id=<c:out value='${temp.id}' />">Edit</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="delete?id=<c:out value='${temp.id}' />">Delete</a></td>
				</tr>

			</c:forEach>

		</table>



		<h1>All Deposits</h1>

		<!-------------  TABLE DEPOSIT  -------- -->

		<table border="1">

			<tr>
				<th>ID</th>
				<th>Deposit</th>
				<th>Date</th>
			</tr>


			<c:forEach var="tempB" items="${ELISTBAL}">
				<tr>
					<td><c:out value="${tempB.id}" /></td>
					<td><c:out value="${tempB.total}" /></td>
					<td><c:out value="${tempB.dfecdep}" /></td>


				</tr>

			</c:forEach>

		</table>


		<c:forEach var="tempB" items="${ELISTBAL}">


			<div align="center">


				BALANCE
				<c:out value="${tempB.total}" />

			</div>



		</c:forEach>


	</div>

</body>
</html>