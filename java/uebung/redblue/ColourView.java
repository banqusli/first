package redblue;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class ColourView extends View {

    JButton red;
    JButton blue;
    Model model;
    
    public void initialise(Controller c, Model m) {
	
	this.red = new JButton("Schalte auf Rot");
	this.blue = new JButton("Schalte auf Blue");
	this.model = m;
	
	red.setActionCommand("red");
	blue.setActionCommand("blue");

	red.addActionListener(c);
	blue.addActionListener(c);
	
	add(red, BorderLayout.WEST);
	add(blue, BorderLayout.CENTER);
	
	setTitle("Colour View");
	setLocation(100, 100);
	setSize(600, 400);
	setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	setVisible(true);
	
	update();
    }
    
    public void update() {
	
	this.red.setBackground(this.model.colour);
	this.blue.setBackground(this.model.colour);
    }
}
