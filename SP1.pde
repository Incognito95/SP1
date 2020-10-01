/**
 * Array 2D. 
 * 
 * Demonstrates the syntax for creating a two-dimensional (2D) array.
 * Values in a 2D array are accessed through two index values.  
 * 2D arrays are useful for storing images. In this example, each dot 
 * is colored in relation to its distance from the center of the image. 
 */
 
import java.util.Random;

Game1 game = new Game1(25, 25, 5, 10);
PFont font;

public void settings() {
  size(1001, 1001);
}

void setup()
{
  frameRate(20);
  font = createFont("Arial", 16, true);
  textFont(font, 16);
}

void keyReleased()
{
  game.onKeyReleased(key);
  game.onKeyReleased1();
}

void keyPressed()
{
  game.onKeyPressed(key);
  game.onKeyPressed1();
}

void draw()
{
  game.update();
  background(0); //Black
  // This embedded loop skips over values in the arrays based on
  // the spacer variable, so there are more values in the array
  // than are drawn here. Change the value of the spacer variable
  // to change the density of the points
  int[][] board = game.getBoard();
  for (int y = 0; y < game.getHeight(); y++)
  {
    for (int x = 0; x < game.getWidth(); x++)
    {
      if(board[x][y] == 0)    //board grids
      {
        fill(0,0,0);
      }
      else if(board[x][y] == 1)  //players
      {
        fill(0,0,255);
      }
      else if(board[x][y] == 2)  //enemies
      {
        fill(255,0,0);
      }
      else if(board[x][y] == 3)  //Food
      {
        fill(0,255,0);
      }
      else if(board[x][y] == 4)  //player2
        {
        fill(255,130,0);
        }
      stroke(100,100,100);
      rect(x*40, y*40, 40, 40);
    }
  }
  fill(255);
  text("Blue Lifes: "+game.getPlayerLife(), 25,25);
  fill(255);
  text("Orange Lifes: "+game.getPlayerLife2(), 850,25);
  game.Losegame();
}