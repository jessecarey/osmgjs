package osmgjs;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import com.google.gson.Gson;


public class JsonFactory {
	protected java.sql.Connection conn;
	private final String queryString;
	
	
	public JsonFactory(String queryString, java.sql.Connection conn){
		this.queryString = queryString;
		this.conn = conn;
	}
	
	public List<LinkedHashMap<String, Object>> runFactory() throws SQLException{
		List<LinkedHashMap<String,Object>> results;
		ResultSet rs = null;
		java.sql.PreparedStatement testStatement = conn.prepareStatement(queryString);
		rs= testStatement.executeQuery();
		results = getEntitiesFromResultSet(rs);
		return results;
	}
	/**
	 * Creates an arraylist of linked hashmaps
	 * @param resultSet
	 * @return
	 * @throws SQLException
	 */
	private List<LinkedHashMap<String, Object>> getEntitiesFromResultSet(ResultSet resultSet) throws SQLException {
        ArrayList<LinkedHashMap<String, Object>> entities = new ArrayList<>();
        while (resultSet.next()) {
            entities.add(getEntityFromResultSet(resultSet));
        }
        return entities;
    }
   /**
    * Creates a map representing a single tuple of the result set. 
    * @param resultSet
    * @return
    * @throws SQLException
    */
    private LinkedHashMap<String, Object> getEntityFromResultSet(ResultSet resultSet) throws SQLException {
        ResultSetMetaData metaData = resultSet.getMetaData();
        int columnCount = metaData.getColumnCount();
        LinkedHashMap<String, Object> resultsMap = new LinkedHashMap<>();
        for (int i = 1; i <= columnCount; ++i) {
            String columnName = metaData.getColumnName(i).toLowerCase();
            columnName = columnName.replace("-", " ");
            Object object = resultSet.getObject(i);
            if(object instanceof String){
            	object = ((String)object).trim();
            }
            resultsMap.put(columnName, object);
        }
        return resultsMap;
    }

    /**
     * Converts an arraylist into a JSON string.
     * @param entities
     * @return
     */
    public static String generateJSON(List<LinkedHashMap<String,Object>> entities){
    	Gson gson = new Gson();
    	return gson.toJson(entities);
    }
}