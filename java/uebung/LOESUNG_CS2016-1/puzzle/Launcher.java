package puzzle;

public class Launcher {

    public static void main(String[] args) {

	Model m = new Model();
        View v = new View();
        Controller c = new Controller();
        
        c.initialise(m, v);
        m.initialise();
        v.initialise(m, c);
    }
}
