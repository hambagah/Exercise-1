//Ripple class
//Special effect for when you click the box
//Changes based on color and size of the box

class Ripple{
  int x2, y2, t, increase, diameter2, s, s2, counter=0;
  float r2, g2, b2, life = 20, speed;
  boolean expire;
  Ripple(int xpos, int ypos, float r, float g, float b, int diameter, float calculate){
    x2 = xpos; 
    y2 = ypos;
    r2 = r;
    g2 = g;
    b2 = b; 
    diameter2 = diameter;
    speed = (2.0+(300.0/diameter)*calculate);
  }
  
  void update(){
    diameter2+=speed;
  }
  
  void draw(){
    //This determines when the ripple expires
    s = second();
    if (s != s2) {
      s2 = s;
      counter++;
    }
    if (counter > life){
      expire = true;
    }
    
    stroke(r2, g2, b2);
    noFill();
    ellipse(x2, y2, diameter2, diameter2);
  }
  
  void run(){
    update();
    draw(); 
  }
}
