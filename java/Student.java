package uebung;

public class Student {

	String lastname;
	String firstname;
	String dayOfBirth;
	String skills;

	public void initialise() {
		this.lastname = "Mustermann";
		this.firstname = "Max";
		this.dayOfBirth = "2000-01-01";
		this.skills = "empty";
	}
	
	@Override
	public String toString() {
		
		return this.firstname + " " + this.lastname;
	}
}
