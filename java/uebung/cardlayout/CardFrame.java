package cardlayout;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class CardFrame extends JFrame implements ItemListener {

    public static final String CARD_1 = "card_1";
    public static final String CARD_2 = "card_2";
    public static final String CARD_3 = "card_3";
    
    CardLayout cardLayout;
    JPanel panel;

    public CardFrame() {

	JComboBox cb = new JComboBox();
	this.panel = new JPanel();
	JPanel p1 = new JPanel();
	JPanel p2 = new JPanel();
	JPanel p3 = new JPanel();
	this.cardLayout = new CardLayout();

	cb.addItem(CardFrame.CARD_1);
	cb.addItem(CardFrame.CARD_2);
	cb.addItem(CardFrame.CARD_3);
	cb.addItemListener(this);
	
	p1.add(new JButton("Test 1"));
	p1.add(new JButton("Test 2"));
	p1.add(new JButton("Test 3"));
	
	p2.add(new JCheckBox("Test 1", true));
	p2.add(new JCheckBox("Test 2", false));
	
	p3.add(new JColorChooser());

	this.panel.setLayout(this.cardLayout);
	this.panel.add(CardFrame.CARD_1, p1);
	this.panel.add(CardFrame.CARD_2, p2);
	this.panel.add(CardFrame.CARD_3, p3);

	add(this.panel, BorderLayout.CENTER);
	add(cb, BorderLayout.SOUTH);
	
	pack();
	setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	setVisible(true);
    }

    public void itemStateChanged(ItemEvent e) {
	
	this.cardLayout.show(this.panel, (String) e.getItem());
    }

    public static void main(String[] args) {

	new CardFrame();
    }
}
