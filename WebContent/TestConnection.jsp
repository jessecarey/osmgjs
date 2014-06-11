<%@ page import = "java.sql.*" %> 
<%@ page import = "java.util.*" %>
<%@ page import = "osmgjs.JsonFactory" %>

<%
	String json = new String();
	final String username = "CRMSYS";
	final String password = "CRMSYS";
	final String url = "jdbc:db2://nyprod.militarycars.com:446/NYPROD";
	final String mysJDBCDriver = "com.ibm.db2.jcc.DB2Driver";
	String queryString = "select  CMAST.CMCUST , CMAST.CMFRST , CMAST.CMMI , CMAST.CMLAST ,CMAST.CMNAM@ ,CMAST.CMNMSO, CMAST.CMADR1 ,CMAST.CMADR2 ,CMAST.CMADR3, CMAST.CMCITY, CMAST.CMST, CMAST.CMZIP, CMAST.CMSTEL, CMAST.CMMAD1, CMAST.CMMAD2, CMAST.CMMAD3, CMAST.CMAPO, CMAST.CMMTEL, CMAST.CMNXDS, CMAST.CMNXDT, CMAST.CMBRCH, CMAST.CMRANK, CMAST.CMDOB, CMAST.CMYISC,CMAST.CMMRTL, CMAST.CM#KID, CMAST.CMBPAY, CMAST.CMSEPD, CMAST.CMDERO, CMAST.CMCOMP, OEMAILP.OEMCUS ,OEMAILP.OEMADD FROM QS36F.CMAST CMAST LEFT OUTER JOIN QS36F.OEMAILP OEMAILP on   CMAST.CMCUST = OEMAILP.OEMCUS WHERE CMAST.CMCUST = 102445188";

	java.sql.Connection conn = null;
	Driver driver = null;
	java.sql.ResultSet rs = null;

	try {
		driver = (Driver) Class.forName(mysJDBCDriver).newInstance();
	} catch (InstantiationException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IllegalAccessException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	java.util.Properties sysprops = System.getProperties();
	sysprops.put("user", username);
	sysprops.put("password", password);
	java.sql.PreparedStatement testStatement;
	try {
		conn = DriverManager.getConnection(url, sysprops);
		conn.setAutoCommit(false);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	JsonFactory jf = new JsonFactory(queryString, conn);
	try {
		List<LinkedHashMap<String, Object>> results = jf.runFactory();
		json = JsonFactory.generateJSON(results);
		System.out.println(json);
		System.out.println();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	request.getSession().setAttribute("JSON", json);
%>