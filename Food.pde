// Snake eats food object to grow

public class Food 
{
  float x,y;
  float scl;
  color col;
  
  Food (float xInit, float yInit, float scale, color c) 
  {
    scl = scale;
    x = xInit -xInit%scl;
    y = yInit - yInit%scl;
    col = c;
  }

// Draws the Food object
void drawing()
  {
    noStroke();
    fill(col);
    rectMode(CORNER);
    rect(x,y,scl,scl);
  }

// creates a new Food Object with a random position
void createNew() 
  {
    float ran = random(0,width);
    x = ran -ran%scl;
    ran = random(0,height);
    y = ran - ran%scl;
    
    x = constrain(x, 0, width - scl);
    y = constrain(y, 0, height - scl);
  }
  
}
