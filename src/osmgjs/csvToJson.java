package osmgjs;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.bean.ColumnPositionMappingStrategy;
import au.com.bytecode.opencsv.bean.CsvToBean;

import com.google.gson.Gson;

public class csvToJson {
	/**
	 * This class depends on an external bean class to be used to convert
	 * to a corrosponding json file. The bean contains all of the paramater 
	 * names.
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	public String convertToJson(String fileName) throws IOException{
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
		//writer.write(jsonTest);
		//writer.close();
		return jsonTest;
	}
}
