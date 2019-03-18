package cs2016_1_puzzle;

import java.awt.event.*;
import java.awt.*;
import javax.swing.*;

public class MouseController extends MouseAdapter {

    JLabel label;

    @Override
    public void mousePressed(MouseEvent e) {

	super.mousePressed(e);

	JLabel label2 = null;

	if (e.getButton() == MouseEvent.BUTTON1) {
	    label = (JLabel) e.getSource();
	} else {
	    label2 = (JLabel) e.getSource();
	    if (this.label != null) {

		Icon i1 = this.label.getIcon();
		Icon i2 = label2.getIcon();

		this.label.setIcon(i2);
		label2.setIcon(i1);
	    } else {
		System.out.println("Fehler: Label ist null");
	    }
	}

    }

}
