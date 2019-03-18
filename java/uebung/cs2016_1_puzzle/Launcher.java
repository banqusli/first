package cs2016_1_puzzle;

public class Launcher {

    public static void main(String[] args) {

	Model m = new Model();
	View v = new View();
	Controller c = new Controller();
		
	m.initialise();
	c.initialise(m,v);
	v.initialise(m, c);
	
	
    }
}
