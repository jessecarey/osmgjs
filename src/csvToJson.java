

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import osmgjs.personBean;
import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.bean.ColumnPositionMappingStrategy;
import au.com.bytecode.opencsv.bean.CsvToBean;

import com.google.gson.Gson;

/**
 * Servlet implementation class csvToJson
 */
@WebServlet("/csvToJson")
public class csvToJson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public csvToJson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fileName = new String("PersonLocation.csv");
		processRequest(request, response, fileName);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fileName = new String("PersonLocation.csv");
		processRequest(request, response, fileName);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response, String fileName) throws ServletException, IOException {
		CSVReader reader;
		reader = new CSVReader(new FileReader("PersonLocation.csv"));
		//Converts CSV to List of personBeans
		String [] columns = {"email", "Location"};
		CsvToBean ctb = new CsvToBean();
		ColumnPositionMappingStrategy cpms = new ColumnPositionMappingStrategy();
		cpms.setType(personBean.class);
		cpms.setColumnMapping(columns);	
		List beanList = ctb.parse(cpms, reader);
		System.out.println();
		//Converts personBeans to JSON
		
		Gson gson = new Gson();
		String jsonTest = new String();
		for(int i = 0; i<beanList.size(); i++)
			jsonTest+= gson.toJson(beanList.get(i)) + ",\n";
		jsonTest = jsonTest.substring(0, jsonTest.length()-2);
		System.out.println(jsonTest);
		
		//writes to Json File
		FileWriter writer = new FileWriter("test.json");
		writer.write(jsonTest);
		writer.close();
	}

}
