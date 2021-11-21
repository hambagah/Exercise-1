//Yinkan Chen Project 3
//Pixel Editor 
//Left click to drag a single pixel
//Right click to select an area of pixels to drag
//Resources 
//https://processing.org/examples/mousefunctions.html
//https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week10/PixelExample05/Dot.pde
//Some glitches
//One: If you area select and then left click drag a pixel it stops left click from working
//Not sure why but if you do the same thing again it works
//Two: Sometimes when you area drag, the xaxis is much larger than what it's supposed
//to be, also don't know why
//Three: If you overlap an selected area over another and then select the same area
//it'll make a weird glitchy effect
PImage img;
ArrayList<Square> square;
Selection select;
boolean right, release;
//Set size of the pixels here
int x, y, size = 20;

void setup() {
  size(50, 50, P2D);  
  //Add image file name here
  img = loadImage("dog.jpg");
  //Sets the size of the window to image size
  surface.setSize(img.width, img.height);
  square = new ArrayList<Square>();
  
  //Adds every pixel and changes it according to size
  for (int x = 0; x < img.width; x+=size) {
    for (int y = 0; y < img.height; y+=size) {
      // this translates x and y coordinates into a location in the pixels array
      int loc = x + y * img.width;
      square.add(new Square(x, y, img.pixels[loc]));
    }
  }
  println(square.size());
}

//This allows for selection using right click
void mouseReleased(){
  if (right == true){
    release = true; 
  }
}

void mousePressed(){
  //Places selected area 
  if (mouseButton == LEFT){
    right = false;
  }
  //Creates new selection when right clicking
  if (mouseButton == RIGHT){
    right = true;
    select = new Selection(mouseX, mouseY);
  }
}

void draw() { 
  background(255);
  //Runs square
  for (Square squares: square) {
    squares.run();
  }
  //Deletes the previous pixel to add the exact same but higher up on the arraylist
  //This is so that the pixel paints over previous pixels rather than being behind 
  for (int i=0; i<=square.size()-1; i++) {
    if (square.get(i).exist == false) {
        square.add(new Square(square.get(i).w-size, square.get(i).h-size, square.get(i).col));
        square.remove(i);
    }
  }
  if (right == true){
    select.run();
  }
}
