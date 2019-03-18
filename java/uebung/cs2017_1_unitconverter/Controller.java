package cs2017_1_unitconverter;

import java.awt.event.*;

public class Controller implements ActionListener {

    Model model;
    View view;

    public void initialise(Model model, View view) {
	this.model = model;
	this.view = view;
    }

    public void actionPerformed(ActionEvent e) {

	String s = e.getActionCommand();

	this.model.builder.setLength(0);
	String text = this.view.text.getText();
	this.model.builder.append(text);

	if ((s.compareTo("0") >= 0) && (s.compareTo("9") <= 0)) {

	    this.model.builder.append(s);
	    this.view.text.setText(this.model.builder.toString());

	} else if (s.contains(".")) {

	    if (!this.model.builder.toString().contains(".")) {
	
		this.model.builder.append(".");
		this.view.text.setText(this.model.builder.toString());
	    }
	    
	} else if (s.equals("C") == true) {

	    this.model.builder.setLength(0);
	    this.view.text.setText("");
	
	} else if (s.equals("Calculate") == true) {
	
	    this.view.reset();

	    try {

		String s1 = this.model.builder.toString().replaceAll(",", ".");
		double d = Double.parseDouble(s1);
		
		// Variante 1
//		this.model.builder.setLength(0);
//		this.model.builder.append(s1);
		// Variante 2
		// int i = this.model.builder.indexOf(",");
		// this.model.builder.setCharAt(i, '.');
		// String s1 = this.model.builder.toString();
		this.model.calculate(d, this.model.unit);

		this.view.repaint();

	    } catch (NumberFormatException e1) {

		System.out.println("Error");
		this.model.builder.setLength(0);
		this.view.text.setText("");
	    }

	} else if (s.equals("choose")) {

	    this.model.unit = this.view.combo.getSelectedItem().toString();
	    this.view.reset();
	}
    }
}
