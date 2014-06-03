package osmgjs;

import java.io.Serializable;

public class personBean implements Serializable {
	private String email;
	private String location;
	
	public personBean(){
		email = new String();
		location = new String();
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String username) {
		this.email = username;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
}
