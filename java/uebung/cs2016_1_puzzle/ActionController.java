package cs2016_1_puzzle;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ActionController implements ActionListener{
    public static final String EXIT = "EXIT";
    public static final String SORT = "SORT";
    public static final String RANDOMISE = "RANDOMISE";
    
    Model model;
    View view;
    
    public void actionPerformed(ActionEvent e) {
	String command;
	command = e.getActionCommand();
	
	if (command.equals(ActionController.EXIT)) {
	    System.exit(0);
	}
	else if (command.equals(ActionController.SORT)) {
	    this.model.sort();
	    this.view.repaint();
	} 
	else if (command.equals(ActionController.RANDOMISE)) {
	    this.model.randomise();
	    this.view.repaint();
	}
	else {
	    System.out.println("Action Command undefined!");
	}
    }
    
}
