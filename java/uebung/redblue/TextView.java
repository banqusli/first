package redblue;

import javax.swing.*;

public class TextView extends View {

    Model model;
    JLabel label;
    
    public void initialise(Model m) {
	
	this.model = m;
	this.label = new JLabel();

	add(this.label);
	
	setTitle("Text View");
	setLocation(800, 100);
	setSize(400, 300);
	setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	setVisible(true);
	
	update();
    }
    
    public void update() {
	
	// this.label.setBackground(this.model.colour);
	this.label.setText(this.model.colour.toString());
    }
}
