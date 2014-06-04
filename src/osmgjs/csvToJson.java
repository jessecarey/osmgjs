package osmgjs;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

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
	public static String convertToJson(String fileName) throws IOException{
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
	/**
	 * dynamically converts a csv file to a json file, the attribute
	 * names are taken from the first column on the csv file.
	 * Does not depend on any secondary beans.
	 * @param fileName
	 * @return
	 */
	public static String convertToJsonDynamic(String fileName){
		int i;
		String line = "";
		String fileToParse = "C:\\Users\\bpmdev\\Desktop\\osmg\\osmg\\PersonLocation.csv";
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
		  	return record.toString();
		 	}
	}

