class Snake 
{
  //float x,y;
  PVector pos, dir;
  float scl;
  int len;
  ArrayList<PVector> tail;
  color col;
  
  
  Snake(float xInit, float yInit, PVector dirInit, float scale, color _col) 
  {
    scl=scale;
    xInit = xInit - xInit%scl;
    yInit = yInit - yInit%scl;
    pos = new PVector(xInit,yInit);
    dir=dirInit;
    scl=scale;
    len = 2;
    tail = new ArrayList();
    tail.add(pos);
    tail.add(pos.copy());
    col = _col;
  } 
  
  // Method that updates all the position coordinates
  void move() 
  {
    
    //Position Updates
    pos.x += dir.x*scl;
    pos.y += dir.y*scl;
    
    pos.x = pos.x%width;
    pos.y = pos.y%height;
    
    // move across borders
    if(pos.x < 0) pos.x +=width;
    if(pos.y < 0) pos.y +=height;
    
    //Constrains
    pos.x = constrain(pos.x,0,width-scl);
    pos.y = constrain(pos.y,0,height-scl);
    
    PVector temp = new PVector(pos.x,pos.y);
    tail.set(len-1,pos);
    
    for(int i = 0;i<len-1;i++) {
      temp = tail.get(i+1).copy();
      tail.set(i,temp);
    }
    
  }
  
  
  //Drawing Method
  void drawing()
  {
    PVector temp = new PVector(0,0);
    
    rectMode(CORNER);
    noStroke();
    
    for(int i =0; i<len-1;i++)
    {
      fill(200-i*10,255,200-i*10);
      temp = tail.get(i);
      rect(temp.x,temp.y,scl,scl);
    }
    
    fill(col);
    rect(pos.x,pos.y,scl,scl);
  } 
  
  
  // Method that changes directions on user Input
  void changeDir() {
    PVector temp = new PVector(0,0);
    temp = dir;
    if (keyCode == LEFT) {
      temp.set(-1,0);
    } else if (keyCode == RIGHT) {
      temp.set(1,0);
    } else if (keyCode == UP) {
      temp.set(0,-1);
    } else if (keyCode == DOWN){
      temp.set(0,1);
    }
    dir = temp;
  }  
  
  
  // Method that checks if the food object is in eat-distance
  void eatFood (Food food)
  {
    PVector check = new PVector(0,0);
    for(int i =0; i < len; i++) {
      check = tail.get(i).copy();
      if (dist(check.x,check.y,food.x,food.y) < scl) 
      {
        len++;
        PVector temp = new PVector(0,0);
        tail.add(len-1,temp);
      
        food.createNew();
      }
    }
    return;  
  }
  
  
  // Method that checks or self-collision
  void cannibal(Food food) {
    for (int i = 0; i<len-3; i++) {
      if ((pos.x == tail.get(i).x) && (pos.y == tail.get(i).y))
      {
        snake.reload(food);
        /*col = 100;
        len = 1;
        tail.clear();
        tail.add(pos);
        tail.add(pos); */
      }
    }
  }
  
  void reload(Food food)
  {
    col = 255;
    len = 2;
    pos.x = 0;
    pos.y = 0;
    dir.x = 1;
    dir.y = 0;
    tail.clear();
    tail.add(pos);
    tail.add(pos);
    food.createNew();
  }
  
}
