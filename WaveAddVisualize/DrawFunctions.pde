/* Different Functions to plot the waves on the canvas */



// draws an wave in a seemingly random colorspectrum that's always moving
void drawArrayColorful(float[] array, color c, int strokeWeight, float yOffset, float phase) 
{
  smooth();
  strokeWeight(strokeWeight);
  for (int i = 0; i<array.length; i++)
  {
    c = color(200+55*sin(i*.7*TWO_PI/width +phase/2),200+55*sin(i*.2*TWO_PI/width+phase),125+125*sin(i*TWO_PI/width+phase/3));
    stroke(c);
    point(i,array[i] + height/2);
  }
}



// draws an array in Dot-Form
void drawArray(float[] array, color c, int strokeWeight, float yOffset) 
{
  smooth();
  stroke(c);
  
  strokeWeight(strokeWeight);
  for (int i = 0; i<array.length; i++)
  {
    point(i,array[i] + height/2);
  }
}



// Draws an Array in vertex Form, as one continous line 
void drawArrayVertex(float[] array, color c, int strokeWeight, float yOffset) 
{
  strokeWeight(strokeWeight);
  stroke(c);
  beginShape(LINES);
  for ( int i = 0; i < array.length; i++) {
    vertex(i,array[i]+ yOffset);
  }
  endShape();
}
