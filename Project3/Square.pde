//Square class
//This determines the pixels position and properties
//This also allows for the dragging of pixels to new locations
boolean others;
class Square {
  PVector position;
  color col;
  float dot;
  float w, h, posx, posy;
  boolean mouse, drag, drag2, exist = true;
  int counter = 0, counter2 = 0;
  
  Square(float x, float y, color c) {
    position = new PVector(x, y);
    w = x+size;
    h = y+size;
    col = c;
    float b = brightness(col) / 255;
    dot = abs(10 - (b * 10)) + 2;
  }
  
  void update(){
    if (mousePressed && mouseButton != LEFT){
      key = '1'; 
    }
    //This makes it so that only one pixel can be dragged at a time
    //Disabling all other pixels until the left mouse button is let go
    //This also resets all the of the booleans so that new pixels can be selected
    if (others == false && mousePressed && mouseButton == LEFT && w > mouseX && mouseX > position.x && h > mouseY && mouseY > position.y){
      others = true;
      mouse = true;
    }
    if (mouse == true && mousePressed && mouseButton == LEFT ){
      drag = true;
    }
    else if (mouse == true && mousePressed == false){
      others = false;
      mouse = false;
      drag = false;
      exist = false;
      drag2 = false;
      key = '1';
      counter = 0;
    }
  }
 
  void draw() {
    //Sets position and colors
    fill(col);
    stroke(col);
    rect(position.x, position.y, size, size);
    
    //This is for singular pixel selection and makes it so that it follows
    //Whereever your mouse is
    if (drag == true){
      w = mouseX+size/2;
      h = mouseY+size/2;
      position.x=mouseX-size/2;
      position.y=mouseY-size/2;
      //If you press q it will inverse the colors
      //W reverses what q does
      //You can inverse the colors, exit selection, reselect the inverted area
      //then q would make the colors normal and w would reverse that
      if (key == 'q' && counter == 0){
        float r = 255 + red(col)*-1;
        float g = 255 + green(col)*-1;
        float b = 255 + blue(col)*-1;
        col = color(r, g, b);
        counter++;
      }
      else if (key == 'w' && counter == 1){
        float r = 255 + red(col)*-1;
        float g = 255 + green(col)*-1;
        float b = 255 + blue(col)*-1;
        col = color(r, g, b);
        counter--;
      }
    }
    if ((mouseButton == LEFT || mouseButton == RIGHT) && drag2 == true){
      drag2 = false;
      others = false;
      mouse = false;
      drag = false;
      exist = false;
      key = '1';
      counter = 0;
    }
    //This is for area selection and makes it so that it stays on screen during the 
    //selection, it goes the opposite direction of where your mouse is.
    else if (drag2 == true){
      w = posx-mouseX+size/2;
      h = posy-mouseY+size/2;
      position.x=posx-mouseX-size/2;
      position.y=posy-mouseY-size/2;
      if (key == 'q' && counter == 0){
        float r = 255 + red(col)*-1;
        float g = 255 + green(col)*-1;
        float b = 255 + blue(col)*-1;
        col = color(r, g, b);
        counter++;
      }
      else if (key == 'w' && counter == 1){
        float r = 255 + red(col)*-1;
        float g = 255 + green(col)*-1;
        float b = 255 + blue(col)*-1;
        col = color(r, g, b);
        counter--;
      }
      if (key == 'a' && counter2 == 0){
        posx = posx*-1;
        posy = posy*-1;
        counter2++;
      }
      else if (key == 's' && counter2 == 1){
        posx = posx*-1;
        posy = posy*-1;
        counter2--;
      }
      //scatters the pixels into different locations
      if (key == ' '){
        position.x = random(width)-size/2;
        position.y = random(height)-size/2;
        w = position.x+size/2;
        h = position.y+size/2;
        drag2 = false;
      }
    }
  }
  
  void run() {
    update();
    draw();
  }
}
