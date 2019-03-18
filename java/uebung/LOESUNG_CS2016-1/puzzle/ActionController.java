package puzzle;

import java.awt.event.*;

public class ActionController implements ActionListener {

    static final String EXIT = "exit";
    static final String SORT = "sort";
    static final String RANDOMISE = "randomise";
    
    Model model;
    View view;

    public void actionPerformed(ActionEvent e) {
	
	String c = e.getActionCommand();
	
	if (c.equals(ActionController.EXIT)) {
	    
	    System.exit(0);

	} else if (c.equals(ActionController.SORT)) {

	    this.model.sort();
	    
	} else if (c.equals(ActionController.RANDOMISE)) {
	    
	    this.model.randomise();

	} else {

	    System.out.println("Error: Unknown command.");
	}

	this.view.repaint();
    }
}
