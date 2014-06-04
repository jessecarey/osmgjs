<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
		<script type="text/javascript" src="http://mbostock.github.com/d3/d3.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		

		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

		<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	    <link href="css/bootstrap.min.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	<style media="screen" type="text/css">
		table{ 
		width: 49%;
		float: left;
		}
	</style>
	<script type = "text/javascript">
	var jsontest = new Array({
	    "agentName": "John Smith",
	    "agentNumber": 15546,
	    "ezApp": 9,
	    "temp": 1,
	    "queued": 0,
	    "pending": 1,
	    "delivered": 56,
	    "cancelled": 110,
	    "open": 2,
	    "isrCustomerInfoList": []
	})
	
	var jsont = '{ "agentName": "John Smith", "agentNumber": 15546, "ezApp": 9, "temp": 1, "queued": 0, "pending": 1, "delivered": 56, "cancelled": 110, "open": 2}';
	
	
	var jsonYearGoal = '{ "agentNumer": 15546, "ezAppGoal": 50, "openGoal": 200, "pendingGoal": 210, "queuedGoal": 50 }';
	var jsonMonthGoal = '{ "agentNumer": 15546, "ezAppGoal": 5, "openGoal": 20, "pendingGoal": 20, "queuedGoal": 10 }';

	var obj = JSON.parse(jsont);
	var mon = JSON.parse(jsonMonthGoal);
	var year = JSON.parse(jsonYearGoal);	
	var data = [9,1,5,1];
	var yearGoal = [50,50,200,210]
	var monthGoal = [5,10,20,20]
	var matrix = [
	              [50,50,200,10], 
	              [5,10,20,20], 
	              [9,1,5,1]
	             ]
	</script>

</head>
<body>
	<div>
		<table id="tableOne" border-spacing="5em" class="table-bordered table-condensed">
			<thead>
				<th class = "name"></th>
				<th class = "id"></th>
				<th></th>
			</thead>
			<thead>
				<th></th>
				<th>Year to Date</th>
				<th>Year Goal</th>
			</thead>
			<tr>
				<td>EzApp</td>
				<td class = "ezapp"></td>
				<td id = "ezyear"></td>
			</tr>
			<tr>
				<td>Queued</td>
				<td class = "queued"></td>
				<td id = "queyear"></td>
			</tr>
			<tr>
				<td>Open</td>
				<td class = "open"></td>
				<td id = "opyear"></td>
			</tr>
			<tr>
				<td>Pending</td>
				<td class = "pending"></td>
				<td id = "penyear"></td>
			</tr>			
			
		</table>
		<table id="tableOne" border-spacing="5em" class="table-bordered table-condensed">
			<thead>
				<th class = "name"></th>
				<th class = "id"></th>
				<th></th>
			</thead>
			<thead>
				<th></th>
				<th>Month Data</th>
				<th>Month Goal</th>
			</thead>
			<tr>
				<td>EzApp</td>
				<td class = "ezapp"></td>
				<td id = "ezmon"></td>
			</tr>
			<tr>
				<td>Queued</td>
				<td class = "queued"></td>
				<td id = "quemon"></td>
			</tr>
			<tr>
				<td>Open</td>
				<td class = "open"></td>
				<td id = "opmon"></td>
			</tr>
			<tr>
				<td>Pending</td>
				<td class = "pending"></td>
				<td id = "penmon"></td>
			</tr>			
			
		</table>
	</div>
	<div id ="chart"></div>
	
	
	
	<script type = "text/javascript">
	

	//creates a table row for every json element
	d3.selectAll(".name").text(obj.agentName)
	d3.selectAll(".id").text("ID = " + obj.agentNumber)
	d3.selectAll(".ezapp").text(obj.ezApp)
	d3.selectAll(".queued").text(obj.queued)
	d3.selectAll(".open").text(obj.open)
	d3.selectAll(".pending").text(obj.pending)
	d3.select("#penmon").text(mon.pendingGoal)
	d3.select("#opmon").text(mon.openGoal)
	d3.select("#quemon").text(mon.queuedGoal)
	d3.select("#ezmon").text(mon.ezAppGoal)
	d3.select("#penyear").text(year.pendingGoal)
	d3.select("#opyear").text(year.openGoal)
	d3.select("#queyear").text(year.queuedGoal)
	d3.select("#ezyear").text(year.ezAppGoal)
	d3.select("#chart").append("svg");
	
	var layerOne = d3.select("svg").
    append("g")
    .attr("class", "0")
	.attr("id", "0");
	
	var layerTwo = d3.select("svg").
    append("g")
    .attr("class", "1")
	.attr("id", "1");
	
	var layerThree = d3.select("svg").
    append("g")
    .attr("class", "2")
	.attr("id", "2");
	
	layerOne
	  .selectAll("rect")
	  .data(yearGoal)
	  .enter().append("rect")  
	  .attr("width", function(d) {
		    return d*3;  
	  })
	   .attr("height", 35)
		.attr("x", 15)
		.attr("y", function(d, i) {
		    return i * 50; 
		    })
		.attr("fill", "blue");
	
	layerTwo
	  .selectAll("rect")
	  .data(monthGoal)
	  .enter().append("rect")  
	  .attr("width", function(d) {
		    return d*3;
	  })
	   .attr("height", 35)
		.attr("x", 15)
		.attr("y", function(d, i) {
		    return i * 50;  
		})
		.attr("fill", "teal")
			
		
	layerThree
	  .selectAll("rect")
	  .data(data)
	  .enter().append("rect")  
	  .attr("width", function(d) {
		    return d*3;  	  })
	   .attr("height", 35)
		.attr("x", 15)
		.attr("y", function(d, i) {
		    return i * 50;
		    })
		.attr("fill", "black")
		
	

	</script>
</body>
</html>