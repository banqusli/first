package it2010_imageviewer;

import java.io.File;
import java.util.Locale;
import java.util.ResourceBundle;

public class Model {
    public ResourceBundle english;
    public ResourceBundle german;
    
    public ResourceBundle language;
    
    public void initialise(){
	
	String path = "it2010_imageviewer"+File.separator+"resources"+File.separator;
	
	Locale localEnglish = new Locale("en", "GB");
	Locale localGerman = new Locale("de", "DE");
	
	this.english = ResourceBundle.getBundle(
		path+"test",
		localEnglish);
	this.german = ResourceBundle.getBundle(
		path+"test", 
		localGerman);
	
	
	this.language = this.english;
	
    }
}
