/*
TODO: need to load an ArrayList of episodes
call the load method:
ArrayList <episode> test = new Arraylist()
episode current = new episode 
*/

PFont f; 
character[] chars = new character[4];

void setup(){
  size(2000, 500);
  background(255);
  f = createFont("Arial",5,true);
  textFont(f,16);                 
  fill(0);  
  smooth();
  //noStroke();
  strokeJoin(ROUND);
}

void draw(){
  Table t = loadTable("TestData.csv");
  
  ArrayList test = new ArrayList();
  
  for (int x = 1; x < 12; x++){
    ArrayList people = new ArrayList();
    character Jer = new character ("Jerry", t.getFloat(x,4), t.getFloat(x,5), 255, 0, 0);
    character Grg = new character ("George", t.getFloat(x,6), t.getFloat(x,7), 0, 255, 0);
    character Eln = new character ("Elaine", t.getFloat(x,8), t.getFloat(x,9), 0, 0, 255);
    character Kman = new character ("Kramer", t.getFloat(x,10), t.getFloat(x,11), 100, 100, 0);
    character otr = new character ("Other", t.getFloat(x,12), t.getFloat(x,13), 0, 50, 100);
    
    people.add(Jer);
    people.add(Grg);
    people.add(Eln);
    people.add(Kman);
    people.add(otr);
  
    episode current = new episode (t.getInt(x,0), t.getInt(x,1), t.getString(x,2), 240, 250, t.getInt(x,3), people);
    test.add(current);
  }
  
  episode curr = new episode();
  character now = new character();
    
  int x = 0;
  int y = 0;
  int step = width/test.size();
  int start = 5;
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
    fill(255);
    rect(startX+2.0, y*1.0, 2.0, episodeSize * (-3.0)); 
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
  
  void clear(){
    season = 0;
    number = 0;
    title = "";
    x = 0;
    y = 0;  
    len = 0;
    //cast = cast.clear();
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
  private int blockSize = 7;
  
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
   rect(Xlocation*1.0, ((height/2) - (onScreen * 4)), blockSize*1.0, blockSize*1.0);
 }
 
 void inFocus(int xLocation){
   //display the name, time on screen, and longest scene if in the box
   if (mouseX >= (xLocation) && mouseX <= (xLocation + blockSize) && mouseY >= (((height/2.0) - (onScreen * 4))) && mouseY <= (((height/2.0) - (onScreen * 4)) + blockSize)){  
     println(name);
     updateText();
   }
   //THE ELSE CASE WAS ONLY USED FOR TESTING OTHERWISE IT WILL CONTINUTE TO PRINT THE (X,Y) LOCATION
   else{
     //removeText();
      //println("x: " + mouseX + " y: " + mouseY); 
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
     rect(0, 0, 250, 55);
 }
 
 String toString(){
   String rtn = "Name: " + name + "\nTime on Screen: " + onScreen + "\nLongest Scene: " + longestTime; 
  return rtn; 
 }
}
