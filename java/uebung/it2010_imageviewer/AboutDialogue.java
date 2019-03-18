package it2010_imageviewer;

import java.awt.*;
import javax.swing.*;

public class AboutDialogue extends JDialog {

    public AboutDialogue() {
	
	JLabel label1 = new JLabel("Programm");
	JLabel label2 = new JLabel("cs17-2");

	// setLayout(new BorderLayout());
	add(label1, BorderLayout.CENTER);
	add(label2, BorderLayout.SOUTH);

	setModal(true);
	setTitle("About");
	setSize(400, 200);
	setLocation(100, 100);
	setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	setVisible(true);
    }
}
