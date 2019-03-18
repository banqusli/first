package awt_window;

import java.awt.*;

public class Launcher {

    public static void main(String[] args) {

	MainFrame f = new MainFrame();

	f.setTitle("Testfenster");
	f.setBackground(Color.LIGHT_GRAY);
	f.setSize(800, 600);
	f.setVisible(true);
    }
}
