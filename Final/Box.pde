//Box class
//This determines the size and color of the box
class Box {
  boolean release, delete, play, select, red, green, blue, size;
  int x, y, x2, y2, diameter, delay;
  float amp;
  float r, g, b;
  PVector pos;
  boolean selected = false;
  SoundFile audio;
  
  Box(int xpos, int ypos, SoundFile select){
    x = xpos;
    y = ypos;
    r = random(255);
    g = random(255);
    b = random(255);
    pos = new PVector(x, y);
    audio = select;
    delay = millis();
  }
  
 void update(){
   //This causes the audio to play and creates the ripple
   if (play == true){
      float calculate = (r+g+b)/381.0;
      audio.play(calculate, volume);
      ripples.add(new Ripple(x, y, r, g, b, diameter, calculate));
      beat = false;
      play = false;
   }
   
   //Conditions for the diameter
   //Makes diameter pos if negative
   //Maxes the diameter at 300
   //Min at 30
   if (diameter < 0){
      diameter = diameter*-1;
   }
   if (diameter > 300){
      diameter = 300;
   }
   if (diameter < 30 && mousePressed == false){
      diameter = 30;
   }
    
   //Deletes the box if rightclicked
   if (mouseButton == RIGHT && mousepos.dist(pos) < diameter/2){
      delete = true;
      start = false;
   }
   //Plays if leftclicked
   else if (mousePressed && mouseButton == LEFT && mousepos.dist(pos) < diameter/2 && beat == true){
      play = true;
   }
   //Selects and gives info when 'q'
   else if (key == 'q' && mousepos.dist(pos) < diameter/2 && beat == true){
      h = true;
      for (int i=0; i<=boxes.size()-1; i++) {
         boxes.get(i).selected = false;
      }
      selected = true;
      text1 = round(r) + "";
      text2 = round(g) + "";
      text3 = round(b) + "";
      text4 = diameter + "";
      key = 'p';
    }
    //stops changing when 'e'
    if (key == 'e'){
      selected = false;
      red = false; 
      green = false;
      blue = false;
      size = false;
      key = 'p';
    }
    if (selected == true){
      //changes red
      if (mousePressed && mouseButton == LEFT && mouseX > 553 && mouseX < 611 && mouseY < 713 && mouseY > 685){
        red = true;
        green = false;
        blue = false;
        size = false;
      }
      if (red == true){
        if (699 < mouseY && r > 1){
          r--;
          text1 = round(r) + "";
        }
        else if (699 > mouseY && r < 256){
          r++;
          text1 = round(r) + "";
        }
      }
      //changes green
      if (mousePressed && mouseButton == LEFT && mouseX > 662 && mouseX < 720 && mouseY < 713 && mouseY > 685){
        green = true;
        red = false;
        blue = false;
        size = false;
      }
      if (green == true){
        if (699 < mouseY && g > 1){
          g--;
          text2 = round(g) + "";
        }
        else if (699 > mouseY && g < 256){
          g++;
          text2 = round(g) + "";
        }
      }
      //changes blue
      if (mousePressed && mouseButton == LEFT && mouseX > 662 && mouseX < 720 && mouseY < 772 && mouseY > 745){
        blue = true;
        red = false;
        green = false;
        size = false;
      }
      if (blue == true){
        if (759 < mouseY && b > 1){
          b--;
          text3 = round(b) + "";
        }
        else if (759 > mouseY && b < 256){
          b++;
          text3 = round(b) + "";
        }
      }
      //changes size
      if (mousePressed && mouseButton == LEFT && mouseX > 553 && mouseX < 611 && mouseY < 772 && mouseY > 745){
        blue = false;
        red = false;
        green = false;
        size = true;
      }
      if (size == true){
        if (759 < mouseY && diameter > 30){
          diameter--;
          text4 = round(diameter) + "";
        }
        else if (759 > mouseY && diameter < 300){
          diameter++;
          text4 = round(diameter) + "";
        }
      }
    }
  }
  
  void draw(){
    //delays between each beat so you don't infinitely hit it when you mouse click
    if (millis()-delay >= 1000){
      delay = millis();
      beat = true;
    }
    
    //Fills color
    stroke(r, g, b);
    fill(r, g, b);
    ellipse(x, y, diameter, diameter);
    
    //Sets the diameter and releases
    if (mouseButton == LEFT && release == false){
      diameter = mouseX - x;
    }
    else {
      release = true;
    }
  }
  
  void run(){
    update();
    draw(); 
  }
}
