//testing a few features for the seinfeld graph
size(500, 500);
background(255);

float total = 0;

//set the values to be in an array
//a[0] - jerrys time
//a[1] - george
//a[2] - elaine
//a[3] - kramer
//a[4] - other
float [] times = {18, 8, 4, 12, 10};

int x = 0;
for (x=0; x < times.length - 1; x++){
  total+= times[x];
}

println(total);

//draw the line
line(width/2.0, height/2.0, width/2.0, ((height/2.0)-(total*2)));

//need to draw each of the lines
//line(((width/2.0) - 2.5), ((height/2.0)-(total*2)), ((width/2.0) + 2.5), ((height/2.0)-(total*2)));

fill(0);
//rect(((width/2.0) - 2.5), (height/2.0)-(total*2), 5, 5);

float Jerry = times[0];
float George = times[1];
float Elaine = times[2];
float Kramer = times[3];
float Other = times[4];

//Jerry
fill(255, 0, 0);
rect (((width/2.0) - 2.5), (height/2.0) - (Jerry * 4), 5, 5);
//George
fill(0, 255, 0);
rect (((width/2.0) - 2.5), (height/2.0) - (George * 4), 5, 5);
//Elaine
fill(0, 0, 255);
rect (((width/2.0) - 2.5), (height/2.0) - (Elaine * 4), 5, 5);
//Kramer
fill(0, 0, 0);
rect (((width/2.0) - 2.5), (height/2.0) - (Kramer * 4), 5, 5);
//Other
fill(100, 100, 100);
rect (((width/2.0) - 2.5), (height/2.0) - (Other * 4), 5, 5);
