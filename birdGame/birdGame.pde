int x1 = 150;
int y1 = 250;
int x2 = 150;
int y2 = 225;
int x3 = 165;
int y3 = 235;

void setup(){  
  size(300, 500);
  //line();
  }
  
void keyReleased() {
  if (keyCode == UP) {
        y1-=15;
        y2-=15;
        y3-=15;
      }
}

void draw()
{ 
  setScreen();
  drawPipes();
  
  //if the space key is pressed jump up a few
  if (y2 > 30){
    if (keyPressed)
    {
      
      y1-=10;
      y2-=10;
      y3-=10; 
    }
  }
  
  if (y1 < 478){
    y1+=3.5;
    y2+=3.5;
    y3+=3.5;
  }
  else{
   println("game over " + y1); 
   noLoop();   
  }
  
  //print the bird
  triangle(x1, y1, x2, y2, x3, y3);
}

void setScreen()
{
  //drawing the board
  background(255);
  fill(255);
  //top part of the screen
  line(0, 15, 300 , 15);
  line(0, 20, 300 , 20);
  //bottom part of the screen
  line(0, 480, 300 , 480);
  line(0, 485, 300 , 485); 
}
  
void drawPipes()
{
 fill(0, 150, 0);
  //top pipe
  int x = int(random(0, width));
  //will be middle
  int y = int(random(150, 350));
  println(y);
  
  rect(x, 20, 50, y-50);
  rect(x, y-50, 50, 20);
  
  int len = 480 - 50 - y;
  //bottom pipe 
  rect(x, y+50, 50, len);
  rect(x, y+50, 50, 20); 
  fill(255);
}
