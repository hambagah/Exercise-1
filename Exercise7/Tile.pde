class Tile {
  int count;
  float r, g, b, directionx, directiony, diameter;
  boolean red, green, blue;
  PVector pos, speed;
  Tile(int x, int y, float q, float w, float e, int size){
    diameter = size;
    pos = new PVector(x, y);
    speed = new PVector(random(-5, 5), random(-5, 5));
    r = q;
    g = w;
    b = e;
  }
  
  void update(){
    if (random(0, 1) < 0.5){
      diameter--;
    }
    else {
      diameter++;
    }
    
    if (random(0, 1) < 0.1){
      count++;
    }
    else if (count > 50){
      diameter = 5;
      count = 0;
    }
    
    if (random(0, 1) < 0.1){
      speed = new PVector(random(-5, 5), random(-5, 5));
    }
   
    r+=random(-5, 5); 
    g+=random(-5, 5); 
    b+=random(-5, 5); 
    
    if (r < 200){
      r = 255;
    }
    if (g < 200){
      g = 255;
    }
    if (b < 200){
      b = 255;
    }
    
    if (pos.x < 0 || pos.x > width - diameter){
      speed.x = directionx;
    }
    else {
      directionx = speed.x * -1;
    }
    if (pos.y < 0 || pos.y > height - diameter){
      speed.y = directiony;
    }
    else {
      directiony = speed.y * -1;
    }
  }
  
  void draw(){
    fill(r, g, b);
    stroke(r, g, b);
    ellipse(pos.x+size/2, pos.y+size/2, diameter, diameter);
    pos.add(speed);
  }
  
  void run(){
    update();
    draw();
  }
}
