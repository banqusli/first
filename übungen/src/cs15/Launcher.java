package cs15;

import javax.swing.*;

public class Launcher {

	static MasterView v = new MasterView(); 
	
	public static void main(String[] args) {
		DefaultListModel defaultlist = new DefaultListModel();
		Details details = new Details();
		Controller c = new Controller();
		details.initialise(c);
		v.initialise(defaultlist);
	}

}
