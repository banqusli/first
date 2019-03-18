package it2010_imageviewer;

public class Launcher {

    public static void main(String[] args) {

	Controller controller = new Controller();
	MainFrame mf = new MainFrame();
	Model model = new Model();
		
	model.initialise();
	mf.initialise(controller, model);
	controller.initialise(mf, model);
    }
}
