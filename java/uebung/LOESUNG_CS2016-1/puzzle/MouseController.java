package puzzle;

import java.awt.event.*;
import javax.swing.*;

public class MouseController extends MouseAdapter {

    JLabel label;
    
    public void mousePressed(MouseEvent e) {
	
	super.mousePressed(e);
	
	if (e.getButton() == MouseEvent.BUTTON1) {
	    
            this.label = (JLabel) e.getSource();
	    
	} else {
	    
            if (this.label != null) {
        	
                JLabel l = (JLabel) e.getSource();
                Icon d = l.getIcon();
                Icon s = this.label.getIcon();
    
        	l.setIcon(s);
        	this.label.setIcon(d);
        	
            } else {
        	
        	System.out.println("Error: The source label's icon is null.");
            }
	}
    }
}
