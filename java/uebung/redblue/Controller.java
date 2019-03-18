package redblue;

import java.awt.*;
import java.awt.event.*;
import java.util.ArrayList;

public class Controller implements ActionListener {
    
    Model model;
    ArrayList<View> views;
    
    public void initialise(Model m, ColourView cv, TextView tv) {
	
	this.model = m;
	this.views = new ArrayList<View>();
	
	this.views.add(cv);
	this.views.add(tv);
    }

    public void actionPerformed(ActionEvent e) {
	
	String c = e.getActionCommand();
	
	if (c.equals("red")) {
	    
	    this.model.colour = Color.RED;
	    
	} else if (c.equals("blue")) {
	    
	    this.model.colour = Color.BLUE;
	    
	} else {
	    
	    System.out.println("Fehler: Kommando unbekannt!");
	}

	for (View v : views) {
	    
	    v.update();
	}
    }
}
