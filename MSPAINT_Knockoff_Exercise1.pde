color bgColor = color(255, 255, 255);
float circleSize = 50;

void setup() {
  size(800, 600, P2D); // P2D enables 2D GPU acceleration
  background(bgColor);
}

void mouseWheel(MouseEvent event) {
  //MouseWheel up to decrease size 
  //MouseWheel down to increase size
  if (event.getCount() > 0 && circleSize < 100) {
    circleSize += 10;
  }
  if (event.getCount() < 0 && circleSize > 0) {
    circleSize -= 10;
  }
}

void draw() {  
  //q = red
  //w = green
  //e = blue
  //a = yellow
  //s = cyan
  //d = purple
  if (mouseButton == LEFT) {
    stroke(0, 0, 0);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  if (mouseButton == RIGHT) {
    stroke(255, 255, 255);
    ellipseMode(CENTER);
    fill(255, 255, 255);
    ellipse(mouseX, mouseY, circleSize, circleSize);
  }
  if (keyPressed && key == 'q'){
    ellipseMode(CENTER);
    stroke(255, 0, 0);
    fill(255, 0, 0);
    ellipse(mouseX, mouseY, circleSize, circleSize);
  }
  else if (keyPressed && key == 'w'){
    ellipseMode(CENTER);
    stroke(0, 255, 0);
    fill(0, 255, 0);
    ellipse(mouseX, mouseY, circleSize, circleSize);
  }
  else if (keyPressed && key == 'e'){
    ellipseMode(CENTER);
    stroke(0, 0, 255);
    fill(0, 0, 255);
    ellipse(mouseX, mouseY, circleSize, circleSize);
  }
  else if (keyPressed && key == 'a'){
    ellipseMode(CENTER);
    stroke(255, 255, 0);
    fill(255, 255, 0);
    ellipse(mouseX, mouseY, circleSize, circleSize);
  }
  else if (keyPressed && key == 's'){
    ellipseMode(CENTER);
    stroke(0, 255, 255);
    fill(0, 255, 255);
    ellipse(mouseX, mouseY, circleSize, circleSize);
  }
  else if (keyPressed && key == 'd'){
    ellipseMode(CENTER);
    stroke(255, 0, 255);
    fill(255, 0, 255);
    ellipse(mouseX, mouseY, circleSize, circleSize);
  }
  if (keyPressed && key == 'r'){
    background(bgColor);
  }
}
