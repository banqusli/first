package uebung;

import java.io.File;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.swing.DefaultListModel;

public class Launcher {

	public static void main(String[] args) {

		MasterView mv = new MasterView();
		DefaultListModel<Student> dlm = new DefaultListModel<>();
		Controller c = new Controller();
		Details details = new Details();
		Locale locale = new Locale(args[0], args[1]);

		String path = "uebung" + File.separator + "gui_ressources" + File.separator + "test";
		ResourceBundle bundle = ResourceBundle.getBundle(path, locale);

		mv.initialise(dlm, c, bundle);
		c.initialise(dlm, mv);
		details.initialise(c, bundle);

	}

}
