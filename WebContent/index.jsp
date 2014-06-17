
<!DOCTYPE html>
<html>
	<head>
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
		<script src = "data.js" type = "text/javascript"></script>
		
		<style media="screen" type="text/css">
		th{padding:15px;
		}
		</style>
		
		
		<script type = "text/javascript">
		var jsonNumber = "${param.num}";
		if (jsonNumber==4){
			var temp = <%= session.getAttribute("json")%>
			users = temp
		}
		else
			if (jsonNumber==2){
				users = json2
			}
			else
				if (jsonNumber==3){
					users = json3
				}
				else
					if (jsonNumber ==5){
						users = json5
					}
					else
						users = json1
		</script>
	</head>
	<body>
		 <table id="split" border-spacing="5em" class="table table-striped table-bordered table-condensed">
			<thead></thead>
			<tbody></tbody>
		</table>
		
		<script type="text/javascript">
		//created table headers based on attribute names in the first json column
		var thead = d3.select("thead").selectAll("th")
			.data(d3.keys(users[0]))
			.enter().append("th").text(function(d){return d});
		
		//creates a table row for every json element
		var tr = d3.select("tbody").selectAll("tr")
			.data(users).enter().append("tr")
 		
		//creates a td for every value in each json row
		var td = tr.selectAll("td")
			.data(function(d){return d3.values(d)})
			.enter().append("td")
			.text(function(d) {return d})

		</script>
	<a href = "index.jsp?num=1">Data Set One</a>
 	<a href = "index.jsp?num=2">Data Set Two</a>
 	
 	
	</body>
</html>



