

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class csvToJsonServlet
 */
@WebServlet("/csvToJsonServlet")
public class csvToJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public csvToJsonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response, new String());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response, new String());

	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response, String fileName){
		int i;
		String line = "";
		String fileToParse = "PersonLocation.csv";
		String root = request.getSession().getServletContext().getRealPath("/");
		System.out.println(root);
		BufferedReader fileReader = null;
		  boolean initial = true;
		  ArrayList<String> header = new ArrayList<String>();
		  JSONObject record = new JSONObject();
		  try {
		  fileReader = new BufferedReader(new FileReader(fileToParse));
		   while ((line = fileReader.readLine()) != null) {
		    i = 0;
		    String[] tokens = line.split(",");
		    if (initial) {

		     for (String token : tokens) {
		      if (token.startsWith("\"")) {
		       token = token.substring(1);
		      }
		      if (token.endsWith("\"")) {
		       token = token.substring(0, token.length() - 1);
		      }
		      header.add(token);
		     }
		     initial = false;
		     continue;

		    }
		    // Get all tokens available in line
		    for (String token : tokens) {
		     if (token.startsWith("\"")) {
		      token = token.substring(1);
		     }
		     if (token.endsWith("\"")) {
		      token = token.substring(0, token.length() - 1);
		     }
		     record.put(header.get(i).toString(), token);
		     i++;
		     if (i == header.size())
		      break;

		    }
		    System.out.println(record);
		   
		   }

		  } catch (IOException e) {
		   e.printStackTrace();
		  } catch (JSONException e) {

		   e.printStackTrace();
		  }
		 }
}


