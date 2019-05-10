///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This sketch creates a visual representation of two sinusodial waves, with moving phases, added together.      //
// The frequency of each wave changes by the position of your mouse relative to the canvas.                      //
// The up- down- left- and right-keyes  change the speed of the pahse change. Basically how fast the waves move. //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


float xfreq,yfreq; // freq is automultiplied by TWO_PI, so f=1 gives one full sine-wave
float maxfreq = 20; // maximum frequency of either wave
float phi1 = 0;  // phase offset of wave1
float phi2 = 0;  // phase offset of wave2
Wave wave1;
Wave wave2;
float[] sum;  // summation of all the waves
float phaseSpeed1 = 0.05; // speed of phase change of phi1. Updated once per loop.
float phaseSpeed2 = 0.05; // speed of phase change of phi1. Updated once per loop.

void setup() 
{
  size(2500,1000);
  wave1 = new Wave(width,1,100,0);
  wave2 = new Wave(width,4,100,0);
  sum = new float[width];
}



void draw() 
{
  background(0);
  
  /* user input to change wave parameters */
  xfreq = constrain(mouseX*maxfreq/width,0,maxfreq);
  yfreq = constrain(mouseY*maxfreq/height,0,maxfreq);
  
  /* wave updates */
  wave1.changeFreqPhase(xfreq, phi1);
  wave2.changeFreqPhase(yfreq, phi2);
  sum = addArray(wave1.wave,wave2.wave);
  
  /* Draw methods */
  drawArrayVertex(sum,255,10,height/2);
  //drawArrayColorful(sum,255,10,height/2,phi1);
  //drawArray(sum, 255, 10, height/2);
  
  /* update the offset to create a moving wave */
  phi1 += phaseSpeed1;
  phi2 += phaseSpeed2;
}


/* manages user input to change the moving speed of each individual wave */
void keyPressed()
{
  if(keyCode == UP) {
    phaseSpeed1 -=0.01;
  }
  if(keyCode == DOWN) {
    phaseSpeed1 +=0.01;
  }
  if(keyCode == LEFT) {
    phaseSpeed2 -=0.01;
  }
  if(keyCode == RIGHT) {
    phaseSpeed2 +=0.01;
  }
  if(key == 's' || key == 'S') {
    phaseSpeed1 = 0;
    phaseSpeed2 = 0;
    phi1 = 0;
    phi2 = 0;
  }
  if(key == 'r' || key == 'R') {
    phaseSpeed1 = 0.05;
    phaseSpeed2 = 0.05;
    phi1 = 0;
    phi2 = 0;
  }
}


/* Adds two arrays value by value */
float[] addArray(float[] arr1, float[] arr2)
{
    float[] sum = new float[arr1.length];
    for (int i = 0; i<arr1.length;i++){
      sum[i] = arr1[i]+arr2[i];
    }
    return sum;
}
