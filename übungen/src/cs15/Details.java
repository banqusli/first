package cs15;

import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;

public class Details extends JDialog {
	
	JTextField lastName, firstName, dayOfBirth, skills;
		
	public void initialise(Controller c) {
		
		JLabel lastNamelabel = new JLabel("lastName");
		lastName = new JTextField();
		JLabel firstNamelabel = new JLabel("firstName");
		firstName = new JTextField();
		JLabel dayOfBirthlabel = new JLabel("dayOfBirth");
		dayOfBirth = new JTextField();
		JLabel skillslabel = new JLabel("skills");
		skills = new JTextField();
		
		JButton save = new JButton("Save");
		JButton abort = new JButton("About");
		
		
		setLayout(new GridLayout());
		add(lastNamelabel);
		add(lastName);
		add(firstNamelabel);
		add(firstName);
		add(dayOfBirthlabel);
		add(dayOfBirth);
		add(skillslabel);
		add(skills);
		add(save);
		add(abort);
		
		save.addActionListener(c);
		abort.addActionListener(c);
		save.setActionCommand("save");
		abort.setActionCommand("abort");
		
		setTitle("Student List");
		setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		pack();
		setVisible(true);
	}
	
	public void open(Student student) {
		
		this.firstName.setText(student.firstName);
		this.lastName.setText(student.lastName);
		this.dayOfBirth.setText(student.dayOfBirth);
		this.skills.setText(student.skills);
		setVisible(true);
	}
	
	public void save() {
		

	}

	
}
