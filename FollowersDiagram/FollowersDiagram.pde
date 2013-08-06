ArrayList<String> followBack = new ArrayList();
ArrayList<String> noFollowBack = new ArrayList();
void setup() {
  //Set the size of the stage, and the background to black.
  size(500,510);
  background(150);
  smooth();
  
  //no need to have the @ symbol on the beginning of the name
  String person = "ryan_hixon";
  
  //these are used in case you follow more than 100 people or are followed by more than 100 people
  int numFollowers = 0;
  int numFollowing = 0;
  
  //UPDATE THE CREDENTIALS WITH MY KEYS BEFORE RUNNING
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("");
  cb.setOAuthConsumerSecret("");
  cb.setOAuthAccessToken("");
  cb.setOAuthAccessTokenSecret("");
 
  TwitterFactory tf = new TwitterFactory(cb.build());
  Twitter twitter = tf.getInstance();
  
  long cursor = -1;
  try {
  String result = twitter.getScreenName();
  IDs ids;
  ids = twitter.getFollowersIDs(person, cursor);
  
  IDs followinglist;
  followinglist = twitter.getFriendsIDs(person, cursor);
  //println(following);

  String name;
  String screenName;
  long[] followers = ids.getIDs();
  long[] followings = followinglist.getIDs();
 
  ResponseList<User> follows = twitter.lookupUsers(followers);
  ResponseList<User> following = twitter.lookupUsers(followings);
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
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  }
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
