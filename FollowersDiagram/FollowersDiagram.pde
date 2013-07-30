//Build an ArrayList to hold all of the words that we get from the imported tweets
ArrayList<Long> followers = new ArrayList();
 
void setup() {
  //Set the size of the stage, and the background to black.
  size(550,550);
  background(0);
  smooth();
  
  //UPDATE THE CREDENTIALS WITH MY KEYS BEFORE RUNNING
  //Credentials
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("");
  cb.setOAuthConsumerSecret("");
  cb.setOAuthAccessToken("-");
  cb.setOAuthAccessTokenSecret("");
 
  TwitterFactory tf = new TwitterFactory(cb.build());
  Twitter twitter = tf.getInstance();
  
  long cursor = -1;
  try {
  String result = twitter.getScreenName();
  IDs ids;
  ids = twitter.getFollowersIDs(cursor);
  
  IDs followinglist;
  followinglist = twitter.getFriendsIDs(cursor);
  //println(following);

  String name;
  String screenName;
  //println(ids.getIDs());
  long[] followers = ids.getIDs();
  long[] followings = followinglist.getIDs();
  
  //println(followers.length);
  //println(twitter.lookupUsers(followers));
  ResponseList<User> follows = twitter.lookupUsers(followers);
  ResponseList<User> following = twitter.lookupUsers(followings);
  
  //Object[] test2 = test.toArray();
  //println(test.size());
  //println(test2);
  User u;
  for(int x = 0; x < follows.size() - 1; x++){
     //println("user: " + test.get(x) + "\n");
     name = follows.get(x).getName();
     screenName = follows.get(x).getScreenName();
     println("Username: " + name + " ScreenName: " + screenName);
  }
  println("\n");
  for(int y = 0; y < following.size() - 1; y++){
    name = following.get(y).getName();
    screenName = following.get(y).getScreenName();
    println("Following: " + name + " ScreenName: " + screenName); 
  } 
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  }
}
