package puzzle;

import java.awt.*;
import javax.swing.*;

public class View extends JFrame {

    Model model;
    JLabel[] labels;

    public void initialise(Model m, Controller c) {

	this.model = m;
	this.labels = new JLabel[Model.SIZE];
	JToolBar tb = new JToolBar("Toolbar");
	JButton e = new JButton("Exit");
	JButton s = new JButton("Sort");
	JButton r = new JButton("Randomise");
	JPanel p = new JPanel();
	GridLayout gl = new GridLayout(4, 4);
	JLabel l = null;

	e.setActionCommand(ActionController.EXIT);
	e.addActionListener(c.actionController);
	e.setToolTipText("Exit application");

	s.setActionCommand(ActionController.SORT);
	s.addActionListener(c.actionController);
	s.setToolTipText("Sort puzzle images");

	r.setActionCommand(ActionController.RANDOMISE);
	r.addActionListener(c.actionController);
	r.setToolTipText("Randomise puzzle images");

	tb.add(e);
	tb.addSeparator();
	tb.add(s);
	tb.addSeparator();
	tb.add(r);
	tb.setRollover(true);

	p.setLayout(gl);

	for (int j = 0; j < Model.SIZE; j++) {

	    l = new JLabel();

	    this.labels[j] = l;
	    l.setIcon(this.model.images[this.model.position[j]]);
	    l.addMouseListener(c.mouseController);
	    p.add(l);
	}

	add(tb, BorderLayout.PAGE_START);
	add(p, BorderLayout.CENTER);
        setTitle("Puzzle");
        pack();
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
    }

    public void paint(Graphics e) {

        super.paint(e);

	for (int j = 0; j < Model.SIZE; j++) {
	    
	    this.labels[j].setIcon(this.model.images[this.model.position[j]]);
	}
    }
}
