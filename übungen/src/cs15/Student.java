package cs15;

public class Student {
	
	String firstName;
	String lastName;
	String dayOfBirth;
	String skills;
	
	public void initialise() {
		// TODO Auto-generated method stub
		this.firstName = "Max";
		this.lastName = "Mustermann";
		this.dayOfBirth = "2000-01-01";
		this.skills = "empty";
	}
	
	
	public String toString() {
		
		return "" + this.firstName + "" + this.lastName;
	}
}
