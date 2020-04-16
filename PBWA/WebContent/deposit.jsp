<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<%-- <LINK REL="StyleSheet" HREF="<%=request.getContextPath()%>/css/style.css" TYPE="text/css">
  --%>
<title>Deposit Page</title>
</head>
<body>
	<h1>Deposit</h1>

	<div align="center" >
	<!-- 		action="showbalance" -->

		<form   action="insertDep"    method="post">
				<!-- <input type="hidden" name="showbalance"  /> -->
			
			<table border="1">
			
				<tr>
					<th>Sum:</th>
					<td><input type="text" name="total" size="10" placeholder="Cash"
						value="<c:out value='${ProductExpense.sum}' />" /></td>
				</tr>
				
				<tr>
					<th>Date:</th>
					<td><input type="text" name="dateD" size="20"  placeholder="Date"
						value="<c:out value='${ProductExpense.dfec}' />" /></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Save" /></td>
				</tr>
			</table>
		</form>
		
		
<%-- 	<table>
			<tr>
				<c:forEach var="tempDep" items="${BALANCE}">
					<td><c:out value="${tempDep.total}" /> balance</td>

				</c:forEach>


			</tr>


		</table> --%>

	</div>

</body>
</html>