//Selection class
//This allows for right click dragging an area to select all the pixels in the rectangle
//Very glitchy
class Selection{
  float fX=0, fY=0, fX2=0, fY2=0;
  boolean calculate;
  Selection (float x, float y){
    fX = x;
    fY = y;
  }
  
  void draw(){
    stroke(127, 255, 127);
    noFill();
    //This draws a green outline so you can see what you're selecting
    rect(fX, fY, mouseX-fX, mouseY-fY); 
    fX2 = mouseX - fX;
    fY2 = mouseY - fY;
  }
  
  void calculate(){
    //Calculates whether or not it needs to adjust for negative values for
    //fX2 and fY2
    if (calculate == true){
      if (fX2 < 0){
        float save = fX;
        fX = fX+fX2;
        fX2 = save;
      }
      if (fY2 < 0){
        float save = fY;
        fY = fY+fY2;
        fY2 = save;
      }
      //This grabs everything inside of the rectangle area
      //Adding a new value so that the pixel doesn't go off screen
      for (int i=0; i<=square.size()-1; i++) {
        if (square.get(i).position.x > fX && square.get(i).w < fX2+fX && square.get(i).position.y > fY && square.get(i).h < fY2+fY) {
          square.get(i).drag2 = true;
          float sposx = square.get(i).position.x;
          float sposy = square.get(i).position.y;
          square.get(i).posx = sposx+width/2;
          square.get(i).posy = sposy+height/2;
          println(fX, fY + " " + fX2, fY2);
        }
      }
      calculate = false;
    }
  }
  
  void run(){
    calculate();
    //It only selects the pixel after you let go of the right click button
    if (release == true){
      release = false;
      calculate = true;
    }
    else if (mousePressed == true && mouseButton == RIGHT ){
      draw();
    }
  }
}
