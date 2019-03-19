package uebung;

import java.awt.BorderLayout;
import java.util.ResourceBundle;

import javax.swing.*;

public class MasterView extends JFrame{

	JList<Student> list;
	JScrollPane scrollPane;
	JPanel panel;
	Details details;
	
	public void initialise(DefaultListModel<Student> dlm, Controller controller, ResourceBundle bundle){
		
		this.panel = new JPanel();
		this.list = new JList<>();
		
		this.details = new Details();
		details.initialise(controller, bundle);
		
		this.scrollPane = new JScrollPane(this.list);
		this.add(this.scrollPane, BorderLayout.CENTER);
		
		this.list.setModel(dlm);
		
		initialisePanel(this.panel, controller, bundle);
		
		this.setTitle("Titel");
		this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
		this.setSize(800, 600);
		this.setVisible(true);
	}

	public void initialisePanel(JPanel panel, Controller controller, ResourceBundle bundle){
		
		JButton add = new JButton(bundle.getString("add"));
		JButton edit = new JButton(bundle.getString("edit"));
		JButton delete = new JButton(bundle.getString("delete"));
		
		panel.add(add);
		panel.add(edit);
		panel.add(delete);
		
		add.setActionCommand(Controller.add);
		edit.setActionCommand(Controller.edit);
		delete.setActionCommand(Controller.delete);
		
		add.addActionListener(controller);
		edit.addActionListener(controller);
		delete.addActionListener(controller);
		
		this.add(panel, BorderLayout.SOUTH);
	}
}
