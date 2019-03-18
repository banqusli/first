package it2010_imageviewer;

import java.awt.*;
import java.awt.event.*;
import java.io.*;
import javax.swing.*;

public class MainFrame extends JFrame {

    JMenuBar menubar;
    JMenu file;
    JMenu settings;
    JMenu help;
    JMenuItem exit;
    JMenuItem english;
    JMenuItem german;
    JMenuItem about;
    Model model;

    void initialise(Controller controller, Model model) {
	
	this.model = model;
	buildMenu(controller);
	buildPanel(controller);
	setTitle("Gallery");
	setSize(800, 600);
	setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	setJMenuBar(this.menubar);
	setVisible(true);
    }

    public void buildMenu(Controller controller) {

	this.menubar = new JMenuBar();
	this.file = new JMenu();
	this.settings = new JMenu();
	this.help = new JMenu();
	this.exit = new JMenuItem();
	this.english = new JRadioButtonMenuItem();
	this.german = new JRadioButtonMenuItem();
	this.about = new JMenuItem();

	ButtonGroup bg = new ButtonGroup();
	bg.add(this.english);
	bg.add(this.german);
	this.english.setSelected(true);

	
	this.file.setMnemonic('F');
	this.settings.setMnemonic('S');
	this.help.setMnemonic('H');

	this.exit.setMnemonic('X');
	this.english.setMnemonic('E');
	this.german.setMnemonic('G');
	this.about.setMnemonic('A');

	this.english.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_E, Event.CTRL_MASK));
	this.german.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_G, Event.CTRL_MASK));
	this.exit.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_W, Event.CTRL_MASK));
	this.about.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_R, Event.CTRL_MASK));

	this.exit.setActionCommand("Exit");
	this.english.setActionCommand("Switch to english");
	this.german.setActionCommand("Switch to german");
	this.about.setActionCommand("About");

	this.exit.addActionListener(controller);
	this.english.addActionListener(controller);
	this.german.addActionListener(controller);
	this.about.addActionListener(controller);

	this.file.add(this.exit);
	this.settings.add(this.english);
	this.settings.add(this.german);
	this.help.add(this.about);

	this.menubar.add(this.file);
	this.menubar.add(this.settings);
	this.menubar.add(this.help);
    }

    public void buildPanel(Controller c) {

	String s = "it2010_imageviewer" + File.separator + "image";
	File file = new File(s);
	String[] fileList = file.list();
	GridLayout gl = new GridLayout(0, 3, 5, 5);
	ImageIcon im;

	setLayout(gl);

	for (int i = 0; i < fileList.length; i++) {

	    im = new ImageIcon(s + File.separator + fileList[i]);
	    JButton jbutton = new JButton(im);
	    jbutton.setActionCommand("show");
	    jbutton.addActionListener(c);

	    add(jbutton);
	}
    }
    
    public void paint(Graphics g) {
      
        super.paint(g);
        this.file.setText(this.model.language.getString("file"));
	this.settings.setText(this.model.language.getString("settings"));
	this.help.setText(this.model.language.getString("help"));
	this.exit.setText(this.model.language.getString("exit"));
	this.english.setText(this.model.language.getString("english"));
	this.german.setText(this.model.language.getString("german"));
	this.about.setText(this.model.language.getString("about"));
    }
}
