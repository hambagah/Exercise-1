float scaleAmp = 500;
float scaleFreq = 500;
int second, lastSecond, seconds;
float bx, by;
Wall wall;
boolean run, gg;

void setup() {
  size(1000, 400, P2D);  
  setupSound();
  bx = 100;
}

void draw() {
  if (gg == false){
    second = second();
    if (second != lastSecond){
      lastSecond = second;
      seconds++;
    }
    background(127);
    if (seconds == 3){
      wall = new Wall(random(50, 300), random(20, height/2));
      run = true;
      seconds = 0;
    }
    if (run == true){
      wall.run(); 
    }
    
    updateSound();
    
    //println("amp: " + amp + " freq: " + freq);
    by = height+(amp * scaleAmp)*-1;
    rectMode(CENTER);
    ellipse(bx, by, 50, 50);
  }
  else {
    
  }
}
