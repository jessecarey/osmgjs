<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<script src="js/dynatable.js"></script>
<link rel="stylesheet" href="css/dynatable.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="data.js" type="text/javascript"></script>
<style>
#container {
	overflow: auto;
	max-height: 500px;
}

#table {
	height ": 500px"
}
</style>


<title>Insert title here</title>
<script>
	var users = testOne;
	var headers = new Array();
	var user = '${sessionScope.type}';
	console.log(user);

	function addRowBroad(tr, d) {
		tr.append("td").text(d.objtype);
		tr.append("td").text(d.objid);
		tr.append("td").text(d.type);
		tr.append("td").text(d.assgrp);
		tr.append("td").text(d.assrole);
		tr.append("td").text(d.status);
		tr.append("td").text(d.reqdate);
		tr.append("td").text(d.duedate);
		tr.append("td").text(d.requestedby);
	}

	function generateTable() {
		var thead = d3.select("tr").selectAll("th").data(d3.keys(users[0]))
				.enter().append("th").text(function(d) {
					headers.push(d);
					return d
				});

		createView();

		/*
		var tr = d3.select("tbody").selectAll("tr").data(users).enter().append(
				"tr")

		var td = tr.selectAll("td").data(function(d) {
			return d3.values(d)
		}).enter().append("td").text(function(d) {
			return d
		})
		
		createDynatable()
		 */
	}
	function loadDiv(data) {
		d3.select("#specific").text("TEST");
	}
	function createView() {
		users.forEach(function(d) {
			d.reqdate = new Date(d.reqdate);
			d.duedate = new Date(d.duedate);
			if (user == 1) {
				if (d.objtype == "person") {
					tr = d3.select("tbody").append("tr")
					tr.on("click", function(a, i){
						d3.select("#specific").append().text(d.status);
					})
					addRowBroad(tr, d);
				}
			} else if (user == 2) {
				if (d.status == "open") {
					tr = d3.select("tbody").append("tr");
					addRowBroad(tr, d)

				}
			} else {
				tr = d3.select("tbody").append("tr")
				tr.on("click", function(a, i){
					d3.select("#specific").text(d.status);
				})
				addRowBroad(tr, d);
			}
		})
		addButtons();
	}

	function addButtons() {
		d3.select("tbody").selectAll("tr").append("td").append("a").attr(
				"class", "btn").text("Address Task").attr("href",
				"PieTest.html");
	}
</script>


</head>
<body>
	<div id="container">
		<table class="table table-striped  table-condensed" id="table">
			<thead>
				<tr></tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
	<div id="specific"></div>
</body>
</html>
<script>
	generateTable()
</script>