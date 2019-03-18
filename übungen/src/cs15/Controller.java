package cs15;

import java.awt.event.*;
import javax.swing.*;

public class Controller implements ActionListener {

	DefaultListModel model;
	MasterView view = new MasterView();
	
	String save;
	String abort;
	
	public void actionPerformed(ActionEvent e) {
		
		String Add = "Add";
		String Edit = "Edit";
		String Delete = "Delete";
		
		if (e.getSource()== view.Add) {
			
			Student student = new Student();
			model.addElement(student);
			view.list.add(view, this.model.getSize() - 1);
			
		}else if(e.getSource()== view.Edit){
			
		}else if(e.getSource()== view.Delete){
			
		}else{
			
			System.out.println("Error");
		}
	}

}
