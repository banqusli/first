package cs2016_1_puzzle;

import java.util.*;
import javax.swing.*;

public class Model {

    static final int SIZE = 16;

    Icon[] images;
    int[] position;

    public void sort() {

	for (int i = 0; i < Model.SIZE; i++) {

	    position[i] = i;
	}
    }

    public boolean exists(int r) {

	boolean b = false;

	for (int i = 0; i < Model.SIZE; i++) {

	    if (position[i] == r) {

		b = true;
		break;
	    }
	}

	return b;
    }

    public int getRandomPosition() {

	int pos = 0;
	Random r = new Random();

	while (true) {

	    pos = r.nextInt(Model.SIZE);

	    if (exists(pos) == false) {

		break;
	    }
	}

	return pos;
    }

    public void randomise() {

	for (int i = 0; i < Model.SIZE; i++) {

	    position[i] = -1;
	}

	for (int j = 0; j < Model.SIZE; j++) {

	    position[j] = getRandomPosition();
	}
    }

    public void initialise() {

	this.position = new int[Model.SIZE];
	this.images = new ImageIcon[Model.SIZE];

	for (int i = 0; i < Model.SIZE; i++) {

	    this.images[i] = new ImageIcon("cs2016_1_puzzle/image/" + i + ".png");
	}

	randomise();
    }
}
