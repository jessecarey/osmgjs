<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://mbostock.github.com/d3/d3.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="data.js" type="text/javascript"></script>
<script src="dataFormat.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
.red {
	color: red;
}

.green {
	color: green;
}

.table {
	width: 49%;
	float: left;
}
</style>
<script>
	var yearToLoad;
	var monthToLoad;
	var jsonNameOne = "Json/deliveries20140500.json";
	var jsonNameTwo = "Json/deliveries20130500.json";
	var headerOne = "May 2014 Deliveries";
	var headerTwo = "May 2013 Deliveries" ;
	
	function loadDropDown() {
		var dropdown = d3.select("#yeardropdownone");
		var dropdownmonth = d3.select("#monthdropdownone");
		var dropdowntwo = d3.select("#yeardropdowntwo");
		var dropdownmonthtwo = d3.select("#monthdropdowntwo");
		years.forEach(function(d) {
			dropdown.append("option").text(d);
			dropdowntwo.append("option").text(d);
		});
		months.forEach(function(d) {
			dropdownmonth.append("option").attr("value", d.value).text(d.name);
			dropdownmonthtwo.append("option").attr("value", d.value).text(d.name);
		})
	}

	function load() {
		monthToLoad = document.getElementById("monthdropdownone").value;
		yearToLoad = document.getElementById("yeardropdownone").value;
		jsonNameOne = "Json/deliveries";
		jsonNameOne = jsonNameOne.concat(yearToLoad, monthToLoad, "00.json");
		loadFirst(jsonNameOne);
		var monthValue;
		if(monthToLoad =="05")
			monthValue = "May";
		if(monthToLoad == "06")
			monthValue = "June";
		headerName = "";
		headerName = headerName.concat(monthValue, " ", yearToLoad, " Deliveries");
		d3.select("#headerOne").text(headerName);			
	}
	
	function loadTwo(){
		monthToLoad = document.getElementById("monthdropdowntwo").value;
		yearToLoad = document.getElementById("yeardropdowntwo").value;
		jsonNameTwo = "Json/deliveries";
		jsonNameTwo = jsonNameTwo.concat(yearToLoad, monthToLoad, "00.json");
		loadSecond(jsonNameTwo);
		var monthValue;
		if(monthToLoad =="05")
			monthValue = "May";
		if(monthToLoad == "06")
			monthValue = "June";
		headerName = "";
		headerName = headerName.concat(monthValue, " ", yearToLoad, " Deliveries");
		d3.select("#headerTwo").text(headerName);	
	}

	function analize() {
		var data14 = new Array(d3.select("#total1"), d3.select("#chr1"), d3
				.select("#vw1"), d3.select("#hd1"), d3.select("#for1"), d3
				.select("#toy1"), d3.select("#har1"), d3.select("#aud1"), d3
				.select("#ado1"), d3.select("#merc1"));
		var data13 = new Array(d3.select("#total2"), d3.select("#chr2"), d3
				.select("#vw2"), d3.select("#hd2"), d3.select("#for2"), d3
				.select("#toy2"), d3.select("#har2"), d3.select("#aud2"), d3
				.select("#ado2"), d3.select("#merc2"));

		var values = new Array(false, false, false, false, false, false, false,
				false, false, false);
		for (i = 0; i < data14.length; i++) {
			if (data14[i].text() > data13[i].text()) {
				data14[i].attr("class", "green");
				data13[i].attr("class", "red");
			} else {
				data13[i].attr("class", "green");
				data14[i].attr("class", "red");

			}
		}

	}
