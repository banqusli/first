package it2010_imageviewer;

import java.awt.event.*;
import javax.swing.*;

public class Controller implements ActionListener {
    Model model;
    MainFrame view;
    
    public void actionPerformed(ActionEvent e) {

	switch (e.getActionCommand()) {

	case "Exit":
	    System.out.println("Exit");
	    break;

	case "Switch to english":
	    this.model.language = this.model.english;
	    this.view.repaint();
	    break;

	case "Switch to german":
	    this.model.language = this.model.german;
	    this.view.repaint();	   
	    break;

	case "About":
	    AboutDialogue d1 = new AboutDialogue();

	    break;

	case "show":
	    JDialog dialog = new JDialog();
	    JButton bSource = (JButton) e.getSource();
	    JLabel imageLabel = new JLabel(bSource.getIcon());

	    dialog.add(imageLabel);
	    dialog.setModal(true);
	    dialog.setTitle("Image Dialog");
	    dialog.setLocation(400, 400);
	    dialog.pack();
	    dialog.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	    dialog.setVisible(true);

	    break;

	default:
	    System.out.println("Command nicht definiert");
	    break;
	}
    }
    
    public void initialise(MainFrame frame, Model model){
	this.model = model;
	this.view = frame;
    }
    
}
