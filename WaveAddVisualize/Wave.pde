/* Wave class which allows to create new Wave Objects stored in an array of the width of the canvas*/

class Wave {
  float[] wave;
  float freq; // is multiplied by TWO_PI
  float phase; // in radians
  float amplitude;
  
  Wave(int arrayLength, float _freq, float _amplitude, float _phase)
  {
    // arrayLenth is the width of the screen 
    wave = new float[arrayLength];
    freq = _freq;
    phase = _phase;
    amplitude = _amplitude;
    
    calcWave();
  }
  void changeFrequency (float newFreq)
  {
    this.freq = newFreq;
    calcWave();
  }
  
  void changeAmplitude (float newAmplitude)
  {
     amplitude = newAmplitude;
     calcWave();
  }
  
  void changePhase(float newPhase)
  {
    this.phase = newPhase;
    calcWave();
  }
  
  void changeFreqPhase (float newFreq, float newPhase)
  {
    freq = newFreq;
    phase = newPhase;
    calcWave();
  }
  
  // calculation of one wave cycle for the whole array meaning once for the whole Screen
  void calcWave () 
  {
    
    for(int i = 0; i< wave.length;i++) 
    {
      wave[i] = amplitude*sin(float(i)*TWO_PI*freq/wave.length + phase);
    }
  }
}
