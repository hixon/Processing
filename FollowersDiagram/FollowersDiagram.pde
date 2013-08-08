ArrayList<String> followBack = new ArrayList();
ArrayList<String> noFollowBack = new ArrayList();
String person = "whitedoncheadle";
long cursor = -1;
  
void setup() {
  //Set the size of the stage, and the background to black.
  size(500,510);
  background(150);
  smooth();
  
  //UPDATE THE CREDENTIALS WITH MY KEYS BEFORE RUNNING
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("");
  cb.setOAuthConsumerSecret("");
  cb.setOAuthAccessToken("");
  cb.setOAuthAccessTokenSecret("");
 
  TwitterFactory tf = new TwitterFactory(cb.build());
  Twitter twitter = tf.getInstance();
  
  println(twitter);

  //these are used in case you follow more than 100 people or are followed by more than 100 people
  int numFollowers = 0;
  int numFollowing = 0;
 
  try {
  String result = twitter.getScreenName();
  IDs ids;
  IDs ids2;
 long[] followers;
  long[] followings;
  //followers = populateList(true);
  //followings = populateList(false);
  
 ArrayList<Long> test1 = new ArrayList();
   do{
      if(0 < args.length){
        ids = twitter.getFollowersIDs(person, cursor);
      } 
      else{
        ids = twitter.getFollowersIDs(cursor); 
      }
      for (long id : ids.getIDs()){
        test1.add(id); 
      }
    }while((cursor = ids.getNextCursor()) != 0);
 followers = new long[test1.size()];
  for(int x = 0; x < test1.size(); x++){
    followers[x] = test1.get(x);
  }
  
  ArrayList<Long> test2 = new ArrayList();
   do{
      if(0 < args.length){
        ids = twitter.getFriendsIDs(person, cursor);
      } 
      else{
        ids = twitter.getFriendsIDs(cursor); 
      }
      for (long id : ids.getIDs()){
        test2.add(id); 
      }
    }while((cursor = ids.getNextCursor()) != 0);
 followings = new long[test2.size()];
  for(int x = 0; x < test2.size(); x++){
    followings[x] = test2.get(x);
  }
 //println("Size of followers: " + test1.size());
 //println("friends list is: " + test2.size());
  
  IDs followinglist;
  //followinglist = twitter.getFriendsIDs(person, cursor);
  //println(following);

  String name;
  String screenName;
  //long[] followers = test1.toArray();
  //long[] followings = followinglist.getIDs();
  
 
  ResponseList<User> follows;// = twitter.lookupUsers(followers);
  User curr;
  ArrayList<String> followList = new ArrayList();
  println(followers.length);
  long[] array = new long[100];
  if (followers.length > 100){
    for(int a = 0; a < 100; a++){
       array[a] = followers[a]; 
       println(a + " : " + array[a]);
    }
    //for (int b = 0; b < followers.length; b++){
    //  curr = twitter.showUser(followers[b]);
    //  followList.add(curr.getName());
    //}
    follows = twitter.lookupUsers(array);
  }
  println(followList);
  //ResponseList<User> following = twitter.lookupUsers(followings);
  /*
  User u;
  
  //loop through the people that you follow and and see if theyre in the list of people that follow you
  // do something for each
  
  for (int z = 0; z < following.size() -1; z++){
    name = following.get(z).getScreenName();
    if (follows.contains(following.get(z))){ 
     followBack.add(name);
    }
    else{
     noFollowBack.add(name);
    }
  }
  
  //print results
  long t2 = twitter.getId();
  u = twitter.showUser(t2);
  //println(u.getFollowersCount());
  //println(u.getFriendsCount());
  
  println("The following people follow you back: " + followBack + "\n\n");
  println("These turds dont follow you back: " + noFollowBack);
  */
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  }
  /*
  fill(190);
  stroke(0);
  rect(125, 125, 250, 250);
  //people that dont follow you back
  int start = 15;
  int wid = 0;
  for (int w = 0; w < noFollowBack.size(); w++){
    if (start > height-10){
      wid += 150;
      start = 10;
    }
    else{
      fill(150, 0, 0);
      text(noFollowBack.get(w), wid, start); 
    } 
    start += 10;
  }
  
  //people that follow you back
  start = 140;
  wid = width-235;
  for (int w = 0; w < followBack.size(); w++){
    if (start > 375){
      wid -= 135;
      start = 140;
    }
    else{
      fill(0, 150, 0);
      text(followBack.get(w), wid, start); 
    } 
    start += 10;
  }
}
*/

/*
long[] populateList(boolean followers){
  
  ArrayList<Long> test = new ArrayList();
  IDs ids;
  if(followers){
    do{
      if(0 < args.length){
        ids = twitter.getFollowersIDs(person, cursor);
      } 
      else{
        ids = twitter.getFollowersIDs(cursor); 
      }
      for (long id : ids.getIDs()){
        test.add(id); 
      }
    }while((cursor = ids.getNextCursor()) != 0);
  }
  
  else{
    do{
      if(0 < args.length){
        ids = twitter.getFriendsIDs(person, cursor);
      } 
      else{
        ids = twitter.getFriendsIDs(cursor); 
      }
      for (long id : ids.getIDs()){
        test.add(id); 
      }
    }while((cursor = ids.getNextCursor()) != 0);
  }
  
  long[] array = new long[test.size()];
  for(int x = 0; x < test.size(); x++){
    array[x] = test.get(x);
  }
  return array;
*/
}
