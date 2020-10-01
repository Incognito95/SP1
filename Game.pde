import java.util.Random;

class Game1
{
  private Random rnd;
  private int width;
  private int height;
  private int[][] board;
  private Keys keys;
  private int playerLife;
  private int playerLife2;
  private Dot player;
  private Dot[] enemies;
  private Dot player1;
  private Dot[] food;
  private int maxFood = 100;


  Game1(int width, int height, int numberOfEnemies, int numberOfFood)
  {
    if (width < 10 || height < 10)
    {
      throw new IllegalArgumentException("Width and height must be at least 10");
    }
    if (numberOfEnemies < 0)
    {
      throw new IllegalArgumentException("Number of enemies must be positive");
    } 
    this.rnd = new Random();
    this.board = new int[width][height];
    this.width = width;
    this.height = height;
    keys = new Keys();
    player = new Dot(0, 0, width-1, height-1);
    player1 = new Dot(0, 24, width-1, height-1); 
    enemies = new Dot[numberOfEnemies];
    food = new Dot[numberOfFood];
    for (int i = 0; i < numberOfEnemies; ++i)
    {
      enemies[i] = new Dot(width-1, height-1, width-1, height-1);
    }

    CreateFood(numberOfFood);

    this.playerLife = 100;
    this.playerLife2 = 100;
  }


  public void update()
  {
    updatePlayer();
    updatePlayer1();
    updateEnemies();
    updateEnemies1();
    checkForCollisions();
    checkForCollisions1();
    clearBoard();
    populateBoard();
    GettingHP();
    GettingHP1();
    updateFood();
    updateFood1();
    Losegame();
  }


  public int[][] getBoard()
  {
    //ToDo: Defensive copy?
    return board;
  }

  public int getWidth()
  {
    return width;
  }

  public int getHeight()
  {
    return height;
  }

  public int getPlayerLife()
  {
    return playerLife;
  }
  public int getPlayerLife2()
  {
    return playerLife2;
  }

  public void onKeyPressed(char ch)
  {
    keys.onKeyPressed(ch);
  }

  public void onKeyReleased(char ch)
  {
    keys.onKeyReleased(ch);
  }

  public void onKeyPressed1()
  {
    keys.onKeyPressed1();
  }

  public void onKeyReleased1()
  {
    keys.onKeyReleased1();
  }

  private void clearBoard()
  {
    for (int y = 0; y < height; ++y)
    {
      for (int x = 0; x < width; ++x)
      {
        board[x][y]=0;
      }
    }
  }

  private void updatePlayer()
  {
    //Update player
    if (keys.wDown() && !keys.sDown())
    {
      player.moveUp();
    }
    if (keys.aDown() && !keys.dDown())
    {
      player.moveLeft();
    }
    if (keys.sDown() && !keys.wDown())
    {
      player.moveDown();
    }
    if (keys.dDown() && !keys.aDown())
    {
      player.moveRight();
    }
  }

  private void updatePlayer1()
  {
    //Update player
    if (keys.UPDown() && !keys.DOWNDown())
    {
      player1.moveUp();
    }
    if (keys.LEFTDown() && !keys.RIGHTDown())
    {
      player1.moveLeft();
    }
    if (keys.DOWNDown() && !keys.UPDown())
    {
      player1.moveDown();
    }
    if (keys.RIGHTDown() && !keys.LEFTDown())
    {
      player1.moveRight();
    }
  }

