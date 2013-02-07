PFont f; 
character[] chars = new character[4];

void setup(){
  size(500, 500);
  background(255);
  f = createFont("Arial",5,true);
  textFont(f,16);                 
  fill(0);     
  
 //create each character and put them into an arraylist to use later
 character Jerry = new character ("Jerry", 18.2, 3.5, 0, 0, 255); 
 character George = new character ("George", 10, 1, 255, 0, 0);
 character Elaine = new character ("Elaine", 4, 0.5, 0, 255, 0);
 character Kramer = new character ("Kramer", 2, 0.12, 0, 100, 100);
 
 chars[0] = Jerry;
 chars[1] = George;
 chars[2] = Elaine;
 chars[3] = Kramer;  
}

void draw(){
   episode first = new episode (1, 2, 35.75);
   first.display();
 
 for (int x = 0; x < chars.length; x++){
   chars[x].display();
   chars[x].inFocus();
 }
}

class character{
 private String name;
 private float onScreen;
 private float longestTime;
 private int R;
 private int G;
 private int B;

 character (String name, float onScreen, float longestTime, int R, int G, int B){
   this.name = name;
   this.onScreen = onScreen;
   this.longestTime = longestTime;
   this.R = R;
   this.G = G;
   this.B = B;
 } 
 
 //used to draw the square on the line
 void display(){
   fill(R, G, B);
   rect(((width/2.0) - 2.5), ((height/2.0) - (onScreen * 4)), 5, 5);
 }
 
 void inFocus(){
   //display the name, time on screen, and longest scene if in the box
   if (mouseX >= ((width/2.0) - 2.5) && mouseX <= ((width/2.0) + 2.5) && mouseY >= (((height/2.0) - (onScreen * 4)) - 5) && mouseY <= (((height/2.0) - (onScreen * 4)) + 5)){
     println(name);
     updateText();
   }
 }
 
 void updateText(){
     fill(255);
     rect(0, 0, 225, 55); 
   
     fill(0);
     text("Character: " + name,10,16);
     text("Total Time On Screen: " + onScreen,10,32);
     text("Longest Scene: " + longestTime,10,48);
 }
 
 void removeText(){  
     fill(255);
     noStroke();
     rect(0, 0, 200, 55);
 }
 
 String toString(){
   String rtn = "Name: " + name + "\nTime on Screen: " + onScreen + "\nLongest Scene: " + longestTime; 
  return rtn; 
 }
}

class episode{
  private int season;
  private int ep;
  private float showLength;
  
  episode(int season, int ep, float showLength){
    this.season = season;
    this.ep = ep;
    this.showLength = showLength;
  }
  
  void display(){
    //need to make the length of the line something like twice the showLength
    //line(width/2.0, height/2.0, width/2.0, ((height/2.0) - (2.0 * showLength)));
    rect(width/2.0 - 1, height/2.0, 3, (showLength * 2.0) * - 1);
  }
  
  void inFocus(){
    //if (mouseX >= (width/2.0 - 2) && mouseX <= (width/2.0 + 2) && mouseY >= (height/2.0) && mouseY <= ((height/2.0) - (2.0 * showLength))){
    //   println("Episode: " + ep);
    //   updateText();
    //}
    if (mouseX >= 248 && mouseX <= 252 && mouseY >= 250 && mouseY <= 170){
      println(ep);
      updateText();
    }
  }
  
  void updateText(){
    fill(0);
    rect(0, 200, 50, 50); 
   
    /*
    fill(0);
    text("Season: " + season,10,16);
    text("Episode: " + ep,10,32);
    text("Episode Length: " + showLength,10,48);
    */
  }
}
