/**
 * 
 */

var test;

test = fetchJSONFile("Json/orders.json", function(data){
    // do something with your data
    //JSON.Parse(data);
	console.log(data);
	return data
});

console.log(test);

function fetchJSONFile(path, callback) {
    var httpRequest = new XMLHttpRequest();
    var data = 0;
    httpRequest.onreadystatechange = function() {
        if (httpRequest.readyState === 4) {
            if (httpRequest.status === 200) {
                data = JSON.parse(httpRequest.responseText);
                if (callback) callback(data);
            }
        }
     return data;
    };
    httpRequest.open('GET', path);
    httpRequest.send(); 
}

// this requests the file and executes a callback with the parsed result once
//   it is available
