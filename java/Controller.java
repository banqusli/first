package uebung;

import java.awt.event.*;
import javax.swing.*;

public class Controller implements ActionListener {

	static final String add = "Add";
	static final String edit = "Edit";
	static final String delete = "Delete";
	static final String save = "Save";
	static final String abort = "Abort";

	DefaultListModel<Student> model;
	MasterView view;

	public void initialise(DefaultListModel<Student> dlm, MasterView mv) {
		this.model = dlm;
		this.view = mv;
	}

	@Override
	public void actionPerformed(ActionEvent e) {

		if (e.getActionCommand().equals(Controller.add)) {

			Student student1 = new Student();
			student1.initialise();
			this.model.addElement(student1);
			//this.view.getComponent(this.model.getSize() - 1);
			
			view.list.setSelectedIndex(this.model.getSize() -1);
			view.details.open(student1);

		} else if (e.getActionCommand().equals(Controller.edit)) {
			if (view.list.getSelectedIndex() < 0) {
				System.out.println("Index kleiner 0");
			} else {
				int i = view.list.getSelectedIndex();
				Student editStudent = this.model.get(i);

				view.details.open(editStudent);
			}
		} else if (e.getActionCommand().equals(Controller.delete)) {

			if (view.list.getSelectedIndex() < 0) {
				System.out.println("Index kleiner 0");
			} else {
				int i = view.list.getSelectedIndex();
				this.model.remove(i);

			}
		} else if (e.getActionCommand().equals(Controller.abort)) {

			view.details.abort();

		} else if (e.getActionCommand().equals(Controller.save)) {

			Student student = this.model.get(view.list.getSelectedIndex());
			if (view.list.getSelectedIndex() >= 0) {

				view.details.save(student);
				view.repaint();
			}	
			
			else {
				System.out.println("Kein Student ausgewählt");
			}
		} else {
			System.out.println("Fehler");
		}

	}

}
