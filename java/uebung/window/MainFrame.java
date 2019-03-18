package window;

import javax.swing.*;

public class MainFrame extends JFrame {
    
    JButton button;

    public void initialise() {
	
	this.button = new JButton();
	
	button.setText("Testknopf");

	add(button);
	setTitle("Hallo Welt!");
	// setSize(800, 600);
	pack();
	setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	setVisible(true);
    }
}
