package cs2017_1_unitconverter;

import java.awt.*;
import javax.swing.*;
import javax.swing.border.*;

public class View extends JFrame {

    JComboBox combo;
    JTextField text;
    JTextField jT1;
    JTextField jT2;
    JTextField jT3;
    JTextField jT4;
    private Model model;
    
    public View() {
	super();
    }

    public void initialise(Model m, Controller controller) {
	this.model = m;
	JPanel textinput = new JPanel();
	JPanel button = new JPanel();
	JPanel values = new JPanel();
	JPanel calc = new JPanel();
	String[] a = { "m", "inch", "foot", "yard" };

	this.combo = new JComboBox(a);
	this.text = new JTextField(20);
	// text.setAlignmentX(RIGHT_ALIGNMENT);
	this.text.setHorizontalAlignment(JTextField.RIGHT);
	Font f = new Font("Monospaced", Font.PLAIN, 18);
	this.text.setFont(f);
	this.combo.setActionCommand("choose");
	this.combo.addActionListener(controller);

	FlowLayout flow = new FlowLayout(FlowLayout.CENTER, 25, 10);
	textinput.setLayout(flow);
	textinput.add(this.text);
	textinput.add(this.combo);

	EmptyBorder emt = new EmptyBorder(0, 20, 0, 0);

	button.setBorder(emt);
	GridLayout gl = new GridLayout(4, 3, 5, 5);
	button.setLayout(gl);

	GridLayout gl2 = new GridLayout(4, 2, 10, 5);
	values.setLayout(gl2);

	BorderLayout border = new BorderLayout(10, 10);
	// this.getContentPane().add();
	this.add(textinput, BorderLayout.NORTH);
	this.add(button, BorderLayout.CENTER);
	this.add(values, BorderLayout.EAST);
	this.add(calc, BorderLayout.SOUTH);

	addButton(button, "7", controller);
	addButton(button, "8", controller);
	addButton(button, "9", controller);
	addButton(button, "4", controller);
	addButton(button, "5", controller);
	addButton(button, "6", controller);
	addButton(button, "1", controller);
	addButton(button, "2", controller);
	addButton(button, "3", controller);
	addButton(button, "0", controller);
	addButton(button, ".", controller);
	addButton(button, "C", controller);

	this.jT1 = addField(values, "m");

	this.jT2 = addField(values, "inch");
	this.jT3 = addField(values, "foot");
	this.jT4 = addField(values, "yard");

	addButton(calc, "Calculate", controller);

	this.setTitle("Unit Converter");
	this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	this.pack();
	this.setVisible(true);
    }

    public void addButton(JPanel panel, String string,
	    Controller controller) {
	JButton button = new JButton(string);
	button.addActionListener(controller);
	panel.add(button);
    }

    public JTextField addField(JPanel panel, String string) {
	
	JTextField textField = new JTextField(20);
	JPanel panel2 = new JPanel();
	Font f = new Font("Monospaced", Font.PLAIN, 12);
	textField.setFont(f);
	textField.setHorizontalAlignment(JTextField.RIGHT);
	textField.setEditable(false);

	FlowLayout flow = new FlowLayout(FlowLayout.LEFT, 20, 5);
	panel2.setLayout(flow);
	panel2.add(textField);

	JLabel label = new JLabel(string);
	panel2.add(label);

	panel.add(panel2);

	return textField;
    }

    public void reset() {

	this.jT1.setText("");
	this.jT2.setText("");
	this.jT3.setText("");
	this.jT4.setText("");
    }
    
    @Override
    public void paint(Graphics arg0) {
        
	super.paint(arg0);
        
        this.jT1.setText(Model.format(this.model.meter));
	this.jT2.setText(Model.format(this.model.inch));
	System.out.println(this.jT1.getText());
	this.jT3.setText(Model.format(this.model.foot));
	this.jT4.setText(Model.format(this.model.yard));
    }
}
