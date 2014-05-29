<%@ page import = "java.io.*" %>

<%
	System.out.println("test");
	String content = new String();
	File file = new File("testData.txt");
   try {
       FileReader reader = new FileReader(file);
       char[] chars = new char[(int) file.length()];
       reader.read(chars);
       content = new String(chars);
       reader.close();
   } catch (IOException e) {
       e.printStackTrace();
   }
   System.out.println(content);





%>