package uebung;

import java.awt.GridLayout;
import java.util.ResourceBundle;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class Details extends JDialog {

	JTextField lastname, firstname, dayOfBirth, skills;

	public void initialise(Controller controller, ResourceBundle bundle) {
		this.lastname = new JTextField();
		this.firstname = new JTextField();
		this.dayOfBirth = new JTextField();
		this.skills = new JTextField();

		JLabel llastname = new JLabel("Last name: ");
		JLabel lfirstname = new JLabel("First name: ");
		JLabel ldayOfBirth = new JLabel("Day of Birth: ");
		JLabel lskills = new JLabel("Skills: ");

		JButton bSave = new JButton("Save");
		JButton bAbort = new JButton("Abort");
		
		bSave.addActionListener(controller);
		bAbort.addActionListener(controller);
		bSave.setActionCommand(controller.save);
		bAbort.setActionCommand(controller.abort);

		GridLayout gLayout = new GridLayout(5, 2);
		this.setLayout(gLayout);
		
		this.add(lastname);
		this.add(llastname);
		this.add(firstname);
		this.add(lfirstname);
		this.add(dayOfBirth);
		this.add(ldayOfBirth);
		this.add(skills);
		this.add(lskills);
		this.add(bSave);
		this.add(bAbort);
		
		this.setTitle("Dialog");
		this.pack();
		this.setDefaultCloseOperation(JDialog.HIDE_ON_CLOSE);
		this.setModal(true);
		
		
	}
	
	public void open(Student student) {
		
		this.lastname.setText(student.lastname);
		this.firstname.setText(student.firstname);
		this.dayOfBirth.setText(student.dayOfBirth);
		this.skills.setText(student.skills);
		this.setVisible(true);
		
	}
	public void save(Student student) {
		
		student.lastname = this.lastname.getText();
		student.firstname = this.firstname.getText();
		student.dayOfBirth = this.dayOfBirth.getText();
		student.skills =this.skills.getText();
		
		this.setVisible(false);
		
	}
	public void abort() {
		this.setVisible(false);
	}
}
