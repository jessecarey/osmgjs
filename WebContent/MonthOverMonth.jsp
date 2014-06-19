<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://mbostock.github.com/d3/d3.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="data.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
.red {
	color: red;
}

.green {
	color: green;
}

.axis path,.axis line {
	fill: none;
	stroke: #000;
	shape-rendering: crispEdges;
}

.x.axis path {
	display: none;
}

.lineOne {
	fill: none;
	stroke: steelblue;
	stroke-width: 1.5px;
}

.lineTwo {
	fill: none;
	stroke: red;
	stroke-width: 1.5px;
}

.table {
	width: 49%;
	float: left;
}
</style>

<title>Month Over Month</title>
</head>
<body>
	<%@ include file="utilities/navbar.html" %>
	<div>
		<table id="2014data" border-spacing="5em"
			class="table table-striped table-bordered table-condensed">
			<tr>
				<td>Total</td>
				<td>Chrystler</td>
				<td>Volkswagen</td>
				<td>Honda</td>
				<td>Ford</td>
				<td>Toyata</td>
				<td>Harley</td>
				<td>Audi</td>
				<td>Nissan</td>
				<td>Mercades</td>
			</tr>
			<tr>
				<td id="total14"></td>
				<td id="chr14"></td>
				<td id="vw14"></td>
				<td id="hd14"></td>
				<td id="for14"></td>
				<td id="toy14"></td>
				<td id="har14"></td>
				<td id="aud14"></td>
				<td id="ado14"></td>
				<td id="merc14"></td>
			</tr>
		</table>

		<table id="2013data" border-spacing="5em"
			class="table table-striped table-bordered table-condensed">
			<tr>
				<td>Total</td>
				<td>Chrystler</td>
				<td>Volkswagen</td>
				<td>Honda</td>
				<td>Ford</td>
				<td>Toyata</td>
				<td>Harley</td>
				<td>Audi</td>
				<td>Nissan</td>
				<td>Mercades</td>
			</tr>
			<tr>
				<td id="total13"></td>
				<td id="chr13"></td>
				<td id="vw13"></td>
				<td id="hd13"></td>
				<td id="for13"></td>
				<td id="toy13"></td>
				<td id="har13"></td>
				<td id="aud13"></td>
				<td id="ado13"></td>
				<td id="merc13"></td>
			</tr>
		</table>
	</div>

	</br>
	</br>
	<div id="container"></div>

	<script>
		var margin = {
			top : 20,
			right : 20,
			bottom : 30,
			left : 50
		}, width = 960 - margin.left - margin.right, height = 500 - margin.top
				- margin.bottom;



		var svg = d3.select("#container").append("svg").attr("width",
				width + margin.left + margin.right).attr("height",
				height + margin.top + margin.bottom)
		var layerOne = d3.select("svg").append("g").attr("id", "g1");
		var layerTwo = d3.select("svg").append("g").attr("id", "g2");
		
		d3.json("Json/deliveriesmay13.json", function(data) {
			var total;
			var chrysTotal = 0;
			var vwTotal = 0;
			var hdTotal = 0;
			var forTotal = 0;
			var toyTotal = 0;
			var harTotal = 0;
			var audTotal = 0;
			var adoTotal = 0;
			var mercTotal = 0;

			data.forEach(function(d) {
				if (d.pmn010 == "CHR")
					chrysTotal += d.ccount;
				if (d.pmn010 == "AVW" || d.pmn010 == "SWV")
					vwTotal += d.ccount;
				if (d.pmn010 == "HAX" || d.pmn010 == "HON")
					hdTotal += d.ccount;
				if (d.pmn010 == "FOR")
					forTotal += d.ccount;
				if (d.pmn010 == "TOY")
					toyTotal += d.ccount;
				if (d.pmn010 == "HD")
					harTotal += d.ccount;
				if (d.pmn010 == "AUD" || d.pmn010 == "ADO")
					audTotal += d.ccount;
				if (d.pmn010 == "NPX")
					adoTotal += d.ccount;
				if (d.pmn010 == "MBA")
					mercTotal += d.ccount;
			})
			total = chrysTotal + vwTotal + hdTotal + forTotal + toyTotal
					+ harTotal + audTotal + adoTotal + mercTotal;
			var data = new Array(total, chrysTotal, vwTotal, hdTotal, forTotal, toyTotal, harTotal, audTotal, adoTotal, mercTotal);

			d3.select("#chr13").text(chrysTotal);
			d3.select("#vw13").text(vwTotal);
			d3.select("#hd13").text(hdTotal);
			d3.select("#for13").text(forTotal);
			d3.select("#toy13").text(toyTotal);
			d3.select("#har13").text(harTotal);
			d3.select("#aud13").text(audTotal);
			d3.select("#ado13").text(adoTotal);
			d3.select("#chr13").text(chrysTotal);
			d3.select("#total13").text(total);
			d3.select("#merc13").text(mercTotal);
			
			layerOne
			  .selectAll("rect")
			  .data(data)
			  .enter().append("rect")  
			  .attr("width", function(d) {
				    return d/3;  
			  })
			   .attr("height", 20)
				.attr("x", 15)
				.attr("y", function(d, i) {
				    return i * 40+12; 
				    })
				.attr("fill", "teal");

		});
		
		d3.json("Json/deliveriesmay14.json", function(data) {
			var total;
			var chrysTotal = 0;
			var vwTotal = 0;
			var hdTotal = 0;
			var forTotal = 0;
			var toyTotal = 0;
			var harTotal = 0;
			var audTotal = 0;
			var adoTotal = 0;
			var mercTotal = 0;

			data.forEach(function(d) {
				if (d.pmn010 == "CHR")
					chrysTotal += d.ccount;
				if (d.pmn010 == "AVW" || d.pmn010 == "SWV")
					vwTotal += d.ccount;
				if (d.pmn010 == "HAX" || d.pmn010 == "HON")
					hdTotal += d.ccount;
				if (d.pmn010 == "FOR")
					forTotal += d.ccount;
				if (d.pmn010 == "TOY")
					toyTotal += d.ccount;
				if (d.pmn010 == "HD")
					harTotal += d.ccount;
				if (d.pmn010 == "AUD" || d.pmn010 == "ADO")
					audTotal += d.ccount;
				if (d.pmn010 == "NPX")
					adoTotal += d.ccount;
				if (d.pmn010 == "MBA")
					mercTotal += d.ccount;
			})
			total = chrysTotal + vwTotal + hdTotal + forTotal + toyTotal
					+ harTotal + audTotal + adoTotal + mercTotal;
			var data = new Array(total, chrysTotal, vwTotal, hdTotal, forTotal, toyTotal, harTotal, audTotal, adoTotal, mercTotal);

			d3.select("#chr14").text(chrysTotal);
			d3.select("#vw14").text(vwTotal);
			d3.select("#hd14").text(hdTotal);
			d3.select("#for14").text(forTotal);
			d3.select("#toy14").text(toyTotal);
			d3.select("#har14").text(harTotal);
			d3.select("#aud14").text(audTotal);
			d3.select("#ado14").text(adoTotal);
			d3.select("#chr14").text(chrysTotal);
			d3.select("#total14").text(total);
			d3.select("#merc14").text(mercTotal);
			
			layerTwo
			  .selectAll("rect")
			  .data(data)
			  .enter().append("rect")  
			  .attr("width", function(d) {
				    return d/3;  
			  })
			   .attr("height", 20)
				.attr("x", 15)
				.attr("y", function(d, i) {
				    return i * 40; 
				    })
				.attr("fill", "blue");

		});

	</script>


</body>
</html>