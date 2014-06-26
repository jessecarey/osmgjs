var m = [ 80, 80, 80, 80 ];
var w = 850 - m[1] - m[3];
var h = 400 - m[0] - m[2];

var data = [ 24509, 19466, 18004, 18381, 17312, 19926, 24761, 24815, 24333,
		29117, 24527, 17478 ];
var dataTwo = [ 24509, 19466, 18004, 08381, 07312, 09926, 14761, 14815, 14333,
		19117, 14527, 7478 ];

function formatTick(d) {
	return d;
}

var xLabels = d3.time.scale().domain(
		[ new Date(2013, 0, 1), new Date(2013, 11, 31) ]).range([ 0, w ]);
var x = d3.scale.linear().domain([ 0, data.length ]).range([ 0, w ]);
var y = d3.scale.linear().domain([ 0, d3.max(data) ]).range([ h, 0 ]);

var line = d3.svg.line().x(function(d, i) {
	return x(i);
}).y(function(d) {
	return y(d);
})

var graph = d3.select("#monthChart").append("svg:svg").attr("width",
		w + m[1] + m[3]).attr("height", h + m[0] + m[2]).append("svg:g").attr(
		"transform", "translate(" + 120 + "," + m[0] + ")");

var xAxis = d3.svg.axis().scale(xLabels).ticks(d3.time.months).tickFormat(
		d3.time.format("%B")).tickSize(-h).tickSubdivide(true);
graph.append("svg:g").attr("class", "x axis").attr("transform",
		"translate(0," + h + ")").call(xAxis);

var yAxisLeft = d3.svg.axis().scale(y).ticks(7).tickFormat(formatTick).orient(
		"left");
graph.append("svg:g").attr("class", "y axis").attr("transform",
		"translate(-25,0)").call(yAxisLeft);

graph.append("svg:path").attr("d", line(data)).attr('class', 'line')

graph.append("svg:path").attr("d", line(dataTwo)).attr('class', 'line').style(
		"stroke", "red").append("svg:title").text(function(d) {
	return d;
});