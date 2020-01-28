#include <iostream>
#include <ctime>
#include <conio.h>
#include <Windows.h>
using namespace std;

enum Direction { Top = 1, Down, Right, Left};
struct Map { int Width, Height, Fruitx, Fruity; };
struct Snake { int Headx, Heady, Tail, Tailx[50], Taily[50]; Direction Dir; };
struct Player { int Score; bool Lose; };

Map game_map; 
Snake game_snake;
Player player;

void right_shift( int arr[], int size) {
	for (int i = size -2; i >= 0 ; i--)
	{
		arr[i + 1] = arr[i];
	}
}

void generate_fruit() {
	srand(time(NULL)); // related with time
	game_map.Fruitx = rand() % (game_map.Width - 2) + 1; // 1 to 38
	game_map.Fruity = rand() % (game_map.Width - 2) + 1; // 1 to 38
}

void setup() {
	game_map.Width = 40;
	game_map.Height = 20;

	generate_fruit();

	game_snake.Headx = game_map.Width / 2;
	game_snake.Heady = game_map.Height / 2;

	player.Score = 0;
	player.Lose = false;
}

void draw_map() {
	system("cls"); // clear screen
	for (int i = 0; i <  game_map.Height; i++){
		for (int j = 0; j < game_map.Width; j++) {
			if (i == 0 || i == game_map.Height - 1) cout << "*";  // i=0 if it was in the first line -- i == map.height if it was in the last line
			else if (j == 0 || j == game_map.Width - 1) cout << "*";
			else if (i == game_snake.Heady && j == game_snake.Headx) cout << "O";
			else if (i == game_map.Fruity && j == game_map.Fruitx) cout << "$";
			else {
				cout << " ";
				bool printed = false;
				for (int z = 0; z < game_snake.Tail; z++)
				{
					if (game_snake.Tailx[z] == j && game_snake.Taily[z] == i)
					{
						cout << "o";
						printed = true;
						break;
					}
				}
			}
		}
		cout << endl;
	}
	cout << "Player Score :" << player.Score << endl;
}

void input() {
	if (_kbhit()) {
		char key = _getch();

		switch (key)
		{
		case 'w': game_snake.Dir = Top;
			break;
		case 's': game_snake.Dir = Down;
			break;
		case 'd': game_snake.Dir = Right;
			break;
		case 'a': game_snake.Dir = Left;
			break;
		case 'x': exit(0);
			break;
		default:
			break;
		}
	}
}

void move() {
	right_shift(game_snake.Tailx, 50);
	right_shift(game_snake.Taily, 50);

	game_snake.Tailx[0] = game_snake.Headx;
	game_snake.Taily[0] = game_snake.Heady;

	switch (game_snake.Dir)
	{
	case Top : game_snake.Heady--; // when the snake move to top, y will decrease
		break;
	case Down: game_snake.Heady++; // when the snake move to down, y will increase
		break;
	case Right: game_snake.Headx++; // when the snake move to down, x will increase
		break;
	case Left: game_snake.Headx--; // when the snake move to down, x will decrease
		break;
	default:
		break;
	}

	if (game_snake.Heady >= game_map.Height || game_snake.Heady <= 0 || game_snake.Headx >= game_map.Width || game_snake.Headx <= 0) {
		player.Lose = true;
	}

	if (game_snake.Headx == game_map.Fruitx && game_snake.Heady == game_map.Fruity){
		generate_fruit();
		player.Score += 1;
		game_snake.Tail++;
	}
}

int main()
{
	setup();
	while (!player.Lose)
	{
		draw_map();
		input();
		move();
		Sleep(100);
	}
	system("pause");
	return 0;
}