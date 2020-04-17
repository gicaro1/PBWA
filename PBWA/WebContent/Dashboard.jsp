<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->

 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Index</title>
<!-- google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Nunito:400,700,800i&display=swap" rel="stylesheet">
<!-- Font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- bootraap -->

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">



<title>Dashoard</title>




</head>
<body>


	<a href="deposit.jsp">Deposit</a><br />

	<a href="index.jsp">login</a><br />
	
	<button type="button" class="btn btn-warning">Warning</button> <br />
	
	<a href="${pageContext.request.servletContext.contextPath }/logoutController">logout</a>
	

  <i class="fa fa-facebook "></i> <br />
  
<!--   <form action="logout " method="get"> 
  	 <input type="submit" value="logout" /> 
  logout</form> -->

  

	<div align="center">
	
	<div>
	
			<h1>
			 Welcome <c:out value="${USER_SESSION}" />	
			
			
			
			</h1>
	
	
	</div>
	





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

	<!-- --------------- Personal Budget Table ------------------------- -->
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
		<!-------------  TABLE DEPOSIT  ---------->
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

		<!------------- balance Loop -------------->

		<c:set var="total" value="${0}"/>
		<c:forEach var="tempA" items="${ELISTBAL}">
		
			<c:set var="total" value="${total + tempA.total}" />
			
		</c:forEach>

		


		<!------------- category Loop -------------->

		<c:set var="TransporTotal" value="${0}" />
		<c:set var="TravelTotal" value="${0}" />
		<c:set var="HomeTotal" value="${0}" />
		<c:set var="lastCategoryItem" value="${0}" />
		
		
		
		
			<!--  test Variable  -->
			<c:set var="x" value="${0}" />
			<c:set var="z" value="${0}" />
			<!--end  -->
			
			
			
			<c:set var="len" value="${ELIST.indexOf(ELIST.size()-1)}" />
			
			
			

		<c:forEach var="temp" items="${ELIST}">
			
		
		
		<!-- star test 1  -->
		
		
		<%-- 	<c:set var="b" value="true" /> --%>
			
		<%-- 	<c:set var="x" value="${ELIST.indexOf(ELIST.size()-1) )}" /> --%>
			
	<%-- 		<c:if test="${x eq ELIST.indexOf(ELIST.size()-1)  }">
			
				<c:set var="z" value="${temp.sum}" />
			
			</c:if> --%>
	
		
		
		<!-- end -->


			<c:choose>
				<c:when test="${temp.category eq 'transport'}">
					<c:set var="TransporTotal" value="${TransporTotal + temp.sum}" />
				</c:when>

				<c:when test="${temp.category eq 'Travel'}">
					<c:set var="TravelTotal" value="${TravelTotal + temp.sum}" />
				</c:when>


				<c:otherwise>
					<!-------- HOME------>
					
					<c:set var="HomeTotal" value="${HomeTotal + temp.sum}" />
					
					<c:if test="${temp.category == null }">
						<c:set var="total" value="${total - HomeTotal}" />
					</c:if>
					
					
					
				
					
				<%-- 	<!----------- Substrac From Balance --------->
						<c:set var="TempC" value="${temp.sum}" />
			
					<c:if test="${temp.sum == null }">
					
						<c:set var="susbtract" value="${TempC}" />
						
						<c:set var="total" value="${total - susbtract}" />
	
					</c:if> --%>
		
				</c:otherwise>
			</c:choose>
			
			


		</c:forEach>
		
								

	
		<div align="center">
			<h1>Category Bar</h1>
			
			
							
						
					
		
			BALANCE
			<c:out value="${total}" />
		</div>
		
		

		<div align="center">

			TRANSPORT
			<c:out value="${TransporTotal}" />
			<br> TRAVEL
			<c:out value="${TravelTotal}" />
			<br> HOME
			<c:out value="${HomeTotal}" />
			<br>
			
		
	
			
			
		
			<c:out value="${len}" />
			<br>
			
			Test<c:out value="${z}" />
			<br>

		</div>
	</div>

</body>
</html>