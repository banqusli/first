package cs2017_1_unitconverter;

public class Launcher {

    public static void main(String[] args) {

	View view = new View();
	Model model = new Model();
	Controller controller = new Controller();
	
	model.initialise(0.0, "m");
	view.initialise(model, controller);
	controller.initialise(model, view);
	
    }
}
