package event;

import java.awt.*;

public class View extends Frame {

    public void paint(Graphics g) {

        super.paint(g);
        
        g.setFont(new Font("Serif", Font.BOLD, 32));
        g.drawString("Zum Beenden ESC drücken!", 10, 50);
    }
}
