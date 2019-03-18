package event;

import java.awt.event.*;

public class Controller extends WindowAdapter implements KeyListener {

    public void windowClosing(WindowEvent e) {

        super.windowClosing(e);
        
        System.exit(0);
    }
    
    public void keyPressed(KeyEvent e) {
	
	if (e.getKeyChar() == KeyEvent.VK_ESCAPE) {

	    System.exit(0);
	}
    }

    public void keyReleased(KeyEvent e) {
    }

    public void keyTyped(KeyEvent e) {
    }
}
