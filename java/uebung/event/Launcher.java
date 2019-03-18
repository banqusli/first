package event;

import java.awt.*;

public class Launcher {

    public static void main(String[] args) {
	
	View v = new View();
	Controller c = new Controller();
	
	v.setBackground(Color.LIGHT_GRAY);
	v.setTitle("Main Window");
	v.setSize(800, 600);
	v.setLocation(200, 100);
	v.addKeyListener(c);
	v.addWindowListener(c);
	v.setVisible(true);
    }
}
