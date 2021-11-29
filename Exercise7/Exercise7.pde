int size = 20;
float q,w,e;
ArrayList<Tile> tiles;
PImage img;
void setup(){
  size(800, 600, P2D);
  tiles = new ArrayList<Tile>();
  q = random(50, 200);
  w = random(50, 200);
  e = random(50, 200);
  for (int x = 0; x < width; x+=size){
    for (int y = 0; y < height; y+= size){
      tiles.add(new Tile(x, y, q, w, e, size));
    }
  }
  println(tiles.size());
}

void draw(){
  background(230, 250, 255);
  for (Tile tile: tiles) {
    tile.run();
  }
  surface.setTitle("" + frameRate);
}
