//Yinkan Chen Final Project
//This program allows the user to create boxes that can be played for audio
//The audio will alter based on its size and color
//The settings of the program can be altered at will with the control scheme
//Spacebar and leftmouse to create box
//Q over a box to check its info
//Click play to start
//Click the numbers to change them with up or down mouseY pos
//Press w and e while changing the values to stop the command
//Sound effects gathered from:
//https://www.youtube.com/watch?v=zKoVlval3qU&ab_channel=VaperSounds
//https://www.youtube.com/watch?v=ERWmbDmXYJI&ab_channel=VaperSounds
//https://www.youtube.com/watch?v=qAn1zfzrvkk&ab_channel=nBeats
//Codes from:
//eecs1710 exercises
//processing references
//https://forum.processing.org/one/topic/trying-to-delay-a-loop.html
import processing.sound.*;

SoundFile one, two, three, four, five, six, seven, eight, nine, ten, select;
ArrayList<Box> boxes;
ArrayList<Ripple> ripples;
int time, count, delays = 100;
boolean beat, h, others, start, start2, d;
String text1, text2, text3, text4, text5, text6;
PImage sframe, pframe, cframe, frame;
PVector mousepos;
float rbox, gbox, bbox, volume = 0.5;
void setup() {
  size(800, 800, P2D);
  //loads everything
  //boxes are not boxes but Im too lazy to change the name
  //They're the circles that you hit to make sounds
  //Ripples are the effects that occur after you hit them
  //Below contains all of the images and sounds
  //None of the sounds belong to me
  //All of the images do though
  boxes = new ArrayList<Box>();
  ripples = new ArrayList<Ripple>();
  sframe = loadImage("pause.png");
  pframe = loadImage("start.png");
  frame = loadImage("frame.png");
  cframe = sframe;
  one = new SoundFile(this, "clap1.wav");
  two = new SoundFile(this, "clap2.wav");
  three = new SoundFile(this, "cymbal1.wav");
  four = new SoundFile(this, "cymbal2.wav");
  five = new SoundFile(this, "cymbal3.wav");
  six = new SoundFile(this, "cymbal4.wav");
  seven = new SoundFile(this, "kick1.wav");
  eight = new SoundFile(this, "kick2.wav");
  nine = new SoundFile(this, "snare1.wav");
  ten = new SoundFile(this, "snare2.wav");
  time = millis();
  rbox = 150 + random(55);
  gbox = 150 + random(55);
  bbox = 150 + random(55);
}

void keyPressed(){
  //This is for stopping delay change
  if (key == 'w'){
    d = false; 
  }
}

void mousePressed(){
  //This adjusts the volume depending on where you click the bar
  if (mouseButton == LEFT && mouseX > 752 && mouseX < 774 && mouseY < 776 && mouseY > 626){
    volume = ((776.0-mouseY)/150.0);
  }
  
  //This activates delay change
  if (mousePressed && mouseButton == LEFT && mouseX > 434 && mouseX < 502 && mouseY < 655 && mouseY > 628){   
    d = true;
  }
  
  //This starts playing all of the boxes if there are any
  //And pauses again if you click while it's playing
  if (boxes.size() > 0 && mouseButton == LEFT && mouseX > 54 && mouseX < 306 && mouseY > 664 && mouseY < 742){
    if (start == false){
      start = true;
    }
    else if (start == true){
      start = false; 
    }
  }
  
  //This creates the boxes whenever you left click the screen above 
  //Y cords 600 and press space at the same time
  //It randomly gives the box a random audio clip to use
  if (mouseButton == LEFT && mouseY < 600 && key == ' '){
    float random = random(10);
    if (random<=1){
      select = one;
    }
    else if (random<=2){
      select = two;
    }
    else if (random<=3){
      select = three;
    }
    else if (random<=4){
      select = four;
    }
    else if (random<=5){
      select = five;
    }
    else if (random<=6){
      select = six;
    }
    else if (random<=7){
      select = seven;
    }
    else if (random<=8){
      select = eight;
    }
    else if (random<=9){
      select = nine;
    }
    else if (random<=10){
      select = ten;
    }
    boxes.add(new Box(mouseX, mouseY, select)); 
    key = '1';
  }
}

void draw(){
  //This allows for box size creator
  mousepos = new PVector(mouseX, mouseY);
  
  //This randomly changes the volume bar color, it's just a fancy effect
  rbox+=random(-5, 5); 
  gbox+=random(-5, 5); 
  bbox+=random(-5, 5); 
  
  //Actives if you click the delay area
  //Changes if your mouse pos is above the line 
  //Increasing and decreasing according to position
  if (d == true){
     if (642 < mouseY && delays > 3){
       delays-=2;
       text5 = round(delays) + "";
     }
     else if (642 > mouseY){
       delays+=2;
       text5 = round(delays) + "";
     }
  }
  
  //This resets the volume bar color if it becomes too dark or bright
  if (rbox < 150 && rbox > 235){
    rbox = 170 + random(55);
  }
  if (gbox < 150 && rbox > 235){
    gbox = 170 + random(55);
  }
  if (bbox < 150 && rbox > 235){
    bbox = 170 + random(55);
  }
  
  //delay between each audio when playing
  //Also changes the frame with the button
  if (start == true){
    cframe = sframe;
    if (millis()-time >= delays){
      time = millis();
      boxes.get(count).play = true;
      count++;
    }
  }
  else {
    cframe = pframe; 
  }
  
  //Only starts if box isn't empty
  if (count == boxes.size()){
    count = 0; 
    start = false;
  }
  
  background(230);
  
  for (Box box: boxes) {
    box.run();
  }
  //Removes if delete is true aka when you right click the box
  for (int i=0; i<=boxes.size()-1; i++) {
    if (boxes.get(i).delete == true) {
       boxes.remove(i);
    }
  }
  
  for (Ripple ripple: ripples) {
    ripple.run();
  }
  //Removes if the the ripple reaches it's expire time
  for (int i=0; i<=ripples.size()-1; i++) {
    if (ripples.get(i).expire == true) {
       ripples.remove(i);
    }
  }
  
  //Fills volume bar with color
  fill(rbox, gbox, bbox);
  noStroke();
  rect(750, 776-150*volume,  25, 776);
  
  //Sets the frames
  image(cframe, 0, 600, 800, 200);
  image(frame, 0, 0, 800, 800);
  
  //Sets the text
  fill(0);
  text5 = delays + "";
  text6 = boxes.size() + "";
  if (h == true){
    //r
    text(text1, 570, 705);
    //g
    text(text2, 680, 705);
    //b
    text(text3, 680, 763);
    //size
    text(text4, 570, 763);
  }
  //delay
  text(text5, 455, 647);
  //count
  text(text6, 680, 647);
}
