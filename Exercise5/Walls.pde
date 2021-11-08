class Wall{
 PVector wallpos;
 PVector speed;
 PVector ball;
 float w, h;
 float r, g, b;
 Wall(float x, float y){
   h = y;
   w = x;
   r = random(0, 255);
   g = random(0, 255);
   b = random(0, 255);
   wallpos = new PVector(width, 380);
   speed = new PVector(-20, 0);
 }
 
 void draw(){
   ball = new PVector(bx, by);
   println(ball.x + " " + ball.y);
   println(wallpos.x + " " + wallpos.y);
   wallpos.add(speed);
   fill(r, g, b);
   rect(wallpos.x, height, w, h);
 }
 
 void collision(){
   if (ball.dist(wallpos)<50){
     gg = true;
   }
 }
 
 void run(){
   draw(); 
   collision();
 }
}
