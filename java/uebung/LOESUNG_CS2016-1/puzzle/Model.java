package puzzle;

import java.util.*;
import javax.swing.*;

public class Model {

	static final int SIZE = 16;
	Icon[] images;
	int[] position;

	public void sort() {
		for (int j = 0; j < Model.SIZE; j++) {
			this.position[j] = j;
		}
	}

	public boolean exists(int i) {
		boolean b = false;
		for (int j = 0; j < Model.SIZE; j++) {

			if (this.position[j] == i) {
				b = true;
				break;
			}
		}
		return b;
	}

	public int getRandomPosition() {
		int p = 0;
		Random r = new Random();
		while (true) {
			p = r.nextInt(Model.SIZE);
			if (exists(p) == false) {
				break;
			}
		}
		return p;
	}

	public void randomise() {
		for (int j = 0; j < Model.SIZE; j++) {
			this.position[j] = -1;
		}
		for (int j = 0; j < Model.SIZE; j++) {
			this.position[j] = getRandomPosition();
		}
	}

	public void initialise() {
		this.position = new int[Model.SIZE];
		this.images = new Icon[Model.SIZE];
		for (int j = 0; j < Model.SIZE; j++) {
			this.images[j] = new ImageIcon("image/" + j + ".png");
		}
		randomise();
	}
}
