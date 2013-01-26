//size needs to be about 15x15 squares
// one square is x by y in size maybe 10x10
//noStroke();
void setup(){    
  size(151, 141);
}

void draw(){
int xSize = 10;
int ySize = 10;
int x = 0;
int y = 0;


for (y = 0; y<150; y+=10){
  for (x = 0; x<150; x+= 10){
    //first row
    if(y == 0 && (x == 0 || x == 10 || x == 50 || x == 60 || x == 80 || x == 100 || x == 110 || x == 140)){
      square(x, y, xSize, ySize, 1);
    }
    
    //second row
    else if(y == 10 && (x == 0 || x == 10 || x == 40 || x == 60 || x == 70 || x == 90 || x == 120 || x == 130 || x == 140)){
      square(x, y, xSize, ySize, 1);
    }
    
    //third row
    else if(y == 20 && (x == 0 || x == 10 || x == 30 || x == 50 || x == 70 || x == 110 || x == 130 || x == 140)){
      square(x, y, xSize, ySize, 1);
    }
    
    //fourth row
    else if(y == 30 && (x == 0 || x == 10 || x == 20 || x == 30 || x == 60 || x == 70 || x == 100 || x == 120 || x == 130 || x == 140)){
      square(x, y, xSize, ySize, 1);
    }
    
    //fifth row
    else if(y == 40 && (x == 0 || x == 10 || x == 20 || x == 30 || x == 50 || x == 70 || x == 100 || x == 120 || x == 130 || x == 140)){
      square(x, y, xSize, ySize, 1);
    }
    
    //sixth row
    else if(y == 50 && (x == 0 || x == 10 || x == 20 || x == 40 || x == 60 || x == 70 || x == 80 || x == 110 || x == 130 || x == 140)){
      square(x, y, xSize, ySize, 1);
    }
    
    //seventh row
    else if(y == 60 && (x == 0 || x == 10 || x == 30 || x == 60 || x == 70 || x == 100 || x == 110 || x == 120 || x == 140)){
      square(x, y, xSize, ySize, 1);
    }

    //eighth row
    else if(y == 70 && (x == 0 || x == 10 || x == 30 || x == 60 || x == 70 || x == 90 || x == 110 || x == 120 || x == 130 || x == 140)){
      square(x, y, xSize, ySize, 1);
    }
    
    //ninth row
    else if(y == 80 && (x == 0 || x == 10 || x == 20 || x == 30 || x == 50 || x == 70 || x == 100 || x == 110 || x == 130 || x == 140)){
      square(x, y, xSize, ySize, 1);
    }
    
    //tenth row
    else if(y == 90 && (x == 0 || x == 10 || x == 40 || x == 50 || x == 60 || x == 90 || x == 110 || x == 120 || x == 130 || x == 140)){
      square(x, y, xSize, ySize, 1);
    }
    
    //eleventh row
    else if(y == 100 && (x == 0 || x == 10 || x == 50 || x == 60 || x == 80 || x == 90 || x == 100 || x == 110 || x == 140)){
      square(x, y, xSize, ySize, 1);
    }
    
    //twelveth row
    else if(y == 110 && (x == 0 || x == 10 || x == 40 || x == 50 || x == 70 || x == 80 || x == 100 || x == 110 || x == 130 || x == 140)){
      square(x, y, xSize, ySize, 1);
    }
    
    //thirteenth row
    else if(y == 120 && (x == 0 || x == 10 || x == 20 || x == 50 || x == 60 || x == 80 || x == 110 || x == 130 || x == 140)){
      square(x, y, xSize, ySize, 1);
    }
    
    //fourteenth row
    else if(y == 130 && (x == 0 || x == 10 || x == 40 || x == 50 || x == 60 || x == 100 || x == 110 || x == 120 || x == 140)){
      square(x, y, xSize, ySize, 1);
    }
    
    //fifteenth
    //else if(y == 140 && (x == 0 || x == 10 || x == 40 || x == 50 || x == 60 || x == 100 || x == 110 || x == 120 || x == 140)){
    //  square(x, y, xSize, ySize, 1);
    //}
    
    else{
     square (x, y, xSize, ySize, 0); 
    }
  }
  x=0;
}
/*
square(x, y, xSize, ySize, 0);
square(x+10, y, xSize, ySize, 0);
square(x+20, y, xSize, ySize, 0);
square(x+30, y, xSize, ySize, 1);
square(x+40, y, xSize, ySize, 1);
square(x+50, y, xSize, ySize, 0);
*/
}
//row one
/*
for (x = 0; x<100; x+=10){
  for (y = 0; y<150; y+=10){
  rect(x, y, xSize, ySize);
  }
  y = 0;
}
*/
//row2
//row3
//row4
//row5
//row6
//row7
//row8
//row9
//row10
//row11
//row12
//row13
//row14
//ro215
//for (x = 0; x<100; x+=10){
//  rect(x, 140, 10, 10); 
//}


//function for creating a square 
// parameters will be the x, y, xSize, ySize, white
void square(int x, int y, int xSize, int ySize, int white){
 noStroke();
 if (white == 1){
  fill(255);
 }
 else{
  fill(0);
 } 
 rect(x, y, xSize, ySize);
}
