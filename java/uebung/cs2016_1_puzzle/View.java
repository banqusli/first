package cs2016_1_puzzle;

import java.awt.*;
import javax.swing.*;

public class View extends JFrame {

    Model model;
    JLabel[] labels;

    public void initialise(Model m, Controller c) {

	this.model = m;
	this.labels = new JLabel[Model.SIZE];
	JPanel p = new JPanel();
	GridLayout g = new GridLayout(4, 4);
	JLabel l = null;

	JToolBar toolBar = new JToolBar();
	JButton b1 = new JButton("Exit");
	JButton b2 = new JButton("Sort");
	JButton b3 = new JButton("Randomise");

	b1.addActionListener(c.actionController);
	b2.addActionListener(c.actionController);
	b3.addActionListener(c.actionController);

	toolBar.add(b1);
	toolBar.addSeparator();
	toolBar.add(b2);
	toolBar.addSeparator();
	toolBar.add(b3);
	toolBar.addSeparator();

	b1.setActionCommand(ActionController.EXIT);
	b2.setActionCommand(ActionController.SORT);
	b3.setActionCommand(ActionController.RANDOMISE);

	b1.setToolTipText("Exit");
	b2.setToolTipText("Sort");
	b3.setToolTipText("Randomise");

	b1.setRolloverEnabled(true);
	b2.setRolloverEnabled(true);
	b3.setRolloverEnabled(true);

	add(toolBar, BorderLayout.NORTH);

	p.setLayout(g);

	for (int i = 0; i < Model.SIZE; i++) {

	    l = new JLabel();
	    l.addMouseListener(c.mouseController);
	    this.labels[i] = l;
	    int pos = this.model.position[i];
	    l.setIcon(this.model.images[pos]);

	    p.add(l);
	}

	add(p, BorderLayout.CENTER);

	setTitle("Puzzle");
	pack();
	setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	setVisible(true);
    }

    public void paint(Graphics g) {
        super.paint(g);
        int pos = 0;
	for(int i= 0; i<this.labels.length;i++){
	    pos = this.model.position[i];
	    this.labels[i].setIcon(this.model.images[pos]);
	}
    }
}
