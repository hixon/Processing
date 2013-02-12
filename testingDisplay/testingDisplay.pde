PFont f; 
character[] chars = new character[4];

void setup(){
  size(500, 500);
  background(255);
  f = createFont("Arial",5,true);
  textFont(f,16);                 
  fill(0);  
}

void draw(){
  ArrayList chars = new ArrayList();
  character Jerry = new character ("Jerry", 12.5, 2.1, 255, 0, 0);
  character George = new character("George", 8, 1.33, 0, 255, 0);
  character Elaine = new character("Elaine", 5.25, 0.68, 0, 0, 255);
  character Kramer = new character("Kramer", 3, 1.25, 100, 100, 0);
  character Other = new character("Other", 15.8, 2.5, 0, 50, 100);
  
  chars.add(Jerry);
  chars.add(George);
  chars.add(Elaine);
  chars.add(Kramer);
  chars.add(Other);
  
  episode first = new episode (1, 1, "The Pick", 240, 250, 32.5, chars);
  
  chars = new ArrayList();
  Jerry = new character("Jerry", 8.5, 1.22, 255, 0, 0);
  George = new character("George", 5.2, 0.66, 0, 255, 0);
  Elaine = new character ("Elaine", 12.3, 2.22, 0, 0, 255);
  Kramer = new character ("Kramer", 9.5, 4.5, 100, 100, 0);
  Other = new character ("Other", 15.88, 2, 0, 50, 100);
  chars.add(Jerry);
  chars.add(George);
  chars.add(Elaine);
  chars.add(Kramer);
  chars.add(Other);
  
  episode sec = new episode (1, 2, "The Test", 260, 250, 35, chars);
  //episode three = new episode (1, 3, "The Soup Nazi", 280, 250);
  //episode four = new episode (1, 4, "The Pilot", 300, 250);
  //episode five = new episode (1, 5, "The Pen", 320, 250);
  
  episode curr = new episode();
  character now = new character();
  
  ArrayList test = new ArrayList();
  test.add(first);
  test.add(sec);
  //test.add(three);
  //test.add(four);
  //test.add(five);
    
  int x = 0;
  int y = 0;
  int step = width/test.size();
  int start = 50;
  float showSize = 0;
  for (x=0; x<test.size(); x++){
    curr = (episode) test.get(x);
    showSize = curr.showLen();
    curr.display(start, showSize);
    
    for (y = 0; y < curr.getSize(); y++){
      now = (character) curr.getChar(y);
      now.display(start);
      now.inFocus(start);
    }
    start += step;
  }
}

class episode {
  private int season;
  private int number;
  private String title;
  private int x;
  private int y;
  private ArrayList cast;
  private float len;
  
  episode (int season, int number, String title, int x, int y, float len, ArrayList cast){
    this.season = season;
    this.number = number;
    this.title = title;
    this.x = x;
    this.y = y;  
    this.len = len;
    this.cast = cast;
  } 
  
  episode(){
    season = 0;
    number = 0;
    title = "";
    x = 0;
    y = 0; 
  }
  
  void display(int startX, float episodeSize){
    fill(0);
    rect(startX+2.0, y*1.0, 2.0, episodeSize * (-2.0)); 
  }
  
  void showText(){
    println("title: " + title);
  }
  
  ArrayList showWho(){
    return cast;
  }
  
  int getSize(){
    return cast.size();
  }
  
  Object getChar(int x){
     return cast.get(x); 
  }
  
  float showLen(){
   return len;
  }
}

class character{
  private String name;
  private float onScreen;
  private float longestTime;
  private int R;
  private int G;
  private int B;
  
  //this variable can probably be a constant, if changed the size of the squares will change
  private int blockSize = 6;
  
  //main constructor method to create each character
  character (String name, float onScreen, float longestTime, int R, int G, int B){
   this.name = name;
   this.onScreen = onScreen;
   this.longestTime = longestTime;
   this.R = R;
   this.G = G;
   this.B = B;
 } 
 
  //this is used when nothing is called
  character(){
      name = "";
      onScreen = 0;
      longestTime = 0;
      R = 0;
      G = 0;
      B = 0;
   }
 
 //used to draw the square on the line
 void display(int Xlocation){
   fill(R, G, B);
   rect(Xlocation, ((height/2.0) - (onScreen * 4)), blockSize, blockSize);
 }
 
 void inFocus(int xLocation){
   //display the name, time on screen, and longest scene if in the box
   if (mouseX >= (xLocation) && mouseX <= (xLocation + blockSize) && mouseY >= (((height/2.0) - (onScreen * 4))) && mouseY <= (((height/2.0) - (onScreen * 4)) + blockSize)){  
     println(name);
     updateText();
   }
   //THE ELSE CASE WAS ONLY USED FOR TESTING OTHERWISE IT WILL CONTINUTE TO PRINT THE (X,Y) LOCATION
   //else{
   //   println("x: " + mouseX + " y: " + mouseY); 
   //}
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
