package puzzle;

public class Controller {
    
    MouseController mouseController;
    ActionController actionController;

    public void initialise(Model m, View v) {
	
	this.mouseController = new MouseController();
	this.actionController = new ActionController();
	
	this.actionController.model = m;
	this.actionController.view = v;
    }
}
