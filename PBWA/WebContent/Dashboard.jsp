<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<!-- google Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:400,700,800i&display=swap"
	rel="stylesheet">
<!-- Font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- bootraap -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">

<!-- StylesSheet  -->
<link rel="stylesheet" href="http://localhost:8080/PBWA/css/styles.css" />




<title>Dashboard</title>
</head>
<body>

	<!-- NAVIGATION LINKS  -->

	<a href="deposit.jsp" class="btn btn-primary m-1">Deposit</a>
	<br />
	<a href="index.jsp" class="btn btn-warning m-1">index</a>
	<br />
	<button class="btn btn-success m-1">logout</button>
	<br />
	<i class="fa fa-instagram fa-lg m-1"> Instagram</i>
	
	<div  class="chart">
	<div id="chartContainer"></div>
	
	
	</div>

	<!-- EXPENSES FORM  -->

	<div align="center">
		<form action="insert" method="post">

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

	<!-- --------------- LIST EXPENSES TABLE------------------------- -->
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

		<h1 align="right">All Deposits</h1>

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


		<!------------- category Loop -------------->

		<c:set var="TransporTotal" value="${0}" />
		<c:set var="TravelTotal" value="${0}" />
		<c:set var="HomeTotal" value="${0}" />
		<c:set var="lastCategoryItem" value="${0}" />
		<!--  remove this variable  -->



		<c:set var="len" value="${ELIST.indexOf(ELIST.size()-1)}" />
		<!--   test last element of the arrayList-->


		<c:forEach var="temp" items="${ELIST}">

			<c:choose>

				<c:when test="${temp.category eq 'transport'}">
					<c:set var="TransporTotal" value="${TransporTotal + temp.sum}" />
				</c:when>

				<c:when test="${temp.category eq 'Travel'}">
					<c:set var="TravelTotal" value="${TravelTotal + temp.sum}" />
				</c:when>

				<c:otherwise>

					<c:set var="HomeTotal" value="${HomeTotal + temp.sum}" />

					<c:if test="${temp.category == null }">
						<c:set var="total" value="${total - HomeTotal}" />
					</c:if>

				</c:otherwise>

			</c:choose>
		</c:forEach>

		<!-- BALANCE SUM SECTION   -->

		<div align="center">
			<h1>Category Bar</h1>

			BALANCE
			<c:out value="${total}" />
		</div>

		<!--  CATEGORY SECTION   -->
		<div align="center">

			TRANSPORT
			<c:out value="${TransporTotal}" />
			<br> TRAVEL
			<c:out value="${TravelTotal}" />
			<br> HOME
			<c:out value="${HomeTotal}" />

		</div>

	</div>

	<%
	 Double  transportChartPie  =  (Double)pageContext.getAttribute("TransporTotal"); 
	Double  homeChartPie  =  (Double)pageContext.getAttribute("HomeTotal"); 
	Double  TravelChartPie  =  (Double)pageContext.getAttribute("TravelTotal"); 
	
		Gson gsonObj = new Gson();
		Map<Object, Object> map = null;
		List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

		map = new HashMap<Object, Object>();
		map.put("label", "Transport");
		map.put("y", transportChartPie);
		list.add(map);
		
		map = new HashMap<Object, Object>();
		map.put("label", "Home");
		map.put("y", homeChartPie);
		list.add(map);
		
		map = new HashMap<Object, Object>();
		map.put("label", "Travel");
		map.put("y", TravelChartPie);
		list.add(map);
		
	

		String dataPoints = gsonObj.toJson(list);
	%>
	
	<script type="text/javascript">
		window.onload = function() {

			var chart = new CanvasJS.Chart("chartContainer", {
				theme : "light2", // "light1", "dark1", "dark2"
				exportEnabled : true,
				animationEnabled : true,
				title : {
					text : "Expenses"
				},
				data : [ {
					type : "pie",
					toolTipContent : "<b>{label}</b>: {y}£",
					indexLabelFontSize : 16,
					indexLabel : "{label} - {y}£",
					dataPoints :
	<%out.print(dataPoints);%>
		} ]
			});
			chart.render();

		}
	</script>

	
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

</body>
</html>