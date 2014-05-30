<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "org.json.*" %>

<%
int[] numarr = {3,2,1};
JSONArray json = new JSONArray(); 
JSONObject obj = new JSONObject();
try {
	obj.put("Num", 4);
	obj.put("String", "test");
	obj.put("Array", numarr);
} catch (JSONException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
json.put(obj);
json.put(obj);
json.put(obj);
session.setAttribute("json", json.toString());
System.out.println(obj.toString());
System.out.println(session.getAttribute("json"));
response.sendRedirect("index.jsp?num=4");


%>