</script>
<title>Month Over Month</title>
</head>
<body>
	<%@ include file="utilities/navbar.html"%>
	<select onchange="load()" id="yeardropdownone">
		<option>Select Year</option>
	</select>
	<select onchange="load()" id="monthdropdownone">
		<option>Select Month</option>
	</select>

	<select onchange="loadTwo()" id="yeardropdowntwo">
		<option>Select Year</option>
	</select>
	<select onchange="loadTwo()" id="monthdropdowntwo">
		<option>Select Month</option>
	</select>
	</br>
	</br>
	<table id="2014data" border-spacing="5em"
		class="table table-striped table-bordered table-condensed">
		<caption id ="headerOne" >May 2014 Deliveries</caption>
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
			<td id="total1"></td>
			<td id="chr1"></td>
			<td id="vw1"></td>
			<td id="hd1"></td>
			<td id="for1"></td>
			<td id="toy1"></td>
			<td id="har1"></td>
			<td id="aud1"></td>
			<td id="ado1"></td>
			<td id="merc1"></td>
		</tr>
	</table>

	<table id="2013data" border-spacing="5em"
		class="table table-striped table-bordered table-condensed">
		<caption id = "headerTwo">May 2013 Deliveries</caption>

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
			<td id="total2"></td>
			<td id="chr2"></td>
			<td id="vw2"></td>
			<td id="hd2"></td>
			<td id="for2"></td>
			<td id="toy2"></td>
			<td id="har2"></td>
			<td id="aud2"></td>
			<td id="ado2"></td>
			<td id="merc2"></td>
		</tr>
	</table>
	</div>

	</br>
	</br>
	<div id="legend"></div>
	<div id="container"></div>

	<script>
		loadDropDown()
		loadFirst(jsonNameOne);
		loadSecond(jsonNameTwo);
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

		function loadSecond(path) {
			d3.json(path, function(data) {
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
				var data = new Array(total, chrysTotal, vwTotal, hdTotal,
						forTotal, toyTotal, harTotal, audTotal, adoTotal,
						mercTotal);

				d3.select("#chr2").text(chrysTotal);
				d3.select("#vw2").text(vwTotal);
				d3.select("#hd2").text(hdTotal);
				d3.select("#for2").text(forTotal);
				d3.select("#toy2").text(toyTotal);
				d3.select("#har2").text(harTotal);
				d3.select("#aud2").text(audTotal);
				d3.select("#ado2").text(adoTotal);
				d3.select("#chr2").text(chrysTotal);
				d3.select("#total2").text(total);
				d3.select("#merc2").text(mercTotal);

				layerOne.selectAll("*").remove();
				layerOne.selectAll("rect").data(data).enter().append("rect")
						.attr("width", function(d) {
							return d / 3;
						}).attr("height", 20).attr("x", 15).attr("y",
								function(d, i) {
									return i * 40 + 12;
								}).attr("fill", "teal");
				analize()

			});
		}

		function loadFirst(path) {
			d3.json(path, function(data) {
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
				var data = new Array(total, chrysTotal, vwTotal, hdTotal,
						forTotal, toyTotal, harTotal, audTotal, adoTotal,
						mercTotal);

				d3.select("#chr1").text(chrysTotal);
				d3.select("#vw1").text(vwTotal);
				d3.select("#hd1").text(hdTotal);
				d3.select("#for1").text(forTotal);
				d3.select("#toy1").text(toyTotal);
				d3.select("#har1").text(harTotal);
				d3.select("#aud1").text(audTotal);
				d3.select("#ado1").text(adoTotal);
				d3.select("#chr1").text(chrysTotal);
				d3.select("#total1").text(total);
				d3.select("#merc1").text(mercTotal);

				layerTwo.selectAll("*").remove();
				layerTwo.selectAll("rect").data(data).enter().append("rect")
						.attr("width", function(d) {
							return d / 3;
						}).attr("height", 20).attr("x", 15).attr("y",
								function(d, i) {
									return i * 40;
								}).attr("fill", "blue");

				analize()

			});
		}
		var legend = d3.select("#legend").append("svg").attr("width", 300)
				.attr("height", 100);

		legend.append("rect").attr("x", 20).attr("y", 0).attr("width", 20)
				.attr("height", 20).attr("fill", "blue")

		legend.append("text").attr("x", 180).attr("y", 10).attr("dy", ".35em")
				.style("text-anchor", "end").text("2014 Deliveries");

		legend.append("rect").attr("x", 20).attr("y", 35).attr("width", 20)
				.attr("height", 20).attr("fill", "teal")

		legend.append("text").attr("x", 180).attr("y", 43).attr("dy", ".35em")
				.style("text-anchor", "end").text("2013 Deliveries");
	</script>


</body>
</html>