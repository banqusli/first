package redblue;

public class Launcher {

    public static void main(String[] args) {

	Model m = new Model();
	ColourView cv = new ColourView();
	TextView tv = new TextView();
	Controller c = new Controller();
	
	m.initialise();
	cv.initialise(c, m);
	tv.initialise(m);
	c.initialise(m, cv, tv);
    }
}