  private void updateEnemies()
  {
    for (int i = 0; i < enemies.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if (rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player.getX() - enemies[i].getX();
        int dy = player.getY() - enemies[i].getY();
        if (abs(dx) > abs(dy))
        {
          if (dx > 0)
          {
            //Player is to the right
            enemies[i].moveRight();
          } else
          {
            //Player is to the left
            enemies[i].moveLeft();
          }
        } else if (dy > 0)
        {
          //Player is down;
          enemies[i].moveDown();
        } else
        {//Player is up;
          enemies[i].moveUp();
        }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          enemies[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          enemies[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          enemies[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          enemies[i].moveDown();
        }
      }
    }
  }

  private void updateEnemies1()
  {
    for (int i = 0; i < enemies.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if (rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player1.getX() - enemies[i].getX();
        int dy = player1.getY() - enemies[i].getY();
        if (abs(dx) > abs(dy))
        {
          if (dx > 0)
          {
            //Player is to the right
            enemies[i].moveRight();
          } else
          {
            //Player is to the left
            enemies[i].moveLeft();
          }
        } else if (dy > 0)
        {
          //Player is down;
          enemies[i].moveDown();
        } else
        {//Player is up;
          enemies[i].moveUp();
        }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          enemies[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          enemies[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          enemies[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          enemies[i].moveDown();
        }
      }
    }
  }

  private void updateFood1()
  {
    for (int i = 0; i < food.length-1; i++)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if (rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player1.getX() - food[i].getX();
        int dy = player1.getY() - food[i].getY();
        if (abs(dx) > abs(dy))
        {
          if (dx > 0)
          {
            //Player is to the right
            food[i].moveLeft();
          } else
          {
            //Player is to the left
            food[i].moveRight();
          }
        } else if (dy > 0)
        {
          //Player is down;
          food[i].moveUp();
        } else
        {//Player is up;
          food[i].moveDown();
        }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          food[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          food[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          food[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          food[i].moveDown();
        }
      }
    }
  }


  private void updateFood()
  {
    for (int i = 0; i < food.length-1; i++)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if (rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player.getX() - food[i].getX();
        int dy = player.getY() - food[i].getY();
        if (abs(dx) > abs(dy))
        {
          if (dx > 0)
          {
            //Player is to the right
            food[i].moveLeft();
          } else
          {
            //Player is to the left
            food[i].moveRight();
          }
        } else if (dy > 0)
        {
          //Player is down;
          food[i].moveUp();
        } else
        {//Player is up;
          food[i].moveDown();
        }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          food[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          food[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          food[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          food[i].moveDown();
        }
      }
    }
  }






  private void populateBoard()
  {
    //Insert players
    board[player.getX()][player.getY()] = 1;
    board[player1.getX()][player1.getY()] = 4;
    //Insert enemies
    for (int i = 0; i < enemies.length; ++i)
    {
      board[enemies[i].getX()][enemies[i].getY()] = 2;
    }
    //Insert food
    for (int i = 0; i < food.length-1; i++)
    {
      board[food[i].getX()][food[i].getY()] = 3;
    }
  }

  private void checkForCollisions()
  {
    //Check enemy collisions
    for (int i = 0; i < enemies.length; ++i)
    {
      if (enemies[i].getX() == player.getX() && enemies[i].getY() == player.getY())
      {
        //We have a collision
        --playerLife;
      }
    }
  }

  private void checkForCollisions1()
  {
    //Check enemy collisions
    for (int i = 0; i < enemies.length; ++i)
    {
      if (enemies[i].getX() == player1.getX() && enemies[i].getY() == player1.getY())
      {
        //We have a collision
        --playerLife2;
      }
    }
  }

  private void GettingHP()
  {
    for (int i = 0; i < food.length-1; i++)
    {
      if (food[i].getX() == player.getX() && food[i].getY() == player.getY())
      {
        if (playerLife >= maxFood) {
          playerLife = maxFood;
        } else if (playerLife < maxFood) {
          ++playerLife;
          removeFood(food[i]);
        }
      }
    }
  }

  private void GettingHP1()
  {
    for (int i = 0; i < food.length-1; i++)
    {
      if (food[i].getX() == player1.getX() && food[i].getY() == player1.getY())
      {
        if (playerLife2 >= maxFood) {
          playerLife2 = maxFood;
        } else if (playerLife2 < maxFood) {
          ++playerLife2;
          removeFood(food[i]);
        }
      }
    }
  }

  private void Losegame() 
  {
    if (playerLife <= 0)
    {
      board[player.getX()][player.getY()] = 0; //Making player turn into black
      playerLife = 0;
      textSize(40);
      text("Orange has won!", 400, 500);
      noLoop();
    } else if (playerLife2 <= 0) {
      board[player1.getX()][player1.getY()] = 0;
      playerLife2 = 0;
      textSize(40);
      text("Blue has won!", 400, 500);
      noLoop();
    }
  }

  private void CreateFood(int amountOfFood) {        //Randomizing food placement
    for (int i = 0; i < amountOfFood; i++)
    {
      int rnd1 = rnd.nextInt(24);
      int rnd2 = rnd.nextInt(24);
      food[i] = new Dot(rnd1, rnd2, width-1, height-1);
    }
  }

  private void removeFood(Dot foodToRemove)
  {
    for (int i = 0; i < food.length-1; i++)
    {
      if (food[i] == foodToRemove) {
        int rnd1 = rnd.nextInt(24);
        int rnd2 = rnd.nextInt(24);
        Dot newFood = new Dot(rnd1, rnd2, width-1, height-1);
        food[i] = newFood;
      }
    }
  }
}
