package cs2016_1_puzzle;

public class Controller {
    
    ActionController actionController;
    MouseController mouseController;
    
    public void initialise (Model model, View view) {
	
	this.mouseController = new MouseController();
	this.actionController = new ActionController();
	this.actionController.model=model;
	this.actionController.view=view;
    }
}
