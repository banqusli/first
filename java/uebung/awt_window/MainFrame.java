package awt_window;

import java.awt.*;

public class MainFrame extends Frame {

    int count;
    
    @Override
    public void paint(Graphics g) {

        super.paint(g);
        
        g.drawRect(50, 80, 300, 200);
        g.setColor(Color.CYAN);
        g.drawRect(80, 40, 300, 200);
        g.fillRoundRect(100, 100, 300, 200, 40, 20);
        
        (this.count)++;
        System.out.println(this.count);
        g.drawString("Count: " + this.count, 50, 100);
        
        if (this.count >= 5) {
            
            setBackground(Color.YELLOW);
        }
    }
}
