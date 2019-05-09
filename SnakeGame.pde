/* A simple snake game */

import java.util.ArrayList;
import java.util.List;

float scale = 100; // set tile size
Snake snake;
Food food;
color foodCol = color(255,255,0);
PVector posInit;

void setup() 
{
  size(2000,1000); // set screen size
  frameRate(10); // set playSpeed
  background(0);
  
  // Object Initialization
  posInit = new PVector(1,0);
  snake = new Snake(0,0,posInit,scale,255);
  food = new Food(random(0,width),random(0,height),scale, foodCol);
}

void draw() 
{
  background(0);
  food.drawing();
  snake.changeDir();
  snake.move();
  snake.drawing(); 
  snake.eatFood(food);
  snake.cannibal(food);
}

void keyPressed ()
{
  if(key == 'r' || key == 'R') {
    snake.reload(food);
  }
}
