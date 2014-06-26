var legendOne = "May 2014";
var legendTwo = "May 2013";
var yearToLoad;
var monthToLoad;
var jsonNameOne = "Json/deliveries20140500.json";
var jsonNameTwo = "Json/deliveries20130500.json";
var headerOne = "May 2014 Deliveries";
var headerTwo = "May 2013 Deliveries";
var margin = {
	top : 20,
	right : 20,
	bottom : 30,
	left : 50
}, width = 700 - margin.left - margin.right, height = 500 - margin.top
		- margin.bottom;

// define SVG and layers
var svg = d3.select("#container").append("svg").attr("width",
		width + margin.left + margin.right).attr("height",
		height + margin.top + margin.bottom)
var layerOne = d3.select("svg").append("g").attr("id", "g1");
var layerTwo = d3.select("svg").append("g").attr("id", "g2");
var legend = d3.select("svg").append("g").attr("id", "legend");

// loads drop down menu
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
	legendOne = monthToLoad.concat(" ", yearToLoad);
	jsonNameOne = "Json/deliveries";
	jsonNameOne = jsonNameOne.concat(yearToLoad, monthToLoad, "00.json");
	loadFirst(jsonNameOne);
	var monthValue;
	if (monthToLoad == "05")
		monthValue = "May";
	if (monthToLoad == "06")
		monthValue = "June";
	headerName = "";
	headerName = headerName.concat(monthValue, " ", yearToLoad);
	d3.select("#headerOne").text(headerName);
}

function loadTwo() {
	monthToLoad = document.getElementById("monthdropdowntwo").value;
	yearToLoad = document.getElementById("yeardropdowntwo").value;
	legendTwo = monthToLoad.concat(" ", yearToLoad);
	jsonNameTwo = "Json/deliveries";
	jsonNameTwo = jsonNameTwo.concat(yearToLoad, monthToLoad, "00.json");
	loadSecond(jsonNameTwo);
	var monthValue;
	if (monthToLoad == "05")
		monthValue = "May";
	if (monthToLoad == "06")
		monthValue = "June";
	headerName = "";
	headerName = headerName.concat(monthValue, " ", yearToLoad);
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
		total = chrysTotal + vwTotal + hdTotal + forTotal + toyTotal + harTotal
				+ audTotal + adoTotal + mercTotal;
		var data = new Array(total, chrysTotal, vwTotal, hdTotal, forTotal,
				toyTotal, harTotal, audTotal, adoTotal, mercTotal);

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
		layerOne.selectAll("rect").data(data).enter().append("rect").attr(
				"width", 20).attr("height", function(d) {
			return d / 3
		}).attr("x", function(d, i) {
			return i * 40 + 25;
		}).attr("y", function(d) {
			return 500 - d / 4
		}).attr("fill", "teal")
		.attr("class", "bartwo")
		.on("mouseover", function(){
			d3.selectAll(".bartwo").style("opacity", 1);
		})
		on("mouseout", function(){
			d3.selectAll(".bartwo").style("opacity", .5);
		});
		analize()
		loadLegend()

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
		total = chrysTotal + vwTotal + hdTotal + forTotal + toyTotal + harTotal
				+ audTotal + adoTotal + mercTotal;
		var data = new Array(total, chrysTotal, vwTotal, hdTotal, forTotal,
				toyTotal, harTotal, audTotal, adoTotal, mercTotal);

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
		layerTwo.selectAll("rect").data(data).enter().append("rect").attr(
				"width", 20).attr("height", function(d) {
			return d / 3
		}).attr("x", function(d, i) {
			return i * 40 + 15;
		}).attr("y", function(d) {
			return 500 - d / 4
		}).attr("fill", "blue")
		.attr("class", "barone");

		analize()
		loadLegend()
	});
}

function loadLegend() {
	legend.selectAll("*").remove();
	legend.append("rect").attr("x", 250).attr("y", 15).attr("width", 20).attr(
			"height", 20).attr("fill", "blue").on("mouseover", function(){
				d3.selectAll(".barone").style("opacity", 1);
			})
			.on("mouseout", function(){
				d3.selectAll(".barone").style("opacity", .5);
			});;

	legend.append("text").attr("x", 380).attr("y", 22).attr("dy", ".35em")
			.style("text-anchor", "end").text(legendOne);

	legend.append("rect").attr("x", 250).attr("y", 35).attr("width", 20).attr(
			"height", 20).attr("fill", "teal").on("mouseover", function(){
				d3.selectAll(".bartwo").style("opacity", 1);
			})
			.on("mouseout", function(){
				d3.selectAll(".bartwo").style("opacity", .5);
			});

	legend.append("text").attr("x", 380).attr("y", 45).attr("dy", ".35em")
			.style("text-anchor", "end").text(legendTwo);
}

function loadPie() {
	var w = 500;
	var h = 500;
	var r = h / 2;
	var color = d3.scale.category20c();

	var data = [ {
		"label" : "CHR",
		"value" : 465
	}, {
		"label" : "AVW",
		"value" : 52
	}, {
		"label" : "HAX",
		"value" : 12
	}, {
		"label" : "FOR",
		"value" : 555
	}, {
		"label" : "TOY",
		"value" : 58
	}, {
		"label" : "HD",
		"value" : 216
	}, {
		"label" : "AUD",
		"value" : 86
	}, {
		"label" : "NPX",
		"value" : 18
	}, {
		"label" : "MBA",
		"value" : 7
	} ];

	var vis = d3.select('#container').append("svg:svg").data([ data ]).attr(
			"width", w).attr("height", h).append("svg:g").attr("transform",
			"translate(" + r + "," + r + ")");
	var arc = d3.svg.arc().outerRadius(r);
	var pie = d3.layout.pie().value(function(d) {
		return d.value;
	});
	var arcs = vis.selectAll("g.slice").data(pie).enter().append("svg:g").attr(
			"class", "slice");
	arcs.append("svg:path").attr("fill", function(d, i) {
		return color(i);
	}).attr("d", arc);
	arcs.append("svg:text").attr("transform", function(d) {
		d.innerRadius = 0;
		d.outerRadius = r;
		return "translate(" + arc.centroid(d) + ")";
	}).attr("text-anchor", "middle").text(function(d, i) {
		if (data[i].value > 50)
			return data[i].label + ":" + data[i].value;
		else
			return ""
	}).attr("class", function(d, i) {
		if (data[i].value > 100)
			return "label";
		else
			return "smallLabel";

	});
	
	

}
