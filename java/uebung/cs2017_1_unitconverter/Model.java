package cs2017_1_unitconverter;

import java.text.DecimalFormat;

public class Model {

    double meter;
    double inch;
    double foot;
    double yard;
    String unit;
    StringBuilder builder;

    public static String format(double number)
    {
	DecimalFormat formater = new DecimalFormat("0.0000");
	return formater.format(number);
    }
    
    public double getMeter() {
	return meter;
    }

    public void setMeter(double meter) {
	this.meter = meter;
	this.inch = 1. / 0.0254 * meter;
	this.foot = 1. / 0.3048 * meter;
	this.yard = 1. / 0.9144 * meter;

    }

    public double getInch() {
	return inch;
    }

    public void setInch(double inch) {
	this.meter = 0.0254 * inch;
	this.inch = inch;
	this.foot = 1. / 12. * inch;
	this.yard = 1. / 36. * inch;

    }

    public double getFoot() {
	return foot;
    }

    public void setFoot(double foot) {
	this.meter = 0.3048 * foot;
	this.inch = 12 * foot;
	this.foot = foot;
	this.yard = 1. / 3. * foot;

    }

    public double getYard() {
	return yard;
    }

    public void setYard(double yard) {
	this.meter = 0.9144 * yard;
	this.inch = 36 * yard;
	this.foot = 3 * yard;
	this.yard = yard;

    }

    public void calculate(double wert, String einheit) {
	// "m", "inch", "foot", "yard"
	if (einheit.equals("m")) {

	    setMeter(wert);
	} else if (einheit.equals("inch")) {

	    setInch(wert);
	} else if (einheit.equals("foot")) {

	    setFoot(wert);
	} else if (einheit.equals("yard")) {

	    setYard(wert);
	}
    }

    void initialise(double anfangswert, String str) {
	setMeter(anfangswert);
	this.unit = str;
	this.builder = new StringBuilder();
	
    }
    
    

}
