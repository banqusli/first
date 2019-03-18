package cs15;

import java.awt.*;
import javax.swing.*;

public class MasterView extends JFrame{
	
	JList list = new JList();
	JScrollPane scroll = new JScrollPane(list);
	JPanel panel = new JPanel();
	
	public void initialise(DefaultListModel defaultlist) {
		
		list.setModel(defaultlist);
		add(scroll, BorderLayout.CENTER);
		add(panel,BorderLayout.SOUTH);
		setTitle("Student Adminsation Master View");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setSize(800, 600);
		setVisible(true);
	}
	
	JButton Add = new JButton("Add");
	JButton Edit = new JButton("Edit");
	JButton Delete = new JButton("Delete");
	
	public void initialisePanel() {
		
		panel.add(Add);
		panel.add(Edit);
		panel.add(Delete);

	}
}
